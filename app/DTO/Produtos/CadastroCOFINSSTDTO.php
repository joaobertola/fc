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
 * Class CadastroCOFINSSTDTO
 * @package App\DTO\Produtos
 * @OA\Schema(
 *     schema="informacoes_fiscais_cofins_st_dto",
 *     type="object",
 *     title="Informações fiscais de COFINS do Produto",
 *     properties={
 *          @OA\Property(property="tipo_calculo", description="ENUM(N,P,V) default N", type="string", example="N"),
 *          @OA\Property(property="percentual_aliquota", type="decimal", example=0.20),
 *          @OA\Property(property="aliquota_real", type="decimal", example=0.20)
 *     }
 * )
 */
class CadastroCOFINSSTDTO implements RequestBodyConverterInterface
{
    /**
     * @JMS\SerializedName("situacao_tributaria")
     * @JMS\Type("string")
     * 
     * situacaoTributaria
     * var string
     */
    private $situacaoTributaria;

    /**
     * @JMS\SerializedName("tipo_calculo")
     * @JMS\Type("string")
     * 
     * tipoCalculo
     * var string
     */
    private $tipoCalculo = "N";

    /**
     * @JMS\SerializedName("percentual_aliquota")
     * @JMS\Type("float")
     * 
     * percentualAliquota
     * var string
     */
    private $percentualAliquota;

    /**
     * @JMS\SerializedName("aliquota_real")
     * @JMS\Type("float")
     * 
     * aliquotaReal
     * var string
     */
    private $aliquotaReal;

    /**
     * @JMS\SerializedName("tipo_calculo_st")
     * @JMS\Type("string")
     * 
     * tipoCalculoSt
     * var string
     */
    private $tipoCalculoSt;
    
    

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
     * Get the value of aliquotaReal
     */ 
    public function getAliquotaReal()
    {
        return $this->aliquotaReal;
    }

    /**
     * Set the value of aliquotaReal
     *
     * @return  self
     */ 
    public function setAliquotaReal($aliquotaReal)
    {
        $this->aliquotaReal = $aliquotaReal;

        return $this;
    }

    /**
     * Get the value of tipoCalculoSt
     */ 
    public function getTipoCalculoSt()
    {
        return $this->tipoCalculoSt;
    }

    /**
     * Set the value of tipoCalculoSt
     *
     * @return  self
     */ 
    public function setTipoCalculoSt($tipoCalculoSt)
    {
        $this->tipoCalculoSt = $tipoCalculoSt;

        return $this;
    }
}