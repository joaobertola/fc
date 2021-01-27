<?php

namespace App\Services\FrenteCaixa\Promocoes;

use App\Model\Venda\Venda;
use App\Services\Utils\CodesApi;
use Illuminate\Support\Facades\DB;
use App\DTO\FrenteCaixa\PromocaoMixDTO;
use App\Exceptions\ApiWebControlException;
use App\DTO\FrenteCaixa\PromocaoMixTempoDTO;
use App\DTO\FrenteCaixa\PromocaoMixDescontoDTO;
use App\Repository\Contracts\Model\Venda\VendaRepositoryInterface;
use App\Repository\Contracts\Model\Produto\ProdutoRepositoryInterface;
use App\Services\Repository\Contracts\Model\Produto\Promocao\PromocaoMixRepositoryServiceInterface;

/**
 * @author Tiago Franco
 * Servico responsavel pelo processamento
 * envolvendo
 */
class PromocaoMixService
{
    /**
     * @var PromocaoMixRepositoryServiceInterface
     */
    private $_promocaoMixRepositoryService;

    /**
     * @var ProdutoRepositoryInterface
     */
    private $_produtoRepository;

    /**
     * @var VendaRepositoryInterface
     */
    private $_vendaRepository;

    public function __construct(
        PromocaoMixRepositoryServiceInterface $promocaoMixRepositoryService,
        ProdutoRepositoryInterface $produtoRepository,
        VendaRepositoryInterface $vendaRepository
    ) {
        $this->_promocaoMixRepositoryService = $promocaoMixRepositoryService;
        $this->_produtoRepository            = $produtoRepository;
        $this->_vendaRepository              = $vendaRepository;
    }

    /**
     * Servico disponivel para salvar as promocoes
     */
    public function gravarPromocaoMix(PromocaoMixDTO $promocaoMixDTO)
    {
        $custosVarejo  = $this->_produtoRepository->getCustoVarejoDeCadaProduto($promocaoMixDTO->getProdutos());
        $totalDesconto = $promocaoMixDTO->getValorTotalDesconto(array_sum($custosVarejo));
        $promocaoMixDTO->setTotalDesconto($totalDesconto);

        try {
            DB::beginTransaction();
            //Salva a nova promocao
            $promocaoMix = $this->_promocaoMixRepositoryService->salvar($promocaoMixDTO);

            //salva novas configuracoes dos descontos
            $this->salvarMixDescontos($promocaoMixDTO, $promocaoMix->id, $custosVarejo);

            DB::commit();

            return $promocaoMix;
        } catch (\Throwable $th) {
            DB::rollBack();
            throw $th;
        }
    }

    /**
     * Servico disponivel para alterar as promocoes
     */
    public function editarPromocaoMix(PromocaoMixDTO $promocaoMixDTO)
    {
        $custosVarejo  = $this->_produtoRepository->getCustoVarejoDeCadaProduto($promocaoMixDTO->getProdutos());
        $totalDesconto = $promocaoMixDTO->getValorTotalDesconto(array_sum($custosVarejo));
        $promocaoMixDTO->setTotalDesconto($totalDesconto);

        try {
            DB::beginTransaction();
            //editar os dados da promocao
            $promocaoMix = $this->_promocaoMixRepositoryService->editar($promocaoMixDTO);
            //inclui configuracoes anteriores de descontos
            $this->_promocaoMixRepositoryService->excluirDescontos($promocaoMix->id);
            //salva novas configuracoes dos descontos
            $this->salvarMixDescontos($promocaoMixDTO, $promocaoMix->id, $custosVarejo);

            DB::commit();

            return $promocaoMix;
        } catch (\Throwable $th) {
            DB::rollBack();
            throw $th;
        }
    }

    /**
     * Funcao private para salvar a configuracao de desconto para cada produto
     */
    private function salvarMixDescontos(PromocaoMixDTO $promocaoMixDTO, $idPromocaoMix, array $custosVarejo)
    {
        #rateio dos descontos
        $valorDesconto = $promocaoMixDTO->getValor();
        $qtdProduto    = count($promocaoMixDTO->getProdutos());
        $rateio        = round(($valorDesconto / $qtdProduto), 2);
        $firstRateio   = $valorDesconto - ($rateio * $qtdProduto) + $rateio;


        for ($i = 0; $i < $qtdProduto; $i++) {

            $idProduto = $promocaoMixDTO->getProdutos()[$i];
            $promocaoMixDescontoDTO = new PromocaoMixDescontoDTO();
            $promocaoMixDescontoDTO->setIdProduto($idProduto);
            $promocaoMixDescontoDTO->setIdPromocaoMix($idPromocaoMix);
            if ($i == 0)
                $promocaoMixDescontoDTO->setValor($promocaoMixDTO->getValorTotalDescontoProduto($custosVarejo[$idProduto], $firstRateio));
            else
                $promocaoMixDescontoDTO->setValor($promocaoMixDTO->getValorTotalDescontoProduto($custosVarejo[$idProduto], $rateio));
            $this->_promocaoMixRepositoryService->salvarDesconto($promocaoMixDescontoDTO);
        }
    }

    /**
     * Servico disponivel para alterar as promocoes
     */
    public function registarItemVendaDesconto(PromocaoMixTempoDTO $promocaoMixTempoDTO)
    {
        $venda   = $this->_vendaRepository->getVendaByItemVenda($promocaoMixTempoDTO->getIdVendaItem());
        if (!$venda) {
            throw new ApiWebControlException("item de venda inválido", CodesApi::PARAMETROINVALIDO);
        }
        $produto = $this->_produtoRepository->find($promocaoMixTempoDTO->getIdProduto());
        if (!$produto) {
            throw new ApiWebControlException("produto inválido", CodesApi::PARAMETROINVALIDO);
        }

        $promocaoMixTempoDTO->setIdVenda($venda->id);
        return $this->_promocaoMixRepositoryService->salvarItemVendaDesconto($promocaoMixTempoDTO);
    }


    public function calcularDescontoVenda(Venda $venda)
    {
        $promosMix = $this->_promocaoMixRepositoryService->getItensProdutosPromocao($venda->id);
        $promocoes = [];

        foreach ($promosMix as $promoMix) {

            if (!array_key_exists ($promoMix->id_promo_mix, $promocoes)) {
                $promocoes[$promoMix->id_promo_mix] = [];
            }            
            
            $promocoes[$promoMix->id_promo_mix][] = $promoMix;
        }
        
        $promosMix = array();

        foreach ($promocoes as $idPromocao => $produtos) {
            $totalItens   = array_sum(array_column($produtos, "quantidade_add_produto"));
            $qtd_desconto = 0;
    
            if ($totalItens >= $produtos[0]->quantidade_promo) {
                $qtd_desconto = floor($totalItens / $produtos[0]->quantidade_promo);
            }

            $promosMix[$idPromocao]["produtos"]       = $produtos;
            $promosMix[$idPromocao]["qtd_desconto"]   = $qtd_desconto;
            $promosMix[$idPromocao]["total_desconto"] = $produtos[0]->total_desconto;
        }

        return $promosMix;
    }
}
