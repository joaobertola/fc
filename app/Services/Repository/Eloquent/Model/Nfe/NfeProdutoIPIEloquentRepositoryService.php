<?php

namespace App\Services\Repository\Eloquent\Model\Nfe;

use App\Model\Nfe\NfeProdutoIPI;
use App\DTO\Produtos\CadastroIPIDTO;
use App\Repository\Eloquent\Model\Nfe\NfeProdutoIPIEloquentRepository;
use App\Services\Repository\Eloquent\WebControlEloquentRepositoryService;
use App\Services\Repository\Contracts\Model\Nfe\NfeProdutoIPIRepositoryServiceInterface;

/**
 * @author Tiago Franco
 * Servico de acesso ao repositorio de Model
 * Deverá possuir os metodos contendo operacoes de escrita 
 * do modelo implementando a interface do repositorio
 */
class NfeProdutoIPIEloquentRepositoryService extends WebControlEloquentRepositoryService implements NfeProdutoIPIRepositoryServiceInterface
{
    public function __construct(NfeProdutoIPI $model, NfeProdutoIPIEloquentRepository $repository)
    {
        parent::__construct($model, $repository);
    }

    public function vinculaIPI(int $idProduto, CadastroIPIDTO $cadastroIPIDTO) {
        $dados = [
            "cIEnq"       => $cadastroIPIDTO->getClasseEnquadramento(),
            "CNPJProd"    => $cadastroIPIDTO->getCnpjProdutor(),
            "cSelo"       => $cadastroIPIDTO->getCodSelos(),
            "qSelo"       => $cadastroIPIDTO->getQtdeSelos(),
            "cEnq"        => $cadastroIPIDTO->getCodigoEnquadramento(),
            "CST"         => $cadastroIPIDTO->getSituacaoTributaria(),
            "pIPI"        => $cadastroIPIDTO->getPercentualAliquota(),
            "tp_calculo"  => $cadastroIPIDTO->getTipoCalculo(),
            "v_aliq"      => $cadastroIPIDTO->getValorUnidadePadrao(),
            "id_cadastro" => $this->_usuarioLogadoService->getIdCadastroLogado(),
        ];
        //cria pou atualiza o existente
        return $this->updateOrCreate(['id_produto' => $idProduto], $dados);
    }
}
