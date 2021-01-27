<?php

namespace App\Repository\Eloquent\Model\Produto;

use App\Model\Produto\ProdutoBeneficioFiscal;
use App\Repository\Contracts\Model\Produto\ProdutoBeneficioFiscalRepositoryInterface;
use App\Repository\Eloquent\WebControlEloquentRepository;

/**
 * @author Tiago Franco
 * Repositorio para metodos de consultas dos clientes
 * Todas as consultas deverá ser realizadas passando
 * a conexao atraves do metodo ::connection(connection)
 */
class ProdutoBeneficioFiscalEloquentRepository extends WebControlEloquentRepository implements ProdutoBeneficioFiscalRepositoryInterface
{
    protected $model;
    /**
    * Instantiate reporitory
    * 
    * @param ProdutoBeneficioFiscal $model
    */
    public function __construct(ProdutoBeneficioFiscal $model)
    {
        parent::__construct($model);
    }
}