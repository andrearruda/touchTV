<?php
namespace Application\Controller;

use Application\Service\EmployeeService;
use Application\Form\EmployeeForm;
use Application\Form\EmployeeExportForm;
use Application\Form\EmployeeImportForm;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\Paginator\Paginator;
use Zend\Paginator\Adapter\ArrayAdapter;
use Zend\View\Model\ViewModel;
use Zend\View\Model\JsonModel;
use Utils\View\Model\XmlModel;
use DoctrineModule\Stdlib\Hydrator\DoctrineObject;

class EmployeeController extends AbstractActionController
{
    /**
     * @var $employee_service EmployeeService
     */
    protected $employee_service;

    /**
     * @var $doctrine_object DoctrineObject
     */
    protected $doctrine_object;

    /**
     * @var $employee_form EmployeeForm
     */
    protected $employee_form;

    /**
     * @var $employee_export_form EmployeeExportForm
     */
    protected $employee_export_form;

    /**
     * @var $employee_import_form EmployeeImportForm
     */
    protected $employee_import_form;

    public function __construct(EmployeeService $employee_service, DoctrineObject $doctrine_object)
    {
        $this->setEmployeeService($employee_service);
        $this->setDoctrineObject($doctrine_object);
    }

    public function indexAction()
    {
        return $this->redirect()->toRoute('employee/default', array(
            'action' =>  'list'
        ));
    }

    public function listAction()
    {
        $entities = $this->getEmployeeService()->findAll();

        $page = $this->params()->fromRoute('page');
        $paginator = new Paginator(new ArrayAdapter($entities));
        $paginator->setCurrentPageNumber($page);
        $paginator->setDefaultItemCountPerPage(50);

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

        $entity = $this->getEmployeeService()->save($data, $id);
        $data = $this->getDoctrineObject()->extract($entity);

        return new JsonModel($data);
    }

    public function showAction()
    {
        $id = $this->params()->fromRoute('id');
        $entity = $this->getEmployeeService()->findById($id);

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

            $this->getEmployeeForm()->setData($data_post);

            if($this->getEmployeeForm()->isValid())
            {
                $this->getEmployeeService()->save($this->getEmployeeForm()->getData());
                return $this->redirect()->toRoute('employee');
            }
            else
            {
                $data_form = $this->getEmployeeForm()->getData();
                if(file_exists($data_form['image']['tmp_name']))
                {
                    unlink($data_form['image']['tmp_name']);
                }
            }
        }

        return array(
            'form' => $this->getEmployeeForm(),
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

            $this->getEmployeeForm()->setData($data_post);

            if($this->getEmployeeForm()->isValid())
            {
                $this->getEmployeeService()->save($this->getEmployeeForm()->getData(), $id);
                return $this->redirect()->toRoute('employee');
            }
            else
            {
                $data_form = $this->getEmployeeForm()->getData();
                if(file_exists($data_form['image']['tmp_name']))
                {
                    unlink($data_form['image']['tmp_name']);
                }
            }
        }

        $entity = $this->getEmployeeService()->findById($id);
        $data_form = $this->getDoctrineObject()->extract($entity);
        $data_form['born_at'] = $data_form['bornAt']->format('d/m/Y');

        return array(
            'form' => $this->getEmployeeForm()->setData($data_form),
        );
    }

    public function deleteAction()
    {
        $id = $this->params()->fromRoute('id');

        $request = $this->getRequest();
        if ($request->isPost())
        {
            $this->getEmployeeService()->delete($id);

            $data = array(
                'id' => $id
            );

            $jsonModel = new JsonModel($data);

            return $jsonModel;
        }
        else
        {
            $entity = $this->getEmployeeService()->findById($id);

            $viewModel = new ViewModel(array(
                'entity' => $entity
            ));
            $viewModel->setTerminal(true);
            return $viewModel;
        }
    }

    public function exportAction()
    {
        $request = $this->getRequest();
        if ($request->isPost())
        {
            $data_post = array_merge(
                $this->getRequest()->getPost()->toArray()
            );

            $this->getEmployeeExportForm()->setData($data_post);

            if($this->getEmployeeExportForm()->isValid())
            {

                $objPHPExcel = $this->getEmployeeService()->exportToExcel($data_post);

                header('Content-Type: application/vnd.ms-excel');
                header('Content-Disposition: attachment;filename="aniversarantes_nivea.xls"');
                header('Cache-Control: max-age=0');

                $objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
                $objWriter->save('php://output');
                die;
            }
            else
            {
                foreach($this->getEmployeeExportForm()->getMessages() as $messages)
                {
                    foreach($messages as $message)
                    {
                        $this->flashMessenger()->addMessage(array(
                            'type' => 'error',
                            'title' => 'Ops!',
                            'message' => 'Não foi possivel exportar: <br /><span class="text-xs">' . htmlentities($message, ENT_QUOTES) . '</span>'
                        ));
                    }
                }
            }

            return $this->redirect()->toRoute('employee');
        }

        $viewModel = new ViewModel(array(
            'form' => $this->getEmployeeExportForm()
        ));

        $viewModel->setTerminal(true);
        return $viewModel;
    }

    public function importAction()
    {
        $request = $this->getRequest();
        if ($request->isPost())
        {
            $data_post = array_merge(
                $this->getRequest()->getPost()->toArray(),
                $this->getRequest()->getFiles()->toArray()
            );

            $this->getEmployeeImportForm()->setData($data_post);

            if($this->getEmployeeImportForm()->isValid())
            {
                if($data_post['clearMonthCurrent'] == '1')
                {
                    $entities = $this->getEmployeeService()->findByMonth($data_post['monthCurrent']);

                    foreach ($entities as $entity) {
                        $this->getEmployeeService()->delete($entity->getId());
                    }
                }

                $inputFileType = \PHPExcel_IOFactory::identify($data_post['fileExcel']['tmp_name']);
                $objReader = \PHPExcel_IOFactory::createReader($inputFileType);
                $objPHPExcel = $objReader->load($data_post['fileExcel']['tmp_name']);

                $objPHPExcel->setActiveSheetIndex(0);

                for($i = 2; $i <= $objPHPExcel->getSheet(0)->getHighestRow(); $i++)
                {
                    $this->getEmployeeService()->save(array(
                        'name' => $objPHPExcel->getActiveSheet()->getCell(sprintf('A%s', $i))->getValue(),
                        'bornAt' => date('Y') . '-' . $data_post['monthCurrent'] . '-' . str_pad($objPHPExcel->getActiveSheet()->getCell(sprintf('B%s', $i))->getValue(), 2, '0', STR_PAD_LEFT),
                        'department' => $objPHPExcel->getActiveSheet()->getCell(sprintf('C%s', $i))->getValue(),
                        'employeeUnit' => $data_post['employeeUnit'],
                        'active' => true
                    ));
                }
            }
            else
            {
                foreach($this->getEmployeeImportForm()->getMessages() as $messages)
                {
                    $data_messages = array();
                    foreach($messages as $message)
                    {
                        $data_messages[] = htmlentities($message, ENT_QUOTES);
                    }

                    $this->flashMessenger()->addMessage(array(
                        'type' => 'error',
                        'title' => 'Ops!',
                        'message' => 'Não foi possivel importar: <br /><span class="text-xs">' . implode('<br />', $data_messages) . '</span>'
                    ));
                }
            }

            return $this->redirect()->toRoute('employee');
        }

        $viewModel = new ViewModel(array(
            'form' => $this->getEmployeeImportForm()
        ));

        $viewModel->setTerminal(true);
        return $viewModel;
    }

    public function feedAction()
    {
        $data = array();
        $months = array(1 => 'Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro');

        $ac = 0;
        foreach($months as $i => $month)
        {
            $container = array();
            $entities = $this->getEmployeeService()->findByMonth($i);
            foreach($entities as $k => $entity)
            {
                $container['item'][$k] = array(
                    'name' => $entity->getName(),
                    'bornat' => $entity->getBornAt()->format('Y-m-d'),
                    'unity' => $entity->getEmployeeUnit()->getName(),
                    'department' => $entity->getDepartment(),
                    'image' => substr($_SERVER['DOCUMENT_ROOT'],0 , -7) . '/data/uploads/employee/middle/' . $entity->getImage()
                );
            }

            $data['item'][$ac] = array(
                'button' => array(
                    'label' => $month
                ),
                'containers' => $container
            );

            $ac++;
        }

        return new XmlModel($data);
    }

    /**
     * @return EmployeeService
     */
    public function getEmployeeService()
    {
        return $this->employee_service;
    }

    /**
     * @param EmployeeService $employee_service
     */
    public function setEmployeeService($employee_service)
    {
        $this->employee_service = $employee_service;
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
     * @return EmployeeForm
     */
    public function getEmployeeForm()
    {
        return $this->employee_form;
    }

    /**
     * @param EmployeeForm $employee_form
     */
    public function setEmployeeForm($employee_form)
    {
        $this->employee_form = $employee_form;
    }

    /**
     * @return EmployeeExportForm
     */
    public function getEmployeeExportForm()
    {
        return $this->employee_export_form;
    }

    /**
     * @param EmployeeExportForm $employee_export_form
     */
    public function setEmployeeExportForm($employee_export_form)
    {
        $this->employee_export_form = $employee_export_form;
    }

    /**
     * @return EmployeeImportForm
     */
    public function getEmployeeImportForm()
    {
        return $this->employee_import_form;
    }

    /**
     * @param EmployeeImportForm $employee_import_form
     */
    public function setEmployeeImportForm($employee_import_form)
    {
        $this->employee_import_form = $employee_import_form;
    }
}