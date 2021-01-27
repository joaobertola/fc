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
 * Class CadastroInformacoesFiscaisDTO
 * @package App\DTO\Produtos
 * @OA\Schema(
 *     schema="informacoes_fiscais_produto_dto",
 *     type="object",
 *     title="Informações fiscais do Produto",
 *     properties={
 *          @OA\Property(property="anp", type="string", example="620505001"),
 *          @OA\Property(property="cod_beneficios_cst", ref="#/components/schemas/informacoes_beneficios_fiscais_produto_dto"),
 *          @OA\Property(property="combate_pobreza", type="char", description="ENUM(S,N) default S", example="S"),
 *          @OA\Property(property="glp", ref="#/components/schemas/informacoes_fiscais_glp_dto"),
 *          @OA\Property(property="cfop", type="integer", example=14),
 *          @OA\Property(property="tributacao_sobre_lucro", type="char", description="ENUM(S,N) default S", example="N"),
 *          @OA\Property(property="icms", ref="#/components/schemas/informacoes_fiscais_icms_dto"),
 *          @OA\Property(property="ipi", ref="#/components/schemas/informacoes_fiscais_ipi_dto"),
 *          @OA\Property(property="pis", ref="#/components/schemas/informacoes_fiscais_pis_dto"),
 *          @OA\Property(property="pis_st", ref="#/components/schemas/informacoes_fiscais_pis_st_dto"),
 *          @OA\Property(property="cofins", ref="#/components/schemas/informacoes_fiscais_cofins_dto"),
 *          @OA\Property(property="cofins_st", ref="#/components/schemas/informacoes_fiscais_cofins_st_dto"),
 *          @OA\Property(property="issqn", ref="#/components/schemas/informacoes_fiscais_issqn_dto"),
 *          @OA\Property(property="cupom_fiscal", ref="#/components/schemas/informacoes_fiscais_cupom_fiscal_dto"),
 *          @OA\Property(property="unidade_tributaria", type="string", example="19"),
 *          @OA\Property(property="qtd_tributaria", type="string", example="25")
 *     }
 * )
 */
class CadastroInformacoesFiscaisDTO implements RequestBodyConverterInterface
{
    /**
     * @JMS\SerializedName("anp")
     * @JMS\Type("string")
     * 
     * anp
     * var string
     */
    private $anp;
    
    /**
     * @JMS\SerializedName("cod_beneficios_cst")
     * @JMS\Type("array<App\DTO\Produtos\CadastroCodBeneficioCSTDTO>")
     * 
     * codBeneficiosCst
     * var string
     */
    private $codBeneficiosCst;

    /**
     * @JMS\SerializedName("combate_pobreza")
     * @JMS\Type("string")
     * 
     * combatePobreza
     * var string
     */
    private $combatePobreza = "S";

    /**
     * @JMS\SerializedName("glp")
     * @JMS\Type("App\DTO\Produtos\CadastroGLPDTO")
     * 
     * glp
     * @var CadastroGLPDTO
     */
    private $glp;

    /**
     * @JMS\SerializedName("cfop")
     * @JMS\Type("integer")
     * 
     * cfop
     * var string
     */
    private $cfop;

    /**
     * @JMS\SerializedName("tributacao_sobre_lucro")
     * @JMS\Type("string")
     * 
     * tributacaoSobreLucro
     * var string
     */
    private $tributacaoSobreLucro;

    /**
     * @JMS\SerializedName("icms")
     * @JMS\Type("App\DTO\Produtos\CadastroICMSDTO")
     * 
     * icms
     * @var CadastroICMSDTO
     */
    private $icms;

    /**
     * @JMS\SerializedName("ipi")
     * @JMS\Type("App\DTO\Produtos\CadastroIPIDTO")
     * 
     * ipi
     * @var CadastroIPIDTO
     */
    private $ipi;

    /**
     * @JMS\SerializedName("pis")
     * @JMS\Type("App\DTO\Produtos\CadastroPISDTO")
     * 
     * pis
     * @var CadastroPISDTO
     */
    private $pis;

    /**
     * @JMS\SerializedName("pis_st")
     * @JMS\Type("App\DTO\Produtos\CadastroPISSTDTO")
     * 
     * pisSt
     * @var CadastroPISSTDTO
     */
    private $pisSt;

    /**
     * @JMS\SerializedName("cofins")
     * @JMS\Type("App\DTO\Produtos\CadastroCOFINSDTO")
     * 
     * cofins
     * @var CadastroCOFINSDTO
     */
    private $cofins;

    /**
     * @JMS\SerializedName("cofins_st")
     * @JMS\Type("App\DTO\Produtos\CadastroCOFINSSTDTO")
     * 
     * cofinsSt
     * @var CadastroCOFINSSTDTO
     */
    private $cofinsSt;

    /**
     * @JMS\SerializedName("issqn")
     * @JMS\Type("App\DTO\Produtos\CadastroISSQNDTO")
     * 
     * issqn
     * @var CadastroISSQNDTO
     */
    private $issqn;

    /**
     * @JMS\SerializedName("cupom_fiscal")
     * @JMS\Type("App\DTO\Produtos\CadastroCupomFiscalDTO")
     * 
     * cupomFiscal
     * @var CadastroCupomFiscalDTO
     */
    private $cupomFiscal;

    /**
     * @JMS\SerializedName("unidade_tributaria")
     * @JMS\Type("integer")
     * 
     * unidadeTributaria
     * var string
     */
    private $unidadeTributaria = null;

    /**
     * @JMS\SerializedName("qtd_tributaria")
     * @JMS\Type("integer")
     * 
     * qtdTributaria
     * var string
     */
    private $qtdTributaria = 0;

    /**
     * Get the value of cupomFiscal
     */ 
    public function getCupomFiscal()
    {
        return $this->cupomFiscal;
    }

    /**
     * Set the value of cupomFiscal
     *
     * @return  self
     */ 
    public function setCupomFiscal($cupomFiscal)
    {
        $this->cupomFiscal = $cupomFiscal;

        return $this;
    }

    /**
     * Get the value of codBeneficiosCst
     */ 
    public function getCodBeneficiosCst()
    {
        return $this->codBeneficiosCst;
    }

    /**
     * Set the value of codBeneficiosCst
     *
     * @return  self
     */ 
    public function setCodBeneficiosCst($codBeneficiosCst)
    {
        $this->codBeneficiosCst = $codBeneficiosCst;

        return $this;
    }

    /**
     * Get the value of combatePobreza
     */ 
    public function getCombatePobreza()
    {
        return $this->combatePobreza;
    }

    /**
     * Set the value of combatePobreza
     *
     * @return  self
     */ 
    public function setCombatePobreza($combatePobreza)
    {
        $this->combatePobreza = $combatePobreza;

        return $this;
    }

    /**
     * Get the value of glp
     */ 
    public function getGlp()
    {
        return $this->glp;
    }

    /**
     * Set the value of glp
     *
     * @return  self
     */ 
    public function setGlp($glp)
    {
        $this->glp = $glp;

        return $this;
    }

    /**
     * Get the value of cfop
     */ 
    public function getCfop()
    {
        return $this->cfop;
    }

    /**
     * Set the value of cfop
     *
     * @return  self
     */ 
    public function setCfop($cfop)
    {
        $this->cfop = $cfop;

        return $this;
    }

    /**
     * Get the value of tributacaoSobreLucro
     */ 
    public function getTributacaoSobreLucro()
    {
        return $this->tributacaoSobreLucro;
    }

    /**
     * Set the value of tributacaoSobreLucro
     *
     * @return  self
     */ 
    public function setTributacaoSobreLucro($tributacaoSobreLucro)
    {
        $this->tributacaoSobreLucro = $tributacaoSobreLucro;

        return $this;
    }

    /**
     * Get the value of icms
     */ 
    public function getIcms()
    {
        return $this->icms;
    }

    /**
     * Set the value of icms
     *
     * @return  self
     */ 
    public function setIcms($icms)
    {
        $this->icms = $icms;

        return $this;
    }

    /**
     * Get the value of ipi
     */ 
    public function getIpi()
    {
        return $this->ipi;
    }

    /**
     * Set the value of ipi
     *
     * @return  self
     */ 
    public function setIpi($ipi)
    {
        $this->ipi = $ipi;

        return $this;
    }

    /**
     * Get the value of pis
     */ 
    public function getPis()
    {
        return $this->pis;
    }

    /**
     * Set the value of pis
     *
     * @return  self
     */ 
    public function setPis($pis)
    {
        $this->pis = $pis;

        return $this;
    }

    /**
     * Get the value of cofins
     */ 
    public function getCofins()
    {
        return $this->cofins;
    }

    /**
     * Set the value of cofins
     *
     * @return  self
     */ 
    public function setCofins($cofins)
    {
        $this->cofins = $cofins;

        return $this;
    }

    /**
     * Get the value of issqn
     */ 
    public function getIssqn()
    {
        return $this->issqn;
    }

    /**
     * Set the value of issqn
     *
     * @return  self
     */ 
    public function setIssqn($issqn)
    {
        $this->issqn = $issqn;

        return $this;
    }

    /**
     * Get the value of anp
     */ 
    public function getAnp()
    {
        return $this->anp;
    }

    /**
     * Set the value of anp
     *
     * @return  self
     */ 
    public function setAnp($anp)
    {
        $this->anp = $anp;

        return $this;
    }

    /**
     * Get the value of unidadeTributaria
     */ 
    public function getUnidadeTributaria()
    {
        return $this->unidadeTributaria;
    }

    /**
     * Set the value of unidadeTributaria
     *
     * @return  self
     */ 
    public function setUnidadeTributaria($unidadeTributaria)
    {
        $this->unidadeTributaria = $unidadeTributaria;

        return $this;
    }

    /**
     * Get the value of qtdTributaria
     */ 
    public function getQtdTributaria()
    {
        return $this->qtdTributaria;
    }

    /**
     * Set the value of qtdTributaria
     *
     * @return  self
     */ 
    public function setQtdTributaria($qtdTributaria)
    {
        $this->qtdTributaria = $qtdTributaria;

        return $this;
    }

    /**
     * Get pis
     *
     * @return  CadastroPISSTDTO
     */ 
    public function getPisSt()
    {
        return $this->pisSt;
    }

    /**
     * Set pis
     *
     * @param  CadastroPISSTDTO  $pisSt  pis
     *
     * @return  self
     */ 
    public function setPisSt(CadastroPISSTDTO $pisSt)
    {
        $this->pisSt = $pisSt;

        return $this;
    }

    /**
     * Get cofinsSt
     *
     * @return  CadastroCOFINSSTDTO
     */ 
    public function getCofinsSt()
    {
        return $this->cofinsSt;
    }

    /**
     * Set cofinsSt
     *
     * @param  CadastroCOFINSSTDTO  $cofinsSt  cofinsSt
     *
     * @return  self
     */ 
    public function setCofinsSt(CadastroCOFINSSTDTO $cofinsSt)
    {
        $this->cofinsSt = $cofinsSt;

        return $this;
    }
}