<?php

namespace App\Services\Repository\Eloquent\Model\Nfe;

use App\DTO\Produtos\CadastroCupomFiscalDTO;
use App\Model\Nfe\NfeCupomFiscal;
use App\Repository\Eloquent\Model\Nfe\NfeCupomFiscalEloquentRepository;
use App\Services\Repository\Contracts\Model\Nfe\NfeCupomFiscalRepositoryServiceInterface;
use App\Services\Repository\Eloquent\WebControlEloquentRepositoryService;

/**
 * @author Tiago Franco
 * Servico de acesso ao repositorio de Model
 * Deverá possuir os metodos contendo operacoes de escrita 
 * do modelo implementando a interface do repositorio
 */
class NfeCupomFiscalEloquentRepositoryService extends WebControlEloquentRepositoryService implements NfeCupomFiscalRepositoryServiceInterface
{
    public function __construct(NfeCupomFiscal $model, NfeCupomFiscalEloquentRepository $repository)
    {
        parent::__construct($model, $repository);
    }

    public function vincularCumpoFiscal(int $idProduto, CadastroCupomFiscalDTO $cadastroCupomFiscalDTO)
    {
        $dados = [
            "id_cfop"             => $cadastroCupomFiscalDTO->getCfop(),
            "sped"                => $cadastroCupomFiscalDTO->getSped(),
            "percentual_icms"     => $cadastroCupomFiscalDTO->getIcms(),
            "percentual_pis"      => $cadastroCupomFiscalDTO->getPis(),
            "csosn"               => $cadastroCupomFiscalDTO->getCsosn(),
            "totalizador_parcial" => $cadastroCupomFiscalDTO->getTotalizadorParcial(),
            "situacao_tributaria" => $cadastroCupomFiscalDTO->getSituacaoTributaria(),
            "iat"                 => $cadastroCupomFiscalDTO->getCupomFiscalIat(),
            "ippt"                => $cadastroCupomFiscalDTO->getCupomFiscalIppt(),
            "id_cadastro"         => $this->_usuarioLogadoService->getIdCadastroLogado(),
        ];
        //cria pou atualiza o existente
        return $this->updateOrCreate(['id_produto' => $idProduto], $dados);
    }
}
