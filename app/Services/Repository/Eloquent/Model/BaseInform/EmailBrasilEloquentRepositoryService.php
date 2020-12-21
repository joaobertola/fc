<?php

namespace App\Services\Repository\Eloquent\Model\BaseInform;

use App\Model\BaseInform\EmailBrasil;
use App\DTO\BaseInforme\DadosInformDTO;
use App\Services\Repository\Eloquent\WebControlEloquentRepositoryService;
use App\Repository\Eloquent\Model\BaseInform\EmailBrasilEloquentRepository;

/**
 * @author Tiago Franco
 * Servico de acesso ao repositorio de Model
 * Deverá possuir os metodos contendo operacoes de escrita 
 * do modelo implementando a interface do repositorio
 */
class EmailBrasilEloquentRepositoryService extends WebControlEloquentRepositoryService
{
    public function __construct(EmailBrasil $model, EmailBrasilEloquentRepository $repository)
    {
        parent::__construct($model, $repository);
    }

    public function salvarEmail(DadosInformDTO $dadosDTO)
    {
        return $this->firstOrCreate([
            'CPF'   => $dadosDTO->getCnpjCpf()
        ],[
            'CPF'   => $dadosDTO->getCnpjCpf(),
            'Tipo'  => $dadosDTO->getTipo(),
            'Email' => $dadosDTO->getEmail()
        ]);
    }
}
