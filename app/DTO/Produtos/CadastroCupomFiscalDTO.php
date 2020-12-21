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
 * Class CadastroCupomFiscalDTO
 * @package App\DTO\Produtos
 * @OA\Schema(
 *     schema="informacoes_fiscais_cupom_fiscal_dto",
 *     type="object",
 *     title="Informações de Cupom Fiscais",
 *     properties={
 *          @OA\Property(property="cfop", type="integer", example=5102),
 *          @OA\Property(property="sped", type="string", description="Sigla de estado válido, pode ser informado vazio", example="455"),
 *          @OA\Property(property="icms", type="decimal", example=10.00),
 *          @OA\Property(property="pis", type="decimal", example=5.00),
 *          @OA\Property(property="csosn", type="string", example="102"),
 *          @OA\Property(property="totalizador_parcial", type="string", example="2"),
 *          @OA\Property(property="situacao_tributaria", type="string", example="T"),
 *          @OA\Property(property="cupom_fiscal_iat", type="string", example="arredondamento"),
 *          @OA\Property(property="cupom_fiscal_ippt", type="string", example="terceiro")
 *     }
 * )
 */
class CadastroCupomFiscalDTO implements RequestBodyConverterInterface
{
    /**
     * @JMS\SerializedName("cfop")
     * @JMS\Type("integer")
     * 
     * cfop
     * var string
     */
    private $cfop;

    /**
     * @JMS\SerializedName("sped")
     * @JMS\Type("string")
     * 
     * sped
     * var string
     */
    private $sped;

    /**
     * @JMS\SerializedName("codigo_balanca")
     * @JMS\Type("integer")
     * 
     * codigoBalanca
     * var string
     */
    private $codigoBalanca;

    /**
     * @JMS\SerializedName("icms")
     * @JMS\Type("float")
     * 
     * icms
     * var string
     */
    private $icms;

    /**
     * @JMS\SerializedName("pis")
     * @JMS\Type("float")
     * 
     * pis
     * var string
     */
    private $pis;

    /**
     * @JMS\SerializedName("csosn")
     * @JMS\Type("string")
     * 
     * csosn
     * var string
     */
    private $csosn;

    /**
     * @JMS\SerializedName("totalizador_parcial")
     * @JMS\Type("integer")
     * 
     * totalizadorParcial
     * var string
     */
    private $totalizadorParcial;

    /**
     * @JMS\SerializedName("situacao_tributaria")
     * @JMS\Type("string")
     * 
     * situacaoTributaria
     * var string
     */
    private $situacaoTributaria;

    /**
     * @JMS\SerializedName("indicador_producao")
     * @JMS\Type("string")
     * 
     * indicadorProducao
     * var string
     */
    private $indicadorProducao;

    /**
     * @JMS\SerializedName("cupom_fiscal_iat")
     * @JMS\Type("string")
     * 
     * cupomFiscalIat
     * var string
     */
    private $cupomFiscalIat;

    /**
     * @JMS\SerializedName("cupom_fiscal_ippt")
     * @JMS\Type("string")
     * 
     * cupomFiscalIppt
     * var string
     */
    private $cupomFiscalIppt;
    

    /**
     * Get the value of cfop
     */ 
    public function getCfop()
    {
        return $this->cfop;
    }

    /**
     * Set the value of cfop
     *
     * @return  self
     */ 
    public function setCfop($cfop)
    {
        $this->cfop = $cfop;

        return $this;
    }

    /**
     * Get the value of sped
     */ 
    public function getSped()
    {
        return $this->sped;
    }

    /**
     * Set the value of sped
     *
     * @return  self
     */ 
    public function setSped($sped)
    {
        $this->sped = $sped;

        return $this;
    }

    /**
     * Get the value of codigoBalanca
     */ 
    public function getCodigoBalanca()
    {
        return $this->codigoBalanca;
    }

    /**
     * Set the value of codigoBalanca
     *
     * @return  self
     */ 
    public function setCodigoBalanca($codigoBalanca)
    {
        $this->codigoBalanca = $codigoBalanca;

        return $this;
    }

    /**
     * Get the value of icms
     */ 
    public function getIcms()
    {
        return $this->icms;
    }

    /**
     * Set the value of icms
     *
     * @return  self
     */ 
    public function setIcms($icms)
    {
        $this->icms = $icms;

        return $this;
    }

    /**
     * Get the value of pis
     */ 
    public function getPis()
    {
        return $this->pis;
    }

    /**
     * Set the value of pis
     *
     * @return  self
     */ 
    public function setPis($pis)
    {
        $this->pis = $pis;

        return $this;
    }

    /**
     * Get the value of csosn
     */ 
    public function getCsosn()
    {
        return $this->csosn;
    }

    /**
     * Set the value of csosn
     *
     * @return  self
     */ 
    public function setCsosn($csosn)
    {
        $this->csosn = $csosn;

        return $this;
    }

    /**
     * Get the value of totalizadorParcial
     */ 
    public function getTotalizadorParcial()
    {
        return $this->totalizadorParcial;
    }

    /**
     * Set the value of totalizadorParcial
     *
     * @return  self
     */ 
    public function setTotalizadorParcial($totalizadorParcial)
    {
        $this->totalizadorParcial = $totalizadorParcial;

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
     * Get the value of indicadorProducao
     */ 
    public function getIndicadorProducao()
    {
        return $this->indicadorProducao;
    }

    /**
     * Set the value of indicadorProducao
     *
     * @return  self
     */ 
    public function setIndicadorProducao($indicadorProducao)
    {
        $this->indicadorProducao = $indicadorProducao;

        return $this;
    }

    /**
     * Get the value of cupomFiscalIat
     */ 
    public function getCupomFiscalIat()
    {
        return $this->cupomFiscalIat;
    }

    /**
     * Set the value of cupomFiscalIat
     *
     * @return  self
     */ 
    public function setCupomFiscalIat($cupomFiscalIat)
    {
        $this->cupomFiscalIat = $cupomFiscalIat;

        return $this;
    }

    /**
     * Get the value of cupomFiscalIppt
     */ 
    public function getCupomFiscalIppt()
    {
        return $this->cupomFiscalIppt;
    }

    /**
     * Set the value of cupomFiscalIppt
     *
     * @return  self
     */ 
    public function setCupomFiscalIppt($cupomFiscalIppt)
    {
        $this->cupomFiscalIppt = $cupomFiscalIppt;

        return $this;
    }
}