<?php
namespace Application\Factory;

use Application\Controller\WarningController;
use Application\Fieldset\SchedulingFieldset;
use Application\Filter\WarningFilter;
use Application\Form\WarningForm;
use Application\Service\WarningService;
use Zend\ServiceManager\FactoryInterface;
use Zend\ServiceManager\ServiceLocatorInterface;
use DoctrineModule\Stdlib\Hydrator\DoctrineObject;

class WarningControllerFactory implements FactoryInterface
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
         * @var $warning_service WarningService
         */
        $warning_service = new WarningService($entity_manager, $doctrine_object);

        /**
         * @var $warning_filter WarningFilter
         */
        $warning_filter = new WarningFilter();

        $schedule_fieldset = new SchedulingFieldset();

        /**
         * @var $warning_form WarningForm
         */
        $warning_form = new WarningForm($schedule_fieldset);
        $warning_form->setInputFilter($warning_filter);

        /**
         * @var $warning_controller WarningController
         */
        $warning_controller = new WarningController($warning_service, $doctrine_object);
        $warning_controller->setWarningForm($warning_form);
        return $warning_controller;
    }

}