<?php

namespace App\DTO\Grades;

use App\Services\Extensions\RequestBodyConverterInterface;
use JMS\Serializer\Annotation as JMS;
use OpenApi\Annotations as OA;


/**
 * @author Tiago Franco
 * DTO para as operacoes envolvendo dados das graddes 
 * @JMS\AccessType("public_method")
 * 
 * 
 * Class GradeDTO
 * @package App\DTO\Grades
 * @OA\Schema(
 *     schema="grade_dto",
 *     type="object",
 *     title="Grade DTO",
 *     properties={
 *          @OA\Property(property="codigo_barra", type="string"),
 *          @OA\Property(property="codigo_barra_pai", type="string"),
 *          @OA\Property(property="codigo_interno", type="string"),
 *          @OA\Property(property="qtd_atual", type="number"),
 *          @OA\Property(property="qtd_minima", type="number"),
 *          @OA\Property(property="qtd_locacao", type="number"),
 *          @OA\Property(property="qtd_locacao_locado", type="number"),
 *          @OA\Property(property="valor_custo", type="number"),
 *          @OA\Property(property="valor_varejo_avista", type="number"),
 *          @OA\Property(property="valor_varejo_aprazo", type="number"),
 *          @OA\Property(property="valor_atacado_avista", type="number"),
 *          @OA\Property(property="valor_atacado_aprazo", type="number"),
 *          @OA\Property(property="porc_varejo_avista", type="number"),
 *          @OA\Property(property="porc_varejo_aprazo", type="number"),
 *          @OA\Property(property="porc_atacado_avista", type="number"),
 *          @OA\Property(property="porc_atacado_aprazo", type="number"),
 *          @OA\Property(property="ativo", type="integer"),
 *          @OA\Property(property="alteracao", type="string"),
 *          @OA\Property(property="atributos_valores", type="array", @OA\Items()),
 *     }
 * )
 */
class GradeDTO implements RequestBodyConverterInterface
{
    /**
     * @JMS\SerializedName("codigo_barra")
     * @JMS\Type("string")
     * 
     * codigoBarra
     * var string
     */
    private $codigoBarra;

    /**
     * @JMS\SerializedName("codigo_barra_pai")
     * @JMS\Type("string")
     * 
     * codigoBarraPai
     * var string
     */
    private $codigoBarraPai;

    /**
     * @JMS\SerializedName("codigo_interno")
     * @JMS\Type("string")
     * 
     * codigoInterno
     * var string
     */
    private $codigoInterno;
    
    /**
     * @JMS\SerializedName("qtd_atual")
     * @JMS\Type("string")
     * 
     * qtdAtual
     * var string
     */
    private $qtdAtual = 0;
    /**
     * @JMS\SerializedName("qtd_minima")
     * @JMS\Type("string")
     * 
     * qtdMinima
     * var string
     */
    private $qtdMinima;
    /**
     * @JMS\SerializedName("qtd_locacao")
     * @JMS\Type("string")
     * 
     * qtdLocacao
     * var string
     */
    private $qtdLocacao;
    /**
     * @JMS\SerializedName("qtd_locacao_locado")
     * @JMS\Type("string")
     * 
     * qtdLocacaoLocado
     * var string
     */
    private $qtdLocacaoLocado;
    /**
     * @JMS\SerializedName("valor_custo")
     * @JMS\Type("string")
     * 
     * valorCusto
     * var string
     */
    private $valorCusto;
    /**
     * @JMS\SerializedName("valor_varejo_avista")
     * @JMS\Type("string")
     * 
     * valorVarejoAvista
     * var string
     */
    private $valorVarejoAvista;
    /**
     * @JMS\SerializedName("valor_varejo_aprazo")
     * @JMS\Type("string")
     * 
     * valorVarejoAprazo
     * var string
     */
    private $valorVarejoAprazo;
    /**
     * @JMS\SerializedName("valor_atacado_avista")
     * @JMS\Type("string")
     * 
     * valorAtacadoAvista
     * var string
     */
    private $valorAtacadoAvista;
    /**
     * @JMS\SerializedName("valor_atacado_aprazo")
     * @JMS\Type("string")
     * 
     * valorAtacadoAprazo
     * var string
     */
    private $valorAtacadoAprazo;
    /**
     * @JMS\SerializedName("porc_varejo_avista")
     * @JMS\Type("string")
     * 
     * porcVarejoAvista
     * var string
     */
    private $porcVarejoAvista;
    /**
     * @JMS\SerializedName("porc_varejo_aprazo")
     * @JMS\Type("string")
     * 
     * porcVarejoAprazo
     * var string
     */
    private $porcVarejoAprazo;
    /**
     * @JMS\SerializedName("porc_atacado_avista")
     * @JMS\Type("string")
     * 
     * porcAtacadoAvista
     * var string
     */
    private $porcAtacadoAvista;
    /**
     * @JMS\SerializedName("porc_atacado_aprazo")
     * @JMS\Type("string")
     * 
     * porcAtacadoAprazo
     * var string
     */
    private $porcAtacadoAprazo;
    /**
     * @JMS\SerializedName("ativo")
     * @JMS\Type("string")
     * 
     * ativo
     * var string
     */
    private $ativo = 1;
    /**
     * @JMS\SerializedName("alteracao")
     * @JMS\Type("string")
     * 
     * alteracao
     * var string
     */
    private $alteracao;

    /**
     * @JMS\SerializedName("atributos_valores")
     * @JMS\Type("array")
     * 
     * atributosValores
     * var array
     */
    private $atributosValores;

    /**
     * Get the value of codigoBarra
     */ 
    public function getCodigoBarra()
    {
        return $this->codigoBarra;
    }

    /**
     * Set the value of codigoBarra
     *
     * @return  self
     */ 
    public function setCodigoBarra($codigoBarra)
    {
        $this->codigoBarra = $codigoBarra;

        return $this;
    }

    /**
     * Get the value of codigoInterno
     */ 
    public function getCodigoInterno()
    {
        return $this->codigoInterno;
    }

    /**
     * Set the value of codigoInterno
     *
     * @return  self
     */ 
    public function setCodigoInterno($codigoInterno)
    {
        $this->codigoInterno = $codigoInterno;

        return $this;
    }

    /**
     * Get the value of qtdAtual
     */ 
    public function getQtdAtual()
    {
        return $this->qtdAtual;
    }

    /**
     * Set the value of qtdAtual
     *
     * @return  self
     */ 
    public function setQtdAtual($qtdAtual)
    {
        $this->qtdAtual = $qtdAtual;

        return $this;
    }

    /**
     * Get the value of qtdMinima
     */ 
    public function getQtdMinima()
    {
        return $this->qtdMinima;
    }

    /**
     * Set the value of qtdMinima
     *
     * @return  self
     */ 
    public function setQtdMinima($qtdMinima)
    {
        $this->qtdMinima = $qtdMinima;

        return $this;
    }

    /**
     * Get the value of qtdLocacao
     */ 
    public function getQtdLocacao()
    {
        return $this->qtdLocacao;
    }

    /**
     * Set the value of qtdLocacao
     *
     * @return  self
     */ 
    public function setQtdLocacao($qtdLocacao)
    {
        $this->qtdLocacao = $qtdLocacao;

        return $this;
    }

    /**
     * Get the value of qtdLocacaoLocado
     */ 
    public function getQtdLocacaoLocado()
    {
        return $this->qtdLocacaoLocado;
    }

    /**
     * Set the value of qtdLocacaoLocado
     *
     * @return  self
     */ 
    public function setQtdLocacaoLocado($qtdLocacaoLocado)
    {
        $this->qtdLocacaoLocado = $qtdLocacaoLocado;

        return $this;
    }

    /**
     * Get the value of valorCusto
     */ 
    public function getValorCusto()
    {
        return $this->valorCusto;
    }

    /**
     * Set the value of valorCusto
     *
     * @return  self
     */ 
    public function setValorCusto($valorCusto)
    {
        $this->valorCusto = $valorCusto;

        return $this;
    }

    /**
     * Get the value of valorVarejoAvista
     */ 
    public function getValorVarejoAvista()
    {
        return $this->valorVarejoAvista;
    }

    /**
     * Set the value of valorVarejoAvista
     *
     * @return  self
     */ 
    public function setValorVarejoAvista($valorVarejoAvista)
    {
        $this->valorVarejoAvista = $valorVarejoAvista;

        return $this;
    }

    /**
     * Get the value of valorVarejoAprazo
     */ 
    public function getValorVarejoAprazo()
    {
        return $this->valorVarejoAprazo;
    }

    /**
     * Set the value of valorVarejoAprazo
     *
     * @return  self
     */ 
    public function setValorVarejoAprazo($valorVarejoAprazo)
    {
        $this->valorVarejoAprazo = $valorVarejoAprazo;

        return $this;
    }

    /**
     * Get the value of valorAtacadoAvista
     */ 
    public function getValorAtacadoAvista()
    {
        return $this->valorAtacadoAvista;
    }

    /**
     * Set the value of valorAtacadoAvista
     *
     * @return  self
     */ 
    public function setValorAtacadoAvista($valorAtacadoAvista)
    {
        $this->valorAtacadoAvista = $valorAtacadoAvista;

        return $this;
    }

    /**
     * Get the value of valorAtacadoAprazo
     */ 
    public function getValorAtacadoAprazo()
    {
        return $this->valorAtacadoAprazo;
    }

    /**
     * Set the value of valorAtacadoAprazo
     *
     * @return  self
     */ 
    public function setValorAtacadoAprazo($valorAtacadoAprazo)
    {
        $this->valorAtacadoAprazo = $valorAtacadoAprazo;

        return $this;
    }

    /**
     * Get the value of porcVarejoAvista
     */ 
    public function getPorcVarejoAvista()
    {
        return $this->porcVarejoAvista;
    }

    /**
     * Set the value of porcVarejoAvista
     *
     * @return  self
     */ 
    public function setPorcVarejoAvista($porcVarejoAvista)
    {
        $this->porcVarejoAvista = $porcVarejoAvista;

        return $this;
    }

    /**
     * Get the value of porcVarejoAprazo
     */ 
    public function getPorcVarejoAprazo()
    {
        return $this->porcVarejoAprazo;
    }

    /**
     * Set the value of porcVarejoAprazo
     *
     * @return  self
     */ 
    public function setPorcVarejoAprazo($porcVarejoAprazo)
    {
        $this->porcVarejoAprazo = $porcVarejoAprazo;

        return $this;
    }

    /**
     * Get the value of porcAtacadoAvista
     */ 
    public function getPorcAtacadoAvista()
    {
        return $this->porcAtacadoAvista;
    }

    /**
     * Set the value of porcAtacadoAvista
     *
     * @return  self
     */ 
    public function setPorcAtacadoAvista($porcAtacadoAvista)
    {
        $this->porcAtacadoAvista = $porcAtacadoAvista;

        return $this;
    }

    /**
     * Get the value of porcAtacadoAprazo
     */ 
    public function getPorcAtacadoAprazo()
    {
        return $this->porcAtacadoAprazo;
    }

    /**
     * Set the value of porcAtacadoAprazo
     *
     * @return  self
     */ 
    public function setPorcAtacadoAprazo($porcAtacadoAprazo)
    {
        $this->porcAtacadoAprazo = $porcAtacadoAprazo;

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
     * Get the value of alteracao
     */ 
    public function getAlteracao()
    {
        return $this->alteracao;
    }

    /**
     * Set the value of alteracao
     *
     * @return  self
     */ 
    public function setAlteracao($alteracao)
    {
        $this->alteracao = $alteracao;

        return $this;
    }

    /**
     * Get the value of atributosValores
     */ 
    public function getAtributosValores()
    {
        return $this->atributosValores;
    }

    /**
     * Set the value of atributosValores
     *
     * @return  self
     */ 
    public function setAtributosValores($atributosValores)
    {
        $this->atributosValores = $atributosValores;

        return $this;
    }

    /**
     * Get the value of codigoBarraPai
     */ 
    public function getCodigoBarraPai()
    {
        return $this->codigoBarraPai;
    }

    /**
     * Set the value of codigoBarraPai
     *
     * @return  self
     */ 
    public function setCodigoBarraPai($codigoBarraPai)
    {
        $this->codigoBarraPai = $codigoBarraPai;

        return $this;
    }
}