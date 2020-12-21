<?php

namespace App\Services\Repository\Eloquent\Model\Nfe;

use App\Model\Nfe\NfeProdutoPISST;
use App\DTO\Produtos\CadastroPISSTDTO;
use App\Repository\Eloquent\Model\Nfe\NfeProdutoPISSTEloquentRepository;
use App\Services\Repository\Eloquent\WebControlEloquentRepositoryService;
use App\Services\Repository\Contracts\Model\Nfe\NfeProdutoPISSTRepositoryServiceInterface;

/**
 * @author Tiago Franco
 * Servico de acesso ao repositorio de Model
 * Deverá possuir os metodos contendo operacoes de escrita 
 * do modelo implementando a interface do repositorio
 */
class NfeProdutoPISSTEloquentRepositoryService extends WebControlEloquentRepositoryService implements NfeProdutoPISSTRepositoryServiceInterface
{
    public function __construct(NfeProdutoPISST $model, NfeProdutoPISSTEloquentRepository $repository)
    {
        parent::__construct($model, $repository);
    }

    public function vincularPISST(int $idProduto, CadastroPISSTDTO $cadastroIPISTSTDTO)
    {
        $dados = [
            "tp_calculo"  => $cadastroIPISTSTDTO->getTipoCalculo(),
            "pPIS"        => $cadastroIPISTSTDTO->getPercentualAliquota(),
            "v_aliq"      => $cadastroIPISTSTDTO->getAliquotaReal(),
            "id_cadastro" => $this->_usuarioLogadoService->getIdCadastroLogado(),
        ];
        //cria pou atualiza o existente
        return $this->updateOrCreate(['id_produto' => $idProduto], $dados);
    }
}
