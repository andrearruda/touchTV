<?php
namespace Application\Factory;

use Application\Controller\ArticleController;
use Application\Fieldset\SchedulingFieldset;
use Application\Filter\ArticleFilter;
use Application\Form\ArticleForm;
use Application\Service\ArticleService;
use Zend\ServiceManager\FactoryInterface;
use Zend\ServiceManager\ServiceLocatorInterface;
use DoctrineModule\Stdlib\Hydrator\DoctrineObject;

class ArticleControllerFactory implements FactoryInterface
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
         * @var $article_service ArticleService
         */
        $article_service = new ArticleService($entity_manager, $doctrine_object);

        /**
         * @var $article_filter ArticleFilter
         */
        $article_filter = new ArticleFilter();

        $schedule_fieldset = new SchedulingFieldset();

        /**
         * @var $article_form ArticleForm
         */
        $article_form = new ArticleForm($schedule_fieldset);
        $article_form->setInputFilter($article_filter);

        /**
         * @var $article_controller ArticleController
         */
        $article_controller = new ArticleController($article_service, $doctrine_object);
        $article_controller->setArticleForm($article_form);
        return $article_controller;
    }

}