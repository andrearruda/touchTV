<?php
namespace Application\Service;

use Doctrine\ORM\EntityManager;
use Doctrine\Common\Collections\Criteria;
use DoctrineModule\Stdlib\Hydrator\DoctrineObject;
use Application\Repository\Warning;
use Imagine\Gd\Imagine;
use Imagine\Image\Box;

class WarningService
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
     * @var $repository_warning Warning
     */
    protected $repository_warning;

    public function __construct(EntityManager $entity_manager, DoctrineObject $doctrine_object)
    {
        $this->setEntityManager($entity_manager);
        $this->setDoctrineObject($doctrine_object);

        $this->setRepositoryWarning($this->getEntityManager()->getRepository('Application\Entity\Warning'));
    }

    public function findAll()
    {
        return $this->getRepositoryWarning()->findBy(array(), array('id' => 'desc'));
    }

    public function findById($id)
    {
        return $this->getRepositoryWarning()->findOneById($id);
    }

    public function findByMonth($month)
    {
        $query_builder = $this->getRepositoryWarning()->createQueryBuilder('W');
        $query_builder
            ->select('W.dayNotice')
            ->distinct(true)
            ->where('W.active = :active')
            ->andWhere('YEAR(W.dayNotice) = :year')
            ->andWhere('MONTH(W.dayNotice) = :month')
            ->andWhere('DATE(:now) >= DATE(W.schedulingStart)')
            ->andWhere('DATE(:now) <= DATE(W.schedulingEnd)')
            ->addGroupBy('W.dayNotice')
            ->addOrderBy('W.dayNotice')
        ;

        $query_builder->setParameter('active', true);
        $query_builder->setParameter('year', date('Y'));
        $query_builder->setParameter('month', $month);
        $query_builder->setParameter('now', new \DateTime('now'));

        return $query_builder->getQuery()->getResult();
    }

    public function findByDayNotice($date)
    {
        $query_builder = $this->getRepositoryWarning()->createQueryBuilder('W');
        $query_builder
            ->where('W.active = :active')
            ->andWhere('W.dayNotice = :day_notice')
            ->andWhere('DATE(:now) >= DATE(W.schedulingStart)')
            ->andWhere('DATE(:now) <= DATE(W.schedulingEnd)')
            ->orderBy('W.dayNotice', 'ASC')
            ->addOrderBy('W.createdAt', 'ASC')
        ;

        $query_builder->setParameter('active', true);
        $query_builder->setParameter('day_notice', $date);
        $query_builder->setParameter('now', new \DateTime('now'));

        return $query_builder->getQuery()->getResult();
    }

    public function findNotification()
    {
        $query_builder = $this->getRepositoryWarning()->createQueryBuilder('W');
        $query_builder
            ->where('W.active = :active')
            ->andWhere('DATE(:now) >= DATE(W.schedulingStart)')
            ->andWhere('DATE(:now) <= DATE(W.schedulingEnd)')
            ->orderBy('W.dayNotice', 'ASC')
            ->addOrderBy('W.createdAt', 'ASC')
        ;

        $query_builder->setParameter('active', true);
        $query_builder->setParameter('now', new \DateTime('now'));

        return $query_builder->getQuery()->getResult();
    }

    public function save($data, $id = null)
    {

        if(isset($data['dayNotice']))
            $data['dayNotice'] = substr($data['dayNotice'], -4) . '-' . substr($data['dayNotice'], 3, 2) . '-' . substr($data['dayNotice'], 0, 2);

        if(isset($data['fieldset_scheduling']))
        {
            $data = array_merge($data, $data['fieldset_scheduling']);
            unset($data['fieldset_scheduling']);
        }

        if(isset($data['image']))
        {
            if($data['image']['error'] != 0)
            {
                unset($data['image']);
            }
        }

        if(isset($data['image']))
        {
            $pathinfo = pathinfo($data['image']['tmp_name']);

            $imagine = new Imagine();
            $image = $imagine->open($data['image']['tmp_name']);
            $percentage = 920 / $image->getSize()->getWidth();

            //MIDDLE
            $image
                ->resize(new Box($image->getSize()->getWidth() * $percentage, $image->getSize()->getHeight() * $percentage))
                ->save(substr($pathinfo['dirname'], 0, -9) . '/middle/' . $pathinfo['basename']);

            //THUMB
            $image
                ->thumbnail(new Box(200, 200), \Imagine\Image\ImageInterface::THUMBNAIL_OUTBOUND)
                ->save(substr($pathinfo['dirname'], 0, -9) . '/thumb/' . $pathinfo['basename']);
        }

        if(is_null($id))
        {
            $entity = new \Application\Entity\Warning();

            if(isset($data['image']))
            {
                $data['image'] = $pathinfo['basename'];
            }
        }
        else
        {
            $entity = $this->getRepositoryWarning()->findOneById($id);

            if(isset($data['image']))
            {
                $dirs = array('middle', 'original', 'thumb');

                foreach($dirs as $dir)
                {
                    $file = substr($pathinfo['dirname'],0, -9) . '/' . $dir . '/' . $entity->getImage();
                    if(file_exists($file))
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
        $entity = $this->getRepositoryWarning()->findOneById($id);

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
     * @return Warning
     */
    public function getRepositoryWarning()
    {
        return $this->repository_warning;
    }

    /**
     * @param Warning $repository_warning
     */
    public function setRepositoryWarning($repository_warning)
    {
        $this->repository_warning = $repository_warning;
    }
}