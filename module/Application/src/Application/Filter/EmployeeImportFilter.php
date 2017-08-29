<?php

namespace Application\Filter;

use Zend\InputFilter\InputFilter;

class EmployeeImportFilter extends InputFilter
{
    public function __construct()
    {
        $this->add(array(
            'name' => 'monthCurrent',
            'required' => true,
            'filters' => array(
                array('name' => 'Int')
            ),
            'validators' => array(
                array(
                    'name' => 'NotEmpty',
                    'break_chain_on_failure' => true,
                ),
                array(
                    'name' => 'Between',
                    'break_chain_on_failure' => true,
                    'options' => array(
                        'min' => 1,
                        'max' => 12,
                    )
                )
            )
        ));

        $this->add(array(
            'name' => 'employeeUnit',
            'required' => true,
            'filters' => array(
                array('name' => 'Int')
            ),
            'validators' => array(
                array(
                    'name' => 'NotEmpty',
                    'break_chain_on_failure' => true,
                )
            )
        ));

        $this->add(array(
            'type' => 'Zend\InputFilter\FileInput',
            'name' => 'fileExcel',
            'required'   => true,
            'validators' => array(
                array(
                    'name' => 'Zend\Validator\File\Extension',
                    'options' => array(
                        'extension' => 'xls,xlsx',
                    )
                ),
                array(
                    'name' => 'Zend\Validator\File\MimeType',
                    'options' => array(
                        'mimeType' => 'application/vnd.ms-office,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
                    )
                ),
                array(
                    'name' => 'Zend\Validator\File\Size',
                    'options' => array(
                        'max' => 1048576,
                    )
                ),
            ),
        ));
    }
}