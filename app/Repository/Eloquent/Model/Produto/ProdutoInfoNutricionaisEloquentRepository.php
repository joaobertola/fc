<?php

namespace App\Repository\Eloquent\Model\Produto;

use App\Model\Produto\ProdutoInfoNutricionais;
use App\Repository\Contracts\Model\Produto\ProdutoInfoNutricionaisRepositoryInterface;
use App\Repository\Eloquent\WebControlEloquentRepository;

/**
 * @author Tiago Franco
 * Repositorio para metodos de consultas dos clientes
 * Todas as consultas deverá ser realizadas passando
 * a conexao atraves do metodo ::connection(connection)
 */
class ProdutoInfoNutricionaisEloquentRepository extends WebControlEloquentRepository implements ProdutoInfoNutricionaisRepositoryInterface
{
    protected $model;
    /**
    * Instantiate reporitory
    * 
    * @param ProdutoInfoNutricionais $model
    */
    public function __construct(ProdutoInfoNutricionais $model)
    {
        parent::__construct($model);
    }
}