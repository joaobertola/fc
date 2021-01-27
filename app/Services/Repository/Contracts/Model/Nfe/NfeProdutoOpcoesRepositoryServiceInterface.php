<?php

namespace App\Services\Repository\Contracts\Model\Nfe;

use App\Services\Repository\Contracts\RepositoryServiceInterface;

/**
 * @author Tiago Franco
 * Interface basica referente a abstração
 * do padrao repository service 
 */
interface NfeProdutoOpcoesRepositoryServiceInterface extends RepositoryServiceInterface
{
    public function vinculaOpcaoProduto(int $idProduto, string $tributacaoLucro) ;
}