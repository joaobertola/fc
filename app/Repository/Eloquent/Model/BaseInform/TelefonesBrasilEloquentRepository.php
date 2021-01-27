<?php

namespace App\Repository\Eloquent\Model\BaseInform;

use App\Model\BaseInform\TelefonesBrasil;
use App\Repository\Eloquent\WebControlEloquentRepository;

/**
 * @author Tiago Franco
 * Repositorio para metodos de consultas dos clientes
 * Todas as consultas deverá ser realizadas passando
 * a conexao atraves do metodo ::connection(connection)
 */
class TelefonesBrasilEloquentRepository extends WebControlEloquentRepository
{
    protected $model;
    /**
    * Instantiate reporitory
    * 
    * @param TelefonesBrasil $model
    */
    public function __construct(TelefonesBrasil $model)
    {
        parent::__construct($model);
    }
}