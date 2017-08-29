<?php
namespace Application\Filter;

use Zend\InputFilter\InputFilter;

class EmployeeFilter extends InputFilter
{
    public function __construct()
    {
        $this->add(array(
            'name' => 'name',
            'required' => true,
            'filters' => array(
                array('name' => 'StripTags'),
                array('name' => 'StringTrim')
            ),
            'validators' => array(
                array(
                    'name' => 'NotEmpty',
                    'break_chain_on_failure' => true,
                ),
                array(
                    'name' => 'StringLength',
                    'break_chain_on_failure' => true,
                    'options' => array(
                        'max' => 45
                    )
                ),
            )
        ));

        $this->add(array(
            'name' => 'department',
            'required' => true,
            'filters' => array(
                array('name' => 'StripTags'),
                array('name' => 'StringTrim')
            ),
            'validators' => array(
                array(
                    'name' => 'NotEmpty',
                    'break_chain_on_failure' => true,
                ),
                array(
                    'name' => 'StringLength',
                    'break_chain_on_failure' => true,
                    'options' => array(
                        'max' => 45
                    )
                ),
            )
        ));

        $this->add(array(
            'type' => 'Zend\InputFilter\FileInput',
            'name' => 'image',
            'required'   => true,
            'filters'    => array(
                array(
                    'name' => '\Zend\Filter\File\RenameUpload',
                    'options' => array(
                        'target' => './data/uploads/employee/original/img',
                        'use_upload_extension' => true,
                        'overwrite' => true,
                        'randomize' => true
                    )
                ),
            ),
            'validators' => array(
                array(
                    'name' => 'Zend\Validator\File\Extension',
                    'options' => array(
                        'extension' => 'jpg,jpeg,png',
                    )
                ),
                array(
                    'name' => 'Zend\Validator\File\MimeType',
                    'options' => array(
                        'mimeType' => 'image/jpeg,image/jpg,image/png,image/x-png',
                    )
                ),
                array(
                    'name' => 'Zend\Validator\File\Size',
                    'options' => array(
                        'max' => 3145728,
                    )
                ),
            ),
        ));

        $this->add(array(
            'name' => 'employeeUnit',
            'required' => true,
            'filters' => array(
                array('name' => 'StripTags'),
                array('name' => 'StringTrim')
            ),
            'validators' => array(
                array(
                    'name' => 'NotEmpty',
                    'break_chain_on_failure' => true,
                )
            )
        ));
    }
}