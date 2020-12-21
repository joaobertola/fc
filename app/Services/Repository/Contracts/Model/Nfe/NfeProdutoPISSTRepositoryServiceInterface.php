<?php

namespace App\Services\Repository\Contracts\Model\Nfe;

use App\DTO\Produtos\CadastroPISSTDTO;
use App\Services\Repository\Contracts\RepositoryServiceInterface;

/**
 * @author Tiago Franco
 * Interface basica referente a abstração
 * do padrao repository service 
 */
interface NfeProdutoPISSTRepositoryServiceInterface extends RepositoryServiceInterface
{
    public function vincularPISST(int $idProduto, CadastroPISSTDTO $cadastroIPISTSTDTO);
}