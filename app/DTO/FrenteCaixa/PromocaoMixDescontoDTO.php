<?php

namespace App\DTO\FrenteCaixa;

use App\Services\Extensions\RequestBodyConverterInterface;
use JMS\Serializer\Annotation as JMS;


/**
 * @author Tiago Franco
 * DTO para os 
 * @JMS\AccessType("public_method")
 */
class PromocaoMixDescontoDTO implements RequestBodyConverterInterface
{
    /**
     * @JMS\SerializedName("id_promocao_mix")
     * @JMS\Type("integer")
     * 
     * idProduto
     * var integer
     */
    private $idPromocaoMix;
    /**
     * @JMS\SerializedName("id_produto")
     * @JMS\Type("integer")
     * 
     * idProduto
     * var integer
     */
    private $idProduto;

    /**
     * @JMS\SerializedName("valor")
     * @JMS\Type("float")
     * 
     * valor
     * var float
     */
    private $valor;


    /**
     * Get the value of idPromocaoMix
     */ 
    public function getIdPromocaoMix()
    {
        return $this->idPromocaoMix;
    }

    /**
     * Set the value of idPromocaoMix
     *
     * @return  self
     */ 
    public function setIdPromocaoMix($idPromocaoMix)
    {
        $this->idPromocaoMix = $idPromocaoMix;

        return $this;
    }

    /**
     * Get the value of idProduto
     */ 
    public function getIdProduto()
    {
        return $this->idProduto;
    }

    /**
     * Set the value of idProduto
     *
     * @return  self
     */ 
    public function setIdProduto($idProduto)
    {
        $this->idProduto = $idProduto;

        return $this;
    }

    /**
     * Get the value of valor
     */ 
    public function getValor()
    {
        return $this->valor;
    }

    /**
     * Set the value of valor
     *
     * @return  self
     */ 
    public function setValor($valor)
    {
        $this->valor = $valor;

        return $this;
    }
}