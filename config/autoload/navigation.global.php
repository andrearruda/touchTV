<?php

return array(
    'navigation' => array(
        'default' => array(
            'home' => array(
                'label' => 'Home',
                'route' => 'home',
                'icon' => 'md md-home',
                'show_in_menu' => false,
            ),
            'warning' => array(
                'label' => 'Avisos Urgentes',
                'route' => 'warning',
                'icon' => 'fa fa-calendar',
                'uri' => '#',
                'pages' => array(
                    array(
                        'label' => 'Listar',
                        'route' => 'warning/default',
                        'action' => 'list'
                    ),
                    array(
                        'label' => 'Listar',
                        'route' => 'warning/paginator',
                        'action' => 'list',
                        'show_in_menu' => false,
                    ),
                    array(
                        'label' => 'Adicionar',
                        'route' => 'warning/default',
                        'action' => 'add'
                    ),
                    array(
                        'label' => 'Editar',
                        'route' => 'warning/default',
                        'action' => 'edit',
                        'show_in_menu' => false,
                    ),
                )
            ),
            array(
                'label' => 'Produção em dia',
                'route' => 'home',
                'icon' => 'fa fa-industry',
                'uri' => '#',
                'pages' => array(
                    'article' => array(
                        'label' => 'Notícias',
                        'route' => 'article',
                        'uri' => '#',
                        'pages' => array(
                            array(
                                'label' => 'Listar',
                                'route' => 'article/default',
                                'action' => 'list'
                            ),
                            array(
                                'label' => 'Listar',
                                'route' => 'article/paginator',
                                'action' => 'list',
                                'show_in_menu' => false,
                            ),
                            array(
                                'label' => 'Adicionar',
                                'route' => 'article/default',
                                'action' => 'add'
                            ),
                            array(
                                'label' => 'Editar',
                                'route' => 'article/default',
                                'action' => 'edit',
                                'show_in_menu' => false,
                            ),
                        )
                    ),
                    'highlights' => array(
                        'label' => 'Destaques',
                        'route' => 'highlights',
                        'uri' => '#',
                        'pages' => array(
                            array(
                                'label' => 'Listar',
                                'route' => 'highlights/default',
                                'action' => 'list'
                            ),
                            array(
                                'label' => 'Listar',
                                'route' => 'highlights/paginator',
                                'action' => 'list',
                                'show_in_menu' => false,
                            ),
                            array(
                                'label' => 'Adicionar',
                                'route' => 'highlights/default',
                                'action' => 'add'
                            ),
                            array(
                                'label' => 'Editar',
                                'route' => 'highlights/default',
                                'action' => 'edit',
                                'show_in_menu' => false,
                            ),
                        )
                    ),
                    'employee' => array(
                        'label' => 'Colaboradores',
                        'route' => 'employee',
                        'uri' => '#',
                        'pages' => array(
                            array(
                                'label' => 'Listar',
                                'route' => 'employee/default',
                                'action' => 'list'
                            ),
                            array(
                                'label' => 'Listar',
                                'route' => 'employee/paginator',
                                'action' => 'list',
                                'show_in_menu' => false,
                            ),
                            array(
                                'label' => 'Adicionar',
                                'route' => 'employee/default',
                                'action' => 'add'
                            ),
                            array(
                                'label' => 'Editar',
                                'route' => 'employee/default',
                                'action' => 'edit',
                                'show_in_menu' => false,
                            ),
                        )
                    ),
                    'itinerary' => array(
                        'label' => 'Itinerário',
                        'route' => 'itinerary',
                        'uri' => '#',
                        'pages' => array(
                            array(
                                'label' => 'Listar',
                                'route' => 'itinerary/default',
                                'action' => 'list'
                            ),
                            array(
                                'label' => 'Listar',
                                'route' => 'itinerary/paginator',
                                'action' => 'list',
                                'show_in_menu' => false,
                            ),
                            array(
                                'label' => 'Adicionar',
                                'route' => 'itinerary/default',
                                'action' => 'add'
                            ),
                            array(
                                'label' => 'Editar',
                                'route' => 'itinerary/default',
                                'action' => 'edit',
                                'show_in_menu' => false,
                            ),
                        )
                    ),
                )
            ),
            'activity' => array(
                'label' => 'Cursos e Treinamentos',
                'route' => 'activity',
                'icon' => 'fa fa-university',
                'uri' => '#',
                'pages' => array(
                    array(
                        'label' => 'Listar',
                        'route' => 'activity/default',
                        'action' => 'list'
                    ),
                    array(
                        'label' => 'Listar',
                        'route' => 'activity/paginator',
                        'action' => 'list',
                        'show_in_menu' => false,
                    ),
                    array(
                        'label' => 'Adicionar',
                        'route' => 'activity/default',
                        'action' => 'add'
                    ),
                    array(
                        'label' => 'Editar',
                        'route' => 'activity/default',
                        'action' => 'edit',
                        'show_in_menu' => false,
                    ),
                )
            ),
        )
    )
);