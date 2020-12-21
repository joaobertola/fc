<?php

namespace App\Services\Vendas;

use Illuminate\Support\Facades\DB;
use App\Services\Auth\UsuarioLogadoService;
use App\DTO\Vendas\Consignacao\DevolverProdutosDTO;
use App\Services\Repository\Contracts\Model\Produto\GradeRepositoryServiceInterface;
use App\Services\Repository\Contracts\Model\Venda\VendaItemRepositoryServiceInterface;
use App\Services\Repository\Contracts\Model\Venda\VendaConsignacaoDevolucaoRepositoryServiceInterface;

/**
 * @author Tiago Franco
 * Servico responsavel pelo processamento
 * envolvendo operacoes de vendas consignadas
 */
class ConsignacaoService
{
    /**
     * @var VendaConsignacaoDevolucaoRepositoryServiceInterface
     */
    protected $_vendaConsignacaoDevolucaoRepositoryService;

    /**
     * @var VendaItemRepositoryServiceInterface
     */
    protected $_vendaItemRepositoryService;

    /**
     * @var GradeRepositoryServiceInterface
     */
    protected $_gradeRepositoryService;

    /**
     * @var UsuarioLogadoService
     */
    protected $_usuarioLogadoService;

    public function __construct(
        VendaConsignacaoDevolucaoRepositoryServiceInterface $vendaConsignacaoDevolucaoRepositoryService,
        VendaItemRepositoryServiceInterface $vendaItemRepositoryService,
        GradeRepositoryServiceInterface $gradeRepositoryService,
        UsuarioLogadoService $usuarioLogadoService
    ) {
        $this->_vendaConsignacaoDevolucaoRepositoryService = $vendaConsignacaoDevolucaoRepositoryService;
        $this->_vendaItemRepositoryService                 = $vendaItemRepositoryService;
        $this->_gradeRepositoryService                     = $gradeRepositoryService;
        $this->_usuarioLogadoService                       = $usuarioLogadoService;
    }

    public function devolverProdutos(DevolverProdutosDTO $devolverProdutosDTO)
    {
        foreach ($devolverProdutosDTO->getVendaItens() as $itemVendaDTO) {
            $vendaItem = $this->_vendaItemRepositoryService->find($itemVendaDTO->getIdItemVenda());

            if ($vendaItem) {

                $grade = $this->_gradeRepositoryService->findOneBy([["id_grade", '=', $vendaItem->id_grade]]);

                if ($grade) {
                    try {
                        DB::beginTransaction();
                        $this->atualizarItemVenda($vendaItem, $itemVendaDTO->getQtde());
                        $this->devolverEstoque($grade, $itemVendaDTO->getQtde());
                        $this->devolverEstoquePrincipal($grade, $itemVendaDTO->getQtde());
                        $this->gravaVendaConsignacaoDevolucao($vendaItem, $grade, $itemVendaDTO->getQtde());
                        DB::commit();
                    } catch (\Throwable $th) {
                        DB::rollBack();
                        throw $th;
                    }                    
                }
            }
        }
    }

    private function atualizarItemVenda($itemVenda, $qtdDevolvida)
    {
        $qtd = $itemVenda->qtd - $qtdDevolvida;

        if ($qtd > 0) {
            $this->_vendaItemRepositoryService->setarQtde($itemVenda->id, $qtd);
        } else {
            $this->_vendaItemRepositoryService->setarEstornado($itemVenda->id);
        }
    }

    private function devolverEstoque($grade, $qtdDevolvida)
    {
        $this->_gradeRepositoryService->atualizarQtdeEstoque($grade->id_grade, $grade->qtd_atual + $qtdDevolvida);
    }


    private function devolverEstoquePrincipal($grade, $qtdDevolvida)
    {
        $gradePai = $this->_gradeRepositoryService->findOneBy([
            ['codigo_barra', '=', $grade->codigo_barra_pai],
            ['id_produto', '=', $grade->id_produto],
            ['id_cadastro', '=', $grade->id_cadastro]
        ]);

        $this->devolverEstoque($gradePai, $qtdDevolvida);
    }
    
    private function gravaVendaConsignacaoDevolucao($itemVenda, $grade, $qtdDevolvida)
    {
        $idUsuario = empty($this->_usuarioLogadoService->getIdUsuarioLogado()) ? $itemVenda->id_usuario : $this->_usuarioLogadoService->getIdUsuarioLogado();
        $dados = [
            "id_venda"      => $itemVenda->id_venda,
            "id_venda_item" => $itemVenda->id,
            "id_cadastro"   => $this->_usuarioLogadoService->getIdCadastroLogado(),
            "id_usuario"    => $idUsuario,
            "qtd_anterior"  => $grade->qtd_atual,
            "qtd"           => $grade->qtd_atual + $qtdDevolvida
        ];

        $this->_vendaConsignacaoDevolucaoRepositoryService->create($dados);
    }
}
