<?php

namespace App\Repository\Eloquent\Model\Fornecedor;

use App\Model\Fornecedor\FornecedorBanco;
use App\Repository\Eloquent\WebControlEloquentRepository;

/**
 * @author Tiago Franco
 * Repositorio para metodos de consultas dos clientes
 * Todas as consultas deverá ser realizadas passando
 * a conexao atraves do metodo ::connection(connection)
 */
class FornecedorBancoEloquentRepository extends WebControlEloquentRepository
{
    protected $model;
    /**
    * Instantiate reporitory
    * 
    * @param FornecedorBanco $model
    */
    public function __construct(FornecedorBanco $model)
    {
        parent::__construct($model);
    }
}