<?php

namespace App\DTO\Produtos;

use App\Services\Extensions\RequestBodyConverterInterface;
use JMS\Serializer\Annotation as JMS;
use OpenApi\Annotations as OA;

/**
 * @author Tiago Franco
 * DTO para os 
 * @JMS\AccessType("public_method")
 * 
 * Class CadastroICMSDTO
 * @package App\DTO\Produtos
 * @OA\Schema(
 *     schema="informacoes_fiscais_icms_dto",
 *     type="object",
 *     title="Informações fiscais de ICMS do Produto",
 *     properties={
 *          @OA\Property(property="origem", type="string", example="0"),
 *          @OA\Property(property="situacao_tributaria", type="string", example="60"),
 *          @OA\Property(property="modalidade_determinacao_bc_icms", type="string", example="3"),
 *          @OA\Property(property="percentual_reducao_bc_icms", type="decimal", example=0.0099),
 *          @OA\Property(property="percentual_aliquota_icms", type="decimal", example=0.5669),
 *          @OA\Property(property="modalidade_deteminacao_bc_icms_st", type="string", example=9),
 *          @OA\Property(property="margem_valor_adicional_icms_st", type="string", example=0.566),
 *          @OA\Property(property="percentual_reducao_bc_icms_st", type="decimal", example=0.566),
 *          @OA\Property(property="percentual_aliquota_icms_st", type="decimal", example=0.99),
 *          @OA\Property(property="regime_fiscal", type="enum('T','S') default T ", example="T"),
 *          @OA\Property(property="percentual_bc_operacao_propria_icms", type="decimal", example=0.756),
 *          @OA\Property(property="uf_devido_operacao_icms_st", type="string", description="Sigla de um estado válido", example="SP"),
 *          @OA\Property(property="aliquotaCalculoCreditoIcms", type="decimal", example=0.756),
 *          @OA\Property(property="percentual_retido_anteriormente_icms_st", type="decimal", example=0.888),
 *          @OA\Property(property="valor_desoneracao_icms", type="decimal", example=0.99),
 *          @OA\Property(property="motivo_desoneracao_icms", type="string", example="3"),
 *          @OA\Property(property="percentual_diferimento_icms", type="decimal", example=1.38),
 *          @OA\Property(property="uf_retido_remetente_icms_st", description="Sigla de um estado válido", type="string", example="PR"),
 *          @OA\Property(property="uf_destino_icms_st", description="Sigla de um estado válido", type="string", example="PR")
 *     }
 * )
 */
class CadastroICMSDTO implements RequestBodyConverterInterface
{
    /**
     * @JMS\SerializedName("regime_fiscal")
     * @JMS\Type("string")
     * 
     * regimeFiscal
     * var string
     * campo regimes
     */
    private $regimeFiscal;

    /**
     * @JMS\SerializedName("origem")
     * @JMS\Type("integer")
     * 
     * origem
     * var string
     * campo orig da tabela
     */
    private $origem;

    /**
     * @JMS\SerializedName("situacao_tributaria")
     * @JMS\Type("integer")
     * 
     * situacaoTributaria
     * var string
     * campo CST da tabela
     */
    private $situacaoTributaria;

    /**
     * @JMS\SerializedName("percentual_aliquota_icms")
     * @JMS\Type("float")
     * 
     * percentualAliquotaIcms
     * var string
     * campo pICMS da tabela
     */
    private $percentualAliquotaIcms = 0.00;

    /**
     * @JMS\SerializedName("aliquota_calculo_credito_icms")
     * @JMS\Type("float")
     * 
     * aliquotaCalculoCreditoIcms
     * var string
     * campo vl_aliq_calc_cre
     */
    private $aliquotaCalculoCreditoIcms = 0.00;

    /**
     * @JMS\SerializedName("modalidade_determinacao_bc_icms")
     * @JMS\Type("integer")
     * 
     * modalidadeDeterminacaoBcIcms
     * var string
     * campo modBC da tabela
     */
    private $modalidadeDeterminacaoBcIcms;

    /**
     * @JMS\SerializedName("percentual_reducao_bc_icms")
     * @JMS\Type("float")
     * 
     * percentualReducaoBcIcms
     * var string
     * campo pRedBC da tabela
     */
    private $percentualReducaoBcIcms = 0.00;

    /**
     * @JMS\SerializedName("percentual_bc_operacao_propria_icms")
     * @JMS\Type("float")
     * 
     * percentualBCOperacaoPropriaIcms
     * var string
     * campo pOpePropria
     */
    private $percentualBCOperacaoPropriaIcms  = 0.00;

    /**
     * @JMS\SerializedName("valor_desoneracao_icms")
     * @JMS\Type("float")
     * 
     * valorDesoneracaoIcms
     * var string
     * campo valor_desoneracao_icms da tabela
     */
    private $valorDesoneracaoIcms;

    /**
     * @JMS\SerializedName("motivo_desoneracao_icms")
     * @JMS\Type("integer")
     * 
     * motivoDesoneracaoIcms
     * var string
     * campo motivo_desoneracao_icms
     */
    private $motivoDesoneracaoIcms;

    /**
     * @JMS\SerializedName("percentual_diferimento_icms")
     * @JMS\Type("float")
     * 
     * percentualDiferimentoIcms
     * var string
     * campo percentual_diferimento_icms
     */
    private $percentualDiferimentoIcms;

    /**
     * @JMS\SerializedName("red_bc")
     * @JMS\Type("float")
     * 
     * redBC
     * var string
     */
    private $redBC;

    /**
     * @JMS\SerializedName("aliquota_icms")
     * @JMS\Type("float")
     * 
     * aliquotaIcms
     * var string
     */
    private $aliquotaIcms;

    /**
     * @JMS\SerializedName("modalidade_deteminacao_bc_icms_st")
     * @JMS\Type("string")
     * 
     * modalidadeDeteminacaoBcIcmsSt
     * var string
     * campo modBCST da tabela
     */
    private $modalidadeDeteminacaoBcIcmsSt;

    /**
     * @JMS\SerializedName("percentual_reducao_bc_icms_st")
     * @JMS\Type("float")
     * 
     * percentualReducaoBcIcmsSt
     * var string
     * campo pRedBCST da tabela
     */
    private $percentualReducaoBcIcmsSt = 0.00;


    /**
     * @JMS\SerializedName("margem_valor_adicional_icms_st")
     * @JMS\Type("float")
     * 
     * margemValorAdicionalIcmsSt
     * var string
     * campo pMVAST da tabela
     */
    private $margemValorAdicionalIcmsSt = 0.00;

    /**
     * @JMS\SerializedName("percentual_aliquota_icms_st")
     * @JMS\Type("float")
     * 
     * percentualAliquotaIcmsSt
     * var string
     * campo pICMSST
     */
    private $percentualAliquotaIcmsSt = 0.00;

    /**
     * @JMS\SerializedName("uf_devido_operacao_icms_st")
     * @JMS\Type("string")
     * 
     * ufDevidoOperacaoIcmsSt
     * var string
     * campo uf da tabela
     */
    private $ufDevidoOperacaoIcmsSt;

    /**
     * @JMS\SerializedName("uf_retido_remetente_icms_st")
     * @JMS\Type("string")
     * 
     * ufRetidoRemetenteIcmsSt
     * var string
     * campo uf_retido_remetente_icms_st
     */
    private $ufRetidoRemetenteIcmsSt;

    /**
     * @JMS\SerializedName("uf_destino_remetente_icms_st")
     * @JMS\Type("string")
     * 
     * ufDestinoRemetenteIcmsSt
     * var string
     * campo uf_destino_icms_st
     */
    private $ufDestinoRemetenteIcmsSt;

    /**
     * @JMS\SerializedName("percentual_retido_anteriormente_icms_st")
     * @JMS\Type("float")
     * 
     * percentualRetidoAnteriormenteIcmsSt
     * var string
     * campo bc_icms_st_ret_ant
     */
    private $percentualRetidoAnteriormenteIcmsSt = 0.00;

    /**
     * Get the value of percentualReducaoBcIcms
     */
    public function getPercentualReducaoBcIcms()
    {
        return $this->percentualReducaoBcIcms;
    }

    /**
     * Set the value of percentualReducaoBcIcms
     *
     * @return  self
     */
    public function setPercentualReducaoBcIcms($percentualReducaoBcIcms)
    {
        $this->percentualReducaoBcIcms = $percentualReducaoBcIcms;

        return $this;
    }

    /**
     * Get the value of origem
     */
    public function getOrigem()
    {
        return $this->origem;
    }

    /**
     * Set the value of origem
     *
     * @return  self
     */
    public function setOrigem($origem)
    {
        $this->origem = $origem;

        return $this;
    }

    /**
     * Get the value of situacaoTributaria
     */
    public function getSituacaoTributaria()
    {
        return $this->situacaoTributaria;
    }

    /**
     * Set the value of situacaoTributaria
     *
     * @return  self
     */
    public function setSituacaoTributaria($situacaoTributaria)
    {
        $this->situacaoTributaria = $situacaoTributaria;

        return $this;
    }

    /**
     * Get the value of percentualAliquotaIcms
     */
    public function getPercentualAliquotaIcms()
    {
        return $this->percentualAliquotaIcms;
    }

    /**
     * Set the value of percentualAliquotaIcms
     *
     * @return  self
     */
    public function setPercentualAliquotaIcms($percentualAliquotaIcms)
    {
        $this->percentualAliquotaIcms = $percentualAliquotaIcms;

        return $this;
    }

    /**
     * Get the value of aliquotaCalculoCreditoIcms
     */
    public function getAliquotaCalculoCreditoIcms()
    {
        return $this->aliquotaCalculoCreditoIcms;
    }

    /**
     * Set the value of aliquotaCalculoCreditoIcms
     *
     * @return  self
     */
    public function setAliquotaCalculoCreditoIcms($aliquotaCalculoCreditoIcms)
    {
        $this->aliquotaCalculoCreditoIcms = $aliquotaCalculoCreditoIcms;

        return $this;
    }

    /**
     * Get the value of modalidadeDeterminacaoBcIcms
     */
    public function getModalidadeDeterminacaoBcIcms()
    {
        return $this->modalidadeDeterminacaoBcIcms;
    }

    /**
     * Set the value of modalidadeDeterminacaoBcIcms
     *
     * @return  self
     */
    public function setModalidadeDeterminacaoBcIcms($modalidadeDeterminacaoBcIcms)
    {
        $this->modalidadeDeterminacaoBcIcms = $modalidadeDeterminacaoBcIcms;

        return $this;
    }

    /**
     * Get the value of regimeFiscal
     */
    public function getRegimeFiscal()
    {
        return $this->regimeFiscal;
    }

    /**
     * Set the value of regimeFiscal
     *
     * @return  self
     */
    public function setRegimeFiscal($regimeFiscal)
    {
        $this->regimeFiscal = $regimeFiscal;

        return $this;
    }

    /**
     * Get the value of percentualBCOperacaoPropriaIcms
     */
    public function getPercentualBCOperacaoPropriaIcms()
    {
        return $this->percentualBCOperacaoPropriaIcms;
    }

    /**
     * Set the value of percentualBCOperacaoPropriaIcms
     *
     * @return  self
     */
    public function setPercentualBCOperacaoPropriaIcms($percentualBCOperacaoPropriaIcms)
    {
        $this->percentualBCOperacaoPropriaIcms = $percentualBCOperacaoPropriaIcms;

        return $this;
    }

    /**
     * Get the value of valorDesoneracaoIcms
     */
    public function getValorDesoneracaoIcms()
    {
        return $this->valorDesoneracaoIcms;
    }

    /**
     * Set the value of valorDesoneracaoIcms
     *
     * @return  self
     */
    public function setValorDesoneracaoIcms($valorDesoneracaoIcms)
    {
        $this->valorDesoneracaoIcms = $valorDesoneracaoIcms;

        return $this;
    }

    /**
     * Get the value of motivoDesoneracaoIcms
     */
    public function getMotivoDesoneracaoIcms()
    {
        return $this->motivoDesoneracaoIcms;
    }

    /**
     * Set the value of motivoDesoneracaoIcms
     *
     * @return  self
     */
    public function setMotivoDesoneracaoIcms($motivoDesoneracaoIcms)
    {
        $this->motivoDesoneracaoIcms = $motivoDesoneracaoIcms;

        return $this;
    }

    /**
     * Get the value of percentualDiferimentoIcms
     */
    public function getPercentualDiferimentoIcms()
    {
        return $this->percentualDiferimentoIcms;
    }

    /**
     * Set the value of percentualDiferimentoIcms
     *
     * @return  self
     */
    public function setPercentualDiferimentoIcms($percentualDiferimentoIcms)
    {
        $this->percentualDiferimentoIcms = $percentualDiferimentoIcms;

        return $this;
    }


    /**
     * Get the value of redBC
     */
    public function getRedBC()
    {
        return $this->redBC;
    }

    /**
     * Set the value of redBC
     *
     * @return  self
     */
    public function setRedBC($redBC)
    {
        $this->redBC = $redBC;

        return $this;
    }

    /**
     * Get the value of aliquotaIcms
     */
    public function getAliquotaIcms()
    {
        return $this->aliquotaIcms;
    }

    /**
     * Set the value of aliquotaIcms
     *
     * @return  self
     */
    public function setAliquotaIcms($aliquotaIcms)
    {
        $this->aliquotaIcms = $aliquotaIcms;

        return $this;
    }

    /**
     * Get the value of modalidadeDeteminacaoBcIcmsSt
     */
    public function getModalidadeDeteminacaoBcIcmsSt()
    {
        return $this->modalidadeDeteminacaoBcIcmsSt;
    }

    /**
     * Set the value of modalidadeDeteminacaoBcIcmsSt
     *
     * @return  self
     */
    public function setModalidadeDeteminacaoBcIcmsSt($modalidadeDeteminacaoBcIcmsSt)
    {
        $this->modalidadeDeteminacaoBcIcmsSt = $modalidadeDeteminacaoBcIcmsSt;

        return $this;
    }

    /**
     * Get the value of percentualReducaoBcIcmsSt
     */
    public function getPercentualReducaoBcIcmsSt()
    {
        return $this->percentualReducaoBcIcmsSt;
    }

    /**
     * Set the value of percentualReducaoBcIcmsSt
     *
     * @return  self
     */
    public function setPercentualReducaoBcIcmsSt($percentualReducaoBcIcmsSt)
    {
        $this->percentualReducaoBcIcmsSt = $percentualReducaoBcIcmsSt;

        return $this;
    }

    /**
     * Get the value of margemValorAdicionalIcmsSt
     */
    public function getMargemValorAdicionalIcmsSt()
    {
        return $this->margemValorAdicionalIcmsSt;
    }

    /**
     * Set the value of margemValorAdicionalIcmsSt
     *
     * @return  self
     */
    public function setMargemValorAdicionalIcmsSt($margemValorAdicionalIcmsSt)
    {
        $this->margemValorAdicionalIcmsSt = $margemValorAdicionalIcmsSt;

        return $this;
    }

    /**
     * Get the value of percentualAliquotaIcmsSt
     */
    public function getPercentualAliquotaIcmsSt()
    {
        return $this->percentualAliquotaIcmsSt;
    }

    /**
     * Set the value of percentualAliquotaIcmsSt
     *
     * @return  self
     */
    public function setPercentualAliquotaIcmsSt($percentualAliquotaIcmsSt)
    {
        $this->percentualAliquotaIcmsSt = $percentualAliquotaIcmsSt;

        return $this;
    }

    /**
     * Get the value of ufDevidoOperacaoIcmsSt
     */
    public function getUfDevidoOperacaoIcmsSt()
    {
        return $this->ufDevidoOperacaoIcmsSt;
    }

    /**
     * Set the value of ufDevidoOperacaoIcmsSt
     *
     * @return  self
     */
    public function setUfDevidoOperacaoIcmsSt($ufDevidoOperacaoIcmsSt)
    {
        $this->ufDevidoOperacaoIcmsSt = $ufDevidoOperacaoIcmsSt;

        return $this;
    }

    /**
     * Get the value of ufRetidoRemetenteIcmsSt
     */
    public function getUfRetidoRemetenteIcmsSt()
    {
        return $this->ufRetidoRemetenteIcmsSt;
    }

    /**
     * Set the value of ufRetidoRemetenteIcmsSt
     *
     * @return  self
     */
    public function setUfRetidoRemetenteIcmsSt($ufRetidoRemetenteIcmsSt)
    {
        $this->ufRetidoRemetenteIcmsSt = $ufRetidoRemetenteIcmsSt;

        return $this;
    }

    /**
     * Get the value of ufDestinoRemetenteIcmsSt
     */
    public function getUfDestinoRemetenteIcmsSt()
    {
        return $this->ufDestinoRemetenteIcmsSt;
    }

    /**
     * Set the value of ufDestinoRemetenteIcmsSt
     *
     * @return  self
     */
    public function setUfDestinoRemetenteIcmsSt($ufDestinoRemetenteIcmsSt)
    {
        $this->ufDestinoRemetenteIcmsSt = $ufDestinoRemetenteIcmsSt;

        return $this;
    }

    /**
     * Get the value of percentualRetidoAnteriormenteIcmsSt
     */
    public function getPercentualRetidoAnteriormenteIcmsSt()
    {
        return $this->percentualRetidoAnteriormenteIcmsSt;
    }

    /**
     * Set the value of percentualRetidoAnteriormenteIcmsSt
     *
     * @return  self
     */
    public function setPercentualRetidoAnteriormenteIcmsSt($percentualRetidoAnteriormenteIcmsSt)
    {
        $this->percentualRetidoAnteriormenteIcmsSt = $percentualRetidoAnteriormenteIcmsSt;

        return $this;
    }
}
