<?php

namespace App\Services\Repository\Eloquent\Model\Fornecedor;

use App\Model\Fornecedor\FornecedorTransportadora;
use App\Repository\Eloquent\Model\Fornecedor\FornecedorTransportadoraEloquentRepository;
use App\Services\Repository\Eloquent\WebControlEloquentRepositoryService;

/**
 * @author Tiago Franco
 * Servico de acesso ao repositorio de Model
 * Deverá possuir os metodos contendo operacoes de escrita 
 * do modelo implementando a interface do repositorio
 */
class FornecedorTransportadoraEloquentRepositoryService extends WebControlEloquentRepositoryService
{
    public function __construct(FornecedorTransportadora $model, FornecedorTransportadoraEloquentRepository $repository)
    {
        parent::__construct($model, $repository);
    }

    public function salvarTransportadoraFornecedor(int $idFornecedor, string $descricaoFornecedora)
    {
        return $this->create(
            [
                'id_fornecedor' => $idFornecedor, 
                'descricao'     => $descricaoFornecedora
            ]
        );
    }
}
