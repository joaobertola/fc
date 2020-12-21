<?php

namespace App\DTO\Produtos;

use JMS\Serializer\Annotation as JMS;
use App\DTO\Produtos\CadastroProdutoDTO;


/**
 * @author Tiago Franco
 * DTO para os 
 * @JMS\AccessType("public_method")
 */
class CadastroProdutoCompletoDTO extends CadastroProdutoDTO
{

    /**
     * @JMS\SerializedName("demais_informacoes")
     * @JMS\Type("App\DTO\Produtos\CadastroDemaisInformacoesDTO")
     * 
     * @var CadastroDemaisInformacoesDTO
     * demaisInformacoes
     * var string
     */
    private $demaisInformacoes;

    /**
     * @JMS\SerializedName("informacoes_nutricionais")
     * @JMS\Type("App\DTO\Produtos\CadastroInformacoesNutricionaisDTO")
     * 
     * @var CadastroInformacoesNutricionaisDTO
     * informacoesNutricionais
     * var string
     */
    private $informacoesNutricionais;

    /**
     * @JMS\SerializedName("informacoes_fiscais")
     * @JMS\Type("App\DTO\Produtos\CadastroInformacoesFiscaisDTO")
     * 
     * @var CadastroInformacoesFiscaisDTO
     * informacoesFiscais
     * var string
     */
    private $informacoesFiscais;

    /**
     * @JMS\SerializedName("calculos_fretes")
     * @JMS\Type("App\DTO\Produtos\CadastroCalculosFretesDTO")
     * 
     * @var CadastroCalculosFretesDTO
     * calculosFretes
     * var string
     */
    private $calculosFretes;
    
    /**
     * Get the value of informacoesNutricionais
     */
    public function getInformacoesNutricionais()
    {
        return $this->informacoesNutricionais;
    }

    /**
     * Set the value of informacoesNutricionais
     *
     * @return  self
     */
    public function setInformacoesNutricionais($informacoesNutricionais)
    {
        $this->informacoesNutricionais = $informacoesNutricionais;

        return $this;
    }

    /**
     * Get the value of informacoesFiscais
     */
    public function getInformacoesFiscais()
    {
        return $this->informacoesFiscais;
    }

    /**
     * Set the value of informacoesFiscais
     *
     * @return  self
     */
    public function setInformacoesFiscais($informacoesFiscais)
    {
        $this->informacoesFiscais = $informacoesFiscais;

        return $this;
    }

    /**
     * Get the value of demaisInformacoes
     */
    public function getDemaisInformacoes()
    {
        return $this->demaisInformacoes;
    }

    /**
     * Set the value of demaisInformacoes
     *
     * @return  self
     */
    public function setDemaisInformacoes($demaisInformacoes)
    {
        $this->demaisInformacoes = $demaisInformacoes;

        return $this;
    }

    /**
     * Get the value of calculosFretes
     */
    public function getCalculosFretes()
    {
        return $this->calculosFretes;
    }

    /**
     * Set the value of calculosFretes
     *
     * @return  self
     */
    public function setCalculosFretes($calculosFretes)
    {
        $this->calculosFretes = $calculosFretes;

        return $this;
    }
}
