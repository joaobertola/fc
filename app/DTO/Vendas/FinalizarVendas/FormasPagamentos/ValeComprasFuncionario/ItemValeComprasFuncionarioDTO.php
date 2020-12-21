<?php

namespace App\DTO\Vendas\FinalizarVendas\FormasPagamentos\ValeComprasFuncionario;

use App\Services\Utils\DataHoraUtils;
use JMS\Serializer\Annotation as JMS;
use App\Services\Extensions\RequestBodyConverterInterface;

/** 
 * Objeto responsavel pelo
 * armazenamento das informacoes
 * dos pagamentos 
 * com juros e mora
 * @JMS\AccessType("public_method")
 */
class ItemValeComprasFuncionarioDTO implements RequestBodyConverterInterface
{
    /**
     * @JMS\SerializedName("parcela")
     * @JMS\Type("float")
     * 
     * parcela
     * var float
     */
    private $parcela;
    /**
     * @JMS\SerializedName("vencimento")
     * @JMS\Type("string")
     * 
     * vencimento
     * var string
     */
    private $vencimento;


    /**
     * Get the value of parcela
     */
    public function getParcela()
    {
        return $this->parcela;
    }

    /**
     * Set the value of parcela
     *
     * @return  self
     */
    public function setParcela($parcela)
    {
        $this->parcela = $parcela;

        return $this;
    }

    /**
     * Get the value of vencimento
     */
    public function getVencimento()
    {
        return $this->vencimento;
    }

    /**
     * Set the value of vencimento
     *
     * @return  self
     */
    public function setVencimento($vencimento)
    {
        if (!empty($vencimento))
            $this->vencimento = DataHoraUtils::getData($vencimento);

        return $this;
    }
}
