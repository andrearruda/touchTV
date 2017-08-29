<?php
namespace Application\Factory;

use Application\Controller\HighlightsController;
use Application\Fieldset\SchedulingFieldset;
use Application\Filter\HighlightsFilter;
use Application\Form\HighlightsForm;
use Application\Service\HighlightsService;
use Zend\ServiceManager\FactoryInterface;
use Zend\ServiceManager\ServiceLocatorInterface;
use DoctrineModule\Stdlib\Hydrator\DoctrineObject;

class HighlightsControllerFactory implements FactoryInterface
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
         * @var $highlights_service HighlightsService
         */
        $highlights_service = new HighlightsService($entity_manager, $doctrine_object);

        /**
         * @var $highlights_filter HighlightsFilter
         */
        $highlights_filter = new HighlightsFilter();

        $schedule_fieldset = new SchedulingFieldset();

        /**
         * @var $highlights_form HighlightsForm
         */
        $highlights_form = new HighlightsForm($schedule_fieldset);
        $highlights_form->setInputFilter($highlights_filter);

        /**
         * @var $highlights_controller HighlightsController
         */
        $highlights_controller = new HighlightsController($highlights_service, $doctrine_object);
        $highlights_controller->setHighlightsForm($highlights_form);
        return $highlights_controller;
    }

}