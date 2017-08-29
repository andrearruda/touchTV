<?php
namespace Application\Controller;

use Application\Service\ItineraryRouteService;
use Application\Service\ItineraryService;
use Application\Form\ItineraryForm;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\Paginator\Paginator;
use Zend\Paginator\Adapter\ArrayAdapter;
use Zend\View\Model\ViewModel;
use Zend\View\Model\JsonModel;
use DoctrineModule\Stdlib\Hydrator\DoctrineObject;
use Thapp\XmlBuilder\XMLBuilder;
use Thapp\XmlBuilder\Normalizer;

class ItineraryController extends AbstractActionController
{
    /**
     * @var $itinerary_service ItineraryService
     */
    protected $itinerary_service;

    /**
     * @var $itinerary_service ItineraryRouteService
     */
    protected $itinerary_route_service;

    /**
     * @var $doctrine_object DoctrineObject
     */
    protected $doctrine_object;

    /**
     * @var $itinerary_form ItineraryForm
     */
    protected $itinerary_form;

    public function __construct(ItineraryService $itinerary_service, ItineraryRouteService $itinerary_route_service, DoctrineObject $doctrine_object)
    {
        $this->setItineraryService($itinerary_service);
        $this->setItineraryRouteService($itinerary_route_service);
        $this->setDoctrineObject($doctrine_object);
    }

    public function indexAction()
    {
        return $this->redirect()->toRoute('itinerary/default', array(
            'action' =>  'list'
        ));
    }

    public function listAction()
    {
        $entities = $this->getItineraryService()->findAll();

        $page = $this->params()->fromRoute('page');
        $paginator = new Paginator(new ArrayAdapter($entities));
        $paginator->setDefaultItemCountPerPage(30);
        $paginator->setCurrentPageNumber($page);

        $viewModel = new ViewModel(array(
            'data' => $paginator,
            'page' => $page
        ));

        return $viewModel;
    }

    public function activeAction()
    {
        $id = $this->params()->fromRoute('id');
        $data = array(
            'active' => $this->params()->fromQuery('active')
        );

        $entity = $this->getItineraryService()->save($data, $id);
        $data = $this->getDoctrineObject()->extract($entity);

        return new JsonModel($data);
    }

    public function showAction()
    {
        $id = $this->params()->fromRoute('id');
        $entity = $this->getItineraryService()->findById($id);

        $viewModel = new ViewModel(array(
            'entity' => $entity
        ));
        $viewModel->setTerminal(true);
        return $viewModel;
    }

    public function addAction()
    {
        $request = $this->getRequest();
        if ($request->isPost())
        {
            $data_post = array_merge(
                $this->getRequest()->getPost()->toArray()
            );

            $this->getItineraryForm()->setData($data_post);

            if($this->getItineraryForm()->isValid())
            {
                $this->getItineraryService()->save($this->getItineraryForm()->getData());
                return $this->redirect()->toRoute('itinerary');
            }
        }

        return array(
            'form' => $this->getItineraryForm(),
        );
    }

    public function editAction()
    {
        $id = $this->params()->fromRoute('id');

        $request = $this->getRequest();
        if ($request->isPost())
        {
            $data_post = array_merge(
                $this->getRequest()->getPost()->toArray()
            );

            $this->getItineraryForm()->setData($data_post);

            if($this->getItineraryForm()->isValid())
            {
                $this->getItineraryService()->save($this->getItineraryForm()->getData(), $id);
                return $this->redirect()->toRoute('itinerary');
            }
            else
            {
                $data_form = $this->getItineraryForm()->getData();
                if(file_exists($data_form['image']['tmp_name']))
                {
                    unlink($data_form['image']['tmp_name']);
                }
            }
        }

        $entity = $this->getItineraryService()->findById($id);
        $data_form = $this->getDoctrineObject()->extract($entity);

        return array(
            'form' => $this->getItineraryForm()->setData($data_form),
        );
    }

    public function deleteAction()
    {
        $id = $this->params()->fromRoute('id');

        $request = $this->getRequest();
        if ($request->isPost())
        {
            $this->getItineraryService()->delete($id);

            $data = array(
                'id' => $id
            );

            $jsonModel = new JsonModel($data);

            return $jsonModel;
        }
        else
        {
            $entity = $this->getItineraryService()->findById($id);

            $viewModel = new ViewModel(array(
                'entity' => $entity
            ));
            $viewModel->setTerminal(true);
            return $viewModel;
        }
    }

    public function feedAction()
    {
        $data = array();

        $entities_itinerary_routes = $this->getItineraryRouteService()->findAll();
        foreach($entities_itinerary_routes as $key => $routes)
        {
            $container = array();
            $entities_itinerary = $this->getItineraryService()->findByItinerayRoute($routes);

            foreach($entities_itinerary as $i => $itinerary)
            {
                $container[$i] = array(
                    'schedule' => $itinerary->getSchedule() . ' hr',
                    'stop' => $itinerary->getStop(),
                    'reference' => $itinerary->getReference(),
                    'neighborhood' => $itinerary->getNeighborhood(),
                    'city' => $itinerary->getItineraryCity()->getName()
                );
            }

            $data[$key] = array(
                'button' => array(
                    'label' => $routes->getName(),
                    'name' => $routes->getTrajectory()
                ),
                'containers' => $container
            );
        }

        $xmlBuilder = new XmlBuilder('root');
        $xmlBuilder->setSingularizer(function ($name) {
            if ('containers' === $name) {
                return 'item';
            }

            return $name;
        });
        $xmlBuilder->load($data);
        $xml_output = $xmlBuilder->createXML(true);

        $response = $this->getResponse();
        $response->getHeaders()->addHeaderLine('Content-Type', 'text/xml; charset=utf-8');
        $response->setContent($xml_output);

        return $response;
    }

    /**
     * @return ItineraryService
     */
    public function getItineraryService()
    {
        return $this->itinerary_service;
    }

    /**
     * @param ItineraryService $itinerary_service
     */
    public function setItineraryService($itinerary_service)
    {
        $this->itinerary_service = $itinerary_service;
    }

    /**
     * @return ItineraryRouteService
     */
    public function getItineraryRouteService()
    {
        return $this->itinerary_route_service;
    }

    /**
     * @param ItineraryRouteService $itinerary_route_service
     */
    public function setItineraryRouteService($itinerary_route_service)
    {
        $this->itinerary_route_service = $itinerary_route_service;
    }

    /**
     * @return DoctrineObject
     */
    public function getDoctrineObject()
    {
        return $this->doctrine_object;
    }

    /**
     * @param DoctrineObject $doctrine_object
     */
    public function setDoctrineObject($doctrine_object)
    {
        $this->doctrine_object = $doctrine_object;
    }

    /**
     * @return ItineraryForm
     */
    public function getItineraryForm()
    {
        return $this->itinerary_form;
    }

    /**
     * @param ItineraryForm $itinerary_form
     */
    public function setItineraryForm($itinerary_form)
    {
        $this->itinerary_form = $itinerary_form;
    }
}