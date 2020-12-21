<?php

namespace App\Repository\Contracts\Model\Lite;

use App\Repository\Contracts\RepositoryInterface;

/**
 * @author Tiago Franco
 * Interface basica referente a abstração
 * do padrao repository de consultas
 */
interface LiteRepositoryInterface extends RepositoryInterface
{
    public function verificaTabelas($liteDTO);
}
