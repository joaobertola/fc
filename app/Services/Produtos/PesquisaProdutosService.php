<?php

namespace App\Services\Produtos;

use App\DTO\ProdutoDTO;
use App\DTO\Produtos\PesquisaProdutoPorNomeDTO;
use App\Exceptions\ApiWebControlException;
use App\Repository\Contracts\Model\Produto\ClassificacaoRepositoryInterface;
use App\Repository\Contracts\Model\Produto\GradeRepositoryInterface;
use App\Repository\Contracts\Model\Produto\ProdutoRepositoryInterface;
use App\Services\Utils\CodigoBarrasUtils;
use Prophecy\Util\StringUtil;

/**
 * @author Tiago Franco
 * Servico para pesquisa de dados
 * relacionados aos produtos
 */
class PesquisaProdutosService
{
    /**
     * @var ProdutoRepositoryInterface
     */
    private $_produtoRepository;

    /**
     * @var GradeRepositoryInterface
     */
    private $_gradeRepository;

    /**
     * @var ClassificacaoRepositoryInterface
     */
    private $_classificacaoRepository;

    public function __construct(
        ClassificacaoRepositoryInterface $classificacaoRepository,
        ProdutoRepositoryInterface $produtoRepository,
        GradeRepositoryInterface $gradeRepository
    ) {
        $this->_classificacaoRepository = $classificacaoRepository;
        $this->_produtoRepository       = $produtoRepository;
        $this->_gradeRepository         = $gradeRepository;
    }

    public function getProdutosDeComadas(ProdutoDTO $produtoDTO)
    {
        $categorias = $this->_classificacaoRepository->listarCategorias();

        if (empty($categorias)) {
            return [];
        }

        return  $this->_produtoRepository->getProdutosDeComandas($categorias, $produtoDTO);
    }

    public function pesquisaProdutoKitCombo(string $termoPesquisa)
    {
        return $this->_produtoRepository->pesquisaKitsCombo($termoPesquisa);
    }

    public function pesquisaDetalhada(string $termoPesquisa)
    {
        return $this->_produtoRepository->pesquisaDetalhada($termoPesquisa);
    }

    public function pesquisaByName(PesquisaProdutoPorNomeDTO $dto)
    {
        return $this->_produtoRepository->pesquisaPorNome($dto);
    }

    public function pesquisaByClassificacao(string $classificacao)
    {
        return $this->_produtoRepository->pesquisaProdutoPorClassificacao($classificacao);
    }

    public function pesquisaByIdInterna(string $idInterna)
    {
        return $this->_produtoRepository->pesquisaProdutoPorIdInterna($idInterna);
    }

    public function getCodigoBarrasDisponivel(string $codigoBarra = "")
    {
        if (empty($codigoBarra)) {
            #gera, verifica e retorna um novo codigo barras ainda nao utilizado
            while (true) {
                $codigoBarra = CodigoBarrasUtils::geraCodigoBarra8();
                if ($this->validarCodBarraNaoVinculado($codigoBarra)) {
                    return $codigoBarra;
                }
            }
        }

        #codigo barra informado, Validar
        if (!$this->validarCodBarraNaoVinculado($codigoBarra)) { 
            throw new ApiWebControlException("Código de barras já utilizado em outro produto, kit ou grade de produto");
        }
    }

    public function validarCodBarraNaoVinculado(string $codigoBarra, $idEditado = false) {
        $vinculado = $this->getVinculoCodBarra($codigoBarra);

        //edicao do proprio objeto
        if($idEditado && $vinculado == $idEditado) {
            return true;
        }

        #cadastros
        return $vinculado ? true : false;
    }
    
    private function getVinculoCodBarra(string $codigoBarra)
    {
        $produto = $this->_produtoRepository->getProdutoPorCodigoBarras($codigoBarra);
        if ($produto) {
            return $produto->id;
        }

        $kitProduto = $this->_produtoRepository->getKitProdutoPorCodigoBarras($codigoBarra);
        if ($kitProduto) {
            return $kitProduto->id;
        }

        $grade = $this->_gradeRepository->getGradePorCodigoBarras($codigoBarra);
        if ($grade) {
            return $grade->id_grade;
        }

        return null;
    }
}
