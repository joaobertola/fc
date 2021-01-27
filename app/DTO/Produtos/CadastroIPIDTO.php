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
 * Class CadastroIPIDTO
 * @package App\DTO\Produtos
 * @OA\Schema(
 *     schema="informacoes_fiscais_ipi_dto",
 *     type="object",
 *     title="Informações fiscais de IPI do Produto",
 *     properties={
 *          @OA\Property(property="situacao_tributaria", description=" default 00", type="string", example=""),
 *          @OA\Property(property="classe_enquadramento", type="string", example=999),
 *          @OA\Property(property="codigo_enquadramento", type="string", example=999),
 *          @OA\Property(property="cnpj_produtor", type="string", example="99999999999999"),
 *          @OA\Property(property="cod_selos", type="string", example="0"),
 *          @OA\Property(property="qtde_selos", type="string", example="09"),
 *          @OA\Property(property="percentual_aliquota", type="decimal", example=6.0),
 *          @OA\Property(property="tipo_calculo", type="ENUM('P', 'V') default P", example=0.566),
 *          @OA\Property(property="valor_unidade_padrao", type="decimal", example=0.99)
 *     }
 * )
 */
class CadastroIPIDTO implements RequestBodyConverterInterface
{
    /**
     * @JMS\SerializedName("situacao_tributaria")
     * @JMS\Type("integer")
     * 
     * situacaoTributaria
     * var string
     * campo CST
     */
    private $situacaoTributaria = 00;

    /**
     * @JMS\SerializedName("classe_enquadramento")
     * @JMS\Type("string")
     * 
     * classeEnquadramento
     * var string
     * campo cIEnq
     */
    private $classeEnquadramento;

    /**
     * @JMS\SerializedName("codigo_enquadramento")
     * @JMS\Type("string")
     * 
     * codigoEnquadramento
     * var string
     * campo cEnq
     */
    private $codigoEnquadramento;

    /**
     * @JMS\SerializedName("cnpj_produtor")
     * @JMS\Type("string")
     * 
     * cnpjProdutor
     * var string
     * campo CNPJProd
     */
    private $cnpjProdutor;

    /**
     * @JMS\SerializedName("cod_selos")
     * @JMS\Type("string")
     * 
     * codSelos
     * var string
     * campo cSelo
     */
    private $codSelos;

    /**
     * @JMS\SerializedName("qtde_selos")
     * @JMS\Type("integer")
     * 
     * qtdeSelos
     * var string
     */
    private $qtdeSelos;

    /**
     * @JMS\SerializedName("percentual_aliquota")
     * @JMS\Type("float")
     * 
     * percentualAliquota
     * var string
     * campo pIPI
     */
    private $percentualAliquota = 0.00;

    /**
     * @JMS\SerializedName("tipo_calculo")
     * @JMS\Type("string")
     * 
     * tipoCalculo
     * var string
     * campo tp_calculo
     */
    private $tipoCalculo = 'P';

    /**
     * @JMS\SerializedName("valor_unidade_padrao")
     * @JMS\Type("float")
     * 
     * valorUnidadePadrao
     * var string
     * campo v_aliq	
     */
    private $valorUnidadePadrao = 0.00;

    /**
     * Get the value of percentualAliquota
     */ 
    public function getPercentualAliquota()
    {
        return $this->percentualAliquota;
    }

    /**
     * Set the value of percentualAliquota
     *
     * @return  self
     */ 
    public function setPercentualAliquota($percentualAliquota)
    {
        $this->percentualAliquota = $percentualAliquota;

        return $this;
    }

    /**
     * Get the value of classeEnquadramento
     */ 
    public function getClasseEnquadramento()
    {
        return $this->classeEnquadramento;
    }

    /**
     * Set the value of classeEnquadramento
     *
     * @return  self
     */ 
    public function setClasseEnquadramento($classeEnquadramento)
    {
        $this->classeEnquadramento = $classeEnquadramento;

        return $this;
    }

    /**
     * Get the value of codigoEnquadramento
     */ 
    public function getCodigoEnquadramento()
    {
        return $this->codigoEnquadramento;
    }

    /**
     * Set the value of codigoEnquadramento
     *
     * @return  self
     */ 
    public function setCodigoEnquadramento($codigoEnquadramento)
    {
        $this->codigoEnquadramento = $codigoEnquadramento;

        return $this;
    }

    /**
     * Get the value of cnpjProdutor
     */ 
    public function getCnpjProdutor()
    {
        return $this->cnpjProdutor;
    }

    /**
     * Set the value of cnpjProdutor
     *
     * @return  self
     */ 
    public function setCnpjProdutor($cnpjProdutor)
    {
        $this->cnpjProdutor = $cnpjProdutor;

        return $this;
    }

    /**
     * Get the value of codSelos
     */ 
    public function getCodSelos()
    {
        return $this->codSelos;
    }

    /**
     * Set the value of codSelos
     *
     * @return  self
     */ 
    public function setCodSelos($codSelos)
    {
        $this->codSelos = $codSelos;

        return $this;
    }

    /**
     * Get the value of qtdeSelos
     */ 
    public function getQtdeSelos()
    {
        return $this->qtdeSelos;
    }

    /**
     * Set the value of qtdeSelos
     *
     * @return  self
     */ 
    public function setQtdeSelos($qtdeSelos)
    {
        $this->qtdeSelos = $qtdeSelos;

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
     * Get the value of valorUnidadePadrao
     */ 
    public function getValorUnidadePadrao()
    {
        return $this->valorUnidadePadrao;
    }

    /**
     * Set the value of valorUnidadePadrao
     *
     * @return  self
     */ 
    public function setValorUnidadePadrao($valorUnidadePadrao)
    {
        $this->valorUnidadePadrao = $valorUnidadePadrao;

        return $this;
    }

    /**
     * Get the value of tipoCalculo
     */ 
    public function getTipoCalculo()
    {
        return $this->tipoCalculo;
    }

    /**
     * Set the value of tipoCalculo
     *
     * @return  self
     */ 
    public function setTipoCalculo($tipoCalculo)
    {
        $this->tipoCalculo = $tipoCalculo;

        return $this;
    }
}