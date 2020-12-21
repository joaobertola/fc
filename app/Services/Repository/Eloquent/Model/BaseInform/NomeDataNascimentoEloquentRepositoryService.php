<?php

namespace App\Services\Repository\Eloquent\Model\BaseInform;

use App\DTO\BaseInforme\DadosInformDTO;
use App\Model\BaseInform\NomeDataNascimento;
use App\Services\Repository\Eloquent\WebControlEloquentRepositoryService;
use App\Repository\Eloquent\Model\BaseInform\NomeDataNascimentoEloquentRepository;

/**
 * @author Tiago Franco
 * Servico de acesso ao repositorio de Model
 * Deverá possuir os metodos contendo operacoes de escrita 
 * do modelo implementando a interface do repositorio
 */
class NomeDataNascimentoEloquentRepositoryService extends WebControlEloquentRepositoryService

{
    public function __construct(NomeDataNascimento $model, NomeDataNascimentoEloquentRepository $repository)
    {
        parent::__construct($model, $repository);
    }

    public function salvarNascimentoFundacao(DadosInformDTO $dadosDTO)
    {
        return $this->updateOrCreate([
            'CPF'  => $dadosDTO->getCnpjCpf(),            
            'Tipo' => $dadosDTO->getTipo(),
        ],[
            'CPF'             => $dadosDTO->getCnpjCpf(),
            'data_nascimento' => $dadosDTO->getDataNascimentoFundacao()           
        ]);
    }
}
