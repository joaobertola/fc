<?php

namespace App\Services\Repository\Eloquent\Model\BaseInform;

use App\DTO\BaseInforme\DadosInformDTO;
use App\Model\BaseInform\TelefonesBrasil;
use App\Services\Repository\Eloquent\WebControlEloquentRepositoryService;
use App\Repository\Eloquent\Model\BaseInform\TelefonesBrasilEloquentRepository;

/**
 * @author Tiago Franco
 * Servico de acesso ao repositorio de Model
 * Deverá possuir os metodos contendo operacoes de escrita 
 * do modelo implementando a interface do repositorio
 */
class TelefonesBrasilEloquentRepositoryService extends WebControlEloquentRepositoryService
{
    public function __construct(TelefonesBrasil $model, TelefonesBrasilEloquentRepository $repository)
    {
        parent::__construct($model, $repository);
    }

    public function salvarTelefone(DadosInformDTO $dadosDTO)
    {
        return $this->firstOrCreate([
            'cpfcnpj' => $dadosDTO->getCnpjCpf(),
            'fone'    => $dadosDTO->getTelefone(),
            'ddd'     => $dadosDTO->getDdd()
        ],[
            'cpfcnpj' => $dadosDTO->getCnpjCpf(),
            'fone'    => $dadosDTO->getTelefone(),
            'ddd'     => $dadosDTO->getDdd()
        ]);
    }

    public function salvarCelular(DadosInformDTO $dadosDTO)
    {
        return $this->firstOrCreate([
            'cpfcnpj' => $dadosDTO->getCnpjCpf(),
            'fone'    => $dadosDTO->getCelular(),
            'ddd'     => $dadosDTO->getDddCelular()
        ],[
            'cpfcnpj' => $dadosDTO->getCnpjCpf(),
            'fone'    => $dadosDTO->getCelular(),
            'ddd'     => $dadosDTO->getDddCelular()
        ]);
    }
}
