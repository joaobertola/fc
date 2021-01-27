<?php

namespace App\Services\Repository\Eloquent\Model\Nfe;

use App\Model\Nfe\NfeProdutoICMS;
use App\DTO\Produtos\CadastroICMSDTO;
use App\Repository\Eloquent\Model\Nfe\NfeProdutoICMSEloquentRepository;
use App\Services\Repository\Eloquent\WebControlEloquentRepositoryService;
use App\Services\Repository\Contracts\Model\Nfe\NfeProdutoICMSRepositoryServiceInterface;

/**
 * @author Tiago Franco
 * Servico de acesso ao repositorio de Model
 * Deverá possuir os metodos contendo operacoes de escrita 
 * do modelo implementando a interface do repositorio
 */
class NfeProdutoICMSEloquentRepositoryService extends WebControlEloquentRepositoryService implements NfeProdutoICMSRepositoryServiceInterface
{
    public function __construct(NfeProdutoICMS $model, NfeProdutoICMSEloquentRepository $repository)
    {
        parent::__construct($model, $repository);
    }

    public function vinculaICMS(int $idProduto, CadastroICMSDTO $cadastroICMSDTO)
    {
        $dados = [
            "orig"                        => $cadastroICMSDTO->getOrigem(),
            "CST"                         => $cadastroICMSDTO->getSituacaoTributaria(),
            "modBC"                       => $cadastroICMSDTO->getModalidadeDeterminacaoBcIcms(),
            "pRedBC"                      => $cadastroICMSDTO->getPercentualReducaoBcIcms(),
            "pICMS"                       => $cadastroICMSDTO->getPercentualAliquotaIcms(),
            "modBCST"                     => $cadastroICMSDTO->getModalidadeDeteminacaoBcIcmsSt(),
            "pMVAST"                      => $cadastroICMSDTO->getMargemValorAdicionalIcmsSt(),
            "pRedBCST"                    => $cadastroICMSDTO->getPercentualReducaoBcIcmsSt(),
            "pICMSST"                     => $cadastroICMSDTO->getPercentualAliquotaIcmsSt(),
            "regimes"                     => $cadastroICMSDTO->getRegimeFiscal(),
            "pOpePropria"                 => $cadastroICMSDTO->getPercentualBCOperacaoPropriaIcms(),
            "uf"                          => $cadastroICMSDTO->getUfDevidoOperacaoIcmsSt(),
            "vl_aliq_calc_cre"            => $cadastroICMSDTO->getAliquotaCalculoCreditoIcms(),
            "bc_icms_st_ret_ant"          => $cadastroICMSDTO->getPercentualRetidoAnteriormenteIcmsSt(),
            "valor_desoneracao_icms"      => $cadastroICMSDTO->getValorDesoneracaoIcms(),
            "motivo_desoneracao_icms"     => $cadastroICMSDTO->getMotivoDesoneracaoIcms(),
            "percentual_diferimento_icms" => $cadastroICMSDTO->getPercentualDiferimentoIcms(),
            "uf_retido_remetente_icms_st" => $cadastroICMSDTO->getUfRetidoRemetenteIcmsSt(),
            "uf_destino_icms_st"          => $cadastroICMSDTO->getUfDestinoRemetenteIcmsSt(),
            "id_cadastro"                 => $this->_usuarioLogadoService->getIdCadastroLogado(),
        ];
        //cria ou atualiza o existente
        return $this->updateOrCreate(['id_produto' => $idProduto], $dados);
    }

    public function apagarICMS(int $idProduto)
    {
        return $this->deleteBy(
            ['id_produto', '=', $idProduto],
            ['id_cadastro', '=', $this->_usuarioLogadoService->getIdCadastroLogado()]
        );
    }
}
