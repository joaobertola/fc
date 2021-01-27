<?php

namespace App\Repository\Eloquent\Model\Nfe;

use App\Model\Nfe\NfeProdutoOpcoes;
use App\Repository\Contracts\Model\Nfe\NfeProdutoOpcoesRepositoryInterface;
use App\Repository\Eloquent\WebControlEloquentRepository;

/**
 * @author Tiago Franco
 * Repositorio para metodos de consultas dos clientes
 * Todas as consultas deverá ser realizadas passando
 * a conexao atraves do metodo ::connection(connection)
 */
class NfeProdutoOpcoesEloquentRepository extends WebControlEloquentRepository implements NfeProdutoOpcoesRepositoryInterface
{
    protected $model;
    /**
    * Instantiate reporitory
    * 
    * @param NfeProdutoOpcoes $model
    */
    public function __construct(NfeProdutoOpcoes $model)
    {
        parent::__construct($model);
    }
}