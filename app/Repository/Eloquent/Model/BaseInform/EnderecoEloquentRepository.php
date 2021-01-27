<?php

namespace App\Repository\Eloquent\Model\BaseInform;

use App\Model\BaseInform\Endereco;
use App\Repository\Eloquent\WebControlEloquentRepository;

/**
 * @author Tiago Franco
 * Repositorio para metodos de consultas dos clientes
 * Todas as consultas deverá ser realizadas passando
 * a conexao atraves do metodo ::connection(connection)
 */
class EnderecoEloquentRepository extends WebControlEloquentRepository
{
    protected $model;
    /**
    * Instantiate reporitory
    * 
    * @param Endereco $model
    */
    public function __construct(Endereco $model)
    {
        parent::__construct($model);
    }
}