<?php

namespace App\Repository\Eloquent\Model\Franquias;

use App\DTO\DTO\Franquias\ClienteDTO;
use App\Model\Franquias\Cliente;
use App\Repository\Contracts\Model\Franquias\ClienteRepositoryInterface;
use App\Repository\Eloquent\WebControlEloquentRepository;

/**
 * @author Tiago Franco
 * Repositorio para metodos de consultas dos clientes
 * Todas as consultas deverá ser realizadas passando
 * a conexao atraves do metodo ::connection(connection)
 */
class ClienteEloquentRepository extends WebControlEloquentRepository implements ClienteRepositoryInterface
{
    protected $model;
    /**
     * Instantiate reporitory
     *
     * @param Cliente $model
     */
    public function __construct(Cliente $model)
    {
        parent::__construct($model);
    }
}
