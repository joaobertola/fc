<?php

namespace App\Services\Repository\Contracts\Model\Produto;

use App\DTO\Produtos\CadastroInformacoesFiscaisDTO;
use App\Services\Repository\Contracts\RepositoryServiceInterface;

/**
 * @author Tiago Franco
 * Interface basica referente a abstração
 * do padrao repository service 
 */
interface ProdutoBeneficioFiscalRepositoryServiceInterface extends RepositoryServiceInterface
{
    public function salvarCodBeneficiosCst(int $idProduto, CadastroInformacoesFiscaisDTO $informacoesFiscais);
}