<?php

namespace App\Repository\Eloquent\Model\BaseInform;

use App\Model\BaseInform\NomeEmpresaTrabalha;
use App\Repository\Eloquent\WebControlEloquentRepository;

/**
 * @author Tiago Franco
 * Repositorio para metodos de consultas dos clientes
 * Todas as consultas deverá ser realizadas passando
 * a conexao atraves do metodo ::connection(connection)
 */
class NomeEmpresaTrabalhaEloquentRepository extends WebControlEloquentRepository
{
    protected $model;
    /**
    * Instantiate reporitory
    * 
    * @param NomeEmpresaTrabalha $model
    */
    public function __construct(NomeEmpresaTrabalha $model)
    {
        parent::__construct($model);
    }
}