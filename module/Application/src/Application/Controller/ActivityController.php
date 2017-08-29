<?php
namespace Application\Controller;

use Application\Service\ActivityService;
use Application\Form\ActivityForm;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\Paginator\Paginator;
use Zend\Paginator\Adapter\ArrayAdapter;
use Zend\View\Model\ViewModel;
use Zend\View\Model\JsonModel;
use Utils\View\Model\XmlModel;
use DoctrineModule\Stdlib\Hydrator\DoctrineObject;

class ActivityController extends AbstractActionController
{
    /**
     * @var $activity_service ActivityService
     */
    protected $activity_service;

    /**
     * @var $doctrine_object DoctrineObject
     */
    protected $doctrine_object;

    /**
     * @var $activity_form ActivityForm
     */
    protected $activity_form;

    public function __construct(ActivityService $activity_service, DoctrineObject $doctrine_object)
    {
        $this->setActivityService($activity_service);
        $this->setDoctrineObject($doctrine_object);
    }

    public function indexAction()
    {
        return $this->redirect()->toRoute('activity/default', array(
            'action' =>  'list'
        ));
    }

    public function listAction()
    {
        $entities = $this->getActivityService()->findAll();

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

        $entity = $this->getActivityService()->save($data, $id);
        $data = $this->getDoctrineObject()->extract($entity);

        return new JsonModel($data);
    }

    public function showAction()
    {
        $id = $this->params()->fromRoute('id');
        $entity = $this->getActivityService()->findById($id);

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

            $this->getActivityForm()->setData($data_post);

            if($this->getActivityForm()->isValid())
            {
                $this->getActivityService()->save($this->getActivityForm()->getData());
                return $this->redirect()->toRoute('activity');
            }
            else
            {
                $data_form = $this->getActivityForm()->getData();
                if(file_exists($data_form['image']['tmp_name']))
                {
                    unlink($data_form['image']['tmp_name']);
                }
            }
        }

        return array(
            'form' => $this->getActivityForm(),
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

            $this->getActivityForm()->setData($data_post);

            if($this->getActivityForm()->isValid())
            {
                $this->getActivityService()->save($this->getActivityForm()->getData(), $id);
                return $this->redirect()->toRoute('activity');
            }
            else
            {
                $data_form = $this->getActivityForm()->getData();
                if(file_exists($data_form['image']['tmp_name']))
                {
                    unlink($data_form['image']['tmp_name']);
                }
            }
        }

        $entity = $this->getActivityService()->findById($id);
        $data_form = $this->getDoctrineObject()->extract($entity);
        $data_form['fieldset_scheduling'] = array(
            'schedulingStart' => $entity->getSchedulingStart()->format('Y-m-d'),
            'schedulingEnd' => $entity->getSchedulingEnd()->format('Y-m-d')
        );
        unset($data_form['schedulingStart'], $data_form['schedulingEnd']);

        return array(
            'form' => $this->getActivityForm()->setData($data_form),
        );
    }

    public function deleteAction()
    {
        $id = $this->params()->fromRoute('id');

        $request = $this->getRequest();
        if ($request->isPost())
        {
            $this->getActivityService()->delete($id);

            $data = array(
                'id' => $id
            );

            $jsonModel = new JsonModel($data);

            return $jsonModel;
        }
        else
        {
            $entity = $this->getActivityService()->findById($id);

            $viewModel = new ViewModel(array(
                'entity' => $entity
            ));
            $viewModel->setTerminal(true);
            return $viewModel;
        }
    }

    public function feedAction()
    {
        $entities = $this->getActivityService()->findAllValid();

        $data = array();
        foreach($entities as $key => $entity)
        {
            if(empty($entity->getImage()))
                $image = '';
            else
                $image = substr($_SERVER['DOCUMENT_ROOT'],0 , -7) . '/data/uploads/activity/middle/' . $entity->getImage();

            $data['item'][$key] = array(
                'button' => array(
                    'label' => $entity->getLabel(),
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
                )
            );
        }

        return new XmlModel($data);
    }

    /**
     * @return ActivityService
     */
    public function getActivityService()
    {
        return $this->activity_service;
    }

    /**
     * @param ActivityService $activity_service
     */
    public function setActivityService($activity_service)
    {
        $this->activity_service = $activity_service;
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
     * @return ActivityForm
     */
    public function getActivityForm()
    {
        return $this->activity_form;
    }

    /**
     * @param ActivityForm $activity_form
     */
    public function setActivityForm($activity_form)
    {
        $this->activity_form = $activity_form;
    }
}