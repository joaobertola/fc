<?php

namespace App\Repository\Eloquent\Model\Fornecedor;

use App\Model\Fornecedor\FornecedorProduto;
use App\Repository\Eloquent\WebControlEloquentRepository;

/**
 * @author Tiago Franco
 * Repositorio para metodos de consultas dos clientes
 * Todas as consultas deverá ser realizadas passando
 * a conexao atraves do metodo ::connection(connection)
 */
class FornecedorProdutoEloquentRepository extends WebControlEloquentRepository
{
    protected $model;
    /**
    * Instantiate reporitory
    * 
    * @param FornecedorProduto $model
    */
    public function __construct(FornecedorProduto $model)
    {
        parent::__construct($model);
    }
}