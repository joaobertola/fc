<?php

namespace App\DTO\Produtos;

use App\Services\Extensions\RequestBodyConverterInterface;
use JMS\Serializer\Annotation as JMS;
use OpenApi\Annotations as OA;

/**
 * @author Tiago Franco
 * DTO para os 
 * @JMS\AccessType("public_method")
 * 
 * Class CadastroISSQNDTO
 * @package App\DTO\Produtos
 * @OA\Schema(
 *     schema="informacoes_fiscais_issqn_dto",
 *     type="object",
 *     title="Informações fiscais de ISSQN do Produto",
 *     properties={
 *          @OA\Property(property="percentual_aliquota_issqn", type="decimal", example=0.00),
 *          @OA\Property(property="uf_issqn", type="string", description="Sigla de estado válido, pode ser informado vazio", example=""),
 *          @OA\Property(property="municipio_issqn", type="string", example=""),
 *          @OA\Property(property="lista_servicos_issqn", type="string", example=""),
 *          @OA\Property(property="situacao_tributacao_issqn", type="ENUM('N', 'R', 'S', 'I', '')", example=""),
 *          @OA\Property(property="id_exigibilidade_issqn", type="integer", example=""),
 *          @OA\Property(property="incentivo_fiscal_issqn", type="ENUM('S', 'N') default S", example="S"),
 *          @OA\Property(property="valor_deducoes_issqn", type="decimal", example=0.00),
 *          @OA\Property(property="valor_outras_retencoes_issqn", type="decimal", example=0.99),
 *          @OA\Property(property="valor_desconto_condicionado_issqn", type="decimal", example=0.00),
 *          @OA\Property(property="valor_retencoes_issqn", type="decimal", example=0.00),
 *          @OA\Property(property="codigo_servico_issqn", type="string", example="3"),
 *          @OA\Property(property="uf_incidencia_issqn", description="Sigla de estado válido, pode ser informado vazio", type="string", example=""),
 *          @OA\Property(property="processo_judicial_administrativo_issqn", type="string", example="")
 *     }
 * )
 */
class CadastroISSQNDTO implements RequestBodyConverterInterface
{
    
    /**
     * @JMS\SerializedName("situacao_tributacao_issqn")
     * @JMS\Type("string")
     * 
     * situacaoTributacaoIssqn
     * var string
     */
    private $situacaoTributacaoIssqn;
    /**
     * @JMS\SerializedName("padrao_nfs")
     * @JMS\Type("string")
     * 
     * padraoNFS
     * var string
     */
    private $padraoNFS;
    /**
     * @JMS\SerializedName("percentual_aliquota_issqn")
     * @JMS\Type("float")
     * 
     * percentualAliquotaIssqn
     * var string
     */
    private $percentualAliquotaIssqn;
    /**
     * @JMS\SerializedName("lista_servicos_issqn")
     * @JMS\Type("string")
     * 
     * listaServicosIssqn
     * var string
     */
    private $listaServicosIssqn;
    /**
     * @JMS\SerializedName("issqn_serie_nf")
     * @JMS\Type("string")
     * 
     * issqnSerieNf
     * var string
     */
    private $issqnSerieNf;
    /**
     * @JMS\SerializedName("issqn_cod_atividade_municipio")
     * @JMS\Type("string")
     * 
     * issqnCodAtividadeMunicipio
     * var string
     */
    private $issqnCodAtividadeMunicipio;
    /**
     * @JMS\SerializedName("uf_issqn")
     * @JMS\Type("string")
     * 
     * ufIssqn
     * var string
     */
    private $ufIssqn;
    /**
     * @JMS\SerializedName("municipio_issqn")
     * @JMS\Type("string")
     * 
     * municipioIssqn
     * var string
     */
    private $municipioIssqn;
    /**
     * @JMS\SerializedName("ano_certificado_issqn")
     * @JMS\Type("string")
     * 
     * anoCertificadoIssqn
     * var string
     */
    private $anoCertificadoIssqn;
    /**
     * @JMS\SerializedName("cmc")
     * @JMS\Type("string")
     * 
     * cmc
     * var string
     */
    private $cmc;
    /**
     * @JMS\SerializedName("cmc_cpf")
     * @JMS\Type("string")
     * 
     * cmcCpf
     * var string
     */
    private $cmcCpf;
    /**
     * @JMS\SerializedName("senha_cmc_cpf")
     * @JMS\Type("string")
     * 
     * senhaCmcCpf
     * var string
     */
    private $senhaCmcCpf;
    /**
     * @JMS\SerializedName("id_exigibilidade_issqn")
     * @JMS\Type("integer")
     * 
     * idExigibilidadeIssqn
     * var string
     */
    private $idExigibilidadeIssqn;
    /**
     * @JMS\SerializedName("incentivo_fiscal_issqn")
     * @JMS\Type("string")
     * 
     * incentivoFiscalIssqn
     * var string
     */
    private $incentivoFiscalIssqn;
    /**
     * @JMS\SerializedName("codigo_servico_issqn")
     * @JMS\Type("float")
     * 
     * codigoServicoIssqn
     * var string
     */
    private $codigoServicoIssqn;
    /**
     * @JMS\SerializedName("uf_incidencia_issqn")
     * @JMS\Type("string")
     * 
     * ufIncidenciaIssqn
     * var string
     */
    private $ufIncidenciaIssqn;
    /**
     * @JMS\SerializedName("uf_municipio_incidencia_issqn")
     * @JMS\Type("string")
     * 
     * ufMunicipioIncidenciaIssqn
     * var string
     */
    private $ufMunicipioIncidenciaIssqn;
    /**
     * @JMS\SerializedName("processo_judicial_administrativo_issqn")
     * @JMS\Type("string")
     * 
     * processoJudicialAdministrativoIssqn
     * var string
     */
    private $processoJudicialAdministrativoIssqn;
    /**
     * @JMS\SerializedName("cod_obra_issqn")
     * @JMS\Type("string")
     * 
     * codObraIssqn
     * var string
     */
    private $codObraIssqn;
    /**
     * @JMS\SerializedName("assinar_nfs")
     * @JMS\Type("string")
     * 
     * assinarNFS
     * var string
     */
    private $assinarNFS;
    /**
     * @JMS\SerializedName("informacoes_nota_fiscal")
     * @JMS\Type("string")
     * 
     * informacoesNotaFiscal
     * var string
     */
    private $informacoesNotaFiscal;

    /**
     * @JMS\SerializedName("valor_deducoes_issqn")
     * @JMS\Type("float")
     * 
     * valorDeducoesIssqn
     * var string
     */
    private $valorDeducoesIssqn;

     /**
     * @JMS\SerializedName("valor_retencoes_issqn")
     * @JMS\Type("float")
     * 
     * valorRetencoesIssqn
     * var string
     */
    private $valorRetencoesIssqn;

     /**
     * @JMS\SerializedName("valor_outras_retencoes_issqn")
     * @JMS\Type("float")
     * 
     * valorOutrasRetencoesIssqn
     * var string
     */
    private $valorOutrasRetencoesIssqn;

    /**
     * @JMS\SerializedName("valor_desconto_condicionado_issqn")
     * @JMS\Type("float")
     * 
     * valorDescontoCondicionadoIssqn
     * var string
     */
    private $valorDescontoCondicionadoIssqn;

    
    
    /**
     * Get the value of informacoesNotaFiscal
     */ 
    public function getInformacoesNotaFiscal()
    {
        return $this->informacoesNotaFiscal;
    }

    /**
     * Set the value of informacoesNotaFiscal
     *
     * @return  self
     */ 
    public function setInformacoesNotaFiscal($informacoesNotaFiscal)
    {
        $this->informacoesNotaFiscal = $informacoesNotaFiscal;

        return $this;
    }

    /**
     * Get the value of padraoNFS
     */ 
    public function getPadraoNFS()
    {
        return $this->padraoNFS;
    }

    /**
     * Set the value of padraoNFS
     *
     * @return  self
     */ 
    public function setPadraoNFS($padraoNFS)
    {
        $this->padraoNFS = $padraoNFS;

        return $this;
    }

    /**
     * Get the value of percentualAliquotaIssqn
     */ 
    public function getPercentualAliquotaIssqn()
    {
        return $this->percentualAliquotaIssqn;
    }

    /**
     * Set the value of percentualAliquotaIssqn
     *
     * @return  self
     */ 
    public function setPercentualAliquotaIssqn($percentualAliquotaIssqn)
    {
        $this->percentualAliquotaIssqn = $percentualAliquotaIssqn;

        return $this;
    }

    /**
     * Get the value of listaServicosIssqn
     */ 
    public function getListaServicosIssqn()
    {
        return $this->listaServicosIssqn;
    }

    /**
     * Set the value of listaServicosIssqn
     *
     * @return  self
     */ 
    public function setListaServicosIssqn($listaServicosIssqn)
    {
        $this->listaServicosIssqn = $listaServicosIssqn;

        return $this;
    }

    /**
     * Get the value of issqnSerieNf
     */ 
    public function getIssqnSerieNf()
    {
        return $this->issqnSerieNf;
    }

    /**
     * Set the value of issqnSerieNf
     *
     * @return  self
     */ 
    public function setIssqnSerieNf($issqnSerieNf)
    {
        $this->issqnSerieNf = $issqnSerieNf;

        return $this;
    }

    /**
     * Get the value of issqnCodAtividadeMunicipio
     */ 
    public function getIssqnCodAtividadeMunicipio()
    {
        return $this->issqnCodAtividadeMunicipio;
    }

    /**
     * Set the value of issqnCodAtividadeMunicipio
     *
     * @return  self
     */ 
    public function setIssqnCodAtividadeMunicipio($issqnCodAtividadeMunicipio)
    {
        $this->issqnCodAtividadeMunicipio = $issqnCodAtividadeMunicipio;

        return $this;
    }

    /**
     * Get the value of ufIssqn
     */ 
    public function getUfIssqn()
    {
        return $this->ufIssqn;
    }

    /**
     * Set the value of ufIssqn
     *
     * @return  self
     */ 
    public function setUfIssqn($ufIssqn)
    {
        $this->ufIssqn = $ufIssqn;

        return $this;
    }

    /**
     * Get the value of municipioIssqn
     */ 
    public function getMunicipioIssqn()
    {
        return $this->municipioIssqn;
    }

    /**
     * Set the value of municipioIssqn
     *
     * @return  self
     */ 
    public function setMunicipioIssqn($municipioIssqn)
    {
        $this->municipioIssqn = $municipioIssqn;

        return $this;
    }

    /**
     * Get the value of anoCertificadoIssqn
     */ 
    public function getAnoCertificadoIssqn()
    {
        return $this->anoCertificadoIssqn;
    }

    /**
     * Set the value of anoCertificadoIssqn
     *
     * @return  self
     */ 
    public function setAnoCertificadoIssqn($anoCertificadoIssqn)
    {
        $this->anoCertificadoIssqn = $anoCertificadoIssqn;

        return $this;
    }

    /**
     * Get the value of cmc
     */ 
    public function getCmc()
    {
        return $this->cmc;
    }

    /**
     * Set the value of cmc
     *
     * @return  self
     */ 
    public function setCmc($cmc)
    {
        $this->cmc = $cmc;

        return $this;
    }

    /**
     * Get the value of cmcCpf
     */ 
    public function getCmcCpf()
    {
        return $this->cmcCpf;
    }

    /**
     * Set the value of cmcCpf
     *
     * @return  self
     */ 
    public function setCmcCpf($cmcCpf)
    {
        $this->cmcCpf = $cmcCpf;

        return $this;
    }

    /**
     * Get the value of senhaCmcCpf
     */ 
    public function getSenhaCmcCpf()
    {
        return $this->senhaCmcCpf;
    }

    /**
     * Set the value of senhaCmcCpf
     *
     * @return  self
     */ 
    public function setSenhaCmcCpf($senhaCmcCpf)
    {
        $this->senhaCmcCpf = $senhaCmcCpf;

        return $this;
    }

    /**
     * Get the value of idExigibilidadeIssqn
     */ 
    public function getIdExigibilidadeIssqn()
    {
        return $this->idExigibilidadeIssqn;
    }

    /**
     * Set the value of idExigibilidadeIssqn
     *
     * @return  self
     */ 
    public function setIdExigibilidadeIssqn($idExigibilidadeIssqn)
    {
        $this->idExigibilidadeIssqn = $idExigibilidadeIssqn;

        return $this;
    }

    /**
     * Get the value of incentivoFiscalIssqn
     */ 
    public function getIncentivoFiscalIssqn()
    {
        return $this->incentivoFiscalIssqn;
    }

    /**
     * Set the value of incentivoFiscalIssqn
     *
     * @return  self
     */ 
    public function setIncentivoFiscalIssqn($incentivoFiscalIssqn)
    {
        $this->incentivoFiscalIssqn = $incentivoFiscalIssqn;

        return $this;
    }

    /**
     * Get the value of codigoServicoIssqn
     */ 
    public function getCodigoServicoIssqn()
    {
        return $this->codigoServicoIssqn;
    }

    /**
     * Set the value of codigoServicoIssqn
     *
     * @return  self
     */ 
    public function setCodigoServicoIssqn($codigoServicoIssqn)
    {
        $this->codigoServicoIssqn = $codigoServicoIssqn;

        return $this;
    }

    /**
     * Get the value of ufIncidenciaIssqn
     */ 
    public function getUfIncidenciaIssqn()
    {
        return $this->ufIncidenciaIssqn;
    }

    /**
     * Set the value of ufIncidenciaIssqn
     *
     * @return  self
     */ 
    public function setUfIncidenciaIssqn($ufIncidenciaIssqn)
    {
        $this->ufIncidenciaIssqn = $ufIncidenciaIssqn;

        return $this;
    }

    /**
     * Get the value of ufMunicipioIncidenciaIssqn
     */ 
    public function getUfMunicipioIncidenciaIssqn()
    {
        return $this->ufMunicipioIncidenciaIssqn;
    }

    /**
     * Set the value of ufMunicipioIncidenciaIssqn
     *
     * @return  self
     */ 
    public function setUfMunicipioIncidenciaIssqn($ufMunicipioIncidenciaIssqn)
    {
        $this->ufMunicipioIncidenciaIssqn = $ufMunicipioIncidenciaIssqn;

        return $this;
    }

    /**
     * Get the value of processoJudicialAdministrativoIssqn
     */ 
    public function getProcessoJudicialAdministrativoIssqn()
    {
        return $this->processoJudicialAdministrativoIssqn;
    }

    /**
     * Set the value of processoJudicialAdministrativoIssqn
     *
     * @return  self
     */ 
    public function setProcessoJudicialAdministrativoIssqn($processoJudicialAdministrativoIssqn)
    {
        $this->processoJudicialAdministrativoIssqn = $processoJudicialAdministrativoIssqn;

        return $this;
    }

    /**
     * Get the value of codObraIssqn
     */ 
    public function getCodObraIssqn()
    {
        return $this->codObraIssqn;
    }

    /**
     * Set the value of codObraIssqn
     *
     * @return  self
     */ 
    public function setCodObraIssqn($codObraIssqn)
    {
        $this->codObraIssqn = $codObraIssqn;

        return $this;
    }

    /**
     * Get the value of assinarNFS
     */ 
    public function getAssinarNFS()
    {
        return $this->assinarNFS;
    }

    /**
     * Set the value of assinarNFS
     *
     * @return  self
     */ 
    public function setAssinarNFS($assinarNFS)
    {
        $this->assinarNFS = $assinarNFS;

        return $this;
    }

    /**
     * Get the value of situacaoTributacaoIssqn
     */ 
    public function getSituacaoTributacaoIssqn()
    {
        return $this->situacaoTributacaoIssqn;
    }

    /**
     * Set the value of situacaoTributacaoIssqn
     *
     * @return  self
     */ 
    public function setSituacaoTributacaoIssqn($situacaoTributacaoIssqn)
    {
        $this->situacaoTributacaoIssqn = $situacaoTributacaoIssqn;

        return $this;
    }

    /**
     * Get the value of valorDeducoesIssqn
     */ 
    public function getValorDeducoesIssqn()
    {
        return $this->valorDeducoesIssqn;
    }

    /**
     * Set the value of valorDeducoesIssqn
     *
     * @return  self
     */ 
    public function setValorDeducoesIssqn($valorDeducoesIssqn)
    {
        $this->valorDeducoesIssqn = $valorDeducoesIssqn;

        return $this;
    }

    /**
     * Get the value of valorOutrasRetencoesIssqn
     */ 
    public function getValorOutrasRetencoesIssqn()
    {
        return $this->valorOutrasRetencoesIssqn;
    }

    /**
     * Set the value of valorOutrasRetencoesIssqn
     *
     * @return  self
     */ 
    public function setValorOutrasRetencoesIssqn($valorOutrasRetencoesIssqn)
    {
        $this->valorOutrasRetencoesIssqn = $valorOutrasRetencoesIssqn;

        return $this;
    }

    /**
     * Get the value of valorDescontoCondicionadoIssqn
     */ 
    public function getValorDescontoCondicionadoIssqn()
    {
        return $this->valorDescontoCondicionadoIssqn;
    }

    /**
     * Set the value of valorDescontoCondicionadoIssqn
     *
     * @return  self
     */ 
    public function setValorDescontoCondicionadoIssqn($valorDescontoCondicionadoIssqn)
    {
        $this->valorDescontoCondicionadoIssqn = $valorDescontoCondicionadoIssqn;

        return $this;
    }

    /**
     * Get the value of valorRetencoesIssqn
     */ 
    public function getValorRetencoesIssqn()
    {
        return $this->valorRetencoesIssqn;
    }

    /**
     * Set the value of valorRetencoesIssqn
     *
     * @return  self
     */ 
    public function setValorRetencoesIssqn($valorRetencoesIssqn)
    {
        $this->valorRetencoesIssqn = $valorRetencoesIssqn;

        return $this;
    }
}