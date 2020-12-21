<?php

namespace App\DTO\Fornecedor;

use App\Services\Extensions\RequestBodyConverterInterface;
use JMS\Serializer\Annotation as JMS;


/**
 * @author Tiago Franco
 * DTO para manipulacao dos dados bancarios dos fornecedores
 * @JMS\AccessType("public_method")
 */
class CadastrarFornecedorBancoDTO implements RequestBodyConverterInterface
{   
     
    /**
     * @JMS\SerializedName("id_banco")
     * @JMS\Type("integer")
     * 
     * idBanco
     * var integer
     */
     private $idBanco;
     
    /**
     * @JMS\SerializedName("agencia")
     * @JMS\Type("string")
     * 
     * agencia
     * var string
     */
     private $agencia;
     
    /**
     * @JMS\SerializedName("conta")
     * @JMS\Type("string")
     * 
     * conta
     * var string
     */
     private $conta;
     
    /**
     * @JMS\SerializedName("titular")
     * @JMS\Type("string")
     * 
     * titular
     * var string
     */
     private $titular;
     
    /**
     * @JMS\SerializedName("titular_cpfcnpj")
     * @JMS\Type("string")
     * 
     * titularCpfcnpj
     * var string
     */
     private $titularCpfcnpj;
     
    /**
     * @JMS\SerializedName("tipo_conta")
     * @JMS\Type("string")
     * 
     * tipoConta
     * var string
     */
     private $tipoConta;

     /**
      * Get the value of idBanco
      */ 
     public function getIdBanco()
     {
          return $this->idBanco;
     }

     /**
      * Set the value of idBanco
      *
      * @return  self
      */ 
     public function setIdBanco($idBanco)
     {
          $this->idBanco = $idBanco;

          return $this;
     }

     /**
      * Get the value of agencia
      */ 
     public function getAgencia()
     {
          return $this->agencia;
     }

     /**
      * Set the value of agencia
      *
      * @return  self
      */ 
     public function setAgencia($agencia)
     {
          $this->agencia = $agencia;

          return $this;
     }

     /**
      * Get the value of conta
      */ 
     public function getConta()
     {
          return $this->conta;
     }

     /**
      * Set the value of conta
      *
      * @return  self
      */ 
     public function setConta($conta)
     {
          $this->conta = $conta;

          return $this;
     }

     /**
      * Get the value of titular
      */ 
     public function getTitular()
     {
          return $this->titular;
     }

     /**
      * Set the value of titular
      *
      * @return  self
      */ 
     public function setTitular($titular)
     {
          $this->titular = $titular;

          return $this;
     }

     /**
      * Get the value of titularCpfcnpj
      */ 
     public function getTitularCpfcnpj()
     {
          return $this->titularCpfcnpj;
     }

     /**
      * Set the value of titularCpfcnpj
      *
      * @return  self
      */ 
     public function setTitularCpfcnpj($titularCpfcnpj)
     {
          $this->titularCpfcnpj = $titularCpfcnpj;

          return $this;
     }

     /**
      * Get the value of tipoConta
      */ 
     public function getTipoConta()
     {
          return $this->tipoConta;
     }

     /**
      * Set the value of tipoConta
      *
      * @return  self
      */ 
     public function setTipoConta($tipoConta)
     {
          $this->tipoConta = $tipoConta;

          return $this;
     }
}