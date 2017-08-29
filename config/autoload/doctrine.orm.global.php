<?php
return array(
    'doctrine' => array(
        'connection' => array(
            // default connection name
            'orm_default' => array(
                'driverClass' => 'Doctrine\DBAL\Driver\PDOMySql\Driver',
                'params' => array(
                    'host'     => '127.0.0.1',
                    'port'     => '3306',
                    'user'     => 'root',
                    'password' => '',
                    'dbname'   => 'nivea_touch',
                    'driverOptions' => array(
                        1002 => 'SET NAMES utf8'
                    )
                )
            )
        ),
        'configuration' => array(
            'orm_default' => array(
                'string_functions' => array(
                    'HOUR' => 'DoctrineExtensions\Query\Mysql\Hour',
                    'DAY' => 'DoctrineExtensions\Query\Mysql\Day',
                    'MONTH' => 'DoctrineExtensions\Query\Mysql\Month',
                    'YEAR' => 'DoctrineExtensions\Query\Mysql\Year',
                    'DATE' => 'DoctrineExtensions\Query\Mysql\Date',
                    'IF' => 'DoctrineExtensions\Query\Mysql\IfElse',
                    'IF_NULL' => 'DoctrineExtensions\Query\Mysql\IfNull',
                    'DATE_FORMAT' => 'DoctrineExtensions\Query\Mysql\DateFormat',
                    'REGEXP' => 'DoctrineExtensions\Query\Mysql\Regexp',
                )
            )
        ),
    ),
);