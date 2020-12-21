<?php

namespace App\Repository\Eloquent\Model\Venda;

use App\Model\Venda\VendaConsignacaoDevolucao;
use App\Repository\Contracts\Model\Venda\VendaConsignacaoDevolucaoRepositoryInterface;
use App\Repository\Eloquent\WebControlEloquentRepository;

/**
 * @author Tiago Franco
 * Repositorio para metodos de consultas dos clientes
 * Todas as consultas deverá ser realizadas passando
 * a conexao atraves do metodo ::connection(connection)
 */
class VendaConsignacaoDevolucaoEloquentRepository extends WebControlEloquentRepository implements VendaConsignacaoDevolucaoRepositoryInterface
{
    protected $model;
    /**
    * Instantiate reporitory
    * 
    * @param VendaConsignacaoDevolucao $model
    */
    public function __construct(VendaConsignacaoDevolucao $model)
    {
        parent::__construct($model);
    }
}