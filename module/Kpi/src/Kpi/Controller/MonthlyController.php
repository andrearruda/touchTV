<?php
namespace Kpi\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Thapp\XmlBuilder\XMLBuilder;
use Thapp\XmlBuilder\Normalizer;
use FileSystemCache;
use Stringy\Stringy as S;

class MonthlyController extends AbstractActionController
{
    public function indexAction()
    {
        $json_file = 'C:/nivea_kpi/json/work/kpi_monthly.json';
        $content = (string) S::create(file_get_contents($json_file))->collapseWhitespace();
        $json = json_decode($content, true);

        if (!is_null($json)) {
            file_put_contents('C:/nivea_kpi/json/final/kpi_monthly.json', json_encode($json));
        }

        $json = json_decode(file_get_contents('C:/nivea_kpi/json/final/kpi_monthly.json'), true);

        $data['info'] = array(
            'publishedat' => array(
                'pt' => 'Atualizado em ' . $json['Data'] . ' às ' . $json['Hora'],
                'en' => 'Updated ' . $json['Data'] . ' at ' . $json['Hora'],
            )
        );

        for($i = 1; $i <= 4; $i++)
        {
            $data['lines']['fl' . $i] = $json['FL' . $i];
        }

        $data['lines']['geral'] = $json['GERAL'];

        foreach($data['lines'] as $i => $lines)
        {
            unset($data['lines'][$i]);
            $data['lines'][] = array(
                'name' => array(
                    'pt' => substr($i, 0, 2) == 'fl' ? str_replace('fl', 'linha ', $i) : $i,
                    'en' => substr($i, 0, 2) == 'fl' ? str_replace('fl', 'line ', $i) : $i
                ),
                'oae' => number_format(str_replace(',', '.', substr($lines['OAE'], 0, -2)), 2, '.', ''),
                'units' => str_replace('.', '', $lines['Unidades'])
            );
        }

        $meses_pt = array(1 => 'Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez');
        $meses_en = array(1 => 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec');

        $json['Mensagem1'] = (string) S::create($json['Mensagem1'])->toLowerCase();
        $json['Mensagem2'] = (string) S::create($json['Mensagem2'])->toLowerCase();

        $year_2 = substr($json['Mensagem2'], 4, 2);

        if(!empty($json['Mensagem1']))
        {
            $year_1 = substr($json['Mensagem1'], 4, 2);

            $month_1_pt = ucfirst(substr($json['Mensagem1'], 0, 3));
            $month_index_1 = array_search($month_1_pt, $meses_pt);

            $period_pt_1 = $meses_pt[$month_index_1] . '/' . $year_1;
            $period_en_1 = $meses_en[$month_index_1] . '/' . $year_1;

            $unit_1 = str_replace('.', '', substr(substr($json['Mensagem1'], 7), 0, -7));
        }
        else
        {
            $period_pt_1 = '';
            $period_en_1 = '';
            $unit_1 = '';
        }

        if(!empty($json['Mensagem2']))
        {
            $month_2_pt = ucfirst(substr($json['Mensagem2'], 0, 3));
            $month_index_2 = array_search($month_2_pt, $meses_pt);

            $period_pt_2 = $meses_pt[$month_index_2] . '/' . $year_2;
            $period_en_2 = $meses_en[$month_index_2] . '/' . $year_2;

            $unit_2 = str_replace('.', '', substr(substr($json['Mensagem2'], 7), 0, -7));
        }
        else
        {
            $period_pt_2 = '--';
            $period_en_2 = '--';
            $unit_2 = '0';
        }

        $data['comparative'] = array(
            'lastmonth' => array(
                'period' => array(
                    'pt' => $period_pt_1,
                    'en' => $period_en_1
                ),
                'units' => $unit_1,
            ),
            'currentmonth' => array(
                'period' => array(
                    'pt' => $period_pt_2,
                    'en' => $period_en_2
                ),
                'units' => $unit_2,
            ),
        );

        $xml = new \SimpleXMLElement('<root/>');

        $info = $xml->addChild('info');
        $publishedat = $info->addChild('publishedat');
        $publishedat->addChild('pt', $data['info']['publishedat']['pt']);
        $publishedat->addChild('en', $data['info']['publishedat']['en']);

        $lines = $xml->addChild('lines');
        foreach($data['lines'] as $item)
        {
            $line = $lines->addChild('line');

            $name = $line->addChild('name');
            $name->addChild('pt', $item['name']['pt']);
            $name->addChild('en', $item['name']['en']);

            $line->addChild('oae', $item['oae']);
            $line->addChild('units', $item['units']);
        }

        $comparative = $xml->addChild('comparative');

        $lastmonth = $comparative->addChild('lastmonth');
        $period = $lastmonth->addChild('period');
        $period->addChild('pt', $data['comparative']['lastmonth']['period']['pt']);
        $period->addChild('en', $data['comparative']['lastmonth']['period']['en']);
        $lastmonth->addChild('units', $data['comparative']['lastmonth']['units']);

        $currentmonth = $comparative->addChild('currentmonth');
        $period = $currentmonth->addChild('period');
        $period->addChild('pt', $data['comparative']['currentmonth']['period']['pt']);
        $period->addChild('en', $data['comparative']['currentmonth']['period']['en']);
        $currentmonth->addChild('units', $data['comparative']['currentmonth']['units']);

        $response = $this->getResponse();
        $response->getHeaders()->addHeaderLine('Content-Type', 'text/xml; charset=utf-8');
        $response->setContent($xml->asXML());

        return $response;
    }
}