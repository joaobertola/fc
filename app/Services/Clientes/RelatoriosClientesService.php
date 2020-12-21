<?php

namespace App\Services\Clientes;

use App\DTO\Relatorios\RelatorioClienteDTO;
use App\Services\Auth\UsuarioLogadoService;
use App\Repository\Contracts\Model\Cliente\ClienteRepositoryInterface;
use App\Repository\Contracts\Model\Relatorio\RelatorioCamposRepositoryInterface;

/**
 * @author Tiago Franco
 * Servico para manipulação das
 * informacoes dos clientes
 */
class RelatoriosClientesService
{
    /**
     * ClienteRepositoryInterface
     *
     * @var ClienteRepositoryInterface
     */
    protected $_clienteRepository;

    /**
     * RelatorioCamposRepositoryInterface
     *
     * @var RelatorioCamposRepositoryInterface
     */
    protected $_relatorioCamposRepositorio;

    public function __construct(
        RelatorioCamposRepositoryInterface $relatorioCamposRepositorio,
        ClienteRepositoryInterface $clienteRepository
    ) {
        $this->_clienteRepository          = $clienteRepository;
        $this->_relatorioCamposRepositorio = $relatorioCamposRepositorio;
    }

    public function relatorioDeClientes(RelatorioClienteDTO $relatorioClienteDTO)
    {
        $clientes = $this->_clienteRepository->relatorioClientes($relatorioClienteDTO);
        $filtros  = [];

        if (!empty($clientes)) {
            $filtros = $this->_relatorioCamposRepositorio->getCamposSelecionados($relatorioClienteDTO->getCampos());
            foreach ($filtros as $filtro) {
                $filtro->nome_campo = ($filtro->nome_campo == "IFNULL(nome,razao_social) AS nome") ? "nome" : trim($filtro->nome_campo);
            }
        }

        return ['clientes' => $clientes, 'filtros' => $filtros];
    }
}
