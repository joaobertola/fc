<?php

namespace App\Repository\Eloquent\Model\Nfe;

use App\Model\Nfe\NfeCupomFiscal;
use App\Repository\Contracts\Model\Nfe\NfeCupomFiscalRepositoryInterface;
use App\Repository\Eloquent\WebControlEloquentRepository;

/**
 * @author Tiago Franco
 * Repositorio para metodos de consultas dos clientes
 * Todas as consultas deverá ser realizadas passando
 * a conexao atraves do metodo ::connection(connection)
 */
class NfeCupomFiscalEloquentRepository extends WebControlEloquentRepository implements NfeCupomFiscalRepositoryInterface
{
    protected $model;
    /**
    * Instantiate reporitory
    * 
    * @param NfeCupomFiscal $model
    */
    public function __construct(NfeCupomFiscal $model)
    {
        parent::__construct($model);
    }
}