<?php

namespace App\Services\whatsApp;

use App\Repository\Contracts\Model\whatsapp\WhatsappListaRepositoryInterface;

/**
 * @author Tiago Franco
 * Servico para maminulção dos torpedos
 */
class WhatsAppService
{
    /**
     * @var WhatsappListaRepositoryInterface
     */
    private $_whatsappListaRepositoryInterface;

    public function __construct(WhatsappListaRepositoryInterface $whatsappListaRepositoryInterface)
    {
        $this->_whatsappListaRepositoryInterface = $whatsappListaRepositoryInterface;
    }

    public function pesquisaPeloNome(string $nomeLista)
    {
        $listas = $this->_whatsappListaRepositoryInterface->getPeloNome($nomeLista);

        if (!empty($listas)) {
            $idListas      = array_column($listas, 'id');
            $totalPorLista = $this->_whatsappListaRepositoryInterface->getQtdeTelefonesListas($idListas);

            foreach ($listas as $lista) {
                $lista->telefones_total = isset($totalPorLista[$lista->id]) ? $totalPorLista[$lista->id] : 0;
            }
        }

        return $listas;
    }
}
