<?php
$config = array(
    'modules' => array(
        'DoctrineModule', 'DoctrineORMModule',
        'ZfcBase', 'ZfcUser', 'ZfcUserDoctrineORM',
        'ZF2Excel',
        'SamUser',
        'Kpi',
        'Application',
    ),

    'module_listener_options' => array(
        'module_paths' => array(
            './module',
            './vendor',
        ),

        'config_glob_paths' => array(
            'config/autoload/{{,*.}global,{,*.}local}.php',
        ),
    ),
);

if(!\Zend\Console\Console::isConsole())
{
    array_unshift($config['modules'],'BjyAuthorize');
}

return $config;