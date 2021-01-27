<?php

namespace App\Repository\Eloquent\Model\Nfe;

use App\Model\Nfe\NfeProdutoPIS;
use App\Repository\Contracts\Model\Nfe\NfeProdutoPISRepositoryInterface;
use App\Repository\Eloquent\WebControlEloquentRepository;

/**
 * @author Tiago Franco
 * Repositorio para metodos de consultas dos clientes
 * Todas as consultas deverá ser realizadas passando
 * a conexao atraves do metodo ::connection(connection)
 */
class NfeProdutoPISEloquentRepository extends WebControlEloquentRepository implements NfeProdutoPISRepositoryInterface
{
    protected $model;
    /**
    * Instantiate reporitory
    * 
    * @param NfeProdutoPIS $model
    */
    public function __construct(NfeProdutoPIS $model)
    {
        parent::__construct($model);
    }
}