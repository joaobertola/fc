<?php

namespace App\Repository\Eloquent\Model\Nfe;

use App\Model\Nfe\NfeProdutoCofinsSt;
use App\Repository\Contracts\Model\Nfe\NfeProdutoCofinsStRepositoryInterface;
use App\Repository\Eloquent\WebControlEloquentRepository;

/**
 * @author Tiago Franco
 * Repositorio para metodos de consultas dos clientes
 * Todas as consultas deverá ser realizadas passando
 * a conexao atraves do metodo ::connection(connection)
 */
class NfeProdutoCofinsStEloquentRepository extends WebControlEloquentRepository implements NfeProdutoCofinsStRepositoryInterface
{
    protected $model;
    /**
    * Instantiate reporitory
    * 
    * @param NfeProdutoCofinsSt $model
    */
    public function __construct(NfeProdutoCofinsSt $model)
    {
        parent::__construct($model);
    }
}