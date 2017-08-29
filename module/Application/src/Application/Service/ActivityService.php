<?php
namespace Application\Service;

use Doctrine\ORM\EntityManager;
use DoctrineModule\Stdlib\Hydrator\DoctrineObject;
use Application\Repository\Activity;
use Imagine\Gd\Imagine;
use Imagine\Image\Box;

class ActivityService
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
     * @var $repository_activity Activity
     */
    protected $repository_activity;

    public function __construct(EntityManager $entity_manager, DoctrineObject $doctrine_object)
    {
        $this->setEntityManager($entity_manager);
        $this->setDoctrineObject($doctrine_object);

        $this->setRepositoryActivity($this->getEntityManager()->getRepository('Application\Entity\Activity'));
    }

    public function findAll()
    {
        return $this->getRepositoryActivity()->findBy(array(), array('id' => 'desc'));
    }

    public function findById($id)
    {
        return $this->getRepositoryActivity()->findOneById($id);
    }

    public function findAllValid()
    {
        $query_builder = $this->getRepositoryActivity()->createQueryBuilder('A');
        $query_builder
            ->where('A.active = :active')
            ->andWhere('DATE(:now) >= DATE(A.schedulingStart)')
            ->andWhere('DATE(:now) <= DATE(A.schedulingEnd)')
            ->addOrderBy('A.createdAt', 'ASC')
        ;

        $query_builder->setParameter('active', true);
        $query_builder->setParameter('now', new \DateTime('now'));

        return $query_builder->getQuery()->getResult();
    }

    public function save($data, $id = null)
    {
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
            $entity = new \Application\Entity\Activity();

            if(isset($data['image']))
            {
                $data['image'] = $pathinfo['basename'];
            }
        }
        else
        {
            $entity = $this->getRepositoryActivity()->findOneById($id);

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
        $entity = $this->getRepositoryActivity()->findOneById($id);

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
     * @return Activity
     */
    public function getRepositoryActivity()
    {
        return $this->repository_activity;
    }

    /**
     * @param Activity $repository_activity
     */
    public function setRepositoryActivity($repository_activity)
    {
        $this->repository_activity = $repository_activity;
    }
}