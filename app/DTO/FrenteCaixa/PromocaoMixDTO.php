<?php

namespace App\DTO\FrenteCaixa;

use App\Services\Utils\DataHoraUtils;
use JMS\Serializer\Annotation as JMS;
use App\Services\Extensions\RequestBodyConverterInterface;


/**
 * @author Tiago Franco
 * DTO para manipulacao dos dados de promocao mix (Gula)
 * @JMS\AccessType("public_method")
 */
class PromocaoMixDTO implements RequestBodyConverterInterface
{    
    /**
     * @JMS\SerializedName("id")
     * @JMS\Type("integer")
     * 
     * id
     * var integer
     */
    private $id;

    /**
     * @JMS\SerializedName("nome")
     * @JMS\Type("string")
     * 
     * nome
     * var string
     */
    private $nome;

    /**
     * @JMS\SerializedName("valor")
     * @JMS\Type("float")
     * 
     * valor
     * var float
     */
    private $valor;

    /**
     * @JMS\SerializedName("quantidade")
     * @JMS\Type("integer")
     * 
     * quantidade
     * var integer
     */
    private $quantidade;

    /**
     * @JMS\SerializedName("data_inicial")
     * @JMS\Type("string")
     * 
     * dataInicial
     * var string
     */
    private $dataInicial;

    /**
     * @JMS\SerializedName("data_final")
     * @JMS\Type("string")
     * 
     * dataFinal
     * var string
     */
    private $dataFinal;

    /**
     * @JMS\SerializedName("produtos")
     * @JMS\Type("array")
     * 
     * produtos
     * var array
     */
    private $produtos;

    /**
     * @JMS\SerializedName("total_desconto")
     * @JMS\Type("float")
     * 
     * totalDesconto
     * var float
     */
    private $totalDesconto;

     /**
     * @JMS\SerializedName("status")
     * @JMS\Type("integer")
     * 
     * status
     * var integer
     */
    private $status;

    /**
     * Get the value of totalDesconto
     */
    public function getTotalDesconto()
    {
        return $this->totalDesconto;
    }

    /**
     * Set the value of totalDesconto
     *
     * @return  self
     */
    public function setTotalDesconto($totalDesconto)
    {
        $this->totalDesconto = $totalDesconto;

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

    /**
     * Get the value of quantidade
     */
    public function getQuantidade()
    {
        return $this->quantidade;
    }

    /**
     * Set the value of quantidade
     *
     * @return  self
     */
    public function setQuantidade($quantidade)
    {
        $this->quantidade = $quantidade;

        return $this;
    }

    /**
     * Get the value of dataInicial
     */
    public function getDataInicial()
    {
        return $this->dataInicial;
    }

    /**
     * Set the value of dataInicial
     *
     * @return  self
     */
    public function setDataInicial($dataInicial)
    {
        $this->dataInicial = DataHoraUtils::getData($dataInicial);

        return $this;
    }

    /**
     * Get the value of dataFinal
     */
    public function getDataFinal()
    {
        return $this->dataFinal;
    }

    /**
     * Set the value of dataFinal
     *
     * @return  self
     */
    public function setDataFinal($dataFinal)
    {
        $this->dataFinal = DataHoraUtils::getData($dataFinal);

        return $this;
    }

    /**
     * Get the value of produtos
     */
    public function getProdutos()
    {
        return $this->produtos;
    }

    /**
     * Set the value of produtos
     *
     * @return  self
     */
    public function setProdutos($produtos)
    {
        $this->produtos = array_unique(array_filter($produtos));

        return $this;
    }

    /**
     * Get the value of nome
     */
    public function getNome()
    {
        return $this->nome;
    }

    /**
     * Set the value of nome
     *
     * @return  self
     */
    public function setNome($nome)
    {
        $this->nome = $nome;

        return $this;
    }

    /**
     * Funcao responsavel por retornar o  valor total do desconto conforme o valor total de varejo dos produtos
     */
    public function getValorTotalDesconto(float $valorTotalVarejoProdutos)
    {
        return ($valorTotalVarejoProdutos * $this->quantidade) - $this->valor;
    }

    /**
     * Funcao responsavel por setar o valor total do desconto conforme o valor total de varejo dos produtos
     */
    public function getValorTotalDescontoProduto(float $valorVarejoProduto, $valorRateio)
    {
        return ($valorVarejoProduto * $this->quantidade) - $valorRateio ;
    }

    /**
     * Get the value of id
     */ 
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set the value of id
     *
     * @return  self
     */ 
    public function setId($id)
    {
        $this->id = $id;

        return $this;
    }

    /**
     * Get the value of status
     */ 
    public function getStatus()
    {
        return $this->status;
    }

    /**
     * Set the value of status
     *
     * @return  self
     */ 
    public function setStatus($status)
    {
        $this->status = $status;

        return $this;
    }
}
