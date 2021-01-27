<?php

namespace App\Services\Repository\Eloquent\Model\Fornecedor;

use App\DTO\Fornecedor\CadastrarFornecedorBancoDTO;
use App\Model\Fornecedor\FornecedorBanco;
use App\Repository\Eloquent\Model\Fornecedor\FornecedorBancoEloquentRepository;
use App\Services\Repository\Eloquent\WebControlEloquentRepositoryService;

/**
 * @author Tiago Franco
 * Servico de acesso ao repositorio de Model
 * Deverá possuir os metodos contendo operacoes de escrita 
 * do modelo implementando a interface do repositorio
 */
class FornecedorBancoEloquentRepositoryService extends WebControlEloquentRepositoryService
{
    public function __construct(FornecedorBanco $model, FornecedorBancoEloquentRepository $repository)
    {
        parent::__construct($model, $repository);
    }

    public function salvarDadosBancariosFornecedor(int $idFornecedor, CadastrarFornecedorBancoDTO $cadastrarFornecedorBancoDTO)
    {
        return $this->create(
            [
                "id_fornecedor"   => $idFornecedor,
                "id_banco"        => $cadastrarFornecedorBancoDTO->getIdBanco(),
                "agencia"         => $cadastrarFornecedorBancoDTO->getAgencia(),
                "conta"           => $cadastrarFornecedorBancoDTO->getConta(),
                "titular"         => $cadastrarFornecedorBancoDTO->getTitular(),
                "titular_cpfcnpj" => $cadastrarFornecedorBancoDTO->getTitularCpfcnpj(),
                "tipo_conta"      => $cadastrarFornecedorBancoDTO->getTipoConta(),
            ]
        );
    }
}
