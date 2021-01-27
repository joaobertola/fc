<?php

namespace App\Services\Repository\Eloquent\Model\Nfe;

use App\DTO\Produtos\CadastroISSQNDTO;
use App\Model\Nfe\NfeProdutoIssqn;
use App\Repository\Eloquent\Model\Nfe\NfeProdutoIssqnEloquentRepository;
use App\Services\Repository\Contracts\Model\Nfe\NfeProdutoIssqnRepositoryServiceInterface;
use App\Services\Repository\Eloquent\WebControlEloquentRepositoryService;

/**
 * @author Tiago Franco
 * Servico de acesso ao repositorio de Model
 * Deverá possuir os metodos contendo operacoes de escrita 
 * do modelo implementando a interface do repositorio
 */
class NfeProdutoIssqnEloquentRepositoryService extends WebControlEloquentRepositoryService implements NfeProdutoIssqnRepositoryServiceInterface
{
    public function __construct(NfeProdutoIssqn $model, NfeProdutoIssqnEloquentRepository $repository)
    {
        parent::__construct($model, $repository);
    }

    public function vincularISSQN(int $idProduto, CadastroISSQNDTO $cadastroISSQNDTO)
    {
        $dados = [
            "pAliq"                       => $cadastroISSQNDTO->getPercentualAliquotaIssqn(),
            "uf"                          => $cadastroISSQNDTO->getUfIssqn(),
            "cMunFG"                      => $cadastroISSQNDTO->getMunicipioIssqn(),
            "cListServ"                   => $cadastroISSQNDTO->getListaServicosIssqn(),
            "tributacao"                  => $cadastroISSQNDTO->getSituacaoTributacaoIssqn(),
            "id_exigibilidade"            => $cadastroISSQNDTO->getIdExigibilidadeIssqn(),
            "incentivo_fiscal"            => $cadastroISSQNDTO->getIncentivoFiscalIssqn(),
            "valor_deducoes"              => $cadastroISSQNDTO->getValorDeducoesIssqn(),
            "valor_outras_retencoes"      => $cadastroISSQNDTO->getValorOutrasRetencoesIssqn(),
            "valor_desconto_condicionado" => $cadastroISSQNDTO->getValorDescontoCondicionadoIssqn(),
            "valor_retencao"              => $cadastroISSQNDTO->getValorRetencoesIssqn(),
            "codigo_servico"              => $cadastroISSQNDTO->getCodigoServicoIssqn(),
            "uf_incidencia"               => $cadastroISSQNDTO->getUfIncidenciaIssqn(),
            "id_municipio_incidencia"     => $cadastroISSQNDTO->getMunicipioIssqn(),
            "processo"                    => $cadastroISSQNDTO->getProcessoJudicialAdministrativoIssqn(),
            "id_cadastro"                 => $this->_usuarioLogadoService->getIdCadastroLogado(),
        ];
        //cria pou atualiza o existente
        return $this->updateOrCreate(['produto_id' => $idProduto], $dados);
    }
}
