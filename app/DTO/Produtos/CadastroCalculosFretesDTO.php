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
 * Class CadastroCalculosFretesDTO
 * @package App\DTO\Produtos
 * @OA\Schema(
 *     schema="informacoes_calculo_fretes_produto_dto",
 *     type="object",
 *     title="Informações utilizados no cálculo dos do Produto",
 *     properties={
 *          @OA\Property(property="peso_bruto", type="float", example=0.60),
 *          @OA\Property(property="peso_liquido", type="float", example=0.60),
 *          @OA\Property(property="altura_caixa", type="float", example=2.60),
 *          @OA\Property(property="largura_caixa", type="float", example=1.60),
 *          @OA\Property(property="comprimento_caixa", type="float", example=2.20)
 *     }
 * )
 */
class CadastroCalculosFretesDTO implements RequestBodyConverterInterface
{

    /**
     * @JMS\SerializedName("tipo_correio")
     * @JMS\Type("string")
     * 
     * tipoCorreio
     * var string
     */
    private $tipoCorreio;
    /**
     * @JMS\SerializedName("peso_bruto")
     * @JMS\Type("float")
     * 
     * pesoBruto
     * var float
     */
    private $pesoBruto;
    /**
     * @JMS\SerializedName("peso_liquido")
     * @JMS\Type("float")
     * 
     * pesoLiquido
     * var float
     */
    private $pesoLiquido;
    /**
     * @JMS\SerializedName("altura_caixa")
     * @JMS\Type("float")
     * 
     * alturaCaixa
     * var float
     */
    private $alturaCaixa;
    /**
     * @JMS\SerializedName("largura_caixa")
     * @JMS\Type("float")
     * 
     * larguraCaixa
     * var float
     */
    private $larguraCaixa;
    /**
     * @JMS\SerializedName("comprimento_caixa")
     * @JMS\Type("float")
     * 
     * comprimentoCaixa
     * var float
     */
    private $comprimentoCaixa;

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
     * Get the value of tipoCorreio
     */ 
    public function getTipoCorreio()
    {
        return $this->tipoCorreio;
    }

    /**
     * Set the value of tipoCorreio
     *
     * @return  self
     */ 
    public function setTipoCorreio($tipoCorreio)
    {
        $this->tipoCorreio = $tipoCorreio;

        return $this;
    }

    /**
     * Get the value of pesoLiquido
     */ 
    public function getPesoLiquido()
    {
        return $this->pesoLiquido;
    }

    /**
     * Set the value of pesoLiquido
     *
     * @return  self
     */ 
    public function setPesoLiquido($pesoLiquido)
    {
        $this->pesoLiquido = $pesoLiquido;

        return $this;
    }

    /**
     * Get the value of alturaCaixa
     */ 
    public function getAlturaCaixa()
    {
        return $this->alturaCaixa;
    }

    /**
     * Set the value of alturaCaixa
     *
     * @return  self
     */ 
    public function setAlturaCaixa($alturaCaixa)
    {
        $this->alturaCaixa = $alturaCaixa;

        return $this;
    }

    /**
     * Get the value of larguraCaixa
     */ 
    public function getLarguraCaixa()
    {
        return $this->larguraCaixa;
    }

    /**
     * Set the value of larguraCaixa
     *
     * @return  self
     */ 
    public function setLarguraCaixa($larguraCaixa)
    {
        $this->larguraCaixa = $larguraCaixa;

        return $this;
    }

    /**
     * Get the value of comprimentoCaixa
     */ 
    public function getComprimentoCaixa()
    {
        return $this->comprimentoCaixa;
    }

    /**
     * Set the value of comprimentoCaixa
     *
     * @return  self
     */ 
    public function setComprimentoCaixa($comprimentoCaixa)
    {
        $this->comprimentoCaixa = $comprimentoCaixa;

        return $this;
    }
}
