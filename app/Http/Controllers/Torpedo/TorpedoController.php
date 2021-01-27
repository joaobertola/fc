<?php

namespace App\Http\Controllers\Torpedo;

use App\Http\Controllers\Controller;
use App\Repository\Contracts\Model\Torpedo\TorpedoListaRepositoryInterface;
use App\Services\Torpedos\TorpedoService;

class TorpedoController extends Controller
{
    public function pesquisaListaTelefonePeloNome($nomeLista, TorpedoService $torpedoService)
    {
        $listas = $torpedoService->pesquisaPeloNome($nomeLista);

        return $this->send($listas);
    }

    public function pesquisaListaTelefonePeloFoneNome(int $idLista, $termoPesquisa, TorpedoListaRepositoryInterface $torpedoListaRepository)
    {
        return $this->send($torpedoListaRepository->getPeloFoneOrNomeLista($termoPesquisa, $idLista));
    }
}
