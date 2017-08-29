<?php

namespace Application\Filter;

use Zend\InputFilter\InputFilter;

class EmployeeExportFilter extends InputFilter
{
    public function __construct()
    {
        $this->add(array(
            'name' => 'startedIn',
            'required' => false,
            'filters'  => array(
                array('name' => 'StringTrim'),
            ),
            'validators' => array(
                array(
                    'name' => 'NotEmpty',
                    'break_chain_on_failure' => true,
                ),
                array(
                    'name' => 'Date',
                    'options' => array(
                        'format' => 'd/m/Y',
                    )
                )
            )
        ));

        $this->add(array(
            'name' => 'finalizedIn',
            'required' => false,
            'filters'  => array(
                array('name' => 'StringTrim'),
            ),
            'validators' => array(
                array(
                    'name' => 'NotEmpty',
                    'break_chain_on_failure' => true,
                ),
                array(
                    'name' => 'Date',
                    'options' => array(
                        'format' => 'd/m/Y',
                    )
                )
            )
        ));
    }
}