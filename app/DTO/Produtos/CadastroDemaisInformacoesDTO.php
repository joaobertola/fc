<?php

namespace App\DTO\Produtos;

use App\Services\Utils\DataUtils;
use JMS\Serializer\Annotation as JMS;
use App\Services\Extensions\RequestBodyConverterInterface;
use OpenApi\Annotations as OA;

/**
 * @author Tiago Franco
 * DTO para os 
 * @JMS\AccessType("public_method")
 * 
 * Class CadastroDemaisInformacoesDTO
 * @package App\DTO\Produtos
 * @OA\Schema(
 *     schema="outras_informacoes_produto_dto",
 *     type="object",
 *     title="Demais Informações do Produtos",
 *     properties={
 *          @OA\Property(property="cor", type="string", example="branco"),
 *          @OA\Property(property="tamanho", type="string", example="PQ"),
 *          @OA\Property(property="localizacao", type="string", example="Gôndola 11"),
 *          @OA\Property(property="fabricante", type="string", example="Nome do fabricante"),
 *          @OA\Property(property="origem_produto_ni", type="integer", example=""),
 *          @OA\Property(property="data_fabricacao", type="integer", example="2000-02-02"),
 *          @OA\Property(property="data_validade", type="integer", example="2000-05-02"),
 *          @OA\Property(property="edicao", description="default 0 inativo", type="integer", example=1),
 *          @OA\Property(property="descricao_detalhada", type="string"),
 *          @OA\Property(property="vender_estoque_zerado", description="ENUM(S,N) default N", type="string", example="S"),
 *          @OA\Property(property="solicitar_valor", description="ENUM(S,N) default N", type="string", example="N"),
 *          @OA\Property(property="enviar_producao", description="ENUM(S,N) default S", type="string", example="S")
 *     }
 * )
 */
class CadastroDemaisInformacoesDTO implements RequestBodyConverterInterface
{
    /**
     * @JMS\SerializedName("cor")
     * @JMS\Type("string")
     * 
     * cor
     * var string
     */
    private $cor;

    /**
     * @JMS\SerializedName("tamanho")
     * @JMS\Type("string")
     * 
     * tamanho
     * var string
     */
    private $tamanho;

    /**
     * @JMS\SerializedName("localizacao")
     * @JMS\Type("string")
     * 
     * localizacao
     * var string
     */
    private $localizacao;

    /**
     * @JMS\SerializedName("fabricante")
     * @JMS\Type("string")
     * 
     * fabricante
     * var string
     */
    private $fabricante;

    /**
     * @JMS\SerializedName("origem_produto_ni")
     * @JMS\Type("string")
     * 
     * origemProdutoNi
     * var string
     */
    private $origemProdutoNi;

    /**
     * @JMS\SerializedName("data_fabricacao")
     * @JMS\Type("string")
     * 
     * dataFabricacao
     * var string
     */
    private $dataFabricacao;

    /**
     * @JMS\SerializedName("data_validade")
     * @JMS\Type("string")
     * 
     * dataValidade
     * var string
     */
    private $dataValidade;

    /**
     * @JMS\SerializedName("edicao")
     * @JMS\Type("string")
     * 
     * edicao
     * var string
     */
    private $edicao;

    /**
     * @JMS\SerializedName("descricao_detalhada")
     * @JMS\Type("string")
     * 
     * descricaoDetalhada
     * var string
     */
    private $descricaoDetalhada;

    /**
     * @JMS\SerializedName("vender_estoque_zerado")
     * @JMS\Type("string")
     * 
     * venderEstoqueZerado
     * var string
     */
    private $venderEstoqueZerado;

    /**
     * @JMS\SerializedName("solicitar_valor")
     * @JMS\Type("string")
     * 
     * solicitarValor
     * var string
     */
    private $solicitarValor;

    /**
     * @JMS\SerializedName("enviar_producao")
     * @JMS\Type("string")
     * 
     * enviarProducao
     * var string
     */
    private $enviarProducao;

    /**
     * Get the value of tamanho
     */ 
    public function getTamanho()
    {
        return $this->tamanho;
    }

    /**
     * Set the value of tamanho
     *
     * @return  self
     */ 
    public function setTamanho($tamanho)
    {
        $this->tamanho = $tamanho;

        return $this;
    }

    /**
     * Get the value of localizacao
     */ 
    public function getLocalizacao()
    {
        return $this->localizacao;
    }

    /**
     * Set the value of localizacao
     *
     * @return  self
     */ 
    public function setLocalizacao($localizacao)
    {
        $this->localizacao = $localizacao;

        return $this;
    }

    /**
     * Get the value of fabricante
     */ 
    public function getFabricante()
    {
        return $this->fabricante;
    }

    /**
     * Set the value of fabricante
     *
     * @return  self
     */ 
    public function setFabricante($fabricante)
    {
        $this->fabricante = $fabricante;

        return $this;
    }

    /**
     * Get the value of origemProdutoNi
     */ 
    public function getOrigemProdutoNi()
    {
        return $this->origemProdutoNi;
    }

    /**
     * Set the value of origemProdutoNi
     *
     * @return  self
     */ 
    public function setOrigemProdutoNi($origemProdutoNi)
    {
        $this->origemProdutoNi = $origemProdutoNi;

        return $this;
    }

    /**
     * Get the value of dataFabricacao
     */ 
    public function getDataFabricacao()
    {
        return $this->dataFabricacao;
    }

    /**
     * Set the value of dataFabricacao
     *
     * @return  self
     */ 
    public function setDataFabricacao($dataFabricacao)
    {
        if(!empty($dataFabricacao))
            $this->dataFabricacao = DataUtils::getData($dataFabricacao);

        return $this;
    }

    /**
     * Get the value of dataValidade
     */ 
    public function getDataValidade()
    {
        return $this->dataValidade;
    }

    /**
     * Set the value of dataValidade
     *
     * @return  self
     */ 
    public function setDataValidade($dataValidade)
    {
        if(!empty($dataValidade))
            $this->dataValidade = DataUtils::getData($dataValidade);

        return $this;
    }

    /**
     * Get the value of edicao
     */ 
    public function getEdicao()
    {
        return $this->edicao;
    }

    /**
     * Set the value of edicao
     *
     * @return  self
     */ 
    public function setEdicao($edicao)
    {
        $this->edicao = $edicao;

        return $this;
    }

    /**
     * Get the value of descricaoDetalhada
     */ 
    public function getDescricaoDetalhada()
    {
        return $this->descricaoDetalhada;
    }

    /**
     * Set the value of descricaoDetalhada
     *
     * @return  self
     */ 
    public function setDescricaoDetalhada($descricaoDetalhada)
    {
        $this->descricaoDetalhada = $descricaoDetalhada;

        return $this;
    }

    /**
     * Get the value of venderEstoqueZerado
     */ 
    public function getVenderEstoqueZerado()
    {
        return $this->venderEstoqueZerado;
    }

    /**
     * Set the value of venderEstoqueZerado
     *
     * @return  self
     */ 
    public function setVenderEstoqueZerado($venderEstoqueZerado)
    {
        $this->venderEstoqueZerado = $venderEstoqueZerado;

        return $this;
    }

    /**
     * Get the value of solicitarValor
     */ 
    public function getSolicitarValor()
    {
        return $this->solicitarValor;
    }

    /**
     * Set the value of solicitarValor
     *
     * @return  self
     */ 
    public function setSolicitarValor($solicitarValor)
    {
        $this->solicitarValor = $solicitarValor;

        return $this;
    }

    /**
     * Get the value of enviarProducao
     */ 
    public function getEnviarProducao()
    {
        return $this->enviarProducao;
    }

    /**
     * Set the value of enviarProducao
     *
     * @return  self
     */ 
    public function setEnviarProducao($enviarProducao)
    {
        $this->enviarProducao = $enviarProducao;

        return $this;
    }

    /**
     * Get the value of cor
     */ 
    public function getCor()
    {
        return $this->cor;
    }

    /**
     * Set the value of cor
     *
     * @return  self
     */ 
    public function setCor($cor)
    {
        $this->cor = $cor;

        return $this;
    }
}