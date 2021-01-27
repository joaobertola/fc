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
 * Class CadastroGLPDTO
 * @package App\DTO\Produtos
 * @OA\Schema(
 *     schema="informacoes_fiscais_glp_dto",
 *     type="object",
 *     title="Informações fiscais de tributos em produtos GLP",
 *     properties={
 *          @OA\Property(property="percentual", type="float", example=0.566),
 *          @OA\Property(property="codigo_fiscal", type="integer",example=15),
 *          @OA\Property(property="temperatura", type="float", example=1.60)
 *     }
 * )
 */
class CadastroGLPDTO implements RequestBodyConverterInterface
{

    /**
     * @JMS\SerializedName("percentual")
     * @JMS\Type("float")
     * 
     * percentua
     * var string
     */
    private $percentual;
    /**
     * @JMS\SerializedName("codigo_fiscal")
     * @JMS\Type("float")
     * 
     * pesoBruto
     * var float
     */
    private $pesoBruto;
    /**
     * @JMS\SerializedName("codigo_fiscal")
     * @JMS\Type("string")
     * 
     * codigoFiscal
     * var float
     */
    private $codigoFiscal;
    /**
     * @JMS\SerializedName("temperatura")
     * @JMS\Type("float")
     * 
     * temperatura
     * var float
     */
    private $temperatura;

    /**
     * Get the value of temperatura
     */ 
    public function getTemperatura()
    {
        return $this->temperatura;
    }

    /**
     * Set the value of temperatura
     *
     * @return  self
     */ 
    public function setTemperatura($temperatura)
    {
        $this->temperatura = $temperatura;

        return $this;
    }

    /**
     * Get the value of pesoBruto
     */ 
    public function getPesoBruto()
    {
        return $this->pesoBruto;
    }

    /**
     * Set the value of pesoBruto
     *
     * @return  self
     */ 
    public function setPesoBruto($pesoBruto)
    {
        $this->pesoBruto = $pesoBruto;

        return $this;
    }

    /**
     * Get the value of codigoFiscal
     */ 
    public function getCodigoFiscal()
    {
        return $this->codigoFiscal;
    }

    /**
     * Set the value of codigoFiscal
     *
     * @return  self
     */ 
    public function setCodigoFiscal($codigoFiscal)
    {
        $this->codigoFiscal = $codigoFiscal;

        return $this;
    }

    /**
     * Get the value of percentual
     */ 
    public function getPercentual()
    {
        return $this->percentual;
    }

    /**
     * Set the value of percentual
     *
     * @return  self
     */ 
    public function setPercentual($percentual)
    {
        $this->percentual = $percentual;

        return $this;
    }
}
