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
 * Class CadastroCodBeneficioCSTDTO
 * @package App\DTO\Produtos
 * @OA\Schema(
 *     schema="informacoes_beneficios_fiscais_produto_dto",
 *     type="object",
 *     title="Informações dos benefícios fiscais do Produto",
 *     properties={
 *          @OA\Property(property="cst", type="integer", example="20"),
 *          @OA\Property(property="cod_beneficio", type="string", example="RS051514")
 *     }
 * )
 */
class CadastroCodBeneficioCSTDTO implements RequestBodyConverterInterface
{
    /**
     * @JMS\SerializedName("cod_beneficio")
     * @JMS\Type("string")
     * 
     * codBeneficio
     * var string
     */
    private $codBeneficio = "";

    /**
     * @JMS\SerializedName("cst")
     * @JMS\Type("integer")
     * 
     * cst
     * var string
     */
    private $cst = 0;

    /**
     * Get the value of codBeneficio
     */ 
    public function getCodBeneficio()
    {
        return $this->codBeneficio;
    }

    /**
     * Set the value of codBeneficio
     *
     * @return  self
     */ 
    public function setCodBeneficio($codBeneficio)
    {
        $this->codBeneficio = $codBeneficio;

        return $this;
    }

    /**
     * Get the value of cst
     */ 
    public function getCst()
    {
        return $this->cst;
    }

    /**
     * Set the value of cst
     *
     * @return  self
     */ 
    public function setCst($cst)
    {
        $this->cst = $cst;

        return $this;
    }
}