<?php

namespace App\DTO\Vendas\Consignacao;

use App\Services\Extensions\RequestBodyConverterInterface;
use JMS\Serializer\Annotation as JMS;

/**
 * @author Tiago Franco
 * DTO para devolucao de producao consignados
 * @JMS\AccessType("public_method")
 */
class ItemDevolucaoDTO implements RequestBodyConverterInterface
{
    /**
     * @JMS\SerializedName("id_item_venda")
     * @JMS\Type("integer")
     * 
     * idItemVenda
     * var integer
     */
    private $idItemVenda;

    /**
     * @JMS\SerializedName("qtde")
     * @JMS\Type("integer")
     * 
     * qtde
     * var integer
     */
    private $qtde;
    
    /**
     * Get the value of idItemVenda
     */ 
    public function getIdItemVenda()
    {
        return $this->idItemVenda;
    }

    /**
     * Set the value of idItemVenda
     *
     * @return  self
     */ 
    public function setIdItemVenda($idItemVenda)
    {
        $this->idItemVenda = $idItemVenda;

        return $this;
    }

    /**
     * Get the value of qtde
     */ 
    public function getQtde()
    {
        return $this->qtde;
    }

    /**
     * Set the value of qtde
     *
     * @return  self
     */ 
    public function setQtde($qtde)
    {
        $this->qtde = $qtde;

        return $this;
    }
}
