<?php
namespace Application\Factory;

use Application\Controller\ItineraryController;
use Application\Filter\ItineraryFilter;
use Application\Form\ItineraryForm;
use Application\Service\ItineraryRouteService;
use Application\Service\ItineraryService;
use Zend\ServiceManager\FactoryInterface;
use Zend\ServiceManager\ServiceLocatorInterface;
use DoctrineModule\Stdlib\Hydrator\DoctrineObject;

class ItineraryControllerFactory implements FactoryInterface
{
    public function createService(ServiceLocatorInterface $serviceLocator)
    {
        /**
         * @var $service_manager ServiceManager
         */
        $service_manager = $serviceLocator->getServiceLocator();

        /**
         * @var $entity_manager EntityManager
         */
        $entity_manager = $service_manager->get('Doctrine\ORM\EntityManager');

        /**
         * @var $doctrine_object DoctrineObject
         */
        $doctrine_object = new DoctrineObject($entity_manager);

        /**
         * @var $itinerary_service ItineraryService
         */
        $itinerary_service = new ItineraryService($entity_manager, $doctrine_object);

        /**
         * @var $itinerary_route_service ItineraryRouteService
         */
        $itinerary_route_service = new ItineraryRouteService($entity_manager, $doctrine_object);

        /**
         * @var $itinerary_filter ItineraryFilter
         */
        $itinerary_filter = new ItineraryFilter();

        /**
         * @var $itinerary_form ItineraryForm
         */
        $itinerary_form = new ItineraryForm($entity_manager);
        $itinerary_form->setInputFilter($itinerary_filter);

        /**
         * @var $itinerary_controller ItineraryController
         */
        $itinerary_controller = new ItineraryController($itinerary_service, $itinerary_route_service, $doctrine_object);
        $itinerary_controller->setItineraryForm($itinerary_form);
        return $itinerary_controller;
    }

}