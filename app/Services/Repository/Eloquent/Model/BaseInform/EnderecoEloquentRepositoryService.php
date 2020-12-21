<?php

namespace App\Services\Repository\Eloquent\Model\BaseInform;

use App\Model\BaseInform\Endereco;
use App\DTO\BaseInforme\DadosInformDTO;
use App\Repository\Eloquent\Model\BaseInform\EnderecoEloquentRepository;
use App\Services\Repository\Eloquent\WebControlEloquentRepositoryService;

/**
 * @author Tiago Franco
 * Servico de acesso ao repositorio de Model
 * Deverá possuir os metodos contendo operacoes de escrita 
 * do modelo implementando a interface do repositorio
 */
class EnderecoEloquentRepositoryService extends WebControlEloquentRepositoryService
{
    public function __construct(Endereco $model, EnderecoEloquentRepository $repository)
    {
        parent::__construct($model, $repository);
    }

    public function salvartEndereco(DadosInformDTO $dadosDTO)
    {
        return $this->updateOrCreate([
            'CPF' => $dadosDTO->getCnpjCpf()
        ], [
            'CPF'            => $dadosDTO->getCnpjCpf(),
            'Tipo'           => $dadosDTO->getTipo(),
            'Origem_Nome_id' => 2,
            'Tipo_Log_id'    => $dadosDTO->getIdTipoLog(),
            'logradouro'     => $dadosDTO->getEndereco(),
            'numero'         => $dadosDTO->getNumero(),
            'complemento'    => $dadosDTO->getComplemento(),
            'bairro'         => $dadosDTO->getBairro(),
            'cidade'         => $dadosDTO->getCidade(),
            'uf'             => $dadosDTO->getUf(),
            'cep'            => $dadosDTO->getCep(),
        ]);
    }
}
