<?php
namespace Application\Form;

use Zend\Form\Form;
use Doctrine\ORM\EntityManager;

class EmployeeForm extends Form
{
    public function __construct(EntityManager $entityManager)
    {
        parent::__construct('form_employee');
        $this->setAttribute('class', 'form');
        $this->setAttribute('enctype','multipart/form-data');

        $this->add(array(
            'type' => 'Zend\Form\Element\Csrf',
            'name' => 'csrf'
        ));

        $this->add(array(
            'type' => 'Zend\Form\Element\Text',
            'name' => 'born_at',
            'options' => array(
                'label' => 'Nascimento',
            ),
            'attributes' => array(
                'id' => 'born_at',
                'required' => true,
                'readonly' => true,
                'class' => 'form-control datepicker',
                'placeholder' => 'dd/mm/aaaa',
                'maxlength' => 10
            ),
        ));

        $this->add(array(
            'type' => 'Zend\Form\Element\Text',
            'name' => 'name',
            'options' => array(
                'label' => 'Nome',
            ),
            'attributes' => array(
                'id' => 'label',
                'required' => true,
                'class' => 'form-control',
                'maxlength' => 45
            ),
        ));

        $this->add(array(
            'type' => 'Zend\Form\Element\Text',
            'name' => 'department',
            'options' => array(
                'label' => 'Departamento',
            ),
            'attributes' => array(
                'id' => 'title',
                'required' => true,
                'class' => 'form-control',
                'maxlength' => 45
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
                'class' => 'form-control',
            ),
        ));

        $this->add(array(
            'type' => 'Zend\Form\Element\File',
            'name' => 'image',
            'options' => array(
                'label' => 'Imagem',
            ),
            'attributes' => array(
                'id' => 'image',
                'class' => 'form-control'
            ),
        ));
    }
}