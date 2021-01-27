<?php

namespace App\Services\Repository\Eloquent\Model\Produto;

use App\Model\Produto\Produto;
use App\DTO\FrenteCaixa\CadastroServicoDTO;
use App\Services\Repository\Eloquent\WebControlEloquentRepositoryService;
use App\Repository\Eloquent\Model\Produto\ProdutoFrenteCaixaEloquentRepository;
use App\Services\Repository\Contracts\Model\Produto\ProdutoFrenteCaixaRepositoryServiceInterface;

/**
 * @author Tiago Franco
 * Servico de acesso ao repositorio de Model
 * Deverá possuir os metodos contendo operacoes de escrita 
 * do modelo implementando a interface do repositorio
 * Repositorio fake para centralizacao das operacoes de produtos na frente de caixa
 */
class ProdutoFrenteCaixaEloquentRepositoryService extends WebControlEloquentRepositoryService implements ProdutoFrenteCaixaRepositoryServiceInterface
{
    public function __construct(Produto $model, ProdutoFrenteCaixaEloquentRepository $repository)
    {
        parent::__construct($model, $repository);
    }
    public function novoServicoFromFrenteCaixa(CadastroServicoDTO $cadastroServicoDTO)
    {
        $produto                          = new Produto();
        $produto->id_fornecedor           = $cadastroServicoDTO->getIdFornecedor();
        $produto->descricao               = $cadastroServicoDTO->getNome();
        $produto->id_classificacao        = $cadastroServicoDTO->getIdClassificacao();
        $produto->custo                   = $cadastroServicoDTO->getPrecoCusto();
        $produto->custo_medio_venda       = $cadastroServicoDTO->getPrecoVenda();
        $produto->margem_lucro_tipo       = $cadastroServicoDTO->getTipoMargemLucro();
        $produto->porcentagem_custo_venda = $cadastroServicoDTO->getPercentualMargemLucro();
        $produto->ativo                   = $cadastroServicoDTO->getAtivo();
        $produto->codigo_barra            = $cadastroServicoDTO->getCodigoBarra();
        $produto->id_unidade              = $cadastroServicoDTO->getTipoUnidade();
        $produto->locacao_quantidade      = $cadastroServicoDTO->getLocacaoQuantidade();
        $produto->ecommerce               = $cadastroServicoDTO->getEcommerce();
        $produto->prod_serv               = "S";
        $produto->margem_lucro_valor      = $cadastroServicoDTO->getMargemLucroValor();        
        $produto->id_cadastro             = $this->_usuarioLogadoService->getIdCadastroLogado();
        $produto->id_usuario              = $this->_usuarioLogadoService->getIdUsuarioLogado();
        $produto->save();

        return $produto;
    }
}
