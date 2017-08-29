<?php

namespace Application\Form;

use Zend\Form\Form;

class EmployeeExportForm extends Form
{
    public function __construct()
    {
        parent::__construct('form_employee_export');
        $this->setAttribute('class', 'form');

        $this->add(array(
            'type' => 'Zend\Form\Element\Text',
            'name' => 'startedIn',
            'options' => array(
                'label' => 'Início',
            ),
            'attributes' => array(
                'id' => 'startedAt',
                'required' => false,
                'readonly' => true,
                'class' => 'form-control datepicker',
                'placeholder' => 'dd/mm/aaaa',
                'maxlength' => 10
            ),
        ));

        $this->add(array(
            'type' => 'Zend\Form\Element\Text',
            'name' => 'finalizedIn',
            'options' => array(
                'label' => 'Fim',
            ),
            'attributes' => array(
                'id' => 'finalizedIn',
                'required' => false,
                'class' => 'form-control datepicker',
                'placeholder' => 'dd/mm/aaaa',
                'maxlength' => 10
            ),
        ));
    }
}