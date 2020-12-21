<?php

namespace App\Services\Repository\Contracts\Model\Nfe;

use App\DTO\Produtos\CadastroCOFINSSTDTO;
use App\Services\Repository\Contracts\RepositoryServiceInterface;

/**
 * @author Tiago Franco
 * Interface basica referente a abstração
 * do padrao repository service 
 */
interface NfeProdutoCofinsStRepositoryServiceInterface extends RepositoryServiceInterface
{
    public function vincularCofinsSt(int $idProduto, CadastroCOFINSSTDTO $cadastroCOFINSSTDTO);
}