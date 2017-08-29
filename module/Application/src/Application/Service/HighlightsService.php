<?php
namespace Application\Service;

use Doctrine\ORM\EntityManager;
use Doctrine\Common\Collections\Criteria;
use DoctrineModule\Stdlib\Hydrator\DoctrineObject;
use Application\Repository\Highlights;
use Imagine\Gd\Imagine;
use Imagine\Image\Box;

class HighlightsService
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
     * @var $repository_highlights Highlights
     */
    protected $repository_highlights;

    public function __construct(EntityManager $entity_manager, DoctrineObject $doctrine_object)
    {
        $this->setEntityManager($entity_manager);
        $this->setDoctrineObject($doctrine_object);

        $this->setRepositoryHighlights($this->getEntityManager()->getRepository('Application\Entity\Highlights'));
    }

    public function findAll()
    {
        return $this->getRepositoryHighlights()->findBy(array(), array('id' => 'desc'));
    }

    public function findAllActive()
    {
        $query_builder = $this->getRepositoryHighlights()->createQueryBuilder('H');
        $query_builder
            ->where('H.active = :active')
            ->andWhere('DATE(:now) >= DATE(H.schedulingStart)')
            ->andWhere('DATE(:now) <= DATE(H.schedulingEnd)')
            ->addOrderBy('H.createdAt', 'ASC')
        ;

        $query_builder->setParameter('active', true);
        $query_builder->setParameter('now', new \DateTime('now'));

        return $query_builder->getQuery()->getResult();
    }

    public function findById($id)
    {
        return $this->getRepositoryHighlights()->findOneById($id);
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
            $entity = new \Application\Entity\Highlights();

            if(isset($data['image']))
            {
                $data['image'] = $pathinfo['basename'];
            }
        }
        else
        {
            $entity = $this->getRepositoryHighlights()->findOneById($id);

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
        $entity = $this->getRepositoryHighlights()->findOneById($id);

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
     * @return Highlights
     */
    public function getRepositoryHighlights()
    {
        return $this->repository_highlights;
    }

    /**
     * @param Highlights $repository_highlights
     */
    public function setRepositoryHighlights($repository_highlights)
    {
        $this->repository_highlights = $repository_highlights;
    }
}