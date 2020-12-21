<?php

namespace App\DTO\Fornecedor;

use App\Interfaces\DataInformData;
use JMS\Serializer\Annotation as JMS;
use App\Services\Extensions\RequestBodyConverterInterface;


/**
 * @author Tiago Franco
 * DTO para manipulacao dos dados dos fornecedores
 * @JMS\AccessType("public_method")
 */
class CadastrarFornecedorDTO implements RequestBodyConverterInterface, DataInformData
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
     * @JMS\SerializedName("razao_social")
     * @JMS\Type("string")
     * 
     * razaoSocial
     * var string
     */
    private $razaoSocial;
    /**
     * @JMS\SerializedName("fantasia")
     * @JMS\Type("string")
     * 
     * fantasia
     * var string
     */
    private $fantasia;
    /**
     * @JMS\SerializedName("contato")
     * @JMS\Type("string")
     * 
     * contato
     * var string
     */
    private $contato;
    /**
     * @JMS\SerializedName("cnpj_cpf")
     * @JMS\Type("string")
     * 
     * cnpjCpf
     * var string
     */
    private $cnpjCpf;
    /**
     * @JMS\SerializedName("telefone")
     * @JMS\Type("string")
     * 
     * telefone
     * var string
     */
    private $telefone;
    /**
     * @JMS\SerializedName("fax")
     * @JMS\Type("string")
     * 
     * fax
     * var string
     */
    private $fax;
    /**
     * @JMS\SerializedName("celular")
     * @JMS\Type("string")
     * 
     * celular
     * var string
     */
    private $celular;
    /**
     * @JMS\SerializedName("email")
     * @JMS\Type("string")
     * 
     * email
     * var string
     */
    private $email;
    /**
     * @JMS\SerializedName("site")
     * @JMS\Type("string")
     * 
     * site
     * var string
     */
    private $site;
    /**
     * @JMS\SerializedName("skype")
     * @JMS\Type("string")
     * 
     * skype
     * var string
     */
    private $skype;
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
     * @JMS\SerializedName("cep")
     * @JMS\Type("string")
     * 
     * cep
     * var string
     */
    private $cep;
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
     * @JMS\SerializedName("informacoes_adicionais")
     * @JMS\Type("string")
     * 
     * informacoesAdicionais
     * var string
     */
    private $informacoesAdicionais;
    
    /**
     * @JMS\SerializedName("id_usuario")
     * @JMS\Type("integer")
     * 
     * idUsuario
     * var integer
     */
    private $idUsuario;
    /**
     * @JMS\SerializedName("tipo_pessoa")
     * @JMS\Type("string")
     * 
     * tipoPessoa
     * var string
     */
    private $tipoPessoa;
    /**
     * @JMS\SerializedName("ativo")
     * @JMS\Type("string")
     * 
     * ativo
     * var string
     */
    private $ativo;
    /**
     * @JMS\SerializedName("data_cadastro")
     * @JMS\Type("string")
     * 
     * dataCadastro
     * var string
     */
    private $dataCadastro;
    /**
     * @JMS\SerializedName("id_tipo_log")
     * @JMS\Type("integer")
     * 
     * idTipoLog
     * var integer
     */
    private $idTipoLog;
    /**
     * @JMS\SerializedName("tipo_cadastro")
     * @JMS\Type("string")
     * 
     * tipoCadastro
     * var string
     */
    private $tipoCadastro;
    /**
     * @JMS\SerializedName("id_fornecedor_servico")
     * @JMS\Type("integer")
     * 
     * idFornecedorServico
     * var integer
     */
    private $idFornecedorServico;
    /**
     * @JMS\SerializedName("id_tmp")
     * @JMS\Type("integer")
     * 
     * idTmp
     * var integer
     */
    private $idTmp;
    /**
     * @JMS\SerializedName("rgie")
     * @JMS\Type("string")
     * 
     * rgie
     * var string
     */
    private $rgie;
    /**
     * @JMS\SerializedName("fone_tmp")
     * @JMS\Type("string")
     * 
     * foneTmp
     * var string
     */
    private $foneTmp;
    /**
     * @JMS\SerializedName("insc_estadual")
     * @JMS\Type("string")
     * 
     * inscEstadual
     * var string
     */
    private $inscEstadual;
    /**
     * @JMS\SerializedName("insc_municipal")
     * @JMS\Type("string")
     * 
     * inscMunicipal
     * var string
     */
    private $inscMunicipal;
    /**
     * @JMS\SerializedName("id_forn_master")
     * @JMS\Type("integer")
     * 
     * idFornMaster
     * var integer
     */
    private $idFornMaster;
    /**
     * @JMS\SerializedName("data_fundacao")
     * @JMS\Type("string")
     * 
     * dataFundacao
     * var string
     */
    private $dataFundacao;
    /**
     * @JMS\SerializedName("prazo_entrega_produtos")
     * @JMS\Type("string")
     * 
     * prazoEntregaProdutos
     * var string
     */
    private $prazoEntregaProdutos;
    
    /**
     * @JMS\SerializedName("isento_icms")
     * @JMS\Type("string")
     * 
     * isentoIcms
     * var string
     */
    private $isentoIcms;

    /**
     * @JMS\SerializedName("pais")
     * @JMS\Type("string")
     * 
     * pais
     * var string
     */
    private $pais;
    /**
     * @JMS\SerializedName("id_pais")
     * @JMS\Type("integer")
     * 
     * idPais
     * var integer
     */
    private $idPais;

    /**
     * @JMS\SerializedName("produtos")
     * @JMS\Type("array")
     * 
     * produtos
     * var array
     */
    private $produtos;

    /**
     * @JMS\SerializedName("transportadoras")
     * @JMS\Type("array")
     * 
     * transportadoras
     * var array
     */
    private $transportadoras;

    /**
     * @JMS\SerializedName("dados_bancarios")
     * @JMS\Type("array<App\DTO\Fornecedor\CadastrarFornecedorBancoDTO>")
     * 
     * dadosBancarios
     * var array
     */
    private $dadosBancarios;
    

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
     * Get the value of fantasia
     */ 
    public function getFantasia()
    {
        return $this->fantasia;
    }

    /**
     * Set the value of fantasia
     *
     * @return  self
     */ 
    public function setFantasia($fantasia)
    {
        $this->fantasia = $fantasia;

        return $this;
    }

    /**
     * Get the value of contato
     */ 
    public function getContato()
    {
        return $this->contato;
    }

    /**
     * Set the value of contato
     *
     * @return  self
     */ 
    public function setContato($contato)
    {
        $this->contato = $contato;

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
     * Get the value of telefone
     */ 
    public function getTelefone()
    {
        return $this->telefone;
    }

    /**
     * Set the value of telefone
     *
     * @return  self
     */ 
    public function setTelefone($telefone)
    {
        $this->telefone = $telefone;

        return $this;
    }

    /**
     * Get the value of fax
     */ 
    public function getFax()
    {
        return $this->fax;
    }

    /**
     * Set the value of fax
     *
     * @return  self
     */ 
    public function setFax($fax)
    {
        $this->fax = $fax;

        return $this;
    }

    /**
     * Get the value of celular
     */ 
    public function getCelular()
    {
        return $this->celular;
    }

    /**
     * Set the value of celular
     *
     * @return  self
     */ 
    public function setCelular($celular)
    {
        $this->celular = $celular;

        return $this;
    }

    /**
     * Get the value of email
     */ 
    public function getEmail()
    {
        return $this->email;
    }

    /**
     * Set the value of email
     *
     * @return  self
     */ 
    public function setEmail($email)
    {
        $this->email = $email;

        return $this;
    }

    /**
     * Get the value of site
     */ 
    public function getSite()
    {
        return $this->site;
    }

    /**
     * Set the value of site
     *
     * @return  self
     */ 
    public function setSite($site)
    {
        $this->site = $site;

        return $this;
    }

    /**
     * Get the value of skype
     */ 
    public function getSkype()
    {
        return $this->skype;
    }

    /**
     * Set the value of skype
     *
     * @return  self
     */ 
    public function setSkype($skype)
    {
        $this->skype = $skype;

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
     * Get the value of informacoesAdicionais
     */ 
    public function getInformacoesAdicionais()
    {
        return $this->informacoesAdicionais;
    }

    /**
     * Set the value of informacoesAdicionais
     *
     * @return  self
     */ 
    public function setInformacoesAdicionais($informacoesAdicionais)
    {
        $this->informacoesAdicionais = $informacoesAdicionais;

        return $this;
    }

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
     * Get the value of idUsuario
     */ 
    public function getIdUsuario()
    {
        return $this->idUsuario;
    }

    /**
     * Set the value of idUsuario
     *
     * @return  self
     */ 
    public function setIdUsuario($idUsuario)
    {
        $this->idUsuario = $idUsuario;

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
     * Get the value of ativo
     */ 
    public function getAtivo()
    {
        return $this->ativo;
    }

    /**
     * Set the value of ativo
     *
     * @return  self
     */ 
    public function setAtivo($ativo)
    {
        $this->ativo = $ativo;

        return $this;
    }

    /**
     * Get the value of dataCadastro
     */ 
    public function getDataCadastro()
    {
        return $this->dataCadastro;
    }

    /**
     * Set the value of dataCadastro
     *
     * @return  self
     */ 
    public function setDataCadastro($dataCadastro)
    {
        $this->dataCadastro = $dataCadastro;

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
     * Get the value of tipoCadastro
     */ 
    public function getTipoCadastro()
    {
        return $this->tipoCadastro;
    }

    /**
     * Set the value of tipoCadastro
     *
     * @return  self
     */ 
    public function setTipoCadastro($tipoCadastro)
    {
        $this->tipoCadastro = $tipoCadastro;

        return $this;
    }

    /**
     * Get the value of idFornecedorServico
     */ 
    public function getIdFornecedorServico()
    {
        return $this->idFornecedorServico;
    }

    /**
     * Set the value of idFornecedorServico
     *
     * @return  self
     */ 
    public function setIdFornecedorServico($idFornecedorServico)
    {
        $this->idFornecedorServico = $idFornecedorServico;

        return $this;
    }

    /**
     * Get the value of idTmp
     */ 
    public function getIdTmp()
    {
        return $this->idTmp;
    }

    /**
     * Set the value of idTmp
     *
     * @return  self
     */ 
    public function setIdTmp($idTmp)
    {
        $this->idTmp = $idTmp;

        return $this;
    }

    /**
     * Get the value of rgie
     */ 
    public function getRgie()
    {
        return $this->rgie;
    }

    /**
     * Set the value of rgie
     *
     * @return  self
     */ 
    public function setRgie($rgie)
    {
        $this->rgie = $rgie;

        return $this;
    }

    /**
     * Get the value of foneTmp
     */ 
    public function getFoneTmp()
    {
        return $this->foneTmp;
    }

    /**
     * Set the value of foneTmp
     *
     * @return  self
     */ 
    public function setFoneTmp($foneTmp)
    {
        $this->foneTmp = $foneTmp;

        return $this;
    }

    /**
     * Get the value of inscEstadual
     */ 
    public function getInscEstadual()
    {
        return $this->inscEstadual;
    }

    /**
     * Set the value of inscEstadual
     *
     * @return  self
     */ 
    public function setInscEstadual($inscEstadual)
    {
        $this->inscEstadual = $inscEstadual;

        return $this;
    }

    /**
     * Get the value of inscMunicipal
     */ 
    public function getInscMunicipal()
    {
        return $this->inscMunicipal;
    }

    /**
     * Set the value of inscMunicipal
     *
     * @return  self
     */ 
    public function setInscMunicipal($inscMunicipal)
    {
        $this->inscMunicipal = $inscMunicipal;

        return $this;
    }

    /**
     * Get the value of idFornMaster
     */ 
    public function getIdFornMaster()
    {
        return $this->idFornMaster;
    }

    /**
     * Set the value of idFornMaster
     *
     * @return  self
     */ 
    public function setIdFornMaster($idFornMaster)
    {
        $this->idFornMaster = $idFornMaster;

        return $this;
    }

    /**
     * Get the value of dataFundacao
     */ 
    public function getDataFundacao()
    {
        return $this->dataFundacao;
    }

    /**
     * Set the value of dataFundacao
     *
     * @return  self
     */ 
    public function setDataFundacao($dataFundacao)
    {
        $this->dataFundacao = $dataFundacao;

        return $this;
    }

    /**
     * Get the value of prazoEntregaProdutos
     */ 
    public function getPrazoEntregaProdutos()
    {
        return $this->prazoEntregaProdutos;
    }

    /**
     * Set the value of prazoEntregaProdutos
     *
     * @return  self
     */ 
    public function setPrazoEntregaProdutos($prazoEntregaProdutos)
    {
        $this->prazoEntregaProdutos = $prazoEntregaProdutos;

        return $this;
    }

    /**
     * Get the value of idImportacao
     */ 
    public function getIdImportacao()
    {
        return $this->idImportacao;
    }

    /**
     * Set the value of idImportacao
     *
     * @return  self
     */ 
    public function setIdImportacao($idImportacao)
    {
        $this->idImportacao = $idImportacao;

        return $this;
    }

    /**
     * Get the value of isentoIcms
     */ 
    public function getIsentoIcms()
    {
        return $this->isentoIcms;
    }

    /**
     * Set the value of isentoIcms
     *
     * @return  self
     */ 
    public function setIsentoIcms($isentoIcms)
    {
        $this->isentoIcms = $isentoIcms;

        return $this;
    }

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
     * Get the value of idPais
     */ 
    public function getIdPais()
    {
        return $this->idPais;
    }

    /**
     * Set the value of idPais
     *
     * @return  self
     */ 
    public function setIdPais($idPais)
    {
        $this->idPais = $idPais;

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
        $this->produtos = $produtos;

        return $this;
    }

    /**
     * Get the value of transportadoras
     */ 
    public function getTransportadoras()
    {
        return $this->transportadoras;
    }

    /**
     * Set the value of transportadoras
     *
     * @return  self
     */ 
    public function setTransportadoras($transportadoras)
    {
        $this->transportadoras = $transportadoras;

        return $this;
    }

    /**
     * Get the value of dadosBancarios
     */ 
    public function getDadosBancarios()
    {
        return $this->dadosBancarios;
    }

    /**
     * Set the value of dadosBancarios
     *
     * @return  self
     */ 
    public function setDadosBancarios($dadosBancarios)
    {
        $this->dadosBancarios = $dadosBancarios;

        return $this;
    }
}