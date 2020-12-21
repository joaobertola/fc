<?php

namespace App\Services\Repository\Contracts\Model\Nfe;

use App\DTO\Produtos\CadastroCupomFiscalDTO;
use App\Services\Repository\Contracts\RepositoryServiceInterface;

/**
 * @author Tiago Franco
 * Interface basica referente a abstração
 * do padrao repository service 
 */
interface NfeCupomFiscalRepositoryServiceInterface extends RepositoryServiceInterface
{
    public function vincularCumpoFiscal(int $idProduto, CadastroCupomFiscalDTO $cadastroCupomFiscalDTO);
}