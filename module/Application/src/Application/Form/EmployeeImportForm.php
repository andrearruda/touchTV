<?php

namespace Application\Form;

use Zend\Form\Form;
use Doctrine\ORM\EntityManager;

class EmployeeImportForm extends Form
{
    public function __construct(EntityManager $entityManager)
    {
        parent::__construct('form_employee_import');
        $this->setAttribute('class', 'form');
        $this->setAttribute('enctype','multipart/form-data');

        $this->add(array(
            'type' => 'Zend\Form\Element\Text',
            'name' => 'monthCurrent',
            'options' => array(
                'label' => 'Mês',
            ),
            'attributes' => array(
                'id' => 'monthCurrent',
                'required' => true,
                'readonly' => true,
                'class' => 'form-control input-sm datepicker',
                'maxlength' => 10
            ),
        ));

        $this->add(array(
            'name' => 'employeeUnit',
            'type'    => 'DoctrineModule\Form\Element\ObjectSelect',
            'options' => array(
                'label' => 'Unidade',
                'object_manager' => $entityManager,
                'target_class'   => 'Application\Entity\EmployeeUnit',
                'property' => 'name',
                'is_method'      => true,
                'find_method'    => array(
                    'name'   => 'findBy',
                    'params' => array(
                        'criteria' => array('active' => 1),
                        'orderBy'  => array('id' => 'asc'),
                    ),
                ),
                'empty_option'   => 'Escolha uma unidade'
            ),
            'attributes' => array(
                'id' => 'employeeUnit',
                'required' => true,
                'class' => 'form-control input-sm',
            ),
        ));

        $this->add(array(
            'type' => 'Zend\Form\Element\File',
            'name' => 'fileExcel',
            'options' => array(
                'label' => 'Arquivo',
            ),
            'attributes' => array(
                'id' => 'fileExcel',
                'class' => 'form-control input-sm'
            ),
        ));

        $this->add(array(
            'type' => 'Zend\Form\Element\Checkbox',
            'name' => 'clearMonthCurrent',
            'options' => array(
                'label' => 'Arquivo',
            ),
            'attributes' => array(
                'id' => 'clearMonthCurrent',
                'class' => 'form-control',
                'checked' => 'checked'
            ),
        ));
    }
}