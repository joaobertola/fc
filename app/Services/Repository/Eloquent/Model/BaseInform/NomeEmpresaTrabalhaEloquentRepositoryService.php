<?php

namespace App\Services\Repository\Eloquent\Model\BaseInform;

use App\Model\BaseInform\NomeEmpresaTrabalha;
use App\Repository\Eloquent\Model\BaseInform\NomeEmpresaTrabalhaEloquentRepository;
use App\Services\Repository\Eloquent\WebControlEloquentRepositoryService;

/**
 * @author Tiago Franco
 * Servico de acesso ao repositorio de Model
 * Deverá possuir os metodos contendo operacoes de escrita 
 * do modelo implementando a interface do repositorio
 */
class NomeEmpresaTrabalhaEloquentRepositoryService extends WebControlEloquentRepositoryService
{
    public function __construct(NomeEmpresaTrabalha $model, NomeEmpresaTrabalhaEloquentRepository $repository)
    {
        parent::__construct($model, $repository);
    }
}
