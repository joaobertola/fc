<?php

namespace App\Repository\Eloquent\Model\BaseInform;

use App\Model\BaseInform\EmailBrasil;
use App\Repository\Eloquent\WebControlEloquentRepository;

/**
 * @author Tiago Franco
 * Repositorio para metodos de consultas dos clientes
 * Todas as consultas deverá ser realizadas passando
 * a conexao atraves do metodo ::connection(connection)
 */
class EmailBrasilEloquentRepository extends WebControlEloquentRepository
{
    protected $model;
    /**
    * Instantiate reporitory
    * 
    * @param EmailBrasil $model
    */
    public function __construct(EmailBrasil $model)
    {
        parent::__construct($model);
    }
}