<?php

namespace App\Services\Repository\Eloquent\Model\BaseInform;

use App\Model\BaseInform\NomeTitulo;
use App\Repository\Eloquent\Model\BaseInform\NomeTituloEloquentRepository;
use App\Services\Repository\Eloquent\WebControlEloquentRepositoryService;

/**
 * @author Tiago Franco
 * Servico de acesso ao repositorio de Model
 * Deverá possuir os metodos contendo operacoes de escrita 
 * do modelo implementando a interface do repositorio
 */
class NomeTituloEloquentRepositoryService extends WebControlEloquentRepositoryService
{
    public function __construct(NomeTitulo $model, NomeTituloEloquentRepository $repository)
    {
        parent::__construct($model, $repository);
    }
}
