<?php

namespace App\Services\FrenteCaixa\Clientes;

use App\Repository\Contracts\Model\Cliente\ClienteFrenteCaixaRepositoryInterface;

/**
 * @author Tiago Franco
 * Servico para gerenciamento das informacoes
 * de frente de caixa envolvendo clientes
 */
class ClientesService
{    
    /**
     * @var ClienteFrenteCaixaRepositoryInterface
     */
    private $_clienteFrenteCaixaRepository;

    public function __construct(ClienteFrenteCaixaRepositoryInterface $clienteFrenteCaixaRepository)
    {
        $this->_clienteFrenteCaixaRepository = $clienteFrenteCaixaRepository;
    }

    public function getInadimplencia(int $idCliente)
    {
        return [
            'nota_promissoria' => $this->_clienteFrenteCaixaRepository->getQtdeNotasPromissorias($idCliente),
            'boleto'           => $this->_clienteFrenteCaixaRepository->getQtdeBoletos($idCliente),
            'carne'            => $this->_clienteFrenteCaixaRepository->getQtdeCarnes($idCliente)
        ];
    }
}
