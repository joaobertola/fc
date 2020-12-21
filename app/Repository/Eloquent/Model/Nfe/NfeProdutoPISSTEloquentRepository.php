<?php

namespace App\Repository\Eloquent\Model\Nfe;

use App\Model\Nfe\NfeProdutoPISST;
use App\Repository\Contracts\Model\Nfe\NfeProdutoPISSTRepositoryInterface;
use App\Repository\Eloquent\WebControlEloquentRepository;

/**
 * @author Tiago Franco
 * Repositorio para metodos de consultas dos clientes
 * Todas as consultas deverá ser realizadas passando
 * a conexao atraves do metodo ::connection(connection)
 */
class NfeProdutoPISSTEloquentRepository extends WebControlEloquentRepository implements NfeProdutoPISSTRepositoryInterface
{
    protected $model;
    /**
    * Instantiate reporitory
    * 
    * @param NfeProdutoPISST $model
    */
    public function __construct(NfeProdutoPISST $model)
    {
        parent::__construct($model);
    }
}