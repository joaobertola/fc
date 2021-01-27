<?php

namespace App\Repository\Eloquent\Model\BaseInform;

use App\Model\BaseInform\NomePessoaContato;
use App\Repository\Eloquent\WebControlEloquentRepository;

/**
 * @author Tiago Franco
 * Repositorio para metodos de consultas dos clientes
 * Todas as consultas deverá ser realizadas passando
 * a conexao atraves do metodo ::connection(connection)
 */
class NomePessoaContatoEloquentRepository extends WebControlEloquentRepository
{
    protected $model;
    /**
    * Instantiate reporitory
    * 
    * @param NomePessoaContato $model
    */
    public function __construct(NomePessoaContato $model)
    {
        parent::__construct($model);
    }
}