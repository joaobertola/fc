<?php

namespace App\Services\Repository\Eloquent\Model\Produto;

use App\Model\Produto\ProdutoInfoNutricionais;
use App\DTO\Produtos\CadastroInformacoesNutricionaisDTO;
use App\Services\Repository\Eloquent\WebControlEloquentRepositoryService;
use App\Repository\Eloquent\Model\Produto\ProdutoInfoNutricionaisEloquentRepository;
use App\Services\Repository\Contracts\Model\Produto\ProdutoInfoNutricionaisRepositoryServiceInterface;

/**
 * @author Tiago Franco
 * Servico de acesso ao repositorio de Model
 * Deverá possuir os metodos contendo operacoes de escrita 
 * do modelo implementando a interface do repositorio
 */
class ProdutoInfoNutricionaisEloquentRepositoryService extends WebControlEloquentRepositoryService implements ProdutoInfoNutricionaisRepositoryServiceInterface
{
    public function __construct(ProdutoInfoNutricionais $model, ProdutoInfoNutricionaisEloquentRepository $repository)
    {
        parent::__construct($model, $repository);
    }

    public function salvarInformacoesNutricionais(int $idProduto, CadastroInformacoesNutricionaisDTO $informacoesNutricionais) {
        $dados = [
            "id_produto"  => $idProduto,
            "dias"        => $informacoesNutricionais->getDiasValidade(),
            "porcao"      => $informacoesNutricionais->getPorcao(),
            "calorias"    => $informacoesNutricionais->getCalorias(),
            "caboidrato"  => $informacoesNutricionais->getCaboidrato(),
            "proteinas"   => $informacoesNutricionais->getProteinas(),
            "gord_tot"    => $informacoesNutricionais->getGorduraTotal(),
            "gord_sat"    => $informacoesNutricionais->getGorduraSaturada(),
            "colesterol"  => $informacoesNutricionais->getColesterol(),
            "gord_trans"  => $informacoesNutricionais->getGorduraTrans(),
            "fibra"       => $informacoesNutricionais->getFibra(),
            "calcio"      => $informacoesNutricionais->getCalcio(),
            "ferro"       => $informacoesNutricionais->getFerro(),
            "sodio"       => $informacoesNutricionais->getSodio(),
            "id_cadastro" => $this->_usuarioLogadoService->getIdCadastroLogado(),
        ];

        return $this->updateOrCreate(['id_produto' => $idProduto, 'id_cadastro' => $dados['id_cadastro']], $dados);
    }
}
