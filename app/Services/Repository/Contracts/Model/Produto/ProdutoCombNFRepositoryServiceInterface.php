<?php

namespace App\Services\Repository\Contracts\Model\Produto;

use App\DTO\Produtos\CadastroProdutoCompletoDTO;
use App\Services\Repository\Contracts\RepositoryServiceInterface;

/**
 * @author Tiago Franco
 * Interface basica referente a abstração
 * do padrao repository service 
 */
interface ProdutoCombNFRepositoryServiceInterface extends RepositoryServiceInterface
{
    public function salvarGLP(int $idProduto, CadastroProdutoCompletoDTO $cadastroProdutoCompletoDTO) ;
}