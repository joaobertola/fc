<?php

namespace App\Services\Repository\Eloquent\Model\BaseInform;

use App\Model\BaseInform\NomePessoaContato;
use App\Repository\Eloquent\Model\BaseInform\NomePessoaContatoEloquentRepository;
use App\Services\Repository\Eloquent\WebControlEloquentRepositoryService;

/**
 * @author Tiago Franco
 * Servico de acesso ao repositorio de Model
 * Deverá possuir os metodos contendo operacoes de escrita 
 * do modelo implementando a interface do repositorio
 */
class NomePessoaContatoEloquentRepositoryService extends WebControlEloquentRepositoryService
{
    public function __construct(NomePessoaContato $model, NomePessoaContatoEloquentRepository $repository)
    {
        parent::__construct($model, $repository);
    }
}
