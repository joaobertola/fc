<?php

namespace App\Services\Repository\Eloquent\Model\Nfe;

use App\DTO\Produtos\CadastroCOFINSDTO;
use App\Model\Nfe\NfeProdutoCofins;
use App\Repository\Eloquent\Model\Nfe\NfeProdutoCofinsEloquentRepository;
use App\Services\Repository\Contracts\Model\Nfe\NfeProdutoCofinsRepositoryServiceInterface;
use App\Services\Repository\Eloquent\WebControlEloquentRepositoryService;

/**
 * @author Tiago Franco
 * Servico de acesso ao repositorio de Model
 * Deverá possuir os metodos contendo operacoes de escrita 
 * do modelo implementando a interface do repositorio
 */
class NfeProdutoCofinsEloquentRepositoryService extends WebControlEloquentRepositoryService implements NfeProdutoCofinsRepositoryServiceInterface
{
    public function __construct(NfeProdutoCofins $model, NfeProdutoCofinsEloquentRepository $repository)
    {
        parent::__construct($model, $repository);
    }

    public function vincularCofins(int $idProduto, CadastroCOFINSDTO $cadastroCOFINSDTO)
    {
        $dados = [
            "CST"         => $cadastroCOFINSDTO->getSituacaoTributaria(),
            "tp_calculo"  => $cadastroCOFINSDTO->getTipoCalculo(),
            "pCOFINS"     => $cadastroCOFINSDTO->getPercentualAliquota(),
            "v_aliq"      => $cadastroCOFINSDTO->getAliquotaReal(),
            "id_cadastro" => $this->_usuarioLogadoService->getIdCadastroLogado(),
        ];
        //cria pou atualiza o existente
        return $this->updateOrCreate(['id_produto' => $idProduto], $dados);
    }
}
