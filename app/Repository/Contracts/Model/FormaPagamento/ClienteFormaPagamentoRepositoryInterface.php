<?php

namespace App\Repository\Contracts\Model\FormaPagamento;

use App\Repository\Contracts\RepositoryInterface;

/**
 * @author Tiago Franco
 * Interface basica referente a abstração
 * do padrao repository de consultas
 */
interface ClienteFormaPagamentoRepositoryInterface extends RepositoryInterface
{
    public function retornaFormasPagamentosCadastro();

}
