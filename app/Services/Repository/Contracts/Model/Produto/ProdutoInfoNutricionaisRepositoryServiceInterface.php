<?php

namespace App\Services\Repository\Contracts\Model\Produto;

use App\DTO\Produtos\CadastroInformacoesNutricionaisDTO;
use App\Services\Repository\Contracts\RepositoryServiceInterface;

/**
 * @author Tiago Franco
 * Interface basica referente a abstração
 * do padrao repository service 
 */
interface ProdutoInfoNutricionaisRepositoryServiceInterface extends RepositoryServiceInterface
{
    public function salvarInformacoesNutricionais(int $idProduto, CadastroInformacoesNutricionaisDTO $informacoesNutricionais);
}