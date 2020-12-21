<?php

namespace App\Services\Repository\Eloquent\Model\Venda;

use App\Model\Venda\VendaItem;
use Illuminate\Support\Facades\DB;
use App\Repository\Eloquent\Model\Venda\VendaItemEloquentRepository;
use App\Services\Repository\Eloquent\WebControlEloquentRepositoryService;
use App\Services\Repository\Contracts\Model\Venda\VendaItemRepositoryServiceInterface;

/**
 * @author Tiago Franco
 * Servico de acesso ao repositorio de Model
 * Deverá possuir os metodos contendo operacoes de escrita 
 * do modelo implementando a interface do repositorio
 */
class VendaItemEloquentRepositoryService extends WebControlEloquentRepositoryService implements VendaItemRepositoryServiceInterface
{
    public function __construct(VendaItem $model, VendaItemEloquentRepository $repository)
    {
        parent::__construct($model, $repository);
    }

    public function setarQtde(int $idItemVenda, int $qtd)
    {
        $sql = "UPDATE base_web_control.venda_itens SET qtd = ? where id = ?";
        DB::update($sql, [$qtd, $idItemVenda]);
    }

    public function setarEstornado(int $idItemVenda, $estornado = "S")
    {
        $sql = "UPDATE base_web_control.venda_itens SET estornado = ? where id = ?";
        DB::update($sql, [$estornado, $idItemVenda]);
    }
}
