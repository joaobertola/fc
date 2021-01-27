<?php

namespace App\Services\Repository\Contracts\Model\Produto;

use App\DTO\Produtos\CadastroProdutoDTO;
use App\DTO\Produtos\CadastroCalculosFretesDTO;
use App\DTO\Produtos\CadastroDemaisInformacoesDTO;
use App\DTO\Produtos\CadastroInformacoesFiscaisDTO;
use App\Services\Repository\Contracts\RepositoryServiceInterface;

/**
 * @author Tiago Franco
 * Interface basica referente a abstração
 * do padrao repository service 
 */
interface ProdutoRepositoryServiceInterface extends RepositoryServiceInterface
{
    public function novoProdutoCadastroRapido(CadastroProdutoDTO $cadastroProdutoDTO);
    public function salvarDemaisInformacoes(int $idProduto, CadastroDemaisInformacoesDTO $demaisInformacoesDTO);
    public function salvarValoresFrete(int $idProduto, CadastroCalculosFretesDTO $calculosFretes);
    public function salvarInformacoesFiscais(int $idProduto, CadastroInformacoesFiscaisDTO $informacoesFiscais);
    
    
}