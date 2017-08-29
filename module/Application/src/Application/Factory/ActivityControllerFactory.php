<?php
namespace Application\Factory;

use Application\Controller\ActivityController;
use Application\Fieldset\SchedulingFieldset;
use Application\Filter\ActivityFilter;
use Application\Form\ActivityForm;
use Application\Service\ActivityService;
use Zend\ServiceManager\FactoryInterface;
use Zend\ServiceManager\ServiceLocatorInterface;
use DoctrineModule\Stdlib\Hydrator\DoctrineObject;

class ActivityControllerFactory implements FactoryInterface
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
         * @var $activity_service ActivityService
         */
        $activity_service = new ActivityService($entity_manager, $doctrine_object);

        /**
         * @var $activity_filter ActivityFilter
         */
        $activity_filter = new ActivityFilter();

        $schedule_fieldset = new SchedulingFieldset();

        /**
         * @var $activity_form ActivityForm
         */
        $activity_form = new ActivityForm($schedule_fieldset);
        $activity_form->setInputFilter($activity_filter);

        /**
         * @var $activity_controller ActivityController
         */
        $activity_controller = new ActivityController($activity_service, $doctrine_object);
        $activity_controller->setActivityForm($activity_form);
        return $activity_controller;
    }

}