<?php

namespace App\Services\Repository\Eloquent\Model\Produto;

use App\Model\Produto\ProdutoBeneficioFiscal;
use App\DTO\Produtos\CadastroInformacoesFiscaisDTO;
use App\Services\Repository\Eloquent\WebControlEloquentRepositoryService;
use App\Repository\Eloquent\Model\Produto\ProdutoBeneficioFiscalEloquentRepository;
use App\Services\Repository\Contracts\Model\Produto\ProdutoBeneficioFiscalRepositoryServiceInterface;

/**
 * @author Tiago Franco
 * Servico de acesso ao repositorio de Model
 * Deverá possuir os metodos contendo operacoes de escrita 
 * do modelo implementando a interface do repositorio
 */
class ProdutoBeneficioFiscalEloquentRepositoryService extends WebControlEloquentRepositoryService implements ProdutoBeneficioFiscalRepositoryServiceInterface
{
    public function __construct(ProdutoBeneficioFiscal $model, ProdutoBeneficioFiscalEloquentRepository $repository)
    {
        parent::__construct($model, $repository);
    }

    public function salvarCodBeneficiosCst(int $idProduto, CadastroInformacoesFiscaisDTO $informacoesFiscais)
    {
        $itens = [];
        foreach ($informacoesFiscais->getCodBeneficiosCst() as $codBeneficiosCst) {
            $itens[] = $this->updateOrCreate(['id_produto'  => $idProduto, 
                                             'cBeneFiscal' => $codBeneficiosCst->getCodBeneficio(), 
                                             'cst'         => $codBeneficiosCst->getCst()
                                             ]); 
        }
        return $itens;
    }
}
