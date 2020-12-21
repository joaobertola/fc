<?php

namespace App\Services\Repository\Eloquent\Model\Fornecedor;

use App\Model\Fornecedor\Fornecedor;
use App\DTO\Fornecedor\CadastrarFornecedorDTO;
use App\Services\Repository\Eloquent\WebControlEloquentRepositoryService;
use App\Repository\Eloquent\Model\Fornecedor\FornecedorEloquentRepository;
use App\Services\Repository\Contracts\Model\Fornecedor\FornecedorRepositoryServiceInterface;

/**
 * @author Tiago Franco
 * Servico de acesso ao repositorio de Model
 * Deverá possuir os metodos contendo operacoes de escrita 
 * do modelo implementando a interface do repositorio
 */
class FornecedorEloquentRepositoryService extends WebControlEloquentRepositoryService implements FornecedorRepositoryServiceInterface
{
    public function __construct(Fornecedor $model, FornecedorEloquentRepository $repository)
    {
        parent::__construct($model, $repository);
    }

    public function novoFornecedor(CadastrarFornecedorDTO $cadastrarFornecedorDTO)
    {
        $dados = $this->getDadosUpdateOrCreate($cadastrarFornecedorDTO);

        //cria novo fornecedor
        return $this->create($dados);
    }

    public function editarFornecedor(int $idFornecedor, CadastrarFornecedorDTO $cadastrarFornecedorDTO)
    {
        $dados = $this->getDadosUpdateOrCreate($cadastrarFornecedorDTO);

        //atualiza o fornecedor
        $this->update($dados, $idFornecedor);
    }

    private function getDadosUpdateOrCreate(CadastrarFornecedorDTO $cadastrarFornecedorDTO) {
        $dados = array();
        $dados['cnpj_cpf']               = $cadastrarFornecedorDTO->getCnpjCpf();
        $dados['rgie']                   = $cadastrarFornecedorDTO->getRgie();
        $dados['contato']                = $cadastrarFornecedorDTO->getContato();
        $dados['razao_social']           = $cadastrarFornecedorDTO->getRazaoSocial();
        $dados['fantasia']               = $cadastrarFornecedorDTO->getFantasia();
        $dados['id_tipo_log']            = $cadastrarFornecedorDTO->getIdTipoLog();
        $dados['id_cadastro']            = $this->_usuarioLogadoService->getIdCadastroLogado();
        $dados['tipo_pessoa']            = $cadastrarFornecedorDTO->getTipoPessoa();
        $dados['endereco']               = $cadastrarFornecedorDTO->getEndereco();
        $dados['numero']                 = $cadastrarFornecedorDTO->getNumero();
        $dados['complemento']            = $cadastrarFornecedorDTO->getComplemento();
        $dados['bairro']                 = $cadastrarFornecedorDTO->getBairro();
        $dados['cidade']                 = $cadastrarFornecedorDTO->getCidade();
        $dados['uf']                     = $cadastrarFornecedorDTO->getUf();
        $dados['cep']                    = $cadastrarFornecedorDTO->getCep();
        $dados['informacoes_adicionais'] = $cadastrarFornecedorDTO->getInformacoesAdicionais();
        $dados['email']                  = $cadastrarFornecedorDTO->getEmail();
        $dados['site']                   = $cadastrarFornecedorDTO->getSite();
        $dados['skype']                  = $cadastrarFornecedorDTO->getSkype();
        $dados['telefone']               = $cadastrarFornecedorDTO->getTelefone();
        $dados['celular']                = $cadastrarFornecedorDTO->getCelular();
        $dados['fax']                    = $cadastrarFornecedorDTO->getFax();
        $dados['insc_municipal']         = $cadastrarFornecedorDTO->getInscMunicipal();
        $dados['insc_estadual']          = $cadastrarFornecedorDTO->getInscEstadual();
        $dados['data_fundacao']          = $cadastrarFornecedorDTO->getDataFundacao();
        $dados['prazo_entrega_produtos'] = $cadastrarFornecedorDTO->getPrazoEntregaProdutos();
        $dados['isento_icms']            = $cadastrarFornecedorDTO->getIsentoIcms();
        $dados['id_pais']                = $cadastrarFornecedorDTO->getIdPais();
        
        return $dados;
    }
}
