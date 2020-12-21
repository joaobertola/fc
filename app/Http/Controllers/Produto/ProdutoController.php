<?php

namespace App\Http\Controllers\Produto;

use Illuminate\Http\Request;
use App\Model\Produto\Produto;
use App\Http\Controllers\Controller;
use App\Services\Produtos\ProdutosService;
use Symfony\Component\HttpFoundation\Response;
use App\DTO\Produtos\CadastroCalculosFretesDTO;
use App\DTO\Produtos\PesquisaProdutoPorNomeDTO;
use App\DTO\Produtos\CadastroProdutoCompletoDTO;
use App\Services\Extensions\RequestBodyConverter;
use App\DTO\Produtos\CadastroDemaisInformacoesDTO;
use App\Services\Produtos\PesquisaProdutosService;
use App\DTO\Produtos\CadastroInformacoesNutricionaisDTO;

class ProdutoController extends Controller
{
    /**
     * Função retornar o produto e sua categoria
     * 
     * @return Json Retorna todas categorias de produtos.
     */
    public function getProduto(Produto $produto){
        //$produto->classificacao;
        return $this->send($produto);
    }

    /**
     * Função para pesquias de produtos por kit e combos
     * 
     * @return Json Retorna todos os produtos contidos em combos ou kits
     */
    public function pesquisaProdutoKitCombo(string $termoPesquisa, PesquisaProdutosService $pesquisaProdutosService)
    {
        return $this->send($pesquisaProdutosService->pesquisaProdutoKitCombo($termoPesquisa));
    }

    /**
     * Pesquisa de produtos de forma detalhada
     * 
     * @return Json Retorna todos os produtos da esquisa de forma detalhada
     */
    public function pesquisaDetalhada(string $termoPesquisa, PesquisaProdutosService $pesquisaProdutosService)
    {
        return $this->send($pesquisaProdutosService->pesquisaProdutoKitCombo($termoPesquisa));
    }


     /**
     * Pesquisa de produtos pelo nome
     * 
     * @return Json Retorna todos os produtos pelo nome
     */
    public function pesquisaPeloNome(PesquisaProdutosService $pesquisaProdutosService, RequestBodyConverter $requestBodyConverter)
    {
        $dto = $requestBodyConverter->deserializer(new PesquisaProdutoPorNomeDTO());
        return $this->send($pesquisaProdutosService->pesquisaByName($dto));
    }

     /**
     * Pesquisa de produtos pela classfificacao
     * 
     * @return Json Retorna todos os produtos pelo nome
     */
    public function pesquisaPelaClassificacao(string $classificacao, PesquisaProdutosService $pesquisaProdutosService)
    {
        return $this->send($pesquisaProdutosService->pesquisaByClassificacao($classificacao));
    }

     /**
     * Pesquisa de produtos pela identicacao interna
     * 
     * @return Json Retorna todos os produtos pelo nome
     */
    public function pesquisaPelaIdInterna(string $idInterna, PesquisaProdutosService $pesquisaProdutosService)
    {
        return $this->send($pesquisaProdutosService->pesquisaByIdInterna($idInterna));
    }

    /**
     * Atualizacao das demais informacoes do produto
     * 
     * @return Json Retorna todos os produtos pelo nome
     */
    public function salvarDemaisInformacoes(Produto $produto, RequestBodyConverter $requestBodyConverter, ProdutosService $produtosService){
        $demaisInformacoesDTO = $requestBodyConverter->deserializer(new CadastroDemaisInformacoesDTO());
        return $this->send($produtosService->salvarDemaisInformacoes($produto->id, $demaisInformacoesDTO), Response::HTTP_CREATED);   
    }

    /**
     * Atualizacao das informacoes nutricionais do produto
     * 
     * @return Json Retorna todos os produtos pelo nome
     */
    public function salvarInformacoesNutricionais(Produto $produto, RequestBodyConverter $requestBodyConverter, ProdutosService $produtosService){
        $informacoesNutricionaisDTO = $requestBodyConverter->deserializer(new CadastroInformacoesNutricionaisDTO());
        return $this->send($produtosService->salvarInformacoesNutricionais($produto->id, $informacoesNutricionaisDTO), Response::HTTP_CREATED);   
    }

    /**
     * Atualizacao das informacoes para entregas via fretes
     * 
     * @return Json Retorna todos os produtos pelo nome
     */
    public function salvarValoresFrete(Produto $produto, RequestBodyConverter $requestBodyConverter, ProdutosService $produtosService){
        $calculosFretesDTO = $requestBodyConverter->deserializer(new CadastroCalculosFretesDTO());
        return $this->send($produtosService->salvarValoresFrete($produto->id, $calculosFretesDTO), Response::HTTP_CREATED);   
    }

    /**
     * Atualizacao das informacoes fiscais
     * 
     * @return Json Retorna todos os produtos pelo nome
     */
    public function salvarInformacoesFiscais(Produto $produto, RequestBodyConverter $requestBodyConverter, ProdutosService $produtosService){
        $cadastroProdutoCompletoDTO = $requestBodyConverter->deserializer(new CadastroProdutoCompletoDTO());
        return $this->send($produtosService->salvaApenasInformacoesFiscais($produto, $cadastroProdutoCompletoDTO), Response::HTTP_CREATED);   
    }

    /**
     * Retornar novo codigo de barras ou validar o informado se ainda nao utilizado para uso
     */
    public function gerarValidarCodigoBarras(Request $request, PesquisaProdutosService $pesquisaProdutosService)
    {
        $codigoBarras = $request->has('codigo_barra') ? $request->codigo_barra : "";
        return $this->send($pesquisaProdutosService->getCodigoBarrasDisponivel($codigoBarras));
    }
    
}
