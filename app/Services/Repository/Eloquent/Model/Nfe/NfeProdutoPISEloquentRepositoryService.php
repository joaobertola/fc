<?php

namespace App\Services\Repository\Eloquent\Model\Nfe;

use App\DTO\Produtos\CadastroPISDTO;
use App\Model\Nfe\NfeProdutoPIS;
use App\Repository\Eloquent\Model\Nfe\NfeProdutoPISEloquentRepository;
use App\Services\Repository\Contracts\Model\Nfe\NfeProdutoPISRepositoryServiceInterface;
use App\Services\Repository\Eloquent\WebControlEloquentRepositoryService;

/**
 * @author Tiago Franco
 * Servico de acesso ao repositorio de Model
 * Deverá possuir os metodos contendo operacoes de escrita 
 * do modelo implementando a interface do repositorio
 */
class NfeProdutoPISEloquentRepositoryService extends WebControlEloquentRepositoryService implements NfeProdutoPISRepositoryServiceInterface
{
    public function __construct(NfeProdutoPIS $model, NfeProdutoPISEloquentRepository $repository)
    {
        parent::__construct($model, $repository);
    }

    public function vincularPIS(int $idProduto, CadastroPISDTO $cadastroIPIDTO)
    {
        $dados = [
            "tp_calculo"  => $cadastroIPIDTO->getTipoCalculo(),
            "CST"         => $cadastroIPIDTO->getSituacaoTributaria(),
            "pPIS"        => $cadastroIPIDTO->getPercentualAliquota(),
            "v_aliq"      => $cadastroIPIDTO->getAliquotaReal(),
            "id_cadastro" => $this->_usuarioLogadoService->getIdCadastroLogado(),
        ];
        //cria pou atualiza o existente
        return $this->updateOrCreate(['id_produto' => $idProduto], $dados);
    }
}
