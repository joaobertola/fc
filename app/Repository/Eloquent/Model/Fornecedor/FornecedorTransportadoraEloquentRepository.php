<?php

namespace App\Repository\Eloquent\Model\Fornecedor;

use App\Model\Fornecedor\FornecedorTransportadora;
use App\Repository\Eloquent\WebControlEloquentRepository;

/**
 * @author Tiago Franco
 * Repositorio para metodos de consultas dos clientes
 * Todas as consultas deverá ser realizadas passando
 * a conexao atraves do metodo ::connection(connection)
 */
class FornecedorTransportadoraEloquentRepository extends WebControlEloquentRepository
{
    protected $model;
    /**
    * Instantiate reporitory
    * 
    * @param FornecedorTransportadora $model
    */
    public function __construct(FornecedorTransportadora $model)
    {
        parent::__construct($model);
    }
}