<?php

namespace App\Services\Repository\Eloquent\Model\Lite;

use App\Model\Venda\Venda;
use App\Repository\Eloquent\Model\Lite\LiteEloquentRepository;
use App\Services\Repository\Eloquent\WebControlEloquentRepositoryService;
use App\Services\Repository\Contracts\Model\Lite\LiteRepositoryServiceInterface;

/**
 * @author Tiago Franco
 * Servico de acesso ao repositorio de Model
 * Deverá possuir os metodos contendo operacoes de escrita
 * do modelo implementando a interface do repositorio
 */
class LiteEloquentRepositoryService extends WebControlEloquentRepositoryService implements LiteRepositoryServiceInterface
{
    public function __construct(Venda $model, LiteEloquentRepository $repository)
    {
        parent::__construct($model, $repository);
    }
}
