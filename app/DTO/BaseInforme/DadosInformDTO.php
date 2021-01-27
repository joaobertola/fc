<?php

namespace App\DTO\BaseInforme;

use App\Interfaces\DataInformData;
use App\DTO\Fornecedor\CadastrarFornecedorDTO;

/**
 * @author Tiago Franco
 * DTO para passagem de informacoes para integracao com a base informe
 */
class DadosInformDTO
{
    private $cnpjCpf;
    private $tipo;
    private $nome;
    private $dataNascimentoFundacao;
    private $numeroTitulo;
    private $endereco;
    private $idTipoLog;
    private $numero;
    private $complemento;
    private $bairro;
    private $cidade;
    private $uf;
    private $cep;
    private $email;
    private $nomeMae;
    private $telefone;
    private $ddd;
    private $celular;
    private $dddCelular;
    private $referenciaComercial;
    private $referenciaPessoal;
    private $empresaTrabalha;
    private $cargo;
    private $enderecoEmpresa;
    private $rg;
    private $nomeReferencia;
    private $fax;
    private $foneEmpresa;
    private $font;


    public function __construct(DataInformData $dataInformData)
    {
        if ($dataInformData instanceof CadastrarFornecedorDTO) {
            $this->setCnpjCpf($dataInformData->getCnpjCpf());
            $this->setTipo($dataInformData->getTipoPessoa());
            $this->setNome($dataInformData->getRazaoSocial());
            $this->setDataNascimentoFundacao($dataInformData->getDataFundacao());
            $this->setEndereco($dataInformData->getEndereco());
            $this->setIdTipoLog($dataInformData->getIdTipoLog());
            $this->setNumero($dataInformData->getNumero());
            $this->setComplemento($dataInformData->getComplemento());
            $this->setBairro($dataInformData->getBairro());
            $this->setCidade($dataInformData->getCidade());
            $this->setUf($dataInformData->getUf());
            $this->setCep($dataInformData->getCep());
            $this->setEmail($dataInformData->getEmail());
            $this->setTelefone($dataInformData->getTelefone());
            $this->setCelular($dataInformData->getCelular());
        }
    }
    /**
     * Get the value of tipo
     */
    public function getTipo()
    {
        return $this->tipo;
    }

    /**
     * Set the value of tipo
     *
     * @return  self
     */
    public function setTipo($tipo)
    {
        $this->tipo = ($tipo == 'F' ? 0 : 1);

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
     * Get the value of dataNascimentoFundacao
     */
    public function getDataNascimentoFundacao()
    {
        return $this->dataNascimentoFundacao;
    }

    /**
     * Set the value of dataNascimentoFundacao
     *
     * @return  self
     */
    public function setDataNascimentoFundacao($dataNascimentoFundacao)
    {
        $this->dataNascimentoFundacao = $dataNascimentoFundacao;

        return $this;
    }

    /**
     * Get the value of numeroTitulo
     */
    public function getNumeroTitulo()
    {
        return $this->numeroTitulo;
    }

    /**
     * Set the value of numeroTitulo
     *
     * @return  self
     */
    public function setNumeroTitulo($numeroTitulo)
    {
        $this->numeroTitulo = $numeroTitulo;

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
     * Get the value of nomeMae
     */
    public function getNomeMae()
    {
        return $this->nomeMae;
    }

    /**
     * Set the value of nomeMae
     *
     * @return  self
     */
    public function setNomeMae($nomeMae)
    {
        $this->nomeMae = $nomeMae;

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

        $telefone = preg_replace("/\D+/", "", $telefone);

        $this->ddd      = substr($telefone, 0,2);
        $this->telefone = substr($telefone, 2);

        return $this;
    }

    /**
     * Get the value of ddd
     */
    public function getDdd()
    {
        return $this->ddd;
    }

    /**
     * Set the value of ddd
     *
     * @return  self
     */
    public function setDdd($ddd)
    {
        $this->ddd = $ddd;

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
        $celular = preg_replace("/\D+/", "", $celular);

        $this->dddCelular  = substr($celular, 0,2);
        $this->celular     = substr($celular, 2);

        return $this;
    }

    /**
     * Get the value of ddd
     */
    public function getDddCelular()
    {
        return $this->dddCelular;
    }

    /**
     * Set the value of ddd
     *
     * @return  self
     */
    public function setDddCelular($dddCelular)
    {
        $this->dddCelular = $dddCelular;

        return $this;
    }

    /**
     * Get the value of referenciaComercial
     */
    public function getReferenciaComercial()
    {
        return $this->referenciaComercial;
    }

    /**
     * Set the value of referenciaComercial
     *
     * @return  self
     */
    public function setReferenciaComercial($referenciaComercial)
    {
        $this->referenciaComercial = $referenciaComercial;

        return $this;
    }

    /**
     * Get the value of referenciaPessoal
     */
    public function getReferenciaPessoal()
    {
        return $this->referenciaPessoal;
    }

    /**
     * Set the value of referenciaPessoal
     *
     * @return  self
     */
    public function setReferenciaPessoal($referenciaPessoal)
    {
        $this->referenciaPessoal = $referenciaPessoal;

        return $this;
    }

    /**
     * Get the value of empresaTrabalha
     */
    public function getEmpresaTrabalha()
    {
        return $this->empresaTrabalha;
    }

    /**
     * Set the value of empresaTrabalha
     *
     * @return  self
     */
    public function setEmpresaTrabalha($empresaTrabalha)
    {
        $this->empresaTrabalha = $empresaTrabalha;

        return $this;
    }

    /**
     * Get the value of cargo
     */
    public function getCargo()
    {
        return $this->cargo;
    }

    /**
     * Set the value of cargo
     *
     * @return  self
     */
    public function setCargo($cargo)
    {
        $this->cargo = $cargo;

        return $this;
    }

    /**
     * Get the value of enderecoEmpresa
     */
    public function getEnderecoEmpresa()
    {
        return $this->enderecoEmpresa;
    }

    /**
     * Set the value of enderecoEmpresa
     *
     * @return  self
     */
    public function setEnderecoEmpresa($enderecoEmpresa)
    {
        $this->enderecoEmpresa = $enderecoEmpresa;

        return $this;
    }

    /**
     * Get the value of rg
     */
    public function getRg()
    {
        return $this->rg;
    }

    /**
     * Set the value of rg
     *
     * @return  self
     */
    public function setRg($rg)
    {
        $this->rg = $rg;

        return $this;
    }

    /**
     * Get the value of nomeReferencia
     */
    public function getNomeReferencia()
    {
        return $this->nomeReferencia;
    }

    /**
     * Set the value of nomeReferencia
     *
     * @return  self
     */
    public function setNomeReferencia($nomeReferencia)
    {
        $this->nomeReferencia = $nomeReferencia;

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
     * Get the value of foneEmpresa
     */
    public function getFoneEmpresa()
    {
        return $this->foneEmpresa;
    }

    /**
     * Set the value of foneEmpresa
     *
     * @return  self
     */
    public function setFoneEmpresa($foneEmpresa)
    {
        $this->foneEmpresa = $foneEmpresa;

        return $this;
    }


    /**
     * Get the value of font
     */
    public function getFont()
    {
        return $this->font;
    }

    /**
     * Set the value of font
     *
     * @return  self
     */
    public function setFont($font)
    {
        $this->font = $font;

        return $this;
    }
}
