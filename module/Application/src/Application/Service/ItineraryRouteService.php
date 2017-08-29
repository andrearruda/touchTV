<?php
namespace Application\Service;

use Doctrine\ORM\EntityManager;
use DoctrineModule\Stdlib\Hydrator\DoctrineObject;
use Application\Repository\ItineraryRoute;

class ItineraryRouteService
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
     * @var $repository_itinerary_route ItineraryRoute
     */
    protected $repository_itinerary_route;

    public function __construct(EntityManager $entity_manager, DoctrineObject $doctrine_object)
    {
        $this->setEntityManager($entity_manager);
        $this->setDoctrineObject($doctrine_object);

        $this->setRepositoryItineraryRoute($this->getEntityManager()->getRepository('Application\Entity\ItineraryRoute'));
    }

    public function findAll()
    {
        return $this->getRepositoryItineraryRoute()->findBy(array(), array('id' => 'desc'));
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
     * @return ItineraryRoute
     */
    public function getRepositoryItineraryRoute()
    {
        return $this->repository_itinerary_route;
    }

    /**
     * @param ItineraryRoute $repository_itinerary_route
     */
    public function setRepositoryItineraryRoute($repository_itinerary_route)
    {
        $this->repository_itinerary_route = $repository_itinerary_route;
    }



}