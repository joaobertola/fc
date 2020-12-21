<?php

namespace App\Services\Produtos;

use App\Services\Utils\CodesApi;
use Illuminate\Support\Facades\DB;
use App\DTO\Produtos\CadastroProdutoDTO;
use App\Exceptions\ApiWebControlException;
use App\DTO\Produtos\CadastroCalculosFretesDTO;
use App\DTO\Produtos\CadastroProdutoCompletoDTO;
use App\DTO\Produtos\CadastroDemaisInformacoesDTO;
use App\DTO\Produtos\CadastroInformacoesFiscaisDTO;
use App\DTO\Produtos\CadastroInformacoesNutricionaisDTO;
use App\Entity\Model\Produto\ProdutoInterface;
use App\Services\Repository\Contracts\Model\Produto\GradeRepositoryServiceInterface;
use App\Services\Repository\Contracts\Model\Produto\ProdutoRepositoryServiceInterface;
use App\Services\Repository\Contracts\Model\Nfe\NfeProdutoIPIRepositoryServiceInterface;
use App\Services\Repository\Contracts\Model\Nfe\NfeProdutoPISRepositoryServiceInterface;
use App\Services\Repository\Contracts\Model\Nfe\NfeCupomFiscalRepositoryServiceInterface;
use App\Services\Repository\Contracts\Model\Nfe\NfeProdutoICMSRepositoryServiceInterface;
use App\Services\Repository\Contracts\Model\Nfe\NfeProdutoIssqnRepositoryServiceInterface;
use App\Services\Repository\Contracts\Model\Nfe\NfeProdutoPISSTRepositoryServiceInterface;
use App\Services\Repository\Contracts\Model\Nfe\NfeProdutoCofinsRepositoryServiceInterface;
use App\Services\Repository\Contracts\Model\Nfe\NfeProdutoOpcoesRepositoryServiceInterface;
use App\Services\Repository\Contracts\Model\Produto\ProdutoCombNFRepositoryServiceInterface;
use App\Services\Repository\Contracts\Model\Nfe\NfeProdutoCofinsStRepositoryServiceInterface;
use App\Services\Repository\Contracts\Model\Produto\ProdutoBeneficioFiscalRepositoryServiceInterface;
use App\Services\Repository\Contracts\Model\Produto\ProdutoInfoNutricionaisRepositoryServiceInterface;

/**
 * @author Tiago Franco
 * Servico responsavel envolvendo operacoes relacionados aos produtos
 */
class ProdutosService
{
    /**
     * @var ProdutoRepositoryServiceInterface
     */
    private $_produtoRepositoryService;

    /**
     * @var ProdutoInfoNutricionaisRepositoryServiceInterface
     */
    private $_produtoInfoNutricionaisRepositoryService;

    /**
     * @var ProdutoBeneficioFiscalRepositoryServiceInterface
     */
    private $_produtoBeneficioFiscalRepositoryService;

    /**
     * @var ProdutoCombNFRepositoryServiceInterface
     */
    private $_produtoCombNFRepositoryService;

    /**
     * @var NfeProdutoOpcoesRepositoryServiceInterface
     */
    private $_nfeProdutoOpcoesRepositoryService;

    /**
     * @var NfeProdutoICMSRepositoryServiceInterface
     */
    private $_nfeProdutoICMSRepositoryService;

    /**
     * @var NfeProdutoIPIRepositoryServiceInterface
     */
    private $_nfeProdutoIPIRepositoryService;

    /**
     * @var NfeProdutoPISRepositoryServiceInterface
     */
    private $_nfeProdutoPISRepositoryService;

    /**
     * @var NfeProdutoPISSTRepositoryServiceInterface
     */
    private $_nfeProdutoPISSTRepositoryService;

    /**
     * @var NfeProdutoCofinsRepositoryServiceInterface
     */
    private $_nfeProdutoCofinsRepositoryService;

    /**
     * @var NfeProdutoCofinsStRepositoryServiceInterface
     */
    private $_nfeProdutoCofinsStRepositoryService;

    /**
     * @var NfeCupomFiscalRepositoryServiceInterface
     */
    private $_nfeCupomFiscalRepositoryService;

    /**
     * @var NfeProdutoIssqnRepositoryServiceInterface
     */
    private $_nfeProdutoIssqnRepositoryService;

    /**
     * @var GradeRepositoryServiceInterface
     */
    private $_gradeRepositoryService;

    public function __construct(
        ProdutoRepositoryServiceInterface $produtoRepositoryService,
        ProdutoInfoNutricionaisRepositoryServiceInterface $produtoInfoNutricionaisRepositoryService,
        ProdutoBeneficioFiscalRepositoryServiceInterface $produtoBeneficioFiscalRepositoryService,
        ProdutoCombNFRepositoryServiceInterface $produtoCombNFRepositoryService,
        NfeProdutoOpcoesRepositoryServiceInterface $nfeProdutoOpcoesRepositoryService,
        NfeProdutoICMSRepositoryServiceInterface $nfeProdutoICMSRepositoryService,
        NfeProdutoIPIRepositoryServiceInterface $nfeProdutoIPIRepositoryService,
        NfeProdutoPISRepositoryServiceInterface $nfeProdutoPISRepositoryService,
        NfeProdutoPISSTRepositoryServiceInterface $nfeProdutoPISSTRepositoryService,
        NfeProdutoCofinsRepositoryServiceInterface $nfeProdutoCofinsRepositoryService,
        NfeProdutoCofinsStRepositoryServiceInterface $nfeProdutoCofinsStRepositoryService,
        NfeProdutoIssqnRepositoryServiceInterface $nfeProdutoIssqnRepositoryService,
        NfeCupomFiscalRepositoryServiceInterface $nfeCupomFiscalRepositoryService,
        GradeRepositoryServiceInterface $gradeRepositoryService

    ) {
        $this->_produtoRepositoryService                 = $produtoRepositoryService;
        $this->_produtoInfoNutricionaisRepositoryService = $produtoInfoNutricionaisRepositoryService;
        $this->_produtoBeneficioFiscalRepositoryService  = $produtoBeneficioFiscalRepositoryService;
        $this->_produtoCombNFRepositoryService           = $produtoCombNFRepositoryService;
        $this->_nfeProdutoOpcoesRepositoryService        = $nfeProdutoOpcoesRepositoryService;
        $this->_nfeProdutoICMSRepositoryService          = $nfeProdutoICMSRepositoryService;
        $this->_nfeProdutoIPIRepositoryService           = $nfeProdutoIPIRepositoryService;
        $this->_nfeProdutoPISRepositoryService           = $nfeProdutoPISRepositoryService;
        $this->_nfeProdutoPISSTRepositoryService         = $nfeProdutoPISSTRepositoryService;
        $this->_nfeProdutoCofinsRepositoryService        = $nfeProdutoCofinsRepositoryService;
        $this->_nfeProdutoCofinsStRepositoryService      = $nfeProdutoCofinsStRepositoryService;
        $this->_nfeCupomFiscalRepositoryService          = $nfeCupomFiscalRepositoryService;
        $this->_nfeProdutoIssqnRepositoryService         = $nfeProdutoIssqnRepositoryService;
        $this->_gradeRepositoryService                   = $gradeRepositoryService;
    }

    /**
     * Metodo para cadastro rapido do produto
     */
    public function cadastroProdutoRapido(CadastroProdutoDTO $cadastroProdutoDTO)
    {
        $produtoCadastrado = $this->_produtoRepositoryService->validaCadastroCodBarra($cadastroProdutoDTO->getCodigoBarra(), $cadastroProdutoDTO->getCodigoInterno());

        if ($produtoCadastrado) {
            throw new ApiWebControlException("Já existe um produto com o codigo de barra ou codigo interno", CodesApi::PARAMETROINVALIDO);
        }

        $novoProduto = $this->_produtoRepositoryService->novoProdutoCadastroRapido($cadastroProdutoDTO);

        if ($novoProduto && $cadastroProdutoDTO->getQtdeInicial() > 0) {
            $this->_gradeRepositoryService->atualizarQtdeEstoqueProduto($novoProduto->id, $cadastroProdutoDTO->getQtdeInicial());
        }

        return $novoProduto;
    }

    /**
     * Metodo para cadastro completo do produto
     */
    public function cadastroProdutoCompleto(CadastroProdutoCompletoDTO $cadastroProdutoDTO)
    {
        try {
            if($cadastroProdutoDTO->getInformacoesNutricionais()) {
                $cadastroProdutoDTO->setInfosNutricionais('S');
            }
            
            DB::beginTransaction();
            $novoProduto = $this->cadastroProdutoRapido($cadastroProdutoDTO);
            $novoProduto = $this->processarAtualizacaoDoProduto($novoProduto, $cadastroProdutoDTO);
            DB::commit();
            return $novoProduto;
        } catch (\Throwable $th) {
            DB::rollBack();
            throw $th;
        }
    }

    /**
     * Metodo para atualizacao completa do produto
     */
    public function edicaoProdutoCompleto(ProdutoInterface $produto, CadastroProdutoCompletoDTO $cadastroProdutoDTO)
    {
        try {
            DB::beginTransaction();
            $novoProduto = $this->processarAtualizacaoDoProduto($produto, $cadastroProdutoDTO);
            DB::commit();
            return $novoProduto;
        } catch (\Throwable $th) {
            DB::rollBack();
            throw $th;
        }
    }

    /**
     * Metodo para salvar informacoes fiscais a ser chamado externamente para controle da transacao
     * */
    public function salvaApenasInformacoesFiscais(ProdutoInterface $produto, CadastroProdutoCompletoDTO $cadastroProdutoDTO)
    {
        try {
            $cadastroProdutoDTO->setNome($produto->descricao);
            DB::beginTransaction();
            $impostos = $this->salvarInformacoesFiscais($produto->id, $cadastroProdutoDTO);
            DB::commit();
            return $impostos;
        } catch (\Throwable $th) {
            DB::rollBack();
            throw $th;
        }
    }
    
    /**
     * Metodo para atualizacao completa do produto novo e ja cadastrados
     */
    private function processarAtualizacaoDoProduto(ProdutoInterface $produto, CadastroProdutoCompletoDTO $cadastroProdutoDTO)
    {
        //Vinculo das demais informacoes do produto
        if($cadastroProdutoDTO->getDemaisInformacoes()) {
            $this->salvarDemaisInformacoes($produto->id, $cadastroProdutoDTO->getDemaisInformacoes());
        }
        
        $informacoesNutricionais = [];
        if ($cadastroProdutoDTO->getInformacoesNutricionais()) {
            $informacoesNutricionais = $this->salvarInformacoesNutricionais($produto->id, $cadastroProdutoDTO->getInformacoesNutricionais());
        }

        if($cadastroProdutoDTO->getCalculosFretes()) {
            $this->salvarValoresFrete($produto->id, $cadastroProdutoDTO->getCalculosFretes());
        }
        
        $impostos = [];
        if ($cadastroProdutoDTO->getInformacoesFiscais()) {
            $impostos = $this->salvarInformacoesFiscais($produto->id, $cadastroProdutoDTO);
        }

        //obter status do produto atualizado
        $produto           = $this->_produtoRepositoryService->find($produto->id);
        $produto->impostos = $impostos;
        $produto->informacoes_nutricionais = $informacoesNutricionais;
        $produto->grade    = $this->_gradeRepositoryService->getGradeProduto($produto->id, $produto->codigo_barra);
        
        return $produto;
    }

    /**
     * Metodo para atualizar as outras informacoes importante do produto tais como cor, tamanho, 
     * fabricante, data de validade e data de fabricacao
     */
    public function salvarDemaisInformacoes(int $idProduto, CadastroDemaisInformacoesDTO $cadastroDemaisInformacoesDTO)
    {
        //Vinculo das demais informacoes do produto
        return $this->_produtoRepositoryService->salvarDemaisInformacoes($idProduto, $cadastroDemaisInformacoesDTO);
    }
    /**
     * Metodo para atualizar as informacoes nutricioanais do produto
     */
    public function salvarInformacoesNutricionais(int $idProduto, CadastroInformacoesNutricionaisDTO $cadastroInformacoesNutricionaisDTO)
    {
        //Vinculo das informacoes nutricionais do produto
        return $this->_produtoInfoNutricionaisRepositoryService->salvarInformacoesNutricionais($idProduto, $cadastroInformacoesNutricionaisDTO);
    }

    /**
     * Metodo para atualizar as informacoes referente a entregas e fretes
     * tais como peso e caracteres fisicas da caixa de entrega
     */
    public function salvarValoresFrete(int $idProduto, CadastroCalculosFretesDTO $cadastroCalculosFretesDTO)
    {
        //atualizado informacoes do frete
        return $this->_produtoRepositoryService->salvarValoresFrete($idProduto, $cadastroCalculosFretesDTO);
    }

    /**
     * Metodo para processar a atualizacao das informacoes de impostos 
     * chamada individualmente ou com o processo de cadastro/edicao
     * do produto completo
     * */
    private function salvarInformacoesFiscais(int $idProduto, CadastroProdutoCompletoDTO $cadastroProdutoDTO)
    {
        $impostos = [];
        /**
         * @var CadastroInformacoesFiscaisDTO
         */
        $informacoesFiscais = $cadastroProdutoDTO->getInformacoesFiscais();

        #salvando os vinculos de beneficios fiscais
        $impostos['cod_beneficios_cst'] = $this->_produtoBeneficioFiscalRepositoryService->salvarCodBeneficiosCst(
            $idProduto,
            $informacoesFiscais
        );

        #processar o glp se informado no json
        if ($informacoesFiscais->getGlp()) {
            $impostos['glp'] = $this->_produtoCombNFRepositoryService->salvarGLP($idProduto, $cadastroProdutoDTO);
        }

        //configura vinculo com a opcao produto
        $impostos['produto_opcoes'] = $this->_nfeProdutoOpcoesRepositoryService->vinculaOpcaoProduto($idProduto, $informacoesFiscais->getTributacaoSobreLucro());

        //IMPOSTO ICMS e ICMS ST (processado se passado a informacao no json)
        if ($informacoesFiscais->getIcms()) {
            //se deselecionado a situacao tributario e excluido o vinculo do imposto
            if ($informacoesFiscais->getIcms()->getSituacaoTributaria()) {
                $impostos['icms'] = $this->_nfeProdutoICMSRepositoryService->vinculaICMS($idProduto, $informacoesFiscais->getIcms());
            }
        }
        //FIM IMPOSTO ICMS e ICMS ST

        //IMPOST IPI
        if ($informacoesFiscais->getIpi() && $informacoesFiscais->getIpi()->getSituacaoTributaria()) {
            $impostos['ipi'] = $this->_nfeProdutoIPIRepositoryService->vinculaIPI($idProduto, $informacoesFiscais->getIpi());
        }
        //FIMIMPOST IPI

        //IMPOST PIS
        if ($informacoesFiscais->getPis()) {
            $impostos['pis'] = $this->_nfeProdutoPISRepositoryService->vincularPIS($idProduto, $informacoesFiscais->getPis());
        }
        //FIMIMPOST PIS

        //IMPOST PISST
        if ($informacoesFiscais->getPisSt()) {
            $impostos['pis_st'] = $this->_nfeProdutoPISSTRepositoryService->vincularPISST($idProduto, $informacoesFiscais->getPisSt());
        }
        //FIMIMPOST PISST

        //IMPOST COFINS
        if ($informacoesFiscais->getCofins()) {
            $impostos['cofins'] = $this->_nfeProdutoCofinsRepositoryService->vincularCofins($idProduto, $informacoesFiscais->getCofins());
        }
        //FIMIMPOST COFINS

        //IMPOST COFINSST
        if ($informacoesFiscais->getCofinsSt()) {
            $impostos['cofins_st'] = $this->_nfeProdutoCofinsStRepositoryService->vincularCofinsSt($idProduto, $informacoesFiscais->getCofinsSt());
        }
        //FIMIMPOST COFINSST

        //IMPOST ISSQN
        if ($informacoesFiscais->getIssqn()) {
            $impostos['issqn'] = $this->_nfeProdutoIssqnRepositoryService->vincularISSQN($idProduto, $informacoesFiscais->getIssqn());
        }
        //FIMIMPOST ISSQN

        //CUMPO FISCAL
        if ($informacoesFiscais->getCupomFiscal()) {
            $impostos['cupom_fiscal'] = $this->_nfeCupomFiscalRepositoryService->vincularCumpoFiscal($idProduto, $informacoesFiscais->getCupomFiscal());
        }
        //FIMCUMPO FISCAL
        //vincular demais informacoes fiscais no produto
        $this->_produtoRepositoryService->salvarInformacoesFiscais($idProduto, $informacoesFiscais);
        return $impostos;
    }
}
