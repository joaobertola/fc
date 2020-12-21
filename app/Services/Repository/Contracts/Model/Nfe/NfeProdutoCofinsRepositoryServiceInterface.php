<?php

namespace App\Services\Repository\Contracts\Model\Nfe;

use App\DTO\Produtos\CadastroCOFINSDTO;
use App\Services\Repository\Contracts\RepositoryServiceInterface;

/**
 * @author Tiago Franco
 * Interface basica referente a abstração
 * do padrao repository service 
 */
interface NfeProdutoCofinsRepositoryServiceInterface extends RepositoryServiceInterface
{
    public function vincularCofins(int $idProduto, CadastroCOFINSDTO $cadastroCOFINSDTO);
}