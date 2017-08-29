<?php
namespace Application\Controller;

use Application\Service\WarningService;
use Application\Form\WarningForm;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\Paginator\Paginator;
use Zend\Paginator\Adapter\ArrayAdapter;
use Zend\View\Model\ViewModel;
use Zend\View\Model\JsonModel;
use Utils\View\Model\XmlModel;
use DoctrineModule\Stdlib\Hydrator\DoctrineObject;

class WarningController extends AbstractActionController
{
    /**
     * @var $warning_service WarningService
     */
    protected $warning_service;

    /**
     * @var $doctrine_object DoctrineObject
     */
    protected $doctrine_object;

    /**
     * @var $warning_form WarningForm
     */
    protected $warning_form;

    public function __construct(WarningService $warning_service, DoctrineObject $doctrine_object)
    {
        $this->setWarningService($warning_service);
        $this->setDoctrineObject($doctrine_object);
    }

    public function indexAction()
    {
        return $this->redirect()->toRoute('warning/default', array(
            'action' =>  'list'
        ));
    }

    public function listAction()
    {
        $entities = $this->getWarningService()->findAll();

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

        $entity = $this->getWarningService()->save($data, $id);
        $data = $this->getDoctrineObject()->extract($entity);

        return new JsonModel($data);
    }

    public function showAction()
    {
        $id = $this->params()->fromRoute('id');
        $entity = $this->getWarningService()->findById($id);

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

            $this->getWarningForm()->setData($data_post);

            if($this->getWarningForm()->isValid())
            {
                $this->getWarningService()->save($this->getWarningForm()->getData());
                return $this->redirect()->toRoute('warning');
            }
            else
            {
                $data_form = $this->getWarningForm()->getData();
                if(file_exists($data_form['image']['tmp_name']))
                {
                    unlink($data_form['image']['tmp_name']);
                }
            }
        }

        return array(
            'form' => $this->getWarningForm(),
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

            $this->getWarningForm()->setData($data_post);

            if($this->getWarningForm()->isValid())
            {
                $this->getWarningService()->save($this->getWarningForm()->getData(), $id);
                return $this->redirect()->toRoute('warning');
            }
            else
            {
                $data_form = $this->getWarningForm()->getData();
                if(file_exists($data_form['image']['tmp_name']))
                {
                    unlink($data_form['image']['tmp_name']);
                }
            }
        }

        $entity = $this->getWarningService()->findById($id);

        $data_form = $this->getDoctrineObject()->extract($entity);
        $data_form['dayNotice'] = $entity->getDayNotice()->format('d/m/Y');
        $data_form['fieldset_scheduling'] = array(
            'schedulingStart' => $entity->getSchedulingStart()->format('Y-m-d'),
            'schedulingEnd' => $entity->getSchedulingEnd()->format('Y-m-d')
        );
        unset($data_form['schedulingStart'], $data_form['schedulingEnd']);

        return array(
            'form' => $this->getWarningForm()->setData($data_form),
        );
    }

    public function deleteAction()
    {
        $id = $this->params()->fromRoute('id');

        $request = $this->getRequest();
        if ($request->isPost())
        {
            $this->getWarningService()->delete($id);

            $data = array(
                'id' => $id
            );

            $jsonModel = new JsonModel($data);

            return $jsonModel;
        }
        else
        {
            $entity = $this->getWarningService()->findById($id);

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
        $months = array(1 => 'Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro');
        $ac = 0;
        foreach($months as $i => $month)
        {
            $container = array();

            $entities_dates = $this->getWarningService()->findByMonth($i);
            if(!empty($entities_dates))
            {
                $container = array();
                foreach($entities_dates as $j => $date)
                {
                    $container['item'][$j] = array(
                        'date' => $date['dayNotice']->format('d/m/Y'),
                        'itens' => array()
                    );
                    $entities = $this->getWarningService()->findByDayNotice($date['dayNotice']);
                    foreach($entities as $l => $entity)
                    {
                        if(empty($entity->getImage()))
                            $image = '';
                        else
                            $image = substr($_SERVER['DOCUMENT_ROOT'],0 , -7) . '/data/uploads/warning/middle/' . $entity->getImage();

                        $container['item'][$j]['itens']['item'][$l]['content'] = [
                            'title' => $entity->getTitle(),
                            'text' => $entity->getText()
                        ];

                        $container['item'][$j]['itens']['item'][$l]['midia'] = [
                            'images' => [
                                'image' => $image
                            ]
                        ];
                    }
                }

                $data['item'][$ac] = [
                    'button' => [
                        'label' => $month
                    ],
                    'container' => $container
                ];

                $ac++;
            }
        }

        return new XmlModel($data);
    }

    public function notificationAction()
    {
        $entities = $this->getWarningService()->findNotification();

        $data = array();
        $data['info'] = array(
            'total' => count($entities),
        );

        if(count($entities) == 0)
        {
            $data['info']['message'] = 'Não avisos urgentes recentes';
        }
        else if(count($entities) == 1)
        {
            $data['info']['message'] = '1 aviso urgente';
        }
        else if(count($entities) > 1 && count($entities) <= 9)
        {
            $data['info']['message'] = count($entities) . ' avisos urgentes';
        }
        else
        {
            $data['info']['message'] = '+9 avisos urgentes';
        }

        foreach($entities as $key => $entity)
        {
            if(empty($entity->getImage()))
                $image = '';
            else
                $image = substr($_SERVER['DOCUMENT_ROOT'],0 , -7) . '/data/uploads/warning/middle/' . $entity->getImage();

            $data['itens'][$key]['item'] = array(
                'content' => array(
                    'title' => $entity->getTitle(),
                    'text' => $entity->getText()
                ),
                'midia' => array(
                    'image' => $image
                )
            );
        }

        return new XmlModel($data);
    }

    /**
     * @return WarningService
     */
    public function getWarningService()
    {
        return $this->warning_service;
    }

    /**
     * @param WarningService $warning_service
     */
    public function setWarningService($warning_service)
    {
        $this->warning_service = $warning_service;
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
     * @return WarningForm
     */
    public function getWarningForm()
    {
        return $this->warning_form;
    }

    /**
     * @param WarningForm $warning_form
     */
    public function setWarningForm($warning_form)
    {
        $this->warning_form = $warning_form;
    }
}