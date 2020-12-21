<?php

namespace App\Repository\Eloquent\Model\BaseInform;

use App\Model\BaseInform\NomeMae;
use App\Repository\Eloquent\WebControlEloquentRepository;

/**
 * @author Tiago Franco
 * Repositorio para metodos de consultas dos clientes
 * Todas as consultas deverá ser realizadas passando
 * a conexao atraves do metodo ::connection(connection)
 */
class NomeMaeEloquentRepository extends WebControlEloquentRepository
{
    protected $model;
    /**
    * Instantiate reporitory
    * 
    * @param NomeMae $model
    */
    public function __construct(NomeMae $model)
    {
        parent::__construct($model);
    }
}