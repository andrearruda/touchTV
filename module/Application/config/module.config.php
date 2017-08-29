<?php
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2015 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Application;

use \Utils\Factory as UtilsFactory;
use \Utils\View as UtilsView;

return array(
    'router' => array(
        'routes' => array(
            'home' => array(
                'type' => 'Zend\Mvc\Router\Http\Literal',
                'options' => array(
                    'route'    => '/',
                    'defaults' => array(
                        'controller' => 'Application\Controller\Index',
                        'action'     => 'index',
                    ),
                ),
            ),

            'warning' => array(
                'type'    => 'Literal',
                'options' => array(
                    'route'    => '/warning',
                    'defaults' => array(
                        '__NAMESPACE__' => 'Application\Controller',
                        'controller'    => 'Warning',
                        'action'        => 'index',
                    ),
                ),
                'may_terminate' => true,
                'child_routes' => array(
                    'default' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route' => '[/:action[/:id]]',
                            'constraints' => array(
                                'action'    => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'        => '\d+',
                            ),
                            'defaults' => array(
                            ),
                        ),
                    ),
                    'paginator' => array(
                        'type' => 'Zend\Mvc\Router\Http\Segment',
                        'options' => array(
                            'route' => '[/list/page/:page]',
                            'constraints' => array(
                                'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'page' => '\d+',
                            ),
                            'defaults' => array(
                                'action'    => 'list',
                                'page'      => 1
                            ),
                        ),
                    ),
                    'feed' => array(
                        'type' => 'Zend\Mvc\Router\Http\Segment',
                        'options' => array(
                            'route' => '/feed.xml',
                            'defaults' => array(
                                'action'        => 'feed',
                            )
                        )
                    ),
                    'notification' => array(
                        'type' => 'Zend\Mvc\Router\Http\Segment',
                        'options' => array(
                            'route' => '/notification/feed.xml',
                            'defaults' => array(
                                'action'        => 'notification',
                            )
                        )
                    ),
                ),
            ),

            'activity' => array(
                'type'    => 'Literal',
                'options' => array(
                    'route'    => '/activity',
                    'defaults' => array(
                        '__NAMESPACE__' => 'Application\Controller',
                        'controller'    => 'Activity',
                        'action'        => 'index',
                    ),
                ),
                'may_terminate' => true,
                'child_routes' => array(
                    'default' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route' => '[/:action[/:id]]',
                            'constraints' => array(
                                'action'    => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'        => '\d+',
                            ),
                            'defaults' => array(
                            ),
                        ),
                    ),
                    'paginator' => array(
                        'type' => 'Zend\Mvc\Router\Http\Segment',
                        'options' => array(
                            'route' => '[/list/page/:page]',
                            'constraints' => array(
                                'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'page' => '\d+',
                            ),
                            'defaults' => array(
                                'action'    => 'list',
                                'page'      => 1
                            ),
                        ),
                    ),
                    'feed' => array(
                        'type' => 'Zend\Mvc\Router\Http\Segment',
                        'options' => array(
                            'route' => '/feed.xml',
                            'defaults' => array(
                                'action'        => 'feed',
                            )
                        )
                    ),
                ),
            ),

            'article' => array(
                'type'    => 'Literal',
                'options' => array(
                    'route'    => '/article',
                    'defaults' => array(
                        '__NAMESPACE__' => 'Application\Controller',
                        'controller'    => 'Article',
                        'action'        => 'index',
                    ),
                ),
                'may_terminate' => true,
                'child_routes' => array(
                    'default' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route' => '[/:action[/:id]]',
                            'constraints' => array(
                                'action'    => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'        => '\d+',
                            ),
                            'defaults' => array(
                            ),
                        ),
                    ),
                    'paginator' => array(
                        'type' => 'Zend\Mvc\Router\Http\Segment',
                        'options' => array(
                            'route' => '[/list/page/:page]',
                            'constraints' => array(
                                'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'page' => '\d+',
                            ),
                            'defaults' => array(
                                'action'    => 'list',
                                'page'      => 1
                            ),
                        ),
                    ),
                    'feed' => array(
                        'type' => 'Zend\Mvc\Router\Http\Segment',
                        'options' => array(
                            'route' => '/feed.xml',
                            'defaults' => array(
                                'action'        => 'feed',
                            )
                        )
                    ),
                ),
            ),

            'employee' => array(
                'type'    => 'Literal',
                'options' => array(
                    'route'    => '/employee',
                    'defaults' => array(
                        '__NAMESPACE__' => 'Application\Controller',
                        'controller'    => 'Employee',
                        'action'        => 'index',
                    ),
                ),
                'may_terminate' => true,
                'child_routes' => array(
                    'default' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route' => '[/:action[/:id]]',
                            'constraints' => array(
                                'action'    => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'        => '\d+',
                            ),
                            'defaults' => array(
                            ),
                        ),
                    ),
                    'paginator' => array(
                        'type' => 'Zend\Mvc\Router\Http\Segment',
                        'options' => array(
                            'route' => '[/list/page/:page]',
                            'constraints' => array(
                                'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'page' => '\d+',
                            ),
                            'defaults' => array(
                                'action'    => 'list',
                                'page'      => 1
                            ),
                        ),
                    ),
                    'feed' => array(
                        'type' => 'Zend\Mvc\Router\Http\Segment',
                        'options' => array(
                            'route' => '/feed.xml',
                            'defaults' => array(
                                'action'        => 'feed',
                            )
                        )
                    ),
                ),
            ),

            'itinerary' => array(
                'type'    => 'Literal',
                'options' => array(
                    'route'    => '/itinerary',
                    'defaults' => array(
                        '__NAMESPACE__' => 'Application\Controller',
                        'controller'    => 'Itinerary',
                        'action'        => 'index',
                    ),
                ),
                'may_terminate' => true,
                'child_routes' => array(
                    'default' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route' => '[/:action[/:id]]',
                            'constraints' => array(
                                'action'    => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'        => '\d+',
                            ),
                            'defaults' => array(
                            ),
                        ),
                    ),
                    'paginator' => array(
                        'type' => 'Zend\Mvc\Router\Http\Segment',
                        'options' => array(
                            'route' => '[/list/page/:page]',
                            'constraints' => array(
                                'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'page' => '\d+',
                            ),
                            'defaults' => array(
                                'action'    => 'list',
                                'page'      => 1
                            ),
                        ),
                    ),
                    'feed' => array(
                        'type' => 'Zend\Mvc\Router\Http\Segment',
                        'options' => array(
                            'route' => '/feed.xml',
                            'defaults' => array(
                                'action'        => 'feed',
                            )
                        )
                    ),
                ),
            ),

            'highlights' => array(
                'type'    => 'Literal',
                'options' => array(
                    'route'    => '/highlights',
                    'defaults' => array(
                        '__NAMESPACE__' => 'Application\Controller',
                        'controller'    => 'Highlights',
                        'action'        => 'index',
                    ),
                ),
                'may_terminate' => true,
                'child_routes' => array(
                    'default' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route' => '[/:action[/:id]]',
                            'constraints' => array(
                                'action'    => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'        => '\d+',
                            ),
                            'defaults' => array(
                            ),
                        ),
                    ),
                    'paginator' => array(
                        'type' => 'Zend\Mvc\Router\Http\Segment',
                        'options' => array(
                            'route' => '[/list/page/:page]',
                            'constraints' => array(
                                'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'page' => '\d+',
                            ),
                            'defaults' => array(
                                'action'    => 'list',
                                'page'      => 1
                            ),
                        ),
                    ),
                    'feed' => array(
                        'type' => 'Zend\Mvc\Router\Http\Segment',
                        'options' => array(
                            'route' => '/feed.xml',
                            'defaults' => array(
                                'action'        => 'feed',
                            )
                        )
                    ),
                ),
            ),

            'upload' => array(
                'type'    => 'Segment',
                'options' => array(
                    'route'    => '/upload/images/[:folder]/[:type]/[:file]',
                    'constraints' => array(
                        'folder' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'type'     => '[a-zA-Z][a-zA-Z0-9_-]*'
                    ),
                    'defaults' => array(
                        '__NAMESPACE__' => 'Application\Controller',
                        'controller'    => 'ImageUpload',
                        'action'        => 'index',
                    ),
                ),
            ),
        ),
    ),
    'service_manager' => array(
        'abstract_factories' => array(
            'Zend\Cache\Service\StorageCacheAbstractServiceFactory',
            'Zend\Log\LoggerAbstractServiceFactory',
        ),
        'factories' => array(
            'translator' => 'Zend\Mvc\Service\TranslatorServiceFactory',
            'Navigation' => 'Zend\Navigation\Service\DefaultNavigationFactory',

            'Utils\View\Strategy\XmlStrategy' => UtilsFactory\XmlStrategyFactory::class,
            'Utils\View\Renderer\XmlRenderer' => UtilsFactory\XmlRendererFactory::class
        ),
        'aliases' => array(
            'ViewXmlStrategy' => UtilsView\Strategy\XmlStrategy::class,
            'ViewXmlRenderer' => UtilsView\Renderer\XmlRenderer::class
        )
    ),
    'translator' => array(
        'locale' => 'en_US',
        'translation_file_patterns' => array(
            array(
                'type'     => 'gettext',
                'base_dir' => __DIR__ . '/../language',
                'pattern'  => '%s.mo',
            ),
        ),
    ),
    'controllers' => array(
        'invokables' => array(
            'Application\Controller\Index' => Controller\IndexController::class,
            'Application\Controller\ImageUpload' => Controller\ImageUploadController::class
        ),
        'factories' => array(
            'Application\Controller\Warning' => 'Application\Factory\WarningControllerFactory',
            'Application\Controller\Activity' => 'Application\Factory\ActivityControllerFactory',
            'Application\Controller\Article' => 'Application\Factory\ArticleControllerFactory',
            'Application\Controller\Employee' => 'Application\Factory\EmployeeControllerFactory',
            'Application\Controller\Itinerary' => 'Application\Factory\ItineraryControllerFactory',
            'Application\Controller\Highlights' => 'Application\Factory\HighlightsControllerFactory',
        )
    ),
    'view_manager' => array(
        'display_not_found_reason' => true,
        'display_exceptions'       => true,
        'doctype'                  => 'HTML5',
        'not_found_template'       => 'error/404',
        'exception_template'       => 'error/index',
        'template_map' => array(
            'layout/layout'           => __DIR__ . '/../view/layout/layout.phtml',
            'layout/simple'            => __DIR__ . '/../view/layout/simple.phtml',
            'layout/error'            => __DIR__ . '/../view/layout/error.phtml',
            'application/index/index' => __DIR__ . '/../view/application/index/index.phtml',
            'error/404'               => __DIR__ . '/../view/error/404.phtml',
            'error/index'             => __DIR__ . '/../view/error/index.phtml',
        ),
        'template_path_stack' => array(
            __DIR__ . '/../view',
            'zfcuser' => __DIR__ . '/view',
        ),
        'strategies' => array(
            'ViewJsonStrategy',
            'ViewXmlStrategy'
        ),
    ),

    'doctrine' => array(
        'eventmanager' => array(
            'orm_default' => array(
                'subscribers' => array(
                    'Gedmo\Timestampable\TimestampableListener',
                    'Gedmo\SoftDeleteable\SoftDeleteableListener'
                ),

            ),
        ),
        'driver' => array(
            __NAMESPACE__ . '_entity' => array(
                'class' => 'Doctrine\ORM\Mapping\Driver\AnnotationDriver',
                'cache' => 'array',
                'paths' => array(__DIR__ . '/../src/' . __NAMESPACE__ . '/Entity')
            ),
            __NAMESPACE__ . '_repository' => array(
                'class' => 'Doctrine\ORM\Mapping\Driver\AnnotationDriver',
                'cache' => 'array',
                'paths' => array(__DIR__ . '/../src/' . __NAMESPACE__ . '/Repository')
            ),
            'orm_default' => array(
                'drivers' => array(
                    __NAMESPACE__ . '\Entity' => __NAMESPACE__ . '_entity',
                    __NAMESPACE__ . '\Repository' => __NAMESPACE__ . '_repository'
                )
            )
        ),
    ),

    // Placeholder for console routes
    'console' => array(
        'router' => array(
            'routes' => array(
            ),
        ),
    ),
);
