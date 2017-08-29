<?php
namespace Application\Service;

use Doctrine\ORM\EntityManager;
use DoctrineModule\Stdlib\Hydrator\DoctrineObject;
use Application\Repository\Itinerary;

class ItineraryService
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
     * @var $repository_itinerary Itinerary
     */
    protected $repository_itinerary;

    public function __construct(EntityManager $entity_manager, DoctrineObject $doctrine_object)
    {
        $this->setEntityManager($entity_manager);
        $this->setDoctrineObject($doctrine_object);

        $this->setRepositoryItinerary($this->getEntityManager()->getRepository('Application\Entity\Itinerary'));
    }

    public function findAll()
    {
        return $this->getRepositoryItinerary()->findBy(array(), array('id' => 'desc'));
    }

    public function findById($id)
    {
        return $this->getRepositoryItinerary()->findOneById($id);
    }

    public function findByItinerayRoute(\Application\Entity\ItineraryRoute $itinerary_route_entity)
    {
        $query_builder = $this->getRepositoryItinerary()->createQueryBuilder('IR');
        $query_builder
            ->where('IR.active = :active')
            ->andWhere('IR.itineraryRoute = :itineraryRoute')
            ->addOrderBy('IR.schedule', 'asc')
            ->addOrderBy('IR.stop', 'asc')
        ;

        $query_builder->setParameter('active', true);
        $query_builder->setParameter('itineraryRoute', $itinerary_route_entity);

        return $query_builder->getQuery()->getResult();
    }

    public function save($data, $id = null)
    {
        if(is_null($id))
        {
            $entity = new \Application\Entity\Itinerary();
        }
        else
        {
            $entity = $this->getRepositoryItinerary()->findOneById($id);
        }

        $this->getDoctrineObject()->hydrate($data, $entity);

        $this->getEntityManager()->persist($entity);
        $this->getEntityManager()->flush();

        return $entity;
    }

    public function delete($id)
    {
        $entity = $this->getRepositoryItinerary()->findOneById($id);

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
     * @return Itinerary
     */
    public function getRepositoryItinerary()
    {
        return $this->repository_itinerary;
    }

    /**
     * @param Itinerary $repository_itinerary
     */
    public function setRepositoryItinerary($repository_itinerary)
    {
        $this->repository_itinerary = $repository_itinerary;
    }
}