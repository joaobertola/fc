<?php

namespace App\Repository\Eloquent\Model\Nfe;

use App\Model\Nfe\NfeProdutoIssqn;
use App\Repository\Contracts\Model\Nfe\NfeProdutoIssqnRepositoryInterface;
use App\Repository\Eloquent\WebControlEloquentRepository;

/**
 * @author Tiago Franco
 * Repositorio para metodos de consultas dos clientes
 * Todas as consultas deverá ser realizadas passando
 * a conexao atraves do metodo ::connection(connection)
 */
class NfeProdutoIssqnEloquentRepository extends WebControlEloquentRepository implements NfeProdutoIssqnRepositoryInterface
{
    protected $model;
    /**
    * Instantiate reporitory
    * 
    * @param NfeProdutoIssqn $model
    */
    public function __construct(NfeProdutoIssqn $model)
    {
        parent::__construct($model);
    }
}