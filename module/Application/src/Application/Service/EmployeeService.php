<?php
namespace Application\Service;

use Doctrine\ORM\EntityManager;
use DoctrineModule\Stdlib\Hydrator\DoctrineObject;
use Application\Repository\Employee;
use Imagine\Gd\Imagine;
use Imagine\Image\Box;
use Zend\XmlRpc\Value\DateTime;

class EmployeeService
{
    /**
     * @var $entity_manager EntityManager
     */
    protected $entity_manager;

    /**
     * @var $doctrine_object DoctrineObject
     */
    protected $doctrine_object;

    /**
     * @var $repository_employee Employee
     */
    protected $repository_employee;

    public function __construct(EntityManager $entity_manager, DoctrineObject $doctrine_object)
    {
        $this->setEntityManager($entity_manager);
        $this->setDoctrineObject($doctrine_object);

        $this->setRepositoryEmployee($this->getEntityManager()->getRepository('Application\Entity\Employee'));
    }

    public function findAll()
    {
        return $this->getRepositoryEmployee()->findBy(array(), array('name' => 'asc'));
    }

    public function findById($id)
    {
        return $this->getRepositoryEmployee()->findOneById($id);
    }

    public function findByMonth($month)
    {
        $query_builder = $this->getRepositoryEmployee()->createQueryBuilder('E');
        $query_builder
            ->distinct(true)
            ->where('E.active = :active')
            ->andWhere('MONTH(E.bornAt) = :month')
            ->addOrderBy('E.bornAt', 'asc')
            ->addOrderBy('E.name', 'asc')
        ;

        $query_builder->setParameter('active', true);
        $query_builder->setParameter('month', $month);

        return $query_builder->getQuery()->getResult();
    }

    public function findAllValid($month = null)
    {
        return $this->getRepositoryEmployee()->findBy(array('active' => true), array('id' => 'desc'));;
    }

    public function exportToExcel($data)
    {
        if(!empty($data['startedIn']) || !empty($data['finalizedIn']))
        {
            $query_builder = $this->getRepositoryEmployee()->createQueryBuilder('E');
            $query_builder
                ->where('E.active = :active')
                ->addOrderBy('E.name', 'asc');

            if(!empty($data['startedIn']))
            {
                $startedIn = \DateTime::createFromFormat('d/m/Y', $data['startedIn']);

                $query_builder->andWhere('MONTH(E.bornAt) >= MONTH(:startedIn) AND DAY(E.bornAt) >= DAY(:startedIn)');
                $query_builder->setParameter('startedIn', $startedIn);
            }

            if(!empty($data['finalizedIn']))
            {
                $finalizedIn = \DateTime::createFromFormat('d/m/Y', $data['finalizedIn']);

                $query_builder->andWhere('MONTH(E.bornAt) <= MONTH(:finalizedIn) AND DAY(E.bornAt) <= DAY(:finalizedIn)');
                $query_builder->setParameter('finalizedIn', $finalizedIn);
            }

            $query_builder->setParameter('active', true);
            $entities = $query_builder->getQuery()->getResult();
        }
        else
        {
            $entities = $this->findAll();
        }

        $objPHPExcel = new \PHPExcel();
        $objPHPExcel->getProperties()->setCreator("FarolSign");
        $objPHPExcel->getProperties()->setLastModifiedBy("FarolSign");
        $objPHPExcel->getProperties()->setTitle("Aniversariantes - Nivea");
        $objPHPExcel->getProperties()->setSubject("Aniversariantes - Nivea");
        $objPHPExcel->getProperties()->setDescription("Exportação da lista de aniversariantes");

        $objPHPExcel->setActiveSheetIndex(0);

        $objPHPExcel->getActiveSheet()->SetCellValue('A1', 'Nome');
        $objPHPExcel->getActiveSheet()->SetCellValue('B1', 'Nascimento');
        $objPHPExcel->getActiveSheet()->SetCellValue('C1', 'Departamento');
        $objPHPExcel->getActiveSheet()->SetCellValue('D1', 'Unidade - ID');
        $objPHPExcel->getActiveSheet()->SetCellValue('E1', 'Unidade - Nome');

        foreach($entities as $key => $entity)
        {
            $indice = $key + 2;
            $objPHPExcel->getActiveSheet()->SetCellValue(sprintf('A%s', $indice), $entity->getName());
            $objPHPExcel->getActiveSheet()->SetCellValue(sprintf('B%s', $indice), $entity->getBornAt()->format('Y-m-d'));
            $objPHPExcel->getActiveSheet()->SetCellValue(sprintf('C%s', $indice), $entity->getDepartment());
            $objPHPExcel->getActiveSheet()->SetCellValue(sprintf('D%s', $indice), $entity->getEmployeeUnit()->getId());
            $objPHPExcel->getActiveSheet()->SetCellValue(sprintf('E%s', $indice), $entity->getEmployeeUnit()->getName());
        }

        return $objPHPExcel;
    }

    public function save($data, $id = null)
    {
        if(isset($data['born_at']))
        {
            $data['born_at'] = substr($data['born_at'], -4) . '-' . substr($data['born_at'], 3, 2) . '-' . substr($data['born_at'], 0, 2);
            $data['born_at'] = new \DateTime($data['born_at']);
        }

        if(isset($data['image']))
        {
            if($data['image']['error'] != 0)
            {
                unset($data['image']);
            }

            $pathinfo = pathinfo($data['image']['tmp_name']);

            $imgs = array(
                'middle' => array(
                    'path' => substr($pathinfo['dirname'], 0, -9) . '/middle/' . $pathinfo['basename'],
                    'mode' => \Imagine\Image\ImageInterface::THUMBNAIL_INSET,
                    'size' => array(
                        'w' => 500,
                        'h' => 500
                    )
                ),
                'thumb' => array(
                    'path' => substr($pathinfo['dirname'], 0, -9) . '/thumb/' . $pathinfo['basename'],
                    'mode' => \Imagine\Image\ImageInterface::THUMBNAIL_OUTBOUND,
                    'size' => array(
                        'w' => 200,
                        'h' => 200
                    )
                )
            );

            // TODO melhorar o upload da imagem em relação as imagens
            $imagine = new Imagine();
            foreach($imgs as $img)
            {
                $size = new Box($img['size']['w'], $img['size']['h']);
                $imagine->open($data['image']['tmp_name'])
                    ->thumbnail($size, $img['mode'])
                    ->save($img['path']);
            }
        }

        if(is_null($id))
        {
            $entity = new \Application\Entity\Employee();

            if(isset($data['image']))
            {
                $data['image'] = $pathinfo['basename'];
            }
        }
        else
        {
            $entity = $this->getRepositoryEmployee()->findOneById($id);

            if(isset($data['image']))
            {
                $dirs = array('middle', 'original', 'thumb');

                foreach($dirs as $dir)
                {
                    $file = substr($pathinfo['dirname'],0, -9) . '/' . $dir . '/' . $entity->getImage();
                    if(file_exists($file) && is_file($file))
                        unlink($file);
                }

                $data['image'] = $pathinfo['basename'];
            }
        }

        $this->getDoctrineObject()->hydrate($data, $entity);

        $this->getEntityManager()->persist($entity);
        $this->getEntityManager()->flush();

        return $entity;
    }

    public function delete($id)
    {
        $entity = $this->getRepositoryEmployee()->findOneById($id);

        $this->getEntityManager()->remove($entity);
        $this->getEntityManager()->flush();

        return array('id' => $id);
    }

    /**
     * @return EntityManager
     */
    public function getEntityManager()
    {
        return $this->entity_manager;
    }

    /**
     * @param EntityManager $entity_manager
     */
    public function setEntityManager($entity_manager)
    {
        $this->entity_manager = $entity_manager;
    }

    /**
     * @return DoctrineObject
     */
    public function getDoctrineObject()
    {
        return $this->doctrine_object;
    }

    /**
     * @param DoctrineObject $doctrine_object
     */
    public function setDoctrineObject($doctrine_object)
    {
        $this->doctrine_object = $doctrine_object;
    }

    /**
     * @return Employee
     */
    public function getRepositoryEmployee()
    {
        return $this->repository_employee;
    }

    /**
     * @param Employee $repository_employee
     */
    public function setRepositoryEmployee($repository_employee)
    {
        $this->repository_employee = $repository_employee;
    }
}