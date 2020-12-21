<?php

namespace App\DTO\Franquias;

use JMS\Serializer\Annotation as JMS;
use App\Services\Extensions\RequestBodyConverterInterface;


/**
 * @author Tiago Franco
 * DTO para os
 * @JMS\AccessType("public_method")
 */
class ClienteDTO implements RequestBodyConverterInterface
{
    /**
     * @JMS\SerializedName("dataInicial")
     * @JMS\Type("string")
     *
     * dataInicial
     * var string
     */
    private $dataInicial;
    /**
     * @JMS\SerializedName("atendenteResp")
     * @JMS\Type("string")
     *
     * atendenteResp
     * var string
     */
    private $atendenteResp;
    /**
     * @JMS\SerializedName("razaosoc")
     * @JMS\Type("string")
     *
     * razaosoc
     * var string
     */
    private $razaosoc;
    /**
     * @JMS\SerializedName("insc")
     * @JMS\Type("string")
     *
     * insc
     * var string
     */
    private $insc;
    /**
     * @JMS\SerializedName("nomefantasia")
     * @JMS\Type("string")
     *
     * nomefantasia
     * var string
     */
    private $nomefantasia;
    /**
     * @JMS\SerializedName("uf")
     * @JMS\Type("string")
     *
     * uf
     * var string
     */
    private $uf;
    /**
     * @JMS\SerializedName("cidade")
     * @JMS\Type("string")
     *
     * cidade
     * var string
     */
    private $cidade;
    /**
     * @JMS\SerializedName("bairro")
     * @JMS\Type("string")
     *
     * bairro
     * var string
     */
    private $bairro;
    /**
     * @JMS\SerializedName("end")
     * @JMS\Type("string")
     *
     * end
     * var string
     */
    private $end;
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
     * @JMS\SerializedName("fone")
     * @JMS\Type("string")
     *
     * fone
     * var string
     */
    private $fone;
    /**
     * @JMS\SerializedName("fax")
     * @JMS\Type("string")
     *
     * fax
     * var string
     */
    private $fax;
    /**
     * @JMS\SerializedName("email")
     * @JMS\Type("string")
     *
     * email
     * var string
     */
    private $email;
    /**
     * @JMS\SerializedName("txMens")
     * @JMS\Type("string")
     *
     * txMens
     * var string
     */
    private $txMens;
    /**
     * @JMS\SerializedName("txAdesao")
     * @JMS\Type("string")
     *
     * txAdesao
     * var string
     */
    private $txAdesao;
    /**
     * @JMS\SerializedName("debito")
     * @JMS\Type("string")
     *
     * debito
     * var string
     */
    private $debito;
    /**
     * @JMS\SerializedName("diapagto")
     * @JMS\Type("string")
     *
     * diapagto
     * var string
     */
    private $diapagto;
    /**
     * @JMS\SerializedName("idFranquia")
     * @JMS\Type("string")
     *
     * idFranquia
     * var string
     */
    private $idFranquia;
    /**
     * @JMS\SerializedName("dtCad")
     * @JMS\Type("string")
     *
     * dtCad
     * var string
     */
    private $dtCad;
    /**
     * @JMS\SerializedName("sitcli")
     * @JMS\Type("string")
     *
     * sitcli
     * var string
     */
    private $sitcli;
    /**
     * @JMS\SerializedName("obs")
     * @JMS\Type("string")
     *
     * obs
     * var string
     */
    private $obs;
    /**
     * @JMS\SerializedName("classificacao")
     * @JMS\Type("string")
     *
     * classificacao
     * var string
     */
    private $classificacao;
    /**
     * @JMS\SerializedName("contrato")
     * @JMS\Type("string")
     *
     * contrato
     * var string
     */
    private $contrato;
    /**
     * @JMS\SerializedName("ramoAtividade")
     * @JMS\Type("string")
     *
     * ramoAtividade
     * var string
     */
    private $ramoAtividade;
    /**
     * @JMS\SerializedName("celular")
     * @JMS\Type("string")
     *
     * celular
     * var string
     */
    private $celular;
    /**
     * @JMS\SerializedName("foneRes")
     * @JMS\Type("string")
     *
     * foneRes
     * var string
     */
    private $foneRes;
    /**
     * @JMS\SerializedName("socio1")
     * @JMS\Type("string")
     *
     * socio1
     * var string
     */
    private $socio1;
    /**
     * @JMS\SerializedName("socio2")
     * @JMS\Type("string")
     *
     * socio2
     * var string
     */
    private $socio2;
    /**
     * @JMS\SerializedName("cpfsocio1")
     * @JMS\Type("string")
     *
     * cpfsocio1
     * var string
     */
    private $cpfsocio1;
    /**
     * @JMS\SerializedName("cpfsocio2")
     * @JMS\Type("string")
     *
     * cpfsocio2
     * var string
     */
    private $cpfsocio2;
    /**
     * @JMS\SerializedName("emissaoFinanceiro")
     * @JMS\Type("string")
     *
     * emissaoFinanceiro
     * var string
     */
    private $emissaoFinanceiro;
    /**
     * @JMS\SerializedName("pendenciaContratual")
     * @JMS\Type("string")
     *
     * pendenciaContratual
     * var string
     */
    private $pendenciaContratual;
    /**
     * @JMS\SerializedName("idConsultor")
     * @JMS\Type("string")
     *
     * idConsultor
     * var string
     */
    private $idConsultor = "";
    /**
     * @JMS\SerializedName("origem")
     * @JMS\Type("string")
     *
     * origem
     * var string
     */
    private $origem;
    /**
     * @JMS\SerializedName("qtdAcessos")
     * @JMS\Type("string")
     *
     * qtdAcessos
     * var string
     */
    private $qtdAcessos;
    /**
     * @JMS\SerializedName("horaCadastro")
     * @JMS\Type("string")
     *
     * horaCadastro
     * var string
     */
    private $horaCadastro;
    /**
     * @JMS\SerializedName("inscricaoEstadual")
     * @JMS\Type("string")
     *
     * inscricaoEstadual
     * var string
     */
    private $inscricaoEstadual;
    /**
     * @JMS\SerializedName("cnaeFiscal")
     * @JMS\Type("string")
     *
     * cnaeFiscal
     * var string
     */
    private $cnaeFiscal;
    /**
     * @JMS\SerializedName("inscricaoMunicipal")
     * @JMS\Type("string")
     *
     * inscricaoMunicipal
     * var string
     */
    private $inscricaoMunicipal;
    /**
     * @JMS\SerializedName("inscricaoEstadualTributario")
     * @JMS\Type("string")
     *
     * inscricaoEstadualTributario
     * var string
     */
    private $inscricaoEstadualTributario;
    /**
     * @JMS\SerializedName("contadorNome")
     * @JMS\Type("string")
     *
     * contadorNome
     * var string
     */
    private $contadorNome = "";
    /**
     * @JMS\SerializedName("contadorTelefone")
     * @JMS\Type("string")
     *
     * contadorTelefone
     * var string
     */
    private $contadorTelefone = "";
    /**
     * @JMS\SerializedName("contadorCelular")
     * @JMS\Type("string")
     *
     * contadorCelular
     * var string
     */
    private $contadorCelular = "";
    /**
     * @JMS\SerializedName("contadorEmail1")
     * @JMS\Type("string")
     *
     * contadorEmail1
     * var string
     */
    private $contadorEmail1 = "";
    /**
     * @JMS\SerializedName("contadorEmail2")
     * @JMS\Type("string")
     *
     * contadorEmail2
     * var string
     */
    private $contadorEmail2 = "";
    /**
     * @JMS\SerializedName("idAgendador")
     * @JMS\Type("string")
     *
     * idAgendador
     * var string
     */
    private $idAgendador = "";
    /**
     * @JMS\SerializedName("idOperadora")
     * @JMS\Type("string")
     *
     * idOperadora
     * var string
     */
    private $idOperadora;
    /**
     * @JMS\SerializedName("nfce")
     * @JMS\Type("string")
     *
     * nfce
     * var string
     */
    private $nfce;
    /**
     * @JMS\SerializedName("nfe")
     * @JMS\Type("string")
     *
     * nfe
     * var string
     */
    private $nfe;
    /**
     * @JMS\SerializedName("liberarNfe")
     * @JMS\Type("string")
     *
     * liberarNfe
     * var string
     */
    private $liberarNfe;
    /**
     * @JMS\SerializedName("assinatura")
     * @JMS\Type("string")
     *
     * assinatura
     * var string
     */
    private $assinatura;
    /**
     * @JMS\SerializedName("pacote")
     * @JMS\Type("string")
     *
     * pacote
     * var string
     */
    private $pacote;

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
        $this->dataInicial = $dataInicial;

        return $this;
    }

    /**
     * Get the value of atendenteResp
     */
    public function getAtendenteResp()
    {
        return $this->atendenteResp;
    }

    /**
     * Set the value of atendenteResp
     *
     * @return  self
     */
    public function setAtendenteResp($atendenteResp)
    {
        $this->atendenteResp = $atendenteResp;

        return $this;
    }

    /**
     * Get the value of razaosoc
     */
    public function getRazaosoc()
    {
        return $this->razaosoc;
    }

    /**
     * Set the value of razaosoc
     *
     * @return  self
     */
    public function setRazaosoc($razaosoc)
    {
        $this->razaosoc = $razaosoc;

        return $this;
    }

    /**
     * Get the value of insc
     */
    public function getInsc()
    {
        return $this->insc;
    }

    /**
     * Set the value of insc
     *
     * @return  self
     */
    public function setInsc($insc)
    {
        $this->insc = $insc;

        return $this;
    }

    /**
     * Get the value of nomefantasia
     */
    public function getNomefantasia()
    {
        return $this->nomefantasia;
    }

    /**
     * Set the value of nomefantasia
     *
     * @return  self
     */
    public function setNomefantasia($nomefantasia)
    {
        $this->nomefantasia = $nomefantasia;

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
     * Get the value of end
     */
    public function getEnd()
    {
        return $this->end;
    }

    /**
     * Set the value of end
     *
     * @return  self
     */
    public function setEnd($end)
    {
        $this->end = $end;

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
     * Get the value of fone
     */
    public function getFone()
    {
        return $this->fone;
    }

    /**
     * Set the value of fone
     *
     * @return  self
     */
    public function setFone($fone)
    {
        $this->fone = $fone;

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
     * Get the value of txMens
     */
    public function getTxMens()
    {
        return $this->txMens;
    }

    /**
     * Set the value of txMens
     *
     * @return  self
     */
    public function setTxMens($txMens)
    {
        $this->txMens = $txMens;

        return $this;
    }

    /**
     * Get the value of txAdesao
     */
    public function getTxAdesao()
    {
        return $this->txAdesao;
    }

    /**
     * Set the value of txAdesao
     *
     * @return  self
     */
    public function setTxAdesao($txAdesao)
    {
        $this->txAdesao = $txAdesao;

        return $this;
    }

    /**
     * Get the value of debito
     */
    public function getDebito()
    {
        return $this->debito;
    }

    /**
     * Set the value of debito
     *
     * @return  self
     */
    public function setDebito($debito)
    {
        $this->debito = $debito;

        return $this;
    }

    /**
     * Get the value of diapagto
     */
    public function getDiapagto()
    {
        return $this->diapagto;
    }

    /**
     * Set the value of diapagto
     *
     * @return  self
     */
    public function setDiapagto($diapagto)
    {
        $this->diapagto = $diapagto;

        return $this;
    }

    /**
     * Get the value of idFranquia
     */
    public function getIdFranquia()
    {
        return $this->idFranquia;
    }

    /**
     * Set the value of idFranquia
     *
     * @return  self
     */
    public function setIdFranquia($idFranquia)
    {
        $this->idFranquia = $idFranquia;

        return $this;
    }

    /**
     * Get the value of dtCad
     */
    public function getDtCad()
    {
        return $this->dtCad;
    }

    /**
     * Set the value of dtCad
     *
     * @return  self
     */
    public function setDtCad($dtCad)
    {
        $this->dtCad = $dtCad;

        return $this;
    }

    /**
     * Get the value of sitcli
     */
    public function getSitcli()
    {
        return $this->sitcli;
    }

    /**
     * Set the value of sitcli
     *
     * @return  self
     */
    public function setSitcli($sitcli)
    {
        $this->sitcli = $sitcli;

        return $this;
    }

    /**
     * Get the value of obs
     */
    public function getObs()
    {
        return $this->obs;
    }

    /**
     * Set the value of obs
     *
     * @return  self
     */
    public function setObs($obs)
    {
        $this->obs = $obs;

        return $this;
    }

    /**
     * Get the value of classificacao
     */
    public function getClassificacao()
    {
        return $this->classificacao;
    }

    /**
     * Set the value of classificacao
     *
     * @return  self
     */
    public function setClassificacao($classificacao)
    {
        $this->classificacao = $classificacao;

        return $this;
    }

    /**
     * Get the value of contrato
     */
    public function getContrato()
    {
        return $this->contrato;
    }

    /**
     * Set the value of contrato
     *
     * @return  self
     */
    public function setContrato($contrato)
    {
        $this->contrato = $contrato;

        return $this;
    }

    /**
     * Get the value of ramoAtividade
     */
    public function getRamoAtividade()
    {
        return $this->ramoAtividade;
    }

    /**
     * Set the value of ramoAtividade
     *
     * @return  self
     */
    public function setRamoAtividade($ramoAtividade)
    {
        $this->ramoAtividade = $ramoAtividade;

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
     * Get the value of foneRes
     */
    public function getFoneRes()
    {
        return $this->foneRes;
    }

    /**
     * Set the value of foneRes
     *
     * @return  self
     */
    public function setFoneRes($foneRes)
    {
        $this->foneRes = $foneRes;

        return $this;
    }

    /**
     * Get the value of socio1
     */
    public function getSocio1()
    {
        return $this->socio1;
    }

    /**
     * Set the value of socio1
     *
     * @return  self
     */
    public function setSocio1($socio1)
    {
        $this->socio1 = $socio1;

        return $this;
    }

    /**
     * Get the value of socio2
     */
    public function getSocio2()
    {
        return $this->socio2;
    }

    /**
     * Set the value of socio2
     *
     * @return  self
     */
    public function setSocio2($socio2)
    {
        $this->socio2 = $socio2;

        return $this;
    }

    /**
     * Get the value of cpfsocio1
     */
    public function getCpfsocio1()
    {
        return $this->cpfsocio1;
    }

    /**
     * Set the value of cpfsocio1
     *
     * @return  self
     */
    public function setCpfsocio1($cpfsocio1)
    {
        $this->cpfsocio1 = $cpfsocio1;

        return $this;
    }

    /**
     * Get the value of cpfsocio2
     */
    public function getCpfsocio2()
    {
        return $this->cpfsocio2;
    }

    /**
     * Set the value of cpfsocio2
     *
     * @return  self
     */
    public function setCpfsocio2($cpfsocio2)
    {
        $this->cpfsocio2 = $cpfsocio2;

        return $this;
    }

    /**
     * Get the value of emissaoFinanceiro
     */
    public function getEmissaoFinanceiro()
    {
        return $this->emissaoFinanceiro;
    }

    /**
     * Set the value of emissaoFinanceiro
     *
     * @return  self
     */
    public function setEmissaoFinanceiro($emissaoFinanceiro)
    {
        $this->emissaoFinanceiro = $emissaoFinanceiro;

        return $this;
    }

    /**
     * Get the value of pendenciaContratual
     */
    public function getPendenciaContratual()
    {
        return $this->pendenciaContratual;
    }

    /**
     * Set the value of pendenciaContratual
     *
     * @return  self
     */
    public function setPendenciaContratual($pendenciaContratual)
    {
        $this->pendenciaContratual = $pendenciaContratual;

        return $this;
    }

    /**
     * Get the value of idConsultor
     */
    public function getIdConsultor()
    {
        return $this->idConsultor;
    }

    /**
     * Set the value of idConsultor
     *
     * @return  self
     */
    public function setIdConsultor($idConsultor)
    {
        $this->idConsultor = $idConsultor;

        return $this;
    }

    /**
     * Get the value of origem
     */
    public function getOrigem()
    {
        return $this->origem;
    }

    /**
     * Set the value of origem
     *
     * @return  self
     */
    public function setOrigem($origem)
    {
        $this->origem = $origem;

        return $this;
    }

    /**
     * Get the value of qtdAcessos
     */
    public function getQtdAcessos()
    {
        return $this->qtdAcessos;
    }

    /**
     * Set the value of qtdAcessos
     *
     * @return  self
     */
    public function setQtdAcessos($qtdAcessos)
    {
        $this->qtdAcessos = $qtdAcessos;

        return $this;
    }

    /**
     * Get the value of horaCadastro
     */
    public function getHoraCadastro()
    {
        return $this->horaCadastro;
    }

    /**
     * Set the value of horaCadastro
     *
     * @return  self
     */
    public function setHoraCadastro($horaCadastro)
    {
        $this->horaCadastro = $horaCadastro;

        return $this;
    }

    /**
     * Get the value of inscricaoEstadual
     */
    public function getInscricaoEstadual()
    {
        return $this->inscricaoEstadual;
    }

    /**
     * Set the value of inscricaoEstadual
     *
     * @return  self
     */
    public function setInscricaoEstadual($inscricaoEstadual)
    {
        $this->inscricaoEstadual = $inscricaoEstadual;

        return $this;
    }

    /**
     * Get the value of cnaeFiscal
     */
    public function getCnaeFiscal()
    {
        return $this->cnaeFiscal;
    }

    /**
     * Set the value of cnaeFiscal
     *
     * @return  self
     */
    public function setCnaeFiscal($cnaeFiscal)
    {
        $this->cnaeFiscal = $cnaeFiscal;

        return $this;
    }

    /**
     * Get the value of inscricaoMunicipal
     */
    public function getInscricaoMunicipal()
    {
        return $this->inscricaoMunicipal;
    }

    /**
     * Set the value of inscricaoMunicipal
     *
     * @return  self
     */
    public function setInscricaoMunicipal($inscricaoMunicipal)
    {
        $this->inscricaoMunicipal = $inscricaoMunicipal;

        return $this;
    }

    /**
     * Get the value of inscricaoEstadualTributario
     */
    public function getInscricaoEstadualTributario()
    {
        return $this->inscricaoEstadualTributario;
    }

    /**
     * Set the value of inscricaoEstadualTributario
     *
     * @return  self
     */
    public function setInscricaoEstadualTributario($inscricaoEstadualTributario)
    {
        $this->inscricaoEstadualTributario = $inscricaoEstadualTributario;

        return $this;
    }

    /**
     * Get the value of contadorNome
     */
    public function getContadorNome()
    {
        return $this->contadorNome;
    }

    /**
     * Set the value of contadorNome
     *
     * @return  self
     */
    public function setContadorNome($contadorNome)
    {
        $this->contadorNome = $contadorNome;

        return $this;
    }

    /**
     * Get the value of contadorTelefone
     */
    public function getContadorTelefone()
    {
        return $this->contadorTelefone;
    }

    /**
     * Set the value of contadorTelefone
     *
     * @return  self
     */
    public function setContadorTelefone($contadorTelefone)
    {
        $this->contadorTelefone = $contadorTelefone;

        return $this;
    }

    /**
     * Get the value of contadorCelular
     */
    public function getContadorCelular()
    {
        return $this->contadorCelular;
    }

    /**
     * Set the value of contadorCelular
     *
     * @return  self
     */
    public function setContadorCelular($contadorCelular)
    {
        $this->contadorCelular = $contadorCelular;

        return $this;
    }

    /**
     * Get the value of contadorEmail1
     */
    public function getContadorEmail1()
    {
        return $this->contadorEmail1;
    }

    /**
     * Set the value of contadorEmail1
     *
     * @return  self
     */
    public function setContadorEmail1($contadorEmail1)
    {
        $this->contadorEmail1 = $contadorEmail1;

        return $this;
    }

    /**
     * Get the value of contadorEmail2
     */
    public function getContadorEmail2()
    {
        return $this->contadorEmail2;
    }

    /**
     * Set the value of contadorEmail2
     *
     * @return  self
     */
    public function setContadorEmail2($contadorEmail2)
    {
        $this->contadorEmail2 = $contadorEmail2;

        return $this;
    }

    /**
     * Get the value of idAgendador
     */
    public function getIdAgendador()
    {
        return $this->idAgendador;
    }

    /**
     * Set the value of idAgendador
     *
     * @return  self
     */
    public function setIdAgendador($idAgendador)
    {
        $this->idAgendador = $idAgendador;

        return $this;
    }

    /**
     * Get the value of idOperadora
     */
    public function getIdOperadora()
    {
        return $this->idOperadora;
    }

    /**
     * Set the value of idOperadora
     *
     * @return  self
     */
    public function setIdOperadora($idOperadora)
    {
        $this->idOperadora = $idOperadora;

        return $this;
    }

    /**
     * Get the value of nfce
     */
    public function getNfce()
    {
        return $this->nfce;
    }

    /**
     * Set the value of nfce
     *
     * @return  self
     */
    public function setNfce($nfce)
    {
        $this->nfce = $nfce;

        return $this;
    }

    /**
     * Get the value of nfe
     */
    public function getNfe()
    {
        return $this->nfe;
    }

    /**
     * Set the value of nfe
     *
     * @return  self
     */
    public function setNfe($nfe)
    {
        $this->nfe = $nfe;

        return $this;
    }

    /**
     * Get the value of liberarNfe
     */
    public function getLiberarNfe()
    {
        return $this->liberarNfe;
    }

    /**
     * Set the value of liberarNfe
     *
     * @return  self
     */
    public function setLiberarNfe($liberarNfe)
    {
        $this->liberarNfe = $liberarNfe;

        return $this;
    }

    /**
     * Get the value of assinatura
     */
    public function getAssinatura()
    {
        return $this->assinatura;
    }

    /**
     * Set the value of assinatura
     *
     * @return  self
     */
    public function setAssinatura($assinatura)
    {
        $this->assinatura = $assinatura;

        return $this;
    }

    /**
     * Get the value of pacote
     */
    public function getPacote()
    {
        return $this->pacote;
    }

    /**
     * Set the value of pacote
     *
     * @return  self
     */
    public function setPacote($pacote)
    {
        $this->pacote = $pacote;

        return $this;
    }
}
