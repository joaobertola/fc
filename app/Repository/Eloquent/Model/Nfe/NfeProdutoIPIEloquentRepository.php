<?php

namespace App\Repository\Eloquent\Model\Nfe;

use App\Model\Nfe\NfeProdutoIPI;
use App\Repository\Contracts\Model\Nfe\NfeProdutoIPIRepositoryInterface;
use App\Repository\Eloquent\WebControlEloquentRepository;

/**
 * @author Tiago Franco
 * Repositorio para metodos de consultas dos clientes
 * Todas as consultas deverá ser realizadas passando
 * a conexao atraves do metodo ::connection(connection)
 */
class NfeProdutoIPIEloquentRepository extends WebControlEloquentRepository implements NfeProdutoIPIRepositoryInterface
{
    protected $model;
    /**
    * Instantiate reporitory
    * 
    * @param NfeProdutoIPI $model
    */
    public function __construct(NfeProdutoIPI $model)
    {
        parent::__construct($model);
    }
}