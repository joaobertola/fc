<?php

namespace App\Services\Repository\Eloquent\Model\Nfe;

use App\Model\Nfe\NfeProdutoOpcoes;
use App\Repository\Eloquent\Model\Nfe\NfeProdutoOpcoesEloquentRepository;
use App\Services\Repository\Contracts\Model\Nfe\NfeProdutoOpcoesRepositoryServiceInterface;
use App\Services\Repository\Eloquent\WebControlEloquentRepositoryService;

/**
 * @author Tiago Franco
 * Servico de acesso ao repositorio de Model
 * Deverá possuir os metodos contendo operacoes de escrita 
 * do modelo implementando a interface do repositorio
 */
class NfeProdutoOpcoesEloquentRepositoryService extends WebControlEloquentRepositoryService implements NfeProdutoOpcoesRepositoryServiceInterface
{
    public function __construct(NfeProdutoOpcoes $model, NfeProdutoOpcoesEloquentRepository $repository)
    {
        parent::__construct($model, $repository);
    }

    public function vinculaOpcaoProduto(int $idProduto, string $tributacaoLucro) {

        return $this->updateOrCreate(['id_produto' => $idProduto], ['tributacao_lucro' => $tributacaoLucro]);
    }
}
