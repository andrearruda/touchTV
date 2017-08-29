<?php
namespace Application\Form;

use Application\Fieldset\SchedulingFieldset;
use Zend\Form\Form;

class ArticleForm extends Form
{
    public function __construct(SchedulingFieldset $scheduling_fieldset)
    {
        parent::__construct('form_article');
        $this->setAttribute('class', 'form');
        $this->setAttribute('enctype','multipart/form-data');

        $this->add(array(
            'type' => 'Zend\Form\Element\Csrf',
            'name' => 'csrf'
        ));

        $this->add(array(
            'type' => 'Zend\Form\Element\Text',
            'name' => 'label',
            'options' => array(
                'label' => 'Label do botão',
            ),
            'attributes' => array(
                'id' => 'label',
                'required' => true,
                'class' => 'form-control',
                'maxlength' => 20
            ),
        ));

        $this->add(array(
            'type' => 'Zend\Form\Element\Text',
            'name' => 'title',
            'options' => array(
                'label' => 'Titulo',
            ),
            'attributes' => array(
                'id' => 'title',
                'required' => true,
                'class' => 'form-control',
                'maxlength' => 45
            ),
        ));

        $this->add(array(
            'type' => 'Zend\Form\Element\Textarea',
            'name' => 'text',
            'options' => array(
                'label' => 'Texto',
            ),
            'attributes' => array(
                'id' => 'text',
                'required' => true,
                'class' => 'form-control'
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

        $this->add(array(
            'type' => 'Application\Fieldset\SchedulingFieldset',
        ));
    }
}