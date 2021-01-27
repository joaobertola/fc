<?php

namespace App\Services\Repository\Eloquent\Model\BaseInform;

use App\Model\BaseInform\NomeRg;
use App\Repository\Eloquent\Model\BaseInform\NomeRgEloquentRepository;
use App\Services\Repository\Eloquent\WebControlEloquentRepositoryService;

/**
 * @author Tiago Franco
 * Servico de acesso ao repositorio de Model
 * Deverá possuir os metodos contendo operacoes de escrita 
 * do modelo implementando a interface do repositorio
 */
class NomeRgEloquentRepositoryService extends WebControlEloquentRepositoryService
{
    public function __construct(NomeRg $model, NomeRgEloquentRepository $repository)
    {
        parent::__construct($model, $repository);
    }
}
