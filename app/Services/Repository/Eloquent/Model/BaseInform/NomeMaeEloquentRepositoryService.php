<?php

namespace App\Services\Repository\Eloquent\Model\BaseInform;

use App\Model\BaseInform\NomeMae;
use App\Repository\Eloquent\Model\BaseInform\NomeMaeEloquentRepository;
use App\Services\Repository\Eloquent\WebControlEloquentRepositoryService;

/**
 * @author Tiago Franco
 * Servico de acesso ao repositorio de Model
 * Deverá possuir os metodos contendo operacoes de escrita 
 * do modelo implementando a interface do repositorio
 */
class NomeMaeEloquentRepositoryService extends WebControlEloquentRepositoryService
{
    public function __construct(NomeMae $model, NomeMaeEloquentRepository $repository)
    {
        parent::__construct($model, $repository);
    }
}
