<?php

namespace App\Repository\Eloquent\Model\MercadoLivre;

use App\Model\MercadoLivre\MercadoLivre;
use App\Repository\Contracts\Model\MercadoLivre\MercadoLivreRepositoryInterface;
use App\Repository\Eloquent\WebControlEloquentRepository;

/**
 * @author Tiago Franco
 * Repositorio para metodos de consultas dos clientes
 * Todas as consultas deverá ser realizadas passando
 * a conexao atraves do metodo ::connection(connection)
 */
class MercadoLivreEloquentRepository extends WebControlEloquentRepository implements MercadoLivreRepositoryInterface
{
    protected $model;
    /**
    * Instantiate reporitory
    * 
    * @param MercadoLivre $model
    */
    public function __construct(MercadoLivre $model)
    {
        parent::__construct($model);
    }
}