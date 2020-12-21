<?php

namespace App\Repository\Eloquent\Model\BaseInform;

use App\Model\BaseInform\NomeRg;
use App\Repository\Eloquent\WebControlEloquentRepository;

/**
 * @author Tiago Franco
 * Repositorio para metodos de consultas dos clientes
 * Todas as consultas deverá ser realizadas passando
 * a conexao atraves do metodo ::connection(connection)
 */
class NomeRgEloquentRepository extends WebControlEloquentRepository
{
    protected $model;
    /**
    * Instantiate reporitory
    * 
    * @param NomeRg $model
    */
    public function __construct(NomeRg $model)
    {
        parent::__construct($model);
    }
}