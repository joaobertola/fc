<?php

namespace App\Exceptions\MercadoLivre;

/**
 * @author Tiago Franco
 * Exception para manipulacao de erros envolvendo processos do mercado livre
 */
class MercadoLivreException extends \Exception
{
    private $retorno;
    private $httpCode;
    private $descricaoProduto;
    private $msgErro;

    public function __construct(string $descricaoProduto, string $httpCode, string $msgErro,  $retorno = [])
    {
        $this->descricaoProduto = trim($descricaoProduto);
        $this->httpCode         = $httpCode;
        $this->retorno          = $retorno;
        $this->msgErro          = $msgErro;
    }

    /**
     * Get the value of retorno
     */ 
    public function getRetorno()
    {
        return $this->retorno;
    }

    /**
     * Get the value of descricaoProduto
     */ 
    public function getDescricaoProduto()
    {
        return $this->descricaoProduto;
    }

    /**
     * Get the value of httpCode
     */ 
    public function getHttpCode()
    {
        return $this->httpCode;
    }

    /**
     * Get the value of msgErro
     */ 
    public function getMsgErro()
    {
        return $this->msgErro;
    }
}
