<?php
namespace Application\Filter;

use Zend\InputFilter\InputFilter;

class ItineraryFilter extends InputFilter
{
    public function __construct()
    {
        $this->add(array(
            'name' => 'itineraryRoute',
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

        $this->add(array(
            'name' => 'schedule',
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
                        'max' => 5
                    )
                ),
            )
        ));

        $this->add(array(
            'name' => 'stop',
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
                        'max' => 60
                    )
                ),
            )
        ));

        $this->add(array(
            'name' => 'reference',
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
                        'max' => 40
                    )
                ),
            )
        ));

        $this->add(array(
            'name' => 'neighborhood',
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
                        'max' => 15
                    )
                ),
            )
        ));

        $this->add(array(
            'name' => 'itineraryCity',
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