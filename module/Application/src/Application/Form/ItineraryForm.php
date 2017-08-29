<?php
namespace Application\Form;

use Zend\Form\Form;
use Doctrine\ORM\EntityManager;

class ItineraryForm extends Form
{
    public function __construct(EntityManager $entityManager)
    {
        parent::__construct('form_itinerary');
        $this->setAttribute('class', 'form');

        $this->add(array(
            'type' => 'Zend\Form\Element\Csrf',
            'name' => 'csrf'
        ));

        $this->add(array(
            'name' => 'itineraryRoute',
            'type'    => 'DoctrineModule\Form\Element\ObjectSelect',
            'options' => array(
                'label' => 'Rota',
                'object_manager' => $entityManager,
                'target_class'   => 'Application\Entity\ItineraryRoute',
                'label_generator' => function($targetEntity) {
                    return $targetEntity->getName() . ' - ' . $targetEntity->getTrajectory();
                },
                'empty_option'   => 'Escolha uma rota'
            ),
            'attributes' => array(
                'id' => 'itineraryRoute',
                'required' => true,
                'class' => 'form-control',
            ),
        ));

        $this->add(array(
            'type' => 'Zend\Form\Element\Time',
            'name' => 'schedule',
            'options' => array(
                'label' => 'Horário',
                'format' => 'H:i'
            ),
            'attributes' => array(
                'id' => 'schedule',
                'required' => true,
                'class' => 'form-control time-mask',
                'maxlength' => 5,
                'placeholder' => 'hh:mm'
            ),
        ));

        $this->add(array(
            'type' => 'Zend\Form\Element\Text',
            'name' => 'stop',
            'options' => array(
                'label' => 'Ponto',
            ),
            'attributes' => array(
                'id' => 'stop',
                'required' => true,
                'class' => 'form-control',
                'maxlength' => 60
            ),
        ));

        $this->add(array(
            'type' => 'Zend\Form\Element\Text',
            'name' => 'reference',
            'options' => array(
                'label' => 'Referência',
            ),
            'attributes' => array(
                'id' => 'reference',
                'required' => true,
                'class' => 'form-control',
                'maxlength' => 40
            ),
        ));

        $this->add(array(
            'type' => 'Zend\Form\Element\Text',
            'name' => 'neighborhood',
            'options' => array(
                'label' => 'Bairo',
            ),
            'attributes' => array(
                'id' => 'neighborhood',
                'required' => true,
                'class' => 'form-control',
                'maxlength' => 15
            ),
        ));

        $this->add(array(
            'name' => 'itineraryCity',
            'type'    => 'DoctrineModule\Form\Element\ObjectSelect',
            'options' => array(
                'label' => 'Cidade',
                'object_manager' => $entityManager,
                'target_class'   => 'Application\Entity\ItineraryCity',
                'property' => 'name',
                'is_method'      => true,
                'find_method'    => array(
                    'name'   => 'findBy',
                    'params' => array(
                        'criteria' => array('active' => 1),
                        'orderBy'  => array('name' => 'asc'),
                    ),
                ),
                'empty_option'   => 'Escolha uma cidade'
            ),
            'attributes' => array(
                'id' => 'itineraryCity',
                'required' => true,
                'class' => 'form-control',
            ),
        ));
    }
}