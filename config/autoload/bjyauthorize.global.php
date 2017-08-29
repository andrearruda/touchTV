<?php
return array(
    'bjyauthorize' => array(
        'unauthorized_strategy' => 'BjyAuthorize\View\RedirectionStrategy',
        'template' => 'error/403_custom',
        'guards' => array(
            \BjyAuthorize\Guard\Controller::class => array(
                ['controller' => 'zfcuser', 'roles' => []],

                ['controller' => 'Kpi\Controller\Daily', 'roles' => []],
                ['controller' => 'Kpi\Controller\Monthly', 'roles' => []],
                ['controller' => 'Kpi\Controller\Shift', 'roles' => []],
                ['controller' => 'Application\Controller\ImageUpload', 'roles' => []],

                ['controller' => 'Application\Controller\Warning', 'roles' => ['guest', 'user']],
                ['controller' => 'Application\Controller\Activity', 'roles' => ['guest', 'user']],
                ['controller' => 'Application\Controller\Article', 'roles' => ['guest', 'user']],
                ['controller' => 'Application\Controller\Employee', 'roles' => ['guest', 'user']],
                ['controller' => 'Application\Controller\Itinerary', 'roles' => ['guest', 'user']],
                ['controller' => 'Application\Controller\Highlights', 'roles' => ['guest', 'user']],
            ),

            \BjyAuthorize\Guard\Route::class => array(
                ['route' => 'upload', 'roles' => ['guest', 'user']],

                ['route' => 'kpi', 'roles' => ['guest']],
                ['route' => 'kpi/default', 'roles' => ['guest']],

                ['route' => 'zfcuser', 'roles' => ['user']],
                ['route' => 'zfcuser/logout', 'roles' => ['user']],
                ['route' => 'zfcuser/login', 'roles' => ['guest']],
                ['route' => 'zfcuser/register', 'roles' => ['guest']],

                ['route' => 'warning', 'roles' => ['user']],
                ['route' => 'warning/default', 'roles' => ['user']],
                ['route' => 'warning/paginator', 'roles' => ['user']],
                ['route' => 'warning/feed', 'roles' => ['guest', 'user']],
                ['route' => 'warning/notification', 'roles' => ['guest', 'user']],

                ['route' => 'activity', 'roles' => ['user']],
                ['route' => 'activity/default', 'roles' => ['user']],
                ['route' => 'activity/paginator', 'roles' => ['user']],
                ['route' => 'activity/feed', 'roles' => ['guest', 'user']],

                ['route' => 'article', 'roles' => ['user']],
                ['route' => 'article/default', 'roles' => ['user']],
                ['route' => 'article/paginator', 'roles' => ['user']],
                ['route' => 'article/feed', 'roles' => ['guest', 'user']],

                ['route' => 'employee', 'roles' => ['user']],
                ['route' => 'employee/default', 'roles' => ['user']],
                ['route' => 'employee/paginator', 'roles' => ['user']],
                ['route' => 'employee/feed', 'roles' => ['guest', 'user']],

                ['route' => 'itinerary', 'roles' => ['user']],
                ['route' => 'itinerary/default', 'roles' => ['user']],
                ['route' => 'itinerary/paginator', 'roles' => ['user']],
                ['route' => 'itinerary/feed', 'roles' => ['guest', 'user']],

                ['route' => 'highlights', 'roles' => ['user']],
                ['route' => 'highlights/default', 'roles' => ['user']],
                ['route' => 'highlights/paginator', 'roles' => ['user']],
                ['route' => 'highlights/feed', 'roles' => ['guest', 'user']],
            )
        )
    )
);