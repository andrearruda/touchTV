<?php
namespace Kpi\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Thapp\XmlBuilder\XMLBuilder;
use Thapp\XmlBuilder\Normalizer;
use FileSystemCache;
use Stringy\Stringy as S;

class ShiftController extends AbstractActionController
{
    public function indexAction()
    {
        $json_file = 'C:/nivea_kpi/json/work/kpi_shift.json';
        $content = (string) S::create(file_get_contents($json_file))->collapseWhitespace();
        $json = json_decode($content, true);

        if (!is_null($json)) {
            file_put_contents('C:/nivea_kpi/json/final/kpi_shift.json', json_encode($json));
        }

        $json = json_decode(file_get_contents('C:/nivea_kpi/json/final/kpi_shift.json'), true);

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

        foreach($data['lines'] as $i => $lines)
        {
            unset($data['lines'][$i]);
            $data['lines'][] = array(
                'name' => array(
                    'pt' => substr($i, 0, 2) == 'fl' ? str_replace('fl', 'linha ', $i) : $i,
                    'en' => substr($i, 0, 2) == 'fl' ? str_replace('fl', 'line ', $i) : $i
                ),
                'oae' => number_format(str_replace(',', '.', substr($lines['OAE'], 0, -2)), 2, '.', ''),
                'units' => str_replace('.', '', $lines['Unidades']),
                'breakdown' => array(
                    'time' => $lines['TempoBreakdown'],
                    'percent' => number_format(str_replace(',', '.', substr($lines['PorcentagemBreakdown'], 0, -2)), 2, '.', ''),
                ),
                'microstoppage' => array(
                    'time' => $lines['TempoMicrostoppage'],
                    'percent' => number_format(str_replace(',', '.', substr($lines['PorcentagemMicrostoppage'], 0, -2)), 2, '.', ''),
                )
            );
        }

        $data['elapsed'] = array(
            'time' => $json['TempoDecorrido'],
            'percent' => number_format(str_replace(',', '.', substr($json['PorcentagemDecorrido'], 0, -2)), 2, '.', ''),
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

            $breakdown = $line->addChild('breakdown');
            $breakdown->addChild('time', $item['breakdown']['time']);
            $breakdown->addChild('percent', $item['breakdown']['percent']);

            $microstoppage = $line->addChild('microstoppage');
            $microstoppage->addChild('time', $item['microstoppage']['time']);
            $microstoppage->addChild('percent', $item['microstoppage']['percent']);
        }

        $elapsed = $xml->addChild('elapsed');
        $elapsed->addChild('time', $data['elapsed']['time']);
        $elapsed->addChild('percent', $data['elapsed']['percent']);

        $response = $this->getResponse();
        $response->getHeaders()->addHeaderLine('Content-Type', 'text/xml; charset=utf-8');
        $response->setContent($xml->asXML());

        return $response;
    }
}