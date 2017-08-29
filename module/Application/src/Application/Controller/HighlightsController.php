<?php
namespace Application\Controller;

use Application\Service\HighlightsService;
use Application\Form\HighlightsForm;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\Paginator\Paginator;
use Zend\Paginator\Adapter\ArrayAdapter;
use Zend\View\Model\ViewModel;
use Zend\View\Model\JsonModel;
use Utils\View\Model\XmlModel;
use DoctrineModule\Stdlib\Hydrator\DoctrineObject;

class HighlightsController extends AbstractActionController
{
    /**
     * @var $highlights_service HighlightsService
     */
    protected $highlights_service;

    /**
     * @var $doctrine_object DoctrineObject
     */
    protected $doctrine_object;

    /**
     * @var $highlights_form HighlightsForm
     */
    protected $highlights_form;

    public function __construct(HighlightsService $highlights_service, DoctrineObject $doctrine_object)
    {
        $this->setHighlightsService($highlights_service);
        $this->setDoctrineObject($doctrine_object);
    }

    public function indexAction()
    {
        return $this->redirect()->toRoute('highlights/default', array(
            'action' =>  'list'
        ));
    }

    public function listAction()
    {
        $entities = $this->getHighlightsService()->findAll();

        $page = $this->params()->fromRoute('page');
        $paginator = new Paginator(new ArrayAdapter($entities));
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

        $entity = $this->getHighlightsService()->save($data, $id);
        $data = $this->getDoctrineObject()->extract($entity);

        return new JsonModel($data);
    }

    public function showAction()
    {
        $id = $this->params()->fromRoute('id');
        $entity = $this->getHighlightsService()->findById($id);

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
                $this->getRequest()->getPost()->toArray(),
                $this->getRequest()->getFiles()->toArray()
            );

            $this->getHighlightsForm()->setData($data_post);

            if($this->getHighlightsForm()->isValid())
            {
                $this->getHighlightsService()->save($this->getHighlightsForm()->getData());
                return $this->redirect()->toRoute('highlights');
            }
            else
            {
                $data_form = $this->getHighlightsForm()->getData();
                if(file_exists($data_form['image']['tmp_name']))
                {
                    unlink($data_form['image']['tmp_name']);
                }
            }
        }

        return array(
            'form' => $this->getHighlightsForm(),
        );
    }

    public function editAction()
    {
        $id = $this->params()->fromRoute('id');

        $request = $this->getRequest();
        if ($request->isPost())
        {
            $data_post = array_merge(
                $this->getRequest()->getPost()->toArray(),
                $this->getRequest()->getFiles()->toArray()
            );

            $this->getHighlightsForm()->setData($data_post);

            if($this->getHighlightsForm()->isValid())
            {
                $this->getHighlightsService()->save($this->getHighlightsForm()->getData(), $id);
                return $this->redirect()->toRoute('highlights');
            }
            else
            {
                $data_form = $this->getHighlightsForm()->getData();
                if(file_exists($data_form['image']['tmp_name']))
                {
                    unlink($data_form['image']['tmp_name']);
                }
            }
        }

        $entity = $this->getHighlightsService()->findById($id);

        $data_form = $this->getDoctrineObject()->extract($entity);
        $data_form['fieldset_scheduling'] = array(
            'schedulingStart' => $entity->getSchedulingStart()->format('Y-m-d'),
            'schedulingEnd' => $entity->getSchedulingEnd()->format('Y-m-d')
        );
        unset($data_form['schedulingStart'], $data_form['schedulingEnd']);

        return array(
            'form' => $this->getHighlightsForm()->setData($data_form),
        );
    }

    public function deleteAction()
    {
        $id = $this->params()->fromRoute('id');

        $request = $this->getRequest();
        if ($request->isPost())
        {
            $this->getHighlightsService()->delete($id);

            $data = array(
                'id' => $id
            );

            $jsonModel = new JsonModel($data);

            return $jsonModel;
        }
        else
        {
            $entity = $this->getHighlightsService()->findById($id);

            $viewModel = new ViewModel(array(
                'entity' => $entity
            ));
            $viewModel->setTerminal(true);
            return $viewModel;
        }
    }

    public function feedAction()
    {
        $entities = $this->getHighlightsService()->findAllActive();

        $data = array();
        foreach($entities as $key => $entity)
        {
            if(empty($entity->getImage()))
                $image = '';
            else
                $image = substr($_SERVER['DOCUMENT_ROOT'],0 , -7) . '/data/uploads/highlights/middle/' . $entity->getImage();

            $data['item'][$key] = array(
                'button' => array(
                    'label' => $entity->getLabel(),
                    'date' => $entity->getCreatedAt()->format('Y-m-d H:i'),
                ),
                'container' => array(
                    'content' => array(
                        'title' => $entity->getTitle(),
                        'text' => $entity->getText(),
                    ),
                    'midia' => array(
                        'images' => array(
                            'image' => $image
                        )
                    )
                ),
            );
        }

        return new XmlModel($data);

    }

    /**
     * @return HighlightsService
     */
    public function getHighlightsService()
    {
        return $this->highlights_service;
    }

    /**
     * @param HighlightsService $highlights_service
     */
    public function setHighlightsService($highlights_service)
    {
        $this->highlights_service = $highlights_service;
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
     * @return HighlightsForm
     */
    public function getHighlightsForm()
    {
        return $this->highlights_form;
    }

    /**
     * @param HighlightsForm $highlights_form
     */
    public function setHighlightsForm($highlights_form)
    {
        $this->highlights_form = $highlights_form;
    }
}