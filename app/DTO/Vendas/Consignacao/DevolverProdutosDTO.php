<?php

namespace App\DTO\Vendas\Consignacao;

use App\Services\Extensions\RequestBodyConverterInterface;
use JMS\Serializer\Annotation as JMS;

/**
 * @author Tiago Franco
 * DTO para devolucao de producao consignados
 * @JMS\AccessType("public_method")
 */
class DevolverProdutosDTO implements RequestBodyConverterInterface
{
    /**
     * @JMS\SerializedName("venda_itens")
     * @JMS\Type("array<App\DTO\Vendas\Consignacao\ItemDevolucaoDTO>")
     * 
     * vendaItens
     * var array
     */
    private $vendaItens;
    
    /**
     * Get the value of vendaItens
     */ 
    public function getVendaItens()
    {
        return $this->vendaItens;
    }

    /**
     * Set the value of vendaItens
     *
     * @return  self
     */ 
    public function setVendaItens($vendaItens)
    {
        $this->vendaItens = $vendaItens;

        return $this;
    }
}
