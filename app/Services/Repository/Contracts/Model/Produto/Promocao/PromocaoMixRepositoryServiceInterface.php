<?php

namespace App\Services\Repository\Contracts\Model\Produto\Promocao;

use App\DTO\FrenteCaixa\PromocaoMixDTO;
use App\DTO\FrenteCaixa\PromocaoMixDescontoDTO;
use App\DTO\FrenteCaixa\PromocaoMixTempoDTO;
use App\Services\Repository\Contracts\RepositoryServiceInterface;

/**
 * @author Tiago Franco
 * Interface basica referente a abstração
 * do padrao repository service 
 */
interface PromocaoMixRepositoryServiceInterface extends RepositoryServiceInterface
{
    public function salvar(PromocaoMixDTO $promocaoMixDTO);

    public function editar(PromocaoMixDTO $promocaoMixDTO);

    public function salvarDesconto(PromocaoMixDescontoDTO $promocaoMixDescontoDTO);

    public function salvarItemVendaDesconto(PromocaoMixTempoDTO $promocaoMixTempoDTO);

    //por default ativa a promocao
    public function ativaInativaPromocaoMix(int $idPromocaoMix, $status = 1);

    public function excluirDescontos(int $idPromocaoMix);
}