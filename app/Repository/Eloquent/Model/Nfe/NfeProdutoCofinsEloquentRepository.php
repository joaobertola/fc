<?php

namespace App\Repository\Eloquent\Model\Nfe;

use App\Model\Nfe\NfeProdutoCofins;
use App\Repository\Contracts\Model\Nfe\NfeProdutoCofinsRepositoryInterface;
use App\Repository\Eloquent\WebControlEloquentRepository;

/**
 * @author Tiago Franco
 * Repositorio para metodos de consultas dos clientes
 * Todas as consultas deverá ser realizadas passando
 * a conexao atraves do metodo ::connection(connection)
 */
class NfeProdutoCofinsEloquentRepository extends WebControlEloquentRepository implements NfeProdutoCofinsRepositoryInterface
{
    protected $model;
    /**
    * Instantiate reporitory
    * 
    * @param NfeProdutoCofins $model
    */
    public function __construct(NfeProdutoCofins $model)
    {
        parent::__construct($model);
    }
}