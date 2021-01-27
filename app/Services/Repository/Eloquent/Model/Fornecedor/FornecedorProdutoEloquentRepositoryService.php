<?php

namespace App\Services\Repository\Eloquent\Model\Fornecedor;

use App\Model\Fornecedor\FornecedorProduto;
use App\Repository\Eloquent\Model\Fornecedor\FornecedorProdutoEloquentRepository;
use App\Services\Repository\Eloquent\WebControlEloquentRepositoryService;

/**
 * @author Tiago Franco
 * Servico de acesso ao repositorio de Model
 * Deverá possuir os metodos contendo operacoes de escrita 
 * do modelo implementando a interface do repositorio
 */
class FornecedorProdutoEloquentRepositoryService extends WebControlEloquentRepositoryService
{
    public function __construct(FornecedorProduto $model, FornecedorProdutoEloquentRepository $repository)
    {
        parent::__construct($model, $repository);
    }

    public function salvarProdutoFornecedor(int $idFornecedor, string $descricaoProduto)
    {
        return $this->create(
            [
                'id_fornecedor' => $idFornecedor, 
                'descricao' => $descricaoProduto
            ]
        );
    }
}
