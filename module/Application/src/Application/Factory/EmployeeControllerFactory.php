<?php
namespace Application\Factory;

use Application\Controller\EmployeeController;
use Application\Filter\EmployeeFilter;
use Application\Filter\EmployeeExportFilter;
use Application\Filter\EmployeeImportFilter;
use Application\Form\EmployeeForm;
use Application\Form\EmployeeExportForm;
use Application\Form\EmployeeImportForm;
use Application\Service\EmployeeService;
use Zend\ServiceManager\FactoryInterface;
use Zend\ServiceManager\ServiceLocatorInterface;
use DoctrineModule\Stdlib\Hydrator\DoctrineObject;

class EmployeeControllerFactory implements FactoryInterface
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
         * @var $employee_service EmployeeService
         */
        $employee_service = new EmployeeService($entity_manager, $doctrine_object);

        /**
         * @var $employee_filter EmployeeFilter
         */
        $employee_filter = new EmployeeFilter();

        /**
         * @var $employee_export_filter EmployeeExportFilter
         */
        $employee_export_filter = new EmployeeExportFilter();

        /**
         * @var $employee_import_filter EmployeeImportFilter
         */
        $employee_import_filter = new EmployeeImportFilter();

        /**
         * @var $employee_form EmployeeForm
         */
        $employee_form = new EmployeeForm($entity_manager);
        $employee_form->setInputFilter($employee_filter);

        /**
         * @var $employee_export_form EmployeeExportForm
         */
        $employee_export_form = new EmployeeExportForm();
        $employee_export_form->setInputFilter($employee_export_filter);

        /**
         * @var $employee_import_form EmployeeImportForm
         */
        $employee_import_form = new EmployeeImportForm($entity_manager);
        $employee_import_form->setInputFilter($employee_import_filter);

        /**
         * @var $employee_controller EmployeeController
         */
        $employee_controller = new EmployeeController($employee_service, $doctrine_object);
        $employee_controller->setEmployeeForm($employee_form);
        $employee_controller->setEmployeeExportForm($employee_export_form);
        $employee_controller->setEmployeeImportForm($employee_import_form);
        return $employee_controller;
    }

}