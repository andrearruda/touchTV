<?php
namespace Kpi;

return array(
    'router' => array(
        'routes' => array(
            'kpi' => array(
                'type'    => 'Literal',
                'options' => array(
                    'route'    => '/kpi',
                ),
                'may_terminate' => true,
                'child_routes' => array(
                    'default' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route' => '/[:controller]/feed.xml',
                            'constraints' => array(
                                'controller'    => '[a-zA-Z][a-zA-Z0-9_-]*',
                            ),
                            'defaults' => array(
                                '__NAMESPACE__' => 'Kpi\Controller',
                                'action' => 'Index'
                            ),
                        ),
                    ),
                ),
            ),
        ),
    ),
    'controllers' => array(
        'invokables' => array(
            'Kpi\Controller\Daily' => Controller\DailyController::class,
            'Kpi\Controller\Monthly' => Controller\MonthlyController::class,
            'Kpi\Controller\Shift' => Controller\ShiftController::class,
        ),
    ),
);
