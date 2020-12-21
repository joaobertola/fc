<?php

namespace App\Services\Repository\Eloquent\Model\Produto;

use App\DTO\Produtos\CadastroProdutoCompletoDTO;
use App\Model\Produto\ProdutoCombNF;
use App\Repository\Eloquent\Model\Produto\ProdutoCombNFEloquentRepository;
use App\Services\Repository\Contracts\Model\Produto\ProdutoCombNFRepositoryServiceInterface;
use App\Services\Repository\Eloquent\WebControlEloquentRepositoryService;

/**
 * @author Tiago Franco
 * Servico de acesso ao repositorio de Model
 * Deverá possuir os metodos contendo operacoes de escrita 
 * do modelo implementando a interface do repositorio
 */
class ProdutoCombNFEloquentRepositoryService extends WebControlEloquentRepositoryService implements ProdutoCombNFRepositoryServiceInterface
{
    public function __construct(ProdutoCombNF $model, ProdutoCombNFEloquentRepository $repository)
    {
        parent::__construct($model, $repository);
    }

    public function salvarGLP(int $idProduto, CadastroProdutoCompletoDTO $cadastroProdutoCompletoDTO) {
        $dados = [
            'id_produto' => $idProduto,
            'descANP' => $cadastroProdutoCompletoDTO->getNome(),
            'pGLP'    => $cadastroProdutoCompletoDTO->getInformacoesFiscais()->getGlp()->getPercentual(),
            'CODIF'   => $cadastroProdutoCompletoDTO->getInformacoesFiscais()->getGlp()->getCodigoFiscal(),
            'qTemp'   => $cadastroProdutoCompletoDTO->getInformacoesFiscais()->getGlp()->getTemperatura(),
        ];

        return $this->updateOrCreate(['id_produto' => $idProduto],$dados);
    }
}
