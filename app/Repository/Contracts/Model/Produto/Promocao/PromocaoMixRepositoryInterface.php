<?php

namespace App\Repository\Contracts\Model\Produto\Promocao;

use App\Repository\Contracts\RepositoryInterface;

/**
 * @author Tiago Franco
 * Interface basica referente a abstração
 * do padrao repository de consultas
 */
interface PromocaoMixRepositoryInterface extends RepositoryInterface
{
    public function getItensProdutosPromocao(int $idVenda); 
}
