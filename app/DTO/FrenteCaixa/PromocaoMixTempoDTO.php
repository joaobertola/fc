<?php

namespace App\DTO\FrenteCaixa;

use App\Services\Extensions\RequestBodyConverterInterface;
use JMS\Serializer\Annotation as JMS;


/**
 * @author Tiago Franco
 * DTO para os 
 * @JMS\AccessType("public_method")
 */
class PromocaoMixTempoDTO implements RequestBodyConverterInterface
{       
    /**
     * @JMS\SerializedName("id_venda_item")
     * @JMS\Type("integer")
     * 
     * idVendaItem
     * var integer
     */    
    private $idVendaItem;
    /**
     * @JMS\SerializedName("id_promo_mix")
     * @JMS\Type("integer")
     * 
     * idPromoMix
     * var integer
     */
    private $idPromoMix;
    /**
     * @JMS\SerializedName("id_venda")
     * @JMS\Type("integer")
     * 
     * idProduto
     * var integer
     */
    private $idVenda;

    /**
     * @JMS\SerializedName("id_produto")
     * @JMS\Type("integer")
     * 
     * idProduto
     * var integer
     */
    private $idProduto;

    /**
     * Get the value of idVendaItem
     */ 
    public function getIdVendaItem()
    {
        return $this->idVendaItem;
    }

    /**
     * Set the value of idVendaItem
     *
     * @return  self
     */ 
    public function setIdVendaItem($idVendaItem)
    {
        $this->idVendaItem = $idVendaItem;

        return $this;
    }

    /**
     * Get the value of idPromoMix
     */ 
    public function getIdPromoMix()
    {
        return $this->idPromoMix;
    }

    /**
     * Set the value of idPromoMix
     *
     * @return  self
     */ 
    public function setIdPromoMix($idPromoMix)
    {
        $this->idPromoMix = $idPromoMix;

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
     * Get the value of idVenda
     */ 
    public function getIdVenda()
    {
        return $this->idVenda;
    }

    /**
     * Set the value of idVenda
     *
     * @return  self
     */ 
    public function setIdVenda($idVenda)
    {
        $this->idVenda = $idVenda;

        return $this;
    }
}