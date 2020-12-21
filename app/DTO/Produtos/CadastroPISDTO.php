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
 * Class CadastroPISDTO
 * @package App\DTO\Produtos
 * @OA\Schema(
 *     schema="informacoes_fiscais_pis_dto",
 *     type="object",
 *     title="Informações fiscais de PIS do Produto",
 *     properties={
 *          @OA\Property(property="situacao_tributaria", description="default 00", type="string", example=""),
 *          @OA\Property(property="tipo_calculo", description="ENUM(N,P,V) default N", type="string", example="N"),
 *          @OA\Property(property="percentual_aliquota", type="decimal", example=0.20),
 *          @OA\Property(property="aliquota_real", type="decimal", example=0.20)
 *     }
 * )
 */
class CadastroPISDTO implements RequestBodyConverterInterface
{
    /**
     * @JMS\SerializedName("situacao_tributaria")
     * @JMS\Type("string")
     * 
     * situacaoTributaria
     * var string
     */
    private $situacaoTributaria = 00;   

    /**
     * @JMS\SerializedName("tipo_calculo")
     * @JMS\Type("string")
     * 
     * tipoCalculo
     * var string
     */
    private $tipoCalculo;

    /**
     * @JMS\SerializedName("percentual_aliquota")
     * @JMS\Type("string")
     * 
     * percentualAliquota
     * var string
     */
    private $percentualAliquota;

    /**
     * @JMS\SerializedName("aliquota_real")
     * @JMS\Type("string")
     * 
     * aliquotaReal
     * var string
     */
    private $aliquotaReal;

    

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
}