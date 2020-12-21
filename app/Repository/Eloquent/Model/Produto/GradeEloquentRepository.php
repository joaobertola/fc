<?php

namespace App\Repository\Eloquent\Model\Produto;

use App\Model\Produto\Grade;
use App\Repository\Contracts\Model\Produto\GradeRepositoryInterface;
use App\Repository\Eloquent\WebControlEloquentRepository;
use Illuminate\Support\Facades\DB;

/**
 * @author Tiago Franco
 * Repositorio para metodos de consultas dos clientes
 * Todas as consultas deverá ser realizadas passando
 * a conexao atraves do metodo ::connection(connection)
 */
class GradeEloquentRepository extends WebControlEloquentRepository implements GradeRepositoryInterface
{
    protected $model;
    /**
     * Instantiate reporitory
     * 
     * @param Grade $model
     */
    public function __construct(Grade $model)
    {
        parent::__construct($model);
    }

    public function getGradeProduto(int $idProduto, string $codigoBarra)
    {
        return $this->findOneBy([
            ['id_produto',   '=', $idProduto],
            ['codigo_barra', '=', $codigoBarra],
        ]);
    }

    public function getGradesProduto(int $idProduto)
    {
        $sql = "SELECT
                    g.id_grade,
                    p.id AS id_produto,
                    @caracteristicas:= IF(base_web_control.fn_get_descricao_grade(g.id_grade_atributo_valor) = '','(Principal)',base_web_control.fn_get_descricao_grade(g.id_grade_atributo_valor)),
                    @pro:= (CONCAT(p.descricao, ' - ', @caracteristicas)),
                    IF(@pro IS NULL, CONCAT(p.descricao, ' (Principal)'), @pro) AS descricao,
                    g.codigo_barra,
                    g.codigo_barra_pai,
                    g.valor_custo,
                    g.qtd_minima,
                    g.valor_varejo_aprazo,
                    g.valor_atacado_aprazo,
                    g.qtd_atual,
                    u.sigla,
                    @caracteristicas AS atributos,
                    IF(CAST(g.codigo_barra AS CHAR) != CAST(g.codigo_barra_pai AS CHAR),0,1) as pai
                FROM base_web_control.grade g
                INNER JOIN base_web_control.produto p ON p.id = g.id_produto
                LEFT JOIN  base_web_control.unidade u ON u.id = p.id_unidade
                WHERE g.id_cadastro = ?
                AND g.id_produto = ?
                AND g.ativo = '1'
                ORDER BY g.id_grade        
                ";

        $grades = DB::select($sql, [$this->_usuarioLogadoService->getIdCadastroLogado(), $idProduto]);
        $grades = array_map(function($grade) {
            //retirar do retorno o uso da variavel
            unset($grade->{"@caracteristicas:= IF(base_web_control.fn_get_descricao_grade(g.id_grade_atributo_valor) = '','(Principal)',base_web_control.fn_get_descricao_grade(g.id_grade_atributo_valor))"});
            unset($grade->{"@pro:= (CONCAT(p.descricao, ' - ', @caracteristicas))"});
            return $grade;
        }, $grades);

        return $grades;
    }
    
    public function getGradePorCodigoBarras(string $codigoBarra) {
        $sql     = "select * from base_web_control.grade where codigo_barra = ? and id_cadastro = ? LIMIT 1";
        $grade   = DB::connection($this->model->getConnectionName())
            ->selectOne($sql, [$codigoBarra, $this->_usuarioLogadoService->getIdCadastroLogado()]);
        
        return $grade;
    }

    public function getAtributosPreenchidos() {
        $sql = "SELECT
                    b.id_grade_atributo,
                    b.atributo
                FROM base_web_control.grade_atributo_valor a
                    INNER JOIN base_web_control.grade_atributo b
                    ON a.id_atributo = b.id_grade_atributo AND a.ativo = 1
                WHERE b.id_cadastro = ?
                AND b.ativo = 1
                GROUP BY b.id_grade_atributo";

        return DB::connection($this->model->getConnectionName())
            ->select($sql, [$this->_usuarioLogadoService->getIdCadastroLogado()]);
    }

    public function getValoresByAtributo(int $idAtributo) {
        $sql = "SELECT
                    a.id_grade_atributo_valor,
                    a.valor
                FROM base_web_control.grade_atributo_valor a
                    INNER JOIN base_web_control.grade_atributo b
                    ON a.id_atributo = b.id_grade_atributo
                WHERE  b.id_cadastro = ?
                AND a.id_atributo = ?
                AND a.ativo = 1
                AND b.ativo = 1
                ORDER BY a.valor;";

        return DB::connection($this->model->getConnectionName())
            ->select($sql, [$this->_usuarioLogadoService->getIdCadastroLogado(), $idAtributo]);
    }
}

