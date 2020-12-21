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
 * Class CadastroInformacoesNutricionaisDTO
 * @package App\DTO\Produtos
 * @OA\Schema(
 *     schema="informacoes_nutricionais_produto_dto",
 *     type="object",
 *     title="Informações Nutricionais do Produto",
 *     properties={
 *          @OA\Property(property="dias_validade", type="integer", example=10),
 *          @OA\Property(property="porcao", type="string", example="10KG"),
 *          @OA\Property(property="calorias", type="integer", example=10),
 *          @OA\Property(property="caboidrato", type="integer", example=10),
 *          @OA\Property(property="proteinas", type="integer", example=10),
 *          @OA\Property(property="gordura_total", type="integer", example=10),
 *          @OA\Property(property="gordura_saturada", type="integer", example=10),
 *          @OA\Property(property="colesterol", type="integer", example=10),
 *          @OA\Property(property="gord_trans", type="integer", example=10),
 *          @OA\Property(property="fibra", type="integer", example=10),
 *          @OA\Property(property="calcio", type="integer", example=10),
 *          @OA\Property(property="ferro", type="integer", example=10),
 *          @OA\Property(property="sodio", type="integer", example=10)
 *     }
 * )
 */
class CadastroInformacoesNutricionaisDTO implements RequestBodyConverterInterface
{
    /**
     * @JMS\SerializedName("dias_validade")
     * @JMS\Type("integer")
     * 
     * diasValidade
     * var string
     */
    private $diasValidade;
    /**
     * @JMS\SerializedName("porcao")
     * @JMS\Type("string")
     * 
     * qtdDiasValidade
     * var string
     */
    private $porcao;
    /**
     * @JMS\SerializedName("calorias")
     * @JMS\Type("integer")
     * 
     * qtdDiasValidade
     * var string
     */
    private $calorias;
    /**
     * @JMS\SerializedName("caboidrato")
     * @JMS\Type("integer")
     * 
     * qtdDiasValidade
     * var string
     */
    private $caboidrato;
    /**
     * @JMS\SerializedName("proteinas")
     * @JMS\Type("integer")
     * 
     * qtdDiasValidade
     * var string
     */
    private $proteinas;
    /**
     * @JMS\SerializedName("gordura_total")
     * @JMS\Type("integer")
     * 
     * gorduraTotal
     * var string
     */
    private $gorduraTotal;
    /**
     * @JMS\SerializedName("gordura_saturada")
     * @JMS\Type("integer")
     * 
     * gorduraSaturada
     * var string
     */
    private $gorduraSaturada;
    /**
     * @JMS\SerializedName("colesterol")
     * @JMS\Type("integer")
     * 
     * qtdDiasValidade
     * var string
     */
    private $colesterol;
    /**
     * @JMS\SerializedName("gord_trans")
     * @JMS\Type("integer")
     * 
     * gorduraTrans
     * var string
     */
    private $gorduraTrans;
    /**
     * @JMS\SerializedName("fibra")
     * @JMS\Type("integer")
     * 
     * qtdDiasValidade
     * var string
     */
    private $fibra;
    /**
     * @JMS\SerializedName("calcio")
     * @JMS\Type("integer")
     * 
     * qtdDiasValidade
     * var string
     */
    private $calcio;
    /**
     * @JMS\SerializedName("ferro")
     * @JMS\Type("integer")
     * 
     * qtdDiasValidade
     * var string
     */
    private $ferro;
    /**
     * @JMS\SerializedName("sodio")
     * @JMS\Type("integer")
     * 
     * qtdDiasValidade
     * var string
     */
    private $sodio;

    /**
     * Get the value of diasValidade
     */ 
    public function getDiasValidade()
    {
        return $this->diasValidade;
    }

    /**
     * Set the value of diasValidade
     *
     * @return  self
     */ 
    public function setDiasValidade($diasValidade)
    {
        $this->diasValidade = $diasValidade;

        return $this;
    }

    /**
     * Get the value of porcao
     */ 
    public function getPorcao()
    {
        return $this->porcao;
    }

    /**
     * Set the value of porcao
     *
     * @return  self
     */ 
    public function setPorcao($porcao)
    {
        $this->porcao = $porcao;

        return $this;
    }

    /**
     * Get the value of calorias
     */ 
    public function getCalorias()
    {
        return $this->calorias;
    }

    /**
     * Set the value of calorias
     *
     * @return  self
     */ 
    public function setCalorias($calorias)
    {
        $this->calorias = $calorias;

        return $this;
    }

    /**
     * Get the value of caboidrato
     */ 
    public function getCaboidrato()
    {
        return $this->caboidrato;
    }

    /**
     * Set the value of caboidrato
     *
     * @return  self
     */ 
    public function setCaboidrato($caboidrato)
    {
        $this->caboidrato = $caboidrato;

        return $this;
    }

    /**
     * Get the value of proteinas
     */ 
    public function getProteinas()
    {
        return $this->proteinas;
    }

    /**
     * Set the value of proteinas
     *
     * @return  self
     */ 
    public function setProteinas($proteinas)
    {
        $this->proteinas = $proteinas;

        return $this;
    }

    /**
     * Get the value of gorduraTotal
     */ 
    public function getGorduraTotal()
    {
        return $this->gorduraTotal;
    }

    /**
     * Set the value of gorduraTotal
     *
     * @return  self
     */ 
    public function setGorduraTotal($gorduraTotal)
    {
        $this->gorduraTotal = $gorduraTotal;

        return $this;
    }

    /**
     * Get the value of gorduraSaturada
     */ 
    public function getGorduraSaturada()
    {
        return $this->gorduraSaturada;
    }

    /**
     * Set the value of gorduraSaturada
     *
     * @return  self
     */ 
    public function setGorduraSaturada($gorduraSaturada)
    {
        $this->gorduraSaturada = $gorduraSaturada;

        return $this;
    }

    /**
     * Get the value of colesterol
     */ 
    public function getColesterol()
    {
        return $this->colesterol;
    }

    /**
     * Set the value of colesterol
     *
     * @return  self
     */ 
    public function setColesterol($colesterol)
    {
        $this->colesterol = $colesterol;

        return $this;
    }

    /**
     * Get the value of gorduraTrans
     */ 
    public function getGorduraTrans()
    {
        return $this->gorduraTrans;
    }

    /**
     * Set the value of gorduraTrans
     *
     * @return  self
     */ 
    public function setGorduraTrans($gorduraTrans)
    {
        $this->gorduraTrans = $gorduraTrans;

        return $this;
    }

    /**
     * Get the value of fibra
     */ 
    public function getFibra()
    {
        return $this->fibra;
    }

    /**
     * Set the value of fibra
     *
     * @return  self
     */ 
    public function setFibra($fibra)
    {
        $this->fibra = $fibra;

        return $this;
    }

    /**
     * Get the value of calcio
     */ 
    public function getCalcio()
    {
        return $this->calcio;
    }

    /**
     * Set the value of calcio
     *
     * @return  self
     */ 
    public function setCalcio($calcio)
    {
        $this->calcio = $calcio;

        return $this;
    }

    /**
     * Get the value of ferro
     */ 
    public function getFerro()
    {
        return $this->ferro;
    }

    /**
     * Set the value of ferro
     *
     * @return  self
     */ 
    public function setFerro($ferro)
    {
        $this->ferro = $ferro;

        return $this;
    }

    /**
     * Get the value of sodio
     */ 
    public function getSodio()
    {
        return $this->sodio;
    }

    /**
     * Set the value of sodio
     *
     * @return  self
     */ 
    public function setSodio($sodio)
    {
        $this->sodio = $sodio;

        return $this;
    }
}