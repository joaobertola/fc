<?php

namespace App\DTO\Cliente;

use App\Services\Extensions\RequestBodyConverterInterface;
use JMS\Serializer\Annotation as JMS;


/**
 * @author Tiago Franco
 * DTO para os 
 * @JMS\AccessType("public_method")
 */
class ClienteEnderecoDTO implements RequestBodyConverterInterface
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
     * @JMS\SerializedName("tipo_endereco")
     * @JMS\Type("string")
     * 
     * tipoEndereco
     * var string
     */
    private $tipoEndereco;
    /**
     * @JMS\SerializedName("cnpj_cpf")
     * @JMS\Type("string")
     * 
     * cnpjCpf
     * var string
     */
    private $cnpjCpf;
    /**
     * @JMS\SerializedName("nome")
     * @JMS\Type("string")
     * 
     * nome
     * var string
     */
    private $nome;
    /**
     * @JMS\SerializedName("razao_social")
     * @JMS\Type("string")
     * 
     * razaoSocial
     * var string
     */
    private $razaoSocial;
    /**
     * @JMS\SerializedName("id_tipo_log")
     * @JMS\Type("integer")
     * 
     * idTipoLog
     * var integer
     */
    private $idTipoLog;
    /**
     * @JMS\SerializedName("endereco")
     * @JMS\Type("string")
     * 
     * endereco
     * var string
     */
    private $endereco;
    /**
     * @JMS\SerializedName("numero")
     * @JMS\Type("string")
     * 
     * numero
     * var string
     */
    private $numero;
    /**
     * @JMS\SerializedName("complemento")
     * @JMS\Type("string")
     * 
     * complemento
     * var string
     */
    private $complemento;
    /**
     * @JMS\SerializedName("bairro")
     * @JMS\Type("string")
     * 
     * bairro
     * var string
     */
    private $bairro;
    /**
     * @JMS\SerializedName("cidade")
     * @JMS\Type("string")
     * 
     * cidade
     * var string
     */
    private $cidade;
    /**
     * @JMS\SerializedName("uf")
     * @JMS\Type("string")
     * 
     * uf
     * var string
     */
    private $uf;
    /**
     * @JMS\SerializedName("cep")
     * @JMS\Type("string")
     * 
     * cep
     * var string
     */
    private $cep;
    /**
     * @JMS\SerializedName("pais")
     * @JMS\Type("string")
     * 
     * pais
     * var string
     */
    private $pais;

    /**
     * Get the value of pais
     */ 
    public function getPais()
    {
        return $this->pais;
    }

    /**
     * Set the value of pais
     *
     * @return  self
     */ 
    public function setPais($pais)
    {
        $this->pais = $pais;

        return $this;
    }

    /**
     * Get the value of tipoEndereco
     */ 
    public function getTipoEndereco()
    {
        return $this->tipoEndereco;
    }

    /**
     * Set the value of tipoEndereco
     *
     * @return  self
     */ 
    public function setTipoEndereco($tipoEndereco)
    {
        $this->tipoEndereco = $tipoEndereco;

        return $this;
    }

    /**
     * Get the value of cnpjCpf
     */ 
    public function getCnpjCpf()
    {
        return $this->cnpjCpf;
    }

    /**
     * Set the value of cnpjCpf
     *
     * @return  self
     */ 
    public function setCnpjCpf($cnpjCpf)
    {
        $this->cnpjCpf = $cnpjCpf;

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
     * Get the value of razaoSocial
     */ 
    public function getRazaoSocial()
    {
        return $this->razaoSocial;
    }

    /**
     * Set the value of razaoSocial
     *
     * @return  self
     */ 
    public function setRazaoSocial($razaoSocial)
    {
        $this->razaoSocial = $razaoSocial;

        return $this;
    }

    /**
     * Get the value of idTipoLog
     */ 
    public function getIdTipoLog()
    {
        return $this->idTipoLog;
    }

    /**
     * Set the value of idTipoLog
     *
     * @return  self
     */ 
    public function setIdTipoLog($idTipoLog)
    {
        $this->idTipoLog = $idTipoLog;

        return $this;
    }

    /**
     * Get the value of endereco
     */ 
    public function getEndereco()
    {
        return $this->endereco;
    }

    /**
     * Set the value of endereco
     *
     * @return  self
     */ 
    public function setEndereco($endereco)
    {
        $this->endereco = $endereco;

        return $this;
    }

    /**
     * Get the value of numero
     */ 
    public function getNumero()
    {
        return $this->numero;
    }

    /**
     * Set the value of numero
     *
     * @return  self
     */ 
    public function setNumero($numero)
    {
        $this->numero = $numero;

        return $this;
    }

    /**
     * Get the value of complemento
     */ 
    public function getComplemento()
    {
        return $this->complemento;
    }

    /**
     * Set the value of complemento
     *
     * @return  self
     */ 
    public function setComplemento($complemento)
    {
        $this->complemento = $complemento;

        return $this;
    }

    /**
     * Get the value of bairro
     */ 
    public function getBairro()
    {
        return $this->bairro;
    }

    /**
     * Set the value of bairro
     *
     * @return  self
     */ 
    public function setBairro($bairro)
    {
        $this->bairro = $bairro;

        return $this;
    }

    /**
     * Get the value of cidade
     */ 
    public function getCidade()
    {
        return $this->cidade;
    }

    /**
     * Set the value of cidade
     *
     * @return  self
     */ 
    public function setCidade($cidade)
    {
        $this->cidade = $cidade;

        return $this;
    }

    /**
     * Get the value of uf
     */ 
    public function getUf()
    {
        return $this->uf;
    }

    /**
     * Set the value of uf
     *
     * @return  self
     */ 
    public function setUf($uf)
    {
        $this->uf = $uf;

        return $this;
    }

    /**
     * Get the value of cep
     */ 
    public function getCep()
    {
        return $this->cep;
    }

    /**
     * Set the value of cep
     *
     * @return  self
     */ 
    public function setCep($cep)
    {
        $this->cep = $cep;

        return $this;
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
}
