<?php

namespace App\Services\Torpedos;

use App\Repository\Contracts\Model\Torpedo\TorpedoListaRepositoryInterface;

/**
 * @author Tiago Franco
 * Servico responsavel pelo processamento
 * envolvendo
 */
class TorpedoService
{
    /**
     * @var TorpedoListaRepositoryInterface
     */
    private $_torpedoListaRepository;
    
    public function __construct(TorpedoListaRepositoryInterface $torpedoListaRepository) 
    {
        $this->_torpedoListaRepository = $torpedoListaRepository;
    }

    public function pesquisaPeloNome(string $nomeLista)
    {
        $listas = $this->_torpedoListaRepository->getPeloNome($nomeLista);
        
        if(!empty($listas)) {
            $idListas      = array_column($listas, 'id');
            $totalPorLista = $this->_torpedoListaRepository->getQtdeTelefonesListas($idListas);
            
            foreach ($listas as $lista) {
                $lista->telefones_total = isset($totalPorLista[$lista->id]) ? $totalPorLista[$lista->id] : 0; 
            }
        }
        
        return $listas;
    }
}