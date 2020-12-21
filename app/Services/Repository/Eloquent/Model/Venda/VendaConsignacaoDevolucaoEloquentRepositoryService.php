<?php

namespace App\Services\Repository\Eloquent\Model\Venda;

use App\Model\Venda\VendaConsignacaoDevolucao;
use App\Repository\Eloquent\Model\Venda\VendaConsignacaoDevolucaoEloquentRepository;
use App\Services\Repository\Contracts\Model\Venda\VendaConsignacaoDevolucaoRepositoryServiceInterface;
use App\Services\Repository\Eloquent\WebControlEloquentRepositoryService;

/**
 * @author Tiago Franco
 * Servico de acesso ao repositorio de Model
 * Deverá possuir os metodos contendo operacoes de escrita 
 * do modelo implementando a interface do repositorio
 */
class VendaConsignacaoDevolucaoEloquentRepositoryService extends WebControlEloquentRepositoryService implements VendaConsignacaoDevolucaoRepositoryServiceInterface
{
    public function __construct(VendaConsignacaoDevolucao $model, VendaConsignacaoDevolucaoEloquentRepository $repository)
    {
        parent::__construct($model, $repository);
    }
}
