<?php
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2015 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Application;

use Zend\Mvc\ModuleRouteListener;
use Zend\Mvc\MvcEvent;
use Zend\Validator\AbstractValidator;
use Zend\I18n\Translator\Translator;
use BjyAuthorize\View\RedirectionStrategy;

class Module
{
    public function onBootstrap(MvcEvent $e)
    {
        $eventManager        = $e->getApplication()->getEventManager();
        $moduleRouteListener = new ModuleRouteListener();
        $moduleRouteListener->attach($eventManager);

        $translator = new Translator();
        $translator->addTranslationFile('phpArray', __DIR__ . '/../../vendor/zendframework/zend-i18n-resources/languages/pt_BR/Zend_Validate.php', 'default', 'pt_BR');
        $translator->addTranslationFile('phpArray', __DIR__ . '/../../vendor/zendframework/zend-i18n-resources/languages/pt_BR/Zend_Captcha.php', 'default', 'pt_BR');
        $translator->setLocale ('pt_BR');
        AbstractValidator::setDefaultTranslator(new \Zend\Mvc\I18n\Translator($translator));

        $em = $e->getApplication()->getServiceManager()->get('Doctrine\ORM\EntityManager');
        $em->getConfiguration()->addFilter(
            'soft-deleteable',
            'Gedmo\SoftDeleteable\Filter\SoftDeleteableFilter'
        );
        $em->getFilters()->enable('soft-deleteable');

        $auth = $e->getApplication()->getServiceManager()->get('zfcuser_auth_service');
        if (!$auth->hasIdentity())
        {
            $eventManager->attach('dispatch', function($e) {
                $controller = $e->getTarget();
                $s_matchedRoute = $e->getParam('route-match')->getMatchedRouteName();

                if ($s_matchedRoute === 'zfcuser/login' || $s_matchedRoute === 'zfcuser/register')
                {
                    $controller->layout('layout/simple');
                }
                else
                {
                    $controller->layout('layout/layout');
                }
            });
        }

        $eventManager->attach(MvcEvent::EVENT_DISPATCH_ERROR, function(MvcEvent $event) {
            $viewModel = $event->getViewModel();
            $viewModel->setTemplate('layout/error');
        }, -200);
    }


    public function getConfig()
    {
        return include __DIR__ . '/config/module.config.php';
    }

    public function getAutoloaderConfig()
    {
        return array(
            'Zend\Loader\StandardAutoloader' => array(
                'namespaces' => array(
                    __NAMESPACE__ => __DIR__ . '/src/' . __NAMESPACE__,
                ),
            ),
        );
    }
}
