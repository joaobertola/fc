<?php

namespace App\DTO\Relatorios;

use App\Services\Utils\DataUtils;
use JMS\Serializer\Annotation as JMS;
use App\Services\Extensions\RequestBodyConverterInterface;

/**
 * @author Tiago Franco
 * DTO para os filtros do relatorio de clientes
 * @JMS\AccessType("public_method")
 */
class RelatorioClienteDTO implements RequestBodyConverterInterface
{
    /**
     * @JMS\SerializedName("id_cadastro")
     * @JMS\Type("integer")
     * 
     * qtd
     * var integer
     */
    private $idCadastro;
    /**
     * @JMS\SerializedName("data_inicial")
     * @JMS\Type("string")
     * 
     * qtd
     * var string
     */
    private $dataInicial = "";

    /**
     * @JMS\SerializedName("data_final")
     * @JMS\Type("string")
     * 
     * qtd
     * var string
     */
    private $dataFinal = "";

    /**
     * @JMS\SerializedName("aniversario_inicial")
     * @JMS\Type("string")
     * 
     * aniversario_inicial
     * var string
     */
    private $aniversarioInicial = "";

    /**
     * @JMS\SerializedName("aniversario_final")
     * @JMS\Type("string")
     * 
     * aniversario_final
     * var string
     */
    private $aniversarioFinal = "";

    /**
     * @JMS\SerializedName("tipo_pessoa")
     * @JMS\Type("string")
     * 
     * qtd
     * var string
     */
    private $tipoPessoa;
    /**
     * @JMS\SerializedName("ipt_uf")
     * @JMS\Type("string")
     * 
     * qtd
     * var string
     */
    private $iptUf;
    /**
     * @JMS\SerializedName("cidade")
     * @JMS\Type("string")
     * 
     * qtd
     * var string
     */
    private $cidade;
    /**
     * @JMS\SerializedName("situacao")
     * @JMS\Type("string")
     * 
     * qtd
     * var string
     */
    private $situacao;
    /**
     * @JMS\SerializedName("bairro")
     * @JMS\Type("string")
     * 
     * qtd
     * var string
     */
    private $bairro;
    /**
     * @JMS\SerializedName("campos")
     * @JMS\Type("array")
     * 
     * id
     * var array
     */
    private $campos;

    /**
     * Get the value of idCadastro
     */
    public function getIdCadastro()
    {
        return $this->idCadastro;
    }

    /**
     * Set the value of idCadastro
     *
     * @return  self
     */
    public function setIdCadastro($idCadastro)
    {
        $this->idCadastro = $idCadastro;

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
        if (!empty($dataInicial))
            $this->dataInicial = DataUtils::getData($dataInicial);

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
        if (!empty($dataFinal))
            $this->dataFinal = DataUtils::getData($dataFinal);

        return $this;
    }

    /**
     * Get the value of tipoPessoa
     */
    public function getTipoPessoa()
    {
        return $this->tipoPessoa;
    }

    /**
     * Set the value of tipoPessoa
     *
     * @return  self
     */
    public function setTipoPessoa($tipoPessoa)
    {
        $this->tipoPessoa = $tipoPessoa;

        return $this;
    }

    /**
     * Get the value of iptUf
     */
    public function getIptUf()
    {
        return $this->iptUf;
    }

    /**
     * Set the value of iptUf
     *
     * @return  self
     */
    public function setIptUf($iptUf)
    {
        $this->iptUf = $iptUf;

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
     * Get the value of situacao
     */
    public function getSituacao()
    {
        return $this->situacao;
    }

    /**
     * Set the value of situacao
     *
     * @return  self
     */
    public function setSituacao($situacao)
    {
        $this->situacao = $situacao;

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
     * Get the value of campos
     */
    public function getCampos()
    {
        return $this->campos;
    }

    /**
     * Set the value of campos
     *
     * @return  self
     */
    public function setCampos($campos)
    {
        $this->campos = array_filter($campos);

        return $this;
    }

    /**
     * Get the value of aniversarioInicial
     */
    public function getAniversarioInicial()
    {
        return $this->aniversarioInicial;
    }

    /**
     * Set the value of aniversarioInicial
     *
     * @return  self
     */
    public function setAniversarioInicial($aniversarioInicial)
    {
        if (!empty($aniversarioInicial))
            $this->aniversarioInicial = substr(DataUtils::getData($aniversarioInicial), 5);

        return $this;
    }

    /**
     * Get the value of aniversarioFinal
     */
    public function getAniversarioFinal()
    {
        return $this->aniversarioFinal;
    }

    /**
     * Set the value of aniversarioFinal
     *
     * @return  self
     */
    public function setAniversarioFinal($aniversarioFinal)
    {
        if (!empty($aniversarioFinal))
            $this->aniversarioFinal = substr(DataUtils::getData($aniversarioFinal), 5);

        return $this;
    }
}
