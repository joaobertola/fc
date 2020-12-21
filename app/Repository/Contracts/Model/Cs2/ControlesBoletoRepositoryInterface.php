<?php

namespace App\Repository\Contracts\Model\Cs2;

use App\Repository\Contracts\RepositoryInterface;

/**
 * @author Tiago Franco
 * Interface basica referente a abstração
 * do padrao repository de consultas
 */
interface ControlesBoletoRepositoryInterface extends RepositoryInterface
{
    public function getConfigControlesBoleto();
}
