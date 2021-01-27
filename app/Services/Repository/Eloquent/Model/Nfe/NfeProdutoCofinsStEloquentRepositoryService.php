<?php

namespace App\Services\Repository\Eloquent\Model\Nfe;

use App\Model\Nfe\NfeProdutoCofinsSt;
use App\DTO\Produtos\CadastroCOFINSSTDTO;
use App\Services\Repository\Eloquent\WebControlEloquentRepositoryService;
use App\Repository\Eloquent\Model\Nfe\NfeProdutoCofinsStEloquentRepository;
use App\Services\Repository\Contracts\Model\Nfe\NfeProdutoCofinsStRepositoryServiceInterface;

/**
 * @author Tiago Franco
 * Servico de acesso ao repositorio de Model
 * Deverá possuir os metodos contendo operacoes de escrita 
 * do modelo implementando a interface do repositorio
 */
class NfeProdutoCofinsStEloquentRepositoryService extends WebControlEloquentRepositoryService implements NfeProdutoCofinsStRepositoryServiceInterface
{
    public function __construct(NfeProdutoCofinsSt $model, NfeProdutoCofinsStEloquentRepository $repository)
    {
        parent::__construct($model, $repository);
    }

    public function vincularCofinsSt(int $idProduto, CadastroCOFINSSTDTO $cadastroCOFINSSTDTO)
    {
        $dados = [
            "tp_calculo"  => $cadastroCOFINSSTDTO->getTipoCalculo(),
            "pCOFINS"     => $cadastroCOFINSSTDTO->getPercentualAliquota(),
            "v_aliq"      => $cadastroCOFINSSTDTO->getAliquotaReal(),
            "id_cadastro" => $this->_usuarioLogadoService->getIdCadastroLogado(),
        ];
        //cria pou atualiza o existente
        return $this->updateOrCreate(['produto_id' => $idProduto], $dados);
    }
}
