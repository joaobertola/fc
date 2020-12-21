<?php

namespace App\Services\Repository\Contracts\Model\Nfe;

use App\DTO\Produtos\CadastroIPIDTO;
use App\Services\Repository\Contracts\RepositoryServiceInterface;

/**
 * @author Tiago Franco
 * Interface basica referente a abstração
 * do padrao repository service 
 */
interface NfeProdutoIPIRepositoryServiceInterface extends RepositoryServiceInterface
{
    public function vinculaIPI(int $idProduto, CadastroIPIDTO $cadastroIPIDTO) ;
}