<?php

namespace App\Repository\Eloquent\Model\Lite;

use App\Model\Venda\Venda;
use App\Repository\Eloquent\WebControlEloquentRepository;
use App\Repository\Contracts\Model\Lite\LiteRepositoryInterface;
use Illuminate\Support\Facades\DB;

/**
 * @author Tiago Franco
 * Repositorio para metodos de consultas das tabelas que o lite usa
 * Todas as consultas deverá ser realizadas passando
 * a conexao atraves do metodo ::connection(connection)
 */
class LiteEloquentRepository extends WebControlEloquentRepository implements LiteRepositoryInterface
{
    protected $model;
    /**
     * Instantiate reporitory
     *
     * @param Venda $model
     */
    public function __construct(Venda $model)
    {
        parent::__construct($model);
    }

    public function verificaTabelas($liteDTO)
    {

        set_time_limit(300);

        $retorno               = [];
        $database              = 'base_web_control';
        $tabelas               = $liteDTO->getTabelas();
        $dataUltimoSincronismo = $liteDTO->getDataUltimoSincronismo();
        $idCadastro            = $this->_usuarioLogadoService->getIdCadastroLogado();

        foreach ($tabelas as $tb) {
            $tabela = $database . '.' . $tb;
            $query = "SELECT COUNT(*) as registros FROM " . $tabela . " WHERE data_alteracao >= '" . $dataUltimoSincronismo . "' AND id_cadastro = " . $idCadastro;
            if ($tb == "venda_pagamento") {
                $query = "SELECT vp.id as registros
                FROM base_web_control.venda v
                INNER JOIN base_web_control.venda_pagamento vp ON v.id = vp.id_venda
                WHERE vp.data_alteracao >= '" . $dataUltimoSincronismo . "' AND v.id_cadastro = " . $idCadastro . " LIMIT 1";
            }
            $result = DB::connection($this->model->getConnectionName())->select($query);
            $registros  = !empty($result) ? $result[0]->registros : 0;
            if ($registros > 0) {
                $retorno[] = $tb;
            }
        }

        return $retorno;
    }

    public function consultaCaixa($idCaixa, $situacaoCaixa)
    {

        $idCadastro            = $this->_usuarioLogadoService->getIdCadastroLogado();

        $query = "SELECT v.id, v.situacao FROM base_web_control.venda v WHERE v.id_cadastro = " . $idCadastro . " AND v.id_abertura_caixa = " . $idCaixa;
        if (!is_null($situacaoCaixa)) {
            $query = $query . " AND v.situacao = '" . $situacaoCaixa . "'";
        }
        $result = DB::connection($this->model->getConnectionName())->select($query);

        return $result;
    }
}
