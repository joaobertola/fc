<?php

namespace App\Services\Repository\Eloquent\Model\Produto;

use App\Model\Produto\Produto;
use App\DTO\Produtos\CadastroProdutoDTO;
use App\DTO\Produtos\CadastroCalculosFretesDTO;
use App\DTO\Produtos\CadastroProdutoCompletoDTO;
use App\DTO\Produtos\CadastroDemaisInformacoesDTO;
use App\DTO\Produtos\CadastroInformacoesFiscaisDTO;
use App\Repository\Eloquent\Model\Produto\ProdutoEloquentRepository;
use App\Services\Repository\Eloquent\WebControlEloquentRepositoryService;
use App\Services\Repository\Contracts\Model\Produto\ProdutoRepositoryServiceInterface;

/**
 * @author Tiago Franco
 * Servico de acesso ao repositorio de Model
 * Deverá possuir os metodos contendo operacoes de escrita 
 * do modelo implementando a interface do repositorio
 */
class ProdutoEloquentRepositoryService extends WebControlEloquentRepositoryService implements ProdutoRepositoryServiceInterface
{
    public function __construct(Produto $model, ProdutoEloquentRepository $repository)
    {
        parent::__construct($model, $repository);
    }

    public function novoProdutoCadastroRapido(CadastroProdutoDTO $cadastroProdutoDTO) {
        $produto                            = new Produto();
        $produto->id_fornecedor             = $cadastroProdutoDTO->getIdFornecedor();
        $produto->id_classificacao          = $cadastroProdutoDTO->getIdClassificacao();
        $produto->id_marca                  = $cadastroProdutoDTO->getIdMarca() ?: null;
        $produto->codigo_barra              = $cadastroProdutoDTO->getCodigoBarra();
        $produto->identificacao_interna     = $cadastroProdutoDTO->getCodigoInterno();
        $produto->descricao                 = $cadastroProdutoDTO->getNome();
        $produto->id_unidade                = $cadastroProdutoDTO->getTipoUnidade();
        $produto->id_unidade_trib           = $cadastroProdutoDTO->getTipoUnidadeTributaria();
        $produto->qtd_minima                = $cadastroProdutoDTO->getEstoqueMinimo();
        $produto->ncm                       = $cadastroProdutoDTO->getNcm();
        $produto->id_ibptax                 = $cadastroProdutoDTO->getIdImpostoNota();
        $produto->cest                      = $cadastroProdutoDTO->getCest();
        $produto->custo                     = $cadastroProdutoDTO->getPrecoCusto();
        $produto->custo_medio_venda         = $cadastroProdutoDTO->getPrecoVenda();
        $produto->custo_medio_venda_prazo   = $cadastroProdutoDTO->getPrecoPrazo();
        $produto->custo_medio_venda_varejo  = $cadastroProdutoDTO->getPrecoVarejo();
        $produto->custo_medio_venda_atacado = $cadastroProdutoDTO->getPrecoAtacado();
        $produto->margem_lucro_tipo         = $cadastroProdutoDTO->getTipoMargemLucro();
        $produto->porcentagem_custo_venda   = $cadastroProdutoDTO->getPercentualMargemLucro();
        $produto->margem_lucro_valor        = $cadastroProdutoDTO->getMargemLucroValor();
        $produto->truncar_vlr_total         = $cadastroProdutoDTO->getTruncarVlrTotal();
        $produto->ecommerce                 = $cadastroProdutoDTO->getEcommerce();
        $produto->estoque_lojavirtual       = $cadastroProdutoDTO->getEstoqueLojaVirtual();
        $produto->obs_preco                 = $cadastroProdutoDTO->getObsPreco();
        $produto->infos_nutricionais        = $cadastroProdutoDTO->getInfosNutricionais();
        $produto->locacao_quantidade        = $cadastroProdutoDTO->getLocacaoQuantidade();
        $produto->prod_serv                 = "P";
        $produto->id_cadastro               = $this->_usuarioLogadoService->getIdCadastroLogado();
        $produto->id_usuario                = $this->_usuarioLogadoService->getIdUsuarioLogado();
        $produto->save();
        
        return $produto;    
    }

    public function salvarDemaisInformacoes(int $idProduto, CadastroDemaisInformacoesDTO $demaisInformacoesDTO) {
        $dados = [
            "cor"                   => $demaisInformacoesDTO->getCor(),
            "tamanho"               => $demaisInformacoesDTO->getTamanho(),
            "localizacao"           => $demaisInformacoesDTO->getLocalizacao(),
            "fabricante"            => $demaisInformacoesDTO->getFabricante(),
            "id_origem"             => $demaisInformacoesDTO->getOrigemProdutoNi(),
            "descricao_detalhada"   => $demaisInformacoesDTO->getDescricaoDetalhada(),
            "data_fabricacao"       => $demaisInformacoesDTO->getDataFabricacao(),
            "data_validade"         => $demaisInformacoesDTO->getDataValidade(),
            "nr_edicao"             => $demaisInformacoesDTO->getEdicao(),
            "vender_estoque_zerado" => $demaisInformacoesDTO->getVenderEstoqueZerado(),
            "solicitar_vrtotal"     => $demaisInformacoesDTO->getSolicitarValor(),
            "env_prod"              => $demaisInformacoesDTO->getEnviarProducao(),
        ];

        return $this->update($dados, $idProduto);
    }
        
    public function salvarValoresFrete(int $idProduto, CadastroCalculosFretesDTO $calculosFretes) {
        $dados = [
            'peso_bruto'   => $calculosFretes->getPesoBruto(),
            'peso_liquido' => $calculosFretes->getPesoLiquido(),
            'altura'       => $calculosFretes->getAlturaCaixa(),
            'largura'      => $calculosFretes->getLarguraCaixa(),
            'comprimento'  => $calculosFretes->getComprimentoCaixa(),
        ];

        return $this->update($dados, $idProduto);
    }
    
    public function salvarInformacoesFiscais(int $idProduto, CadastroInformacoesFiscaisDTO $informacoesFiscais) {
        $dados = [
            'codigo_anp'   => $informacoesFiscais->getAnp(),
            'fcp'          => $informacoesFiscais->getCombatePobreza(),
            'glp'          => $informacoesFiscais->getGlp() ? "S" : "N",
            'unidade_trib' => $informacoesFiscais->getUnidadeTributaria(),
            'qtd_trib'     => $informacoesFiscais->getQtdTributaria(),
            'id_cfop'      => $informacoesFiscais->getCfop()
        ];

        return $this->update($dados, $idProduto);
    }   
}
