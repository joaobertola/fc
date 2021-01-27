<?php

namespace App\Services\Clientes;

use App\DTO\ClienteDTO;
use Illuminate\Support\Facades\DB;
use App\Services\Auth\UsuarioLogadoService;
use App\Services\Repository\Contracts\Model\Cliente\ClienteRepositoryServiceInterface;

/**
 * @author Tiago Franco
 * Servico para manipulação das
 * informacoes dos clientes
 */
class ClientesService
{
    /**
     * UsuarioLogadoService
     *
     * @var UsuarioLogadoService
     */
    protected $_usuarioLogadoService;

    /**
     * ClienteRepositoryServiceInterface
     *
     * @var ClienteRepositoryServiceInterface
     */
    protected $_clienteRepositoryService;

    public function __construct(UsuarioLogadoService $usuarioLogadoService, 
    ClienteRepositoryServiceInterface $clienteRepositoryService)
    {
        $this->_usuarioLogadoService     = $usuarioLogadoService;
        $this->_clienteRepositoryService = $clienteRepositoryService;
    }

    public function salvarCliente(ClienteDTO $clienteDTO){
        try {
            DB::beginTransaction();
            $cliente   = $this->_clienteRepositoryService->salvarClientes($clienteDTO);
            $enderecos = [];
            
            foreach($clienteDTO->getEnderecos() as $enderecoClienteDTO) {
                $enderecos[] = $this->_clienteRepositoryService->salvarEnderecoCliente($cliente->id, $enderecoClienteDTO);   
            }
            $cliente->enderecos = $enderecos;
            DB::commit();

            return $cliente;

        } catch (\Throwable $th) {
            DB::rollBack();
            throw $th;
        }
    }
}
