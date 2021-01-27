<?php

namespace App\Repository\Eloquent\Model\Nfe;

use App\Model\Nfe\NfeProdutoICMS;
use App\Repository\Contracts\Model\Nfe\NfeProdutoICMSRepositoryInterface;
use App\Repository\Eloquent\WebControlEloquentRepository;

/**
 * @author Tiago Franco
 * Repositorio para metodos de consultas dos clientes
 * Todas as consultas deverá ser realizadas passando
 * a conexao atraves do metodo ::connection(connection)
 */
class NfeProdutoICMSEloquentRepository extends WebControlEloquentRepository implements NfeProdutoICMSRepositoryInterface
{
    protected $model;
    /**
    * Instantiate reporitory
    * 
    * @param NfeProdutoICMS $model
    */
    public function __construct(NfeProdutoICMS $model)
    {
        parent::__construct($model);
    }
}