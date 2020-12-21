<?php

namespace App\Services\BaseInform;

use App\DTO\BaseInforme\DadosInformDTO;
use App\DTO\Fornecedor\CadastrarFornecedorDTO;
use App\Services\Repository\Eloquent\Model\BaseInform\NomeRgEloquentRepositoryService;
use App\Services\Repository\Eloquent\Model\BaseInform\NomeMaeEloquentRepositoryService;
use App\Services\Repository\Eloquent\Model\BaseInform\EnderecoEloquentRepositoryService;
use App\Services\Repository\Eloquent\Model\BaseInform\NomeBrasilEloquentRepositoryService;
use App\Services\Repository\Eloquent\Model\BaseInform\NomeTituloEloquentRepositoryService;
use App\Services\Repository\Eloquent\Model\BaseInform\EmailBrasilEloquentRepositoryService;
use App\Services\Repository\Eloquent\Model\BaseInform\TelefonesBrasilEloquentRepositoryService;
use App\Services\Repository\Eloquent\Model\BaseInform\NomePessoaContatoEloquentRepositoryService;
use App\Services\Repository\Eloquent\Model\BaseInform\NomeDataNascimentoEloquentRepositoryService;
use App\Services\Repository\Eloquent\Model\BaseInform\NomeEmpresaTrabalhaEloquentRepositoryService;


/**
 * @author Tiago Franco
 * Servico responsavel pelo processamento
 * envolvendo
 */
class ManterBaseInformeService
{
    /**
     * @var EmailBrasilEloquentRepositoryService
     */
    private $_emailBrasilEloquentRepositoryService;
    /**
     * @var EnderecoEloquentRepositoryService
     */
    private $_enderecoEloquentRepositoryService;
    /**
     * @var NomeBrasilEloquentRepositoryService
     */
    private $_nomeBrasilEloquentRepositoryService;
    /**
     * @var NomeDataNascimentoEloquentRepositoryService
     */
    private $_nomeDataNascimentoEloquentRepositoryService;
    /**
     * @var NomeEmpresaTrabalhaEloquentRepositoryService
     */
    private $_nomeEmpresaTrabalhaEloquentRepositoryService;
    /**
     * @var NomeMaeEloquentRepositoryService
     */
    private $_nomeMaeEloquentRepositoryService;
    /**
     * @var NomePessoaContatoEloquentRepositoryService
     */
    private $_nomePessoaContatoEloquentRepositoryService;
    /**
     * @var NomeRgEloquentRepositoryService
     */
    private $_nomeRgEloquentRepositoryService;
    /**
     * @var NomeTituloEloquentRepositoryService
     */
    private $_nomeTituloEloquentRepositoryService;
    /**
     * @var TelefonesBrasilEloquentRepositoryService
     */
    private $_telefonesBrasilEloquentRepositoryService;

    public function __construct(
        EmailBrasilEloquentRepositoryService $emailBrasilEloquentRepositoryService,
        EnderecoEloquentRepositoryService $enderecoEloquentRepositoryService,
        NomeBrasilEloquentRepositoryService $nomeBrasilEloquentRepositoryService,
        NomeDataNascimentoEloquentRepositoryService $nomeDataNascimentoEloquentRepositoryService,
        NomeEmpresaTrabalhaEloquentRepositoryService $nomeEmpresaTrabalhaEloquentRepositoryService,
        NomeMaeEloquentRepositoryService $nomeMaeEloquentRepositoryService,
        NomePessoaContatoEloquentRepositoryService $nomePessoaContatoEloquentRepositoryService,
        NomeRgEloquentRepositoryService $nomeRgEloquentRepositoryService,
        NomeTituloEloquentRepositoryService $nomeTituloEloquentRepositoryService,
        TelefonesBrasilEloquentRepositoryService $telefonesBrasilEloquentRepositoryService
    ) {
        $this->_emailBrasilEloquentRepositoryService         = $emailBrasilEloquentRepositoryService;
        $this->_enderecoEloquentRepositoryService            = $enderecoEloquentRepositoryService;
        $this->_nomeBrasilEloquentRepositoryService          = $nomeBrasilEloquentRepositoryService;
        $this->_nomeDataNascimentoEloquentRepositoryService  = $nomeDataNascimentoEloquentRepositoryService;
        $this->_nomeEmpresaTrabalhaEloquentRepositoryService = $nomeEmpresaTrabalhaEloquentRepositoryService;
        $this->_nomeMaeEloquentRepositoryService             = $nomeMaeEloquentRepositoryService;
        $this->_nomePessoaContatoEloquentRepositoryService   = $nomePessoaContatoEloquentRepositoryService;
        $this->_nomeRgEloquentRepositoryService              = $nomeRgEloquentRepositoryService;
        $this->_nomeTituloEloquentRepositoryService          = $nomeTituloEloquentRepositoryService;
        $this->_telefonesBrasilEloquentRepositoryService     = $telefonesBrasilEloquentRepositoryService;
    }

    public function processarSCPCFornecedor(CadastrarFornecedorDTO $cadastrarFornecedorDTO)
    {
        if (!empty($cadastrarFornecedorDTO->getCnpjCpf())) {

            $dadosDto = new DadosInformDTO($cadastrarFornecedorDTO);
            //atualizar os dados cadastrais do fornecedor
            return $this->efeturarAtualizacaoCadastral($dadosDto);
        }
    }


    private function efeturarAtualizacaoCadastral(DadosInformDTO $dadosDto) {
        $saida = [];
        //gerenciar gravacao da razao social ou nome do cadastro
        $saida['nome'] = $this->_nomeBrasilEloquentRepositoryService->salvarNome($dadosDto);

        //gerenciar gravacao dos dados do ednereco do cadastro
        $saida['endereco'] = $this->_enderecoEloquentRepositoryService->salvartEndereco($dadosDto);

        //gerenciar gravacao dos dados do email do cadastro
        $saida['email'] = $this->_emailBrasilEloquentRepositoryService->salvarEmail($dadosDto);

        //gerenciar gravac dos dados de nascimento fundacao do cadastro
        $saida['nascimento_fundacao'] = $this->_nomeDataNascimentoEloquentRepositoryService->salvarNascimentoFundacao($dadosDto);

        //gerenciar gravac dos dados do telefone do cadastro
        $saida['telefone'] = $this->_telefonesBrasilEloquentRepositoryService->salvarTelefone($dadosDto);

        //gerenciar gravac dos dados do celular do cadastro
        $saida['celular'] = $this->_telefonesBrasilEloquentRepositoryService->salvarCelular($dadosDto);

        return $saida;
    }
}
