<?php
namespace Application\Service;

use Doctrine\ORM\EntityManager;
use Doctrine\Common\Collections\Criteria;
use DoctrineModule\Stdlib\Hydrator\DoctrineObject;
use Application\Repository\Article;

use Imagine\Gd\Imagine;
use Imagine\Image\Box;

class ArticleService
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
     * @var $repository_article Article
     */
    protected $repository_article;

    public function __construct(EntityManager $entity_manager, DoctrineObject $doctrine_object)
    {
        $this->setEntityManager($entity_manager);
        $this->setDoctrineObject($doctrine_object);

        $this->setRepositoryArticle($this->getEntityManager()->getRepository('Application\Entity\Article'));
    }

    public function findAll()
    {
        return $this->getRepositoryArticle()->findBy(array(), array('id' => 'desc'));
    }

    public function findAllActive()
    {
        $query_builder = $this->getRepositoryArticle()->createQueryBuilder('A');
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

    public function findById($id)
    {
        return $this->getRepositoryArticle()->findOneById($id);
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
            $entity = new \Application\Entity\Article();

            if(isset($data['image']))
            {
                $data['image'] = $pathinfo['basename'];
            }
        }
        else
        {
            $entity = $this->getRepositoryArticle()->findOneById($id);

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
        $entity = $this->getRepositoryArticle()->findOneById($id);

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
     * @return Article
     */
    public function getRepositoryArticle()
    {
        return $this->repository_article;
    }

    /**
     * @param Article $repository_article
     */
    public function setRepositoryArticle($repository_article)
    {
        $this->repository_article = $repository_article;
    }
}