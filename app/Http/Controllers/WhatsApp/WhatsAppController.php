<?php

namespace App\Http\Controllers\WhatsApp;

use App\Http\Controllers\Controller;
use App\Repository\Contracts\Model\Whatsapp\WhatsappListaRepositoryInterface;
use App\Services\whatsApp\WhatsAppService;

class WhatsAppController extends Controller
{
    public function pesquisaListaTelefonePeloNome($nomeLista, WhatsAppService $whatsAppService)
    {        
        $listas = $whatsAppService->pesquisaPeloNome($nomeLista);
        
        return $this->send($listas);
    }

    public function pesquisaListaTelefonePeloFoneNome(int $idLista, $termoPesquisa, WhatsappListaRepositoryInterface $whatsappListaRepository)
    {
        return $this->send($whatsappListaRepository->getPeloFoneOrNomeLista($termoPesquisa, $idLista));
    }
}
