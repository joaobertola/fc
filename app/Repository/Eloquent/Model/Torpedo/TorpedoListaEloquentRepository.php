<?php

namespace App\Repository\Eloquent\Model\Torpedo;

use Illuminate\Support\Facades\DB;
use App\Model\Torpedos\TorpedoLista;
use App\Repository\Eloquent\WebControlEloquentRepository;
use App\Repository\Contracts\Model\Torpedo\TorpedoListaRepositoryInterface;

/**
 * @author Tiago Franco
 * Repositorio para metodos de consultas dos clientes
 * Todas as consultas deverá ser realizadas passando
 * a conexao atraves do metodo ::connection(connection)
 */
class TorpedoListaEloquentRepository extends WebControlEloquentRepository implements TorpedoListaRepositoryInterface
{
    protected $model;
    /**
     * Instantiate reporitory
     * 
     * @param TorpedoLista $model
     */
    public function __construct(TorpedoLista $model)
    {
        parent::__construct($model);
    }

    public function getQtdeTelefonesListas(array $idListas)
    {
        $sql = "select count(1) as qtde, id_lista from 
                base_web_control.torpedo_lista_telefones 
                where id_lista IN (?) and id_cadastro = ?
                group by id_lista";

        $totais =  DB::connection($this->model->getConnectionName())
            ->select($sql, [implode(",", $idListas), $this->_usuarioLogadoService->getIdCadastroLogado()]);
        
        return array_column($totais, 'qtde', 'id_lista');
    }

    public function getPeloNome(string $nomeLista)
    {
        return DB::connection($this->model->getConnectionName())
            ->table("base_web_control.torpedo_lista")
            ->where([
                ["id_cadastro", $this->_usuarioLogadoService->getIdCadastroLogado()],
                ["nome_lista", "like", "%{$nomeLista}%"]
            ])
            ->orderBy('dt_creation', 'desc')
            ->get()
            ->toArray();
    }

    public function getPeloFoneOrNomeLista(string $termoPesquisa, int $idLista)
    {
        return DB::connection($this->model->getConnectionName())
            ->table("base_web_control.torpedo_lista_telefones")
            ->where([
                ['id_cadastro', $this->_usuarioLogadoService->getIdCadastroLogado()],
                ['id_lista', $idLista],
                ['nome', 'like', "%{$termoPesquisa}%"]
            ])->orWhere([
                ['id_cadastro', $this->_usuarioLogadoService->getIdCadastroLogado()],
                ['id_lista', $idLista],
                ['telefone', 'like', "%{$termoPesquisa}%"]
            ])
            ->orderBy('nome', 'asc')
            ->get()
            ->toArray();
    }
}
