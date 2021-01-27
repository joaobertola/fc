<?php

namespace App\Http\Controllers\Produto;

use App\Services\Cs2\Cs2Service;
use App\Http\Controllers\Controller;
use App\Repository\Contracts\Model\Produto\ClassificacaoRepositoryInterface;
use App\Repository\Contracts\Model\Produto\ProdutoRepositoryInterface;

class CategoriasProdutosController extends Controller
{
    /**
     * Função para fazer a listagem de categorias de produtos
     * 
     * @return Json Retorna todas categorias de produtos.
     */
    public function categorias(ClassificacaoRepositoryInterface $ClassificacaoRepository, Cs2Service $cs2Service)
    {
        $categorias = $ClassificacaoRepository->listarCategorias();
        $cadastro   = $cs2Service->getCadastro();

        return $this->send([
            'data_count' => count($categorias),
            'data' => $categorias,
            'config' => $cadastro ?: ""
        ]);
    }

    /**
     * Função para retornar informacoes da
     * categoria informada
     *  
     * @return Json Retorna todas categorias de produtos.
     */
    public function categoria(ClassificacaoRepositoryInterface $classificacaoRepository, ProdutoRepositoryInterface $produtoRepository, $idCategoria)
    {
        $categoria = $classificacaoRepository->find($idCategoria);
        return $this->send([
            'item' => $categoria ?: "",
            'data' => $produtoRepository->getProdutosGradesDaCategoria($idCategoria)
        ]);
    }
}
