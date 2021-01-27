<?php

namespace App\Repository\Eloquent\Model\Produto;

use App\Model\Produto\ProdutoCombNF;
use App\Repository\Contracts\Model\Produto\ProdutoCombNFRepositoryInterface;
use App\Repository\Eloquent\WebControlEloquentRepository;

/**
 * @author Tiago Franco
 * Repositorio para metodos de consultas dos clientes
 * Todas as consultas deverá ser realizadas passando
 * a conexao atraves do metodo ::connection(connection)
 */
class ProdutoCombNFEloquentRepository extends WebControlEloquentRepository implements ProdutoCombNFRepositoryInterface
{
    protected $model;
    /**
    * Instantiate reporitory
    * 
    * @param ProdutoCombNF $model
    */
    public function __construct(ProdutoCombNF $model)
    {
        parent::__construct($model);
    }
}