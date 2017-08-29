<?php

namespace Application\Fieldset;

use Zend\Form\Fieldset;
use Zend\InputFilter\InputFilterProviderInterface;

class SchedulingFieldset extends Fieldset implements InputFilterProviderInterface
{
    public function __construct()
    {
        parent::__construct('fieldset_scheduling');

        $this->add(array(
            'type' => 'Zend\Form\Element\Hidden',
            'name' => 'schedulingStart',
            'options' => array(
                'label' => 'Data início',
            ),
            'attributes' => array(
                'id' => 'schedulingStart',
                'required' => true,
                'maxlength' => 13
            ),
        ));

        $this->add(array(
            'type' => 'Zend\Form\Element\Hidden',
            'name' => 'schedulingEnd',
            'options' => array(
                'label' => 'Data final',
            ),
            'attributes' => array(
                'id' => 'schedulingEnd',
                'required' => true,
                'maxlength' => 13
            ),
        ));
    }

    public function getInputFilterSpecification()
    {
        return array(
            'schedulingStart' => array(
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
                        'name' => 'Date',
                        'break_chain_on_failure' => true,
                        'options' => array(
                            'format' => 'Y-m-d'
                        )
                    )
                )
            ),
            'schedulingEnd' => array(
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
                        'name' => 'Date',
                        'break_chain_on_failure' => true,
                        'options' => array(
                            'format' => 'Y-m-d'
                        )
                    )
                )
            ),
        );
    }
}