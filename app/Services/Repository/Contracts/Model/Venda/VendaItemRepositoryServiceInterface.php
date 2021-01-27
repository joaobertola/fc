<?php

namespace App\Services\Repository\Contracts\Model\Venda;

use App\Services\Repository\Contracts\RepositoryServiceInterface;

/**
 * @author Tiago Franco
 * Interface basica referente a abstração
 * do padrao repository service 
 */
interface VendaItemRepositoryServiceInterface extends RepositoryServiceInterface
{
    public function setarQtde(int $idItemVenda, int $qtd);
    public function setarEstornado(int $idItemVenda, $estornado = "S");
}