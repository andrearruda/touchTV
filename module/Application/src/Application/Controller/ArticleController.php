<?php
namespace Application\Controller;

use Application\Service\ArticleService;
use Application\Form\ArticleForm;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\Paginator\Paginator;
use Zend\Paginator\Adapter\ArrayAdapter;
use Zend\View\Model\ViewModel;
use Zend\View\Model\JsonModel;
use Utils\View\Model\XmlModel;
use DoctrineModule\Stdlib\Hydrator\DoctrineObject;
use Thapp\XmlBuilder\XMLBuilder;
use Thapp\XmlBuilder\Normalizer;

class ArticleController extends AbstractActionController
{
    /**
     * @var $article_service ArticleService
     */
    protected $article_service;

    /**
     * @var $doctrine_object DoctrineObject
     */
    protected $doctrine_object;

    /**
     * @var $article_form ArticleForm
     */
    protected $article_form;

    public function __construct(ArticleService $article_service, DoctrineObject $doctrine_object)
    {
        $this->setArticleService($article_service);
        $this->setDoctrineObject($doctrine_object);
    }

    public function indexAction()
    {
        return $this->redirect()->toRoute('article/default', array(
            'action' =>  'list'
        ));
    }

    public function listAction()
    {
        $entities = $this->getArticleService()->findAll();

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

        $entity = $this->getArticleService()->save($data, $id);
        $data = $this->getDoctrineObject()->extract($entity);

        return new JsonModel($data);
    }

    public function showAction()
    {
        $id = $this->params()->fromRoute('id');
        $entity = $this->getArticleService()->findById($id);

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

            $this->getArticleForm()->setData($data_post);

            if($this->getArticleForm()->isValid())
            {
                $this->getArticleService()->save($this->getArticleForm()->getData());
                return $this->redirect()->toRoute('article');
            }
            else
            {
                $data_form = $this->getArticleForm()->getData();
                if(file_exists($data_form['image']['tmp_name']))
                {
                    unlink($data_form['image']['tmp_name']);
                }
            }
        }

        return array(
            'form' => $this->getArticleForm(),
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

            $this->getArticleForm()->setData($data_post);

            if($this->getArticleForm()->isValid())
            {
                $this->getArticleService()->save($this->getArticleForm()->getData(), $id);
                return $this->redirect()->toRoute('article');
            }
            else
            {
                $data_form = $this->getArticleForm()->getData();
                if(file_exists($data_form['image']['tmp_name']))
                {
                    unlink($data_form['image']['tmp_name']);
                }
            }
        }

        $entity = $this->getArticleService()->findById($id);

        $data_form = $this->getDoctrineObject()->extract($entity);
        $data_form['fieldset_scheduling'] = array(
            'schedulingStart' => $entity->getSchedulingStart()->format('Y-m-d'),
            'schedulingEnd' => $entity->getSchedulingEnd()->format('Y-m-d')
        );
        unset($data_form['schedulingStart'], $data_form['schedulingEnd']);

        return array(
            'form' => $this->getArticleForm()->setData($data_form),
        );
    }

    public function deleteAction()
    {
        $id = $this->params()->fromRoute('id');

        $request = $this->getRequest();
        if ($request->isPost())
        {
            $this->getArticleService()->delete($id);

            $data = array(
                'id' => $id
            );

            $jsonModel = new JsonModel($data);

            return $jsonModel;
        }
        else
        {
            $entity = $this->getArticleService()->findById($id);

            $viewModel = new ViewModel(array(
                'entity' => $entity
            ));
            $viewModel->setTerminal(true);
            return $viewModel;
        }
    }

    public function feedAction()
    {
        $entities = $this->getArticleService()->findAllActive();

        $data = array();
        foreach($entities as $key => $entity)
        {
            if(empty($entity->getImage()))
                $image = '';
            else
                $image = substr($_SERVER['DOCUMENT_ROOT'],0 , -7) . '/data/uploads/article/middle/' . $entity->getImage();

            $data[$key] = array(
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
                            $image
                        )
                    )
                ),
            );
        }

        $xmlBuilder = new XmlBuilder('root');
        $xmlBuilder->setSingularizer(function ($name) {
            if ('images' === $name) {
                return 'image';
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
     * @return ArticleService
     */
    public function getArticleService()
    {
        return $this->article_service;
    }

    /**
     * @param ArticleService $article_service
     */
    public function setArticleService($article_service)
    {
        $this->article_service = $article_service;
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
     * @return ArticleForm
     */
    public function getArticleForm()
    {
        return $this->article_form;
    }

    /**
     * @param ArticleForm $article_form
     */
    public function setArticleForm($article_form)
    {
        $this->article_form = $article_form;
    }
}