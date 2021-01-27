<?php

namespace App\Services\Repository\Eloquent\Model\Cliente;

use App\DTO\ClienteDTO;
use App\Model\Cliente\Cliente;
use App\Model\Cliente\ClienteEndereco;
use App\DTO\Cliente\ClienteEnderecoDTO;
use App\Repository\Eloquent\Model\Cliente\ClienteEloquentRepository;
use App\Services\Repository\Eloquent\WebControlEloquentRepositoryService;
use App\Services\Repository\Contracts\Model\Cliente\ClienteRepositoryServiceInterface;

/**
 * @author Tiago Franco
 * Servico de acesso ao repositorio de Model
 * Deverá pos * Deverá possuir os metodos contendo operacoes de escrita
 * do modelo implementando a interface do repositorio
 */
class ClienteEloquentRepositoryService extends WebControlEloquentRepositoryService implements ClienteRepositoryServiceInterface
{
    public function __construct(Cliente $model, ClienteEloquentRepository $repository)
    {
        parent::__construct($model, $repository);
    }

    public function salvarClientes(ClienteDTO $clienteDTO)
    {
        $cliente = new Cliente();
        $cliente->id_cadastro       = $this->_usuarioLogadoService->getIdCadastroLogado();
        $cliente->tipo_pessoa       = $clienteDTO->getTipoPessoa();
        $cliente->cnpj_cpf          = $clienteDTO->getCnpjCpf();
        $cliente->nome              = strtoupper($clienteDTO->getNome());
        $cliente->razao_social      = $clienteDTO->getRazaoSocial();
        $cliente->id_tipo_log       = $clienteDTO->getIdTipoLog();
        $cliente->endereco          = $clienteDTO->getEndereco();
        $cliente->numero            = $clienteDTO->getNumero();
        $cliente->complemento       = $clienteDTO->getComplemento();
        $cliente->bairro            = $clienteDTO->getBairro();
        $cliente->cidade            = $clienteDTO->getCidade();
        $cliente->uf                = $clienteDTO->getUf();
        $cliente->cep               = $clienteDTO->getCep();
        $cliente->pais              = strtoupper($clienteDTO->getPais());
        $cliente->email             = $clienteDTO->getEmail();
        $cliente->telefone          = $clienteDTO->getTelefone();
        $cliente->celular           = $clienteDTO->getCelular();
        $cliente->empresa_trabalha  = $clienteDTO->getEmpresaTrabalha();
        $cliente->socio2            = $clienteDTO->getSocio2();
        $cliente->fax               = $clienteDTO->getFax();
        $cliente->id_usuario        = $this->_usuarioLogadoService->getIdUsuarioLogado();
        $cliente->endereco_empresa  = $clienteDTO->getEnderecoEmpresa();
        $cliente->save();

        return $cliente;
    }

    public function salvarEnderecoCliente(int $idCliente, ClienteEnderecoDTO $clienteEnderecoDTO) {
        $enderecoCliente = new ClienteEndereco();
        $enderecoCliente->setConnection($this->model->getConnectionName());
        
        #se alterar
        if(!empty($clienteEnderecoDTO->getId())) {
            $enderecoCliente->id = $clienteEnderecoDTO->getId();
        }
        
        $enderecoCliente->tipo_endereco = $clienteEnderecoDTO->getTipoEndereco();
        $enderecoCliente->id_cadastro   = $this->_usuarioLogadoService->getIdCadastroLogado();
        $enderecoCliente->cnpj_cpf      = $clienteEnderecoDTO->getCnpjCpf();
        $enderecoCliente->nome          = $clienteEnderecoDTO->getNome();
        $enderecoCliente->razao_social  = $clienteEnderecoDTO->getRazaoSocial();
        $enderecoCliente->id_tipo_log   = $clienteEnderecoDTO->getIdTipoLog();
        $enderecoCliente->endereco      = $clienteEnderecoDTO->getEndereco();
        $enderecoCliente->numero        = $clienteEnderecoDTO->getNumero();
        $enderecoCliente->complemento   = $clienteEnderecoDTO->getComplemento();
        $enderecoCliente->bairro        = $clienteEnderecoDTO->getBairro();
        $enderecoCliente->cidade        = $clienteEnderecoDTO->getCidade();
        $enderecoCliente->uf            = $clienteEnderecoDTO->getUf();
        $enderecoCliente->cep           = $clienteEnderecoDTO->getCep();
        $enderecoCliente->id_cliente    = $idCliente;
        $enderecoCliente->pais          = strtoupper($clienteEnderecoDTO->getPais());
        $enderecoCliente->save();

        return $enderecoCliente;        
    }
}
