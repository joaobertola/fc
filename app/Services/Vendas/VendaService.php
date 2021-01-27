<?php

namespace App\Services\Vendas;

use App\Model\Venda\Venda;
use App\Repository\Contracts\Model\Venda\VendaRepositoryInterface;

/**
 * @author Tiago Franco
 * Servico responsavel pelo processamento
 * envolvendo dados das vendas
 */
class VendaService
{
    /**
     * 
     */
    private $_vendaRepository;
    
    public function __construct(VendaRepositoryInterface $vendaRepository) 
    {
        $this->_vendaRepository = $vendaRepository;    
    }

    public function obtemVenda(int $idVenda)
    {
        $venda = $this->_vendaRepository->find($idVenda);
        
        if($venda) {
            $retorno = [
                "venda"       => $venda,
                "itens_venda" => $this->vendaRepository->getItensVenda($venda->id)
            ];

            return $retorno;
        }
        return null;
    }
}