<?php

namespace App\Services\Repository\Contracts\Model\Nfe;

use App\DTO\Produtos\CadastroISSQNDTO;
use App\Services\Repository\Contracts\RepositoryServiceInterface;

/**
 * @author Tiago Franco
 * Interface basica referente a abstração
 * do padrao repository service 
 */
interface NfeProdutoIssqnRepositoryServiceInterface extends RepositoryServiceInterface
{
    public function vincularISSQN(int $idProduto, CadastroISSQNDTO $cadastroISSQNDTO);
}