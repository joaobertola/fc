<?php

namespace App\DTO\Lite;

use App\Services\Extensions\RequestBodyConverterInterface;
use JMS\Serializer\Annotation as JMS;

/**
 * @author João Vitor Ferreira
 * Manipulação de dados vinfos do lite para sincronismo
 * @JMS\AccessType("public_method")
 */

class LiteDTO implements RequestBodyConverterInterface
{
    /**
     * @JMS\SerializedName("data_ultimo_sincronismo")
     * @JMS\Type("string")
     *
     * data_ultimo_sincronismo
     * var string
     */
    private $dataUltimoSincronismo;

    /**
     * @JMS\SerializedName("tabelas")
     * @JMS\Type("array")
     *
     * tabelas
     * var array
     */
    private $tabelas;

    /**
     * Get the value of dataUltimoSincronismo
     */
    public function getDataUltimoSincronismo()
    {
        return $this->dataUltimoSincronismo;
    }

    /**
     * Set the value of dataUltimoSincronismo
     *
     * @return  self
     */
    public function setDataUltimoSincronismo($dataUltimoSincronismo)
    {
        $this->dataUltimoSincronismo = $dataUltimoSincronismo;

        return $this;
    }

    /**
     * Get the value of tabelas
     */
    public function getTabelas()
    {
        return $this->tabelas;
    }

    /**
     * Set the value of tabelas
     *
     * @return  self
     */
    public function setTabelas($tabelas)
    {
        $this->tabelas = $tabelas;

        return $this;
    }
}
