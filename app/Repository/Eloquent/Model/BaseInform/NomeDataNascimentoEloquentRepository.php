<?php

namespace App\Repository\Eloquent\Model\BaseInform;

use App\Model\BaseInform\NomeDataNascimento;
use App\Repository\Eloquent\WebControlEloquentRepository;

/**
 * @author Tiago Franco
 * Repositorio para metodos de consultas dos clientes
 * Todas as consultas deverá ser realizadas passando
 * a conexao atraves do metodo ::connection(connection)
 */
class NomeDataNascimentoEloquentRepository extends WebControlEloquentRepository
{
    protected $model;
    /**
    * Instantiate reporitory
    * 
    * @param NomeDataNascimento $model
    */
    public function __construct(NomeDataNascimento $model)
    {
        parent::__construct($model);
    }
}