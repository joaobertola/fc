<?php

namespace App\Services\Repository\Contracts\Model\Nfe;

use App\DTO\Produtos\CadastroPISDTO;
use App\Services\Repository\Contracts\RepositoryServiceInterface;

/**
 * @author Tiago Franco
 * Interface basica referente a abstração
 * do padrao repository service 
 */
interface NfeProdutoPISRepositoryServiceInterface extends RepositoryServiceInterface
{
    public function vincularPIS(int $idProduto, CadastroPISDTO $cadastroIPIDTO) ;
}