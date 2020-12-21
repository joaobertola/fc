<?php

namespace App\Repository\Eloquent\Model\BaseInform;

use App\Model\BaseInform\NomeBrasil;
use App\Repository\Eloquent\WebControlEloquentRepository;

/**
 * @author Tiago Franco
 * Repositorio para metodos de consultas dos clientes
 * Todas as consultas deverá ser realizadas passando
 * a conexao atraves do metodo ::connection(connection)
 */
class NomeBrasilEloquentRepository extends WebControlEloquentRepository
{
    protected $model;
    /**
    * Instantiate reporitory
    * 
    * @param NomeBrasil $model
    */
    public function __construct(NomeBrasil $model)
    {
        parent::__construct($model);
    }
}