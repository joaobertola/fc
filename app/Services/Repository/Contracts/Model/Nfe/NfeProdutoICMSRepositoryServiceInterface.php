<?php

namespace App\Services\Repository\Contracts\Model\Nfe;

use App\DTO\Produtos\CadastroICMSDTO;
use App\Services\Repository\Contracts\RepositoryServiceInterface;

/**
 * @author Tiago Franco
 * Interface basica referente a abstração
 * do padrao repository service 
 */
interface NfeProdutoICMSRepositoryServiceInterface extends RepositoryServiceInterface
{
    public function vinculaICMS(int $idProduto, CadastroICMSDTO $cadastroICMSDTO) ;
    public function apagarICMS(int $idProduto) ;
}