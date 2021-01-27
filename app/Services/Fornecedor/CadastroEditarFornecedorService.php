<?php

namespace App\Services\Fornecedor;

use Illuminate\Support\Facades\DB;
use App\Model\Fornecedor\Fornecedor;
use App\DTO\Fornecedor\CadastrarFornecedorDTO;
use App\Services\BaseInform\ManterBaseInformeService;
use App\Services\Repository\Contracts\Model\Fornecedor\FornecedorRepositoryServiceInterface;
use App\Services\Repository\Eloquent\Model\Fornecedor\FornecedorBancoEloquentRepositoryService;
use App\Services\Repository\Eloquent\Model\Fornecedor\FornecedorProdutoEloquentRepositoryService;
use App\Services\Repository\Eloquent\Model\Fornecedor\FornecedorTransportadoraEloquentRepositoryService;

/**
 * @author Tiago Franco
 * Servico responsavel pelo processamento
 * envolvendo cadastro/edicao dos fornecedores
 */
class CadastroEditarFornecedorService
{
    /**
     * @var ManterBaseInformeService
     */
    private $_manterBaseInformeService;

    /**
     * @var FornecedorProdutoEloquentRepositoryService
     */
    private $_fornecedorProdutoEloquentRepositoryService;
    /**
     * @var FornecedorBancoEloquentRepositoryService
     */
    private $_fornecedorBancoEloquentRepositoryService;
    /**
     * @var FornecedorTransportadoraEloquentRepositoryService
     */
    private $_fornecedorTransportadoraEloquentRepositoryService;

    /**
     * @var FornecedorRepositoryServiceInterface
     */
    private $_fornecedorRepositoryService;


    public function __construct(
        FornecedorRepositoryServiceInterface $fornecedorRepositoryService,
        FornecedorProdutoEloquentRepositoryService $fornecedorProdutoEloquentRepositoryService,
        FornecedorBancoEloquentRepositoryService $fornecedorBancoEloquentRepositoryService,
        FornecedorTransportadoraEloquentRepositoryService $fornecedorTransportadoraEloquentRepositoryService,
        ManterBaseInformeService $manterBaseInformeService
    ) {
        $this->_manterBaseInformeService                          = $manterBaseInformeService;
        $this->_fornecedorRepositoryService                       = $fornecedorRepositoryService;
        $this->_fornecedorProdutoEloquentRepositoryService        = $fornecedorProdutoEloquentRepositoryService;
        $this->_fornecedorBancoEloquentRepositoryService          = $fornecedorBancoEloquentRepositoryService;
        $this->_fornecedorTransportadoraEloquentRepositoryService = $fornecedorTransportadoraEloquentRepositoryService;
    }

    public function salvarFornecedor(CadastrarFornecedorDTO $cadastrarFornecedorDTO)
    {
        $saida = [];
        try {
            DB::beginTransaction();
            $fornecedor   = $this->_fornecedorRepositoryService->novoFornecedor($cadastrarFornecedorDTO);
            $idFornecedor = $fornecedor->id;

            $saida['fornecedor']      = $fornecedor;
            $saida['produtos']        = $this->salvarProdutos($idFornecedor, $cadastrarFornecedorDTO);
            $saida['transportadoras'] = $this->salvarTransportadoras($idFornecedor, $cadastrarFornecedorDTO);
            $saida['dados_bancarios'] = $this->salvarDadosBancarios($idFornecedor, $cadastrarFornecedorDTO);
            $saida['base_inform']     = $this->_manterBaseInformeService->processarSCPCFornecedor($cadastrarFornecedorDTO);

            DB::commit();
        } catch (\Throwable $th) {
            DB::rollBack();
            throw $th;
        }

        return $saida;
    }

    public function editarFornecedor(Fornecedor $fornecedor, CadastrarFornecedorDTO $cadastrarFornecedorDTO)
    {
        $saida = [];
        try {
            DB::beginTransaction();
            $this->_fornecedorRepositoryService->editarFornecedor($fornecedor->id, $cadastrarFornecedorDTO);
            $idFornecedor = $fornecedor->id;

            $this->_fornecedorProdutoEloquentRepositoryService->deleteBy([["id_fornecedor", '=', $idFornecedor]]);
            $this->_fornecedorBancoEloquentRepositoryService->deleteBy([["id_fornecedor", '=', $idFornecedor]]);
            $this->_fornecedorTransportadoraEloquentRepositoryService->deleteBy([["id_fornecedor", '=', $idFornecedor]]);

            $saida['fornecedor']      = $this->_fornecedorRepositoryService->find($idFornecedor);
            $saida['produtos']        = $this->salvarProdutos($idFornecedor, $cadastrarFornecedorDTO);
            $saida['transportadoras'] = $this->salvarTransportadoras($idFornecedor, $cadastrarFornecedorDTO);
            $saida['dados_bancarios'] = $this->salvarDadosBancarios($idFornecedor, $cadastrarFornecedorDTO);
            $saida['base_inform']     = $this->_manterBaseInformeService->processarSCPCFornecedor($cadastrarFornecedorDTO);

            DB::commit();
        } catch (\Throwable $th) {
            DB::rollBack();
            throw $th;
        }

        return $saida;
    }

    private function salvarProdutos(int $idFornecedor, CadastrarFornecedorDTO $cadastrarFornecedorDTO)
    {
        $produtos = [];
        foreach ($cadastrarFornecedorDTO->getProdutos() as $descricaoProduto) {
            $produtos[] = $this->_fornecedorProdutoEloquentRepositoryService->salvarProdutoFornecedor($idFornecedor, $descricaoProduto);
        }
        return $produtos;
    }

    private function salvarTransportadoras(int $idFornecedor, CadastrarFornecedorDTO $cadastrarFornecedorDTO)
    {
        $transportadoras = array();
        foreach ($cadastrarFornecedorDTO->getTransportadoras() as $descricaoTransportadora) {
            $transportadoras[] = $this->_fornecedorTransportadoraEloquentRepositoryService->salvarTransportadoraFornecedor($idFornecedor, $descricaoTransportadora);
        }
        return $transportadoras;
    }

    private function salvarDadosBancarios(int $idFornecedor, CadastrarFornecedorDTO $cadastrarFornecedorDTO)
    {
        $dadosBancarios = array();
        foreach ($cadastrarFornecedorDTO->getDadosBancarios() as $dadosBancario) {
            $dadosBancarios[] = $this->_fornecedorBancoEloquentRepositoryService->salvarDadosBancariosFornecedor($idFornecedor, $dadosBancario);
        }
        return $dadosBancarios;
    }
}
