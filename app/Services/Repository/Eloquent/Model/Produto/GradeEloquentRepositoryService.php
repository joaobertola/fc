<?php

namespace App\Services\Repository\Eloquent\Model\Produto;

use App\DTO\Grades\GradeDTO;
use App\Model\Produto\Grade;
use App\Services\Utils\CodesApi;
use Illuminate\Support\Facades\DB;
use App\DTO\FrenteCaixa\DevolucaoDTO;
use App\Exceptions\ApiWebControlException;
use App\Repository\Eloquent\Model\Produto\GradeEloquentRepository;
use App\Services\Repository\Eloquent\WebControlEloquentRepositoryService;
use App\Services\Repository\Contracts\Model\Produto\GradeRepositoryServiceInterface;

/**
 * @author Tiago Franco
 * Servico de acesso ao repositorio de Model
 * Deverá possuir os metodos contendo operacoes de escrita 
 * do modelo implementando a interface do repositorio
 */
class GradeEloquentRepositoryService extends WebControlEloquentRepositoryService implements GradeRepositoryServiceInterface
{
    public function __construct(Grade $model, GradeEloquentRepository $repository)
    {
        parent::__construct($model, $repository);
    }

    public function salvarHistoricoGradeDevolucao(DevolucaoDTO $devolucaoDTO)
    {
        $sql = "INSERT INTO base_web_control.grade_historico(
            id_grade,
            id_cadastro,
            id_usuario,
            qtd_antigo,
            qtd_atual,
            codigo_barra_antigo,
            codigo_barra,
            valor_custo_antigo,
            valor_custo,
            valor_varejo_aprazo_antigo,
            valor_varejo_aprazo,
            ativo_antigo,
            ativo,
            data_hora_alteracao,
            origem_alteracao
            )
        SELECT
            g.id_grade,
            g.id_cadastro,
            g.id_usuario_alterou,
            g.qtd_atual - :qtdDevolucao,
            g.qtd_atual ,
            g.codigo_barra AS codigo_barra_antigo,
            g.codigo_barra,
            g.valor_custo AS valor_custo_antigo,
            g.valor_custo,
            g.valor_varejo_aprazo AS valor_varejo_aprazo_antigo,
            g.valor_varejo_aprazo,
            g.ativo AS ativo_antigo,
            g.ativo,
            NOW(),
            'Devolução por Produto'
        FROM base_web_control.grade g
        WHERE g.id_grade = :idGrade
        LIMIT 1";

        DB::connection($this->model->getConnectionName())
            ->insert($sql, [
                "qtdDevolucao" => $devolucaoDTO->getQuantidade(),
                "idGrade"      => $devolucaoDTO->getIdGrade()
            ]);

        $hGrade = DB::getPdo()->lastInsertId();

        if (!$hGrade) {
            throw new ApiWebControlException("Erro ao salvar o historico da grade", CodesApi::ERROOPERACAO);
        }

        return $hGrade;
    }

    public function atualizarQtdeEstoque(int $idGrade, int $qtdAtual)
    {
        $sql = "UPDATE base_web_control.grade SET qtd_atual = ?
                WHERE id_grade = ?";

        DB::connection($this->model->getConnectionName())->update($sql, [$qtdAtual, $idGrade]);
    }

    public function atualizarQtdeEstoqueProduto(int $idProduto, int $qtdAtual)
    {
        $sql = "UPDATE base_web_control.grade SET qtd_atual = ?
                WHERE id_produto = ?";

        DB::connection($this->model->getConnectionName())->update($sql, [$qtdAtual, $idProduto]);
    }

    public function salvarGrade(int $idProduto, string $codigoBarraPai, GradeDTO $gradeDTO)
    {
        $dados = [
            "id_cadastro"             => $this->_usuarioLogadoService->getIdCadastroLogado(),
            "id_produto"              => $idProduto,
            "id_grade_atributo_valor" => implode(',', $gradeDTO->getAtributosValores()),
            "id_usuario_alterou"      => $this->_usuarioLogadoService->getIdUsuarioLogado(),
            "codigo_barra_pai"        => $codigoBarraPai,
            "codigo_barra"            => $gradeDTO->getCodigoBarra(),
            "codigo_interno"          => $gradeDTO->getCodigoInterno(),
            "qtd_atual"               => $gradeDTO->getQtdAtual(),
            "qtd_minima"              => $gradeDTO->getQtdMinima(),
            "qtd_locacao"             => $gradeDTO->getQtdLocacao(),
            "qtd_locacao_locado"      => $gradeDTO->getQtdLocacaoLocado(),
            "valor_custo"             => $gradeDTO->getValorCusto(),
            "valor_varejo_avista"     => $gradeDTO->getValorVarejoAvista(),
            "valor_varejo_aprazo"     => $gradeDTO->getValorVarejoAprazo(),
            "valor_atacado_avista"    => $gradeDTO->getValorAtacadoAvista(),
            "valor_atacado_aprazo"    => $gradeDTO->getValorAtacadoAprazo(),
            "porc_varejo_avista"      => $gradeDTO->getPorcVarejoAvista(),
            "porc_varejo_aprazo"      => $gradeDTO->getPorcVarejoAprazo(),
            "porc_atacado_avista"     => $gradeDTO->getPorcAtacadoAvista(),
            "porc_atacado_aprazo"     => $gradeDTO->getPorcAtacadoAprazo(),
            "ativo"                   => $gradeDTO->getAtivo(),
            "alteracao"               => $gradeDTO->getAlteracao(),
        ];

        return $this->updateOrCreate([
            "id_produto" => $idProduto, "codigo_barra_pai" => $codigoBarraPai, "codigo_barra" => $gradeDTO->getCodigoBarra()
        ], $dados);
    }

    public function editarGrade(int $idGrade, GradeDTO $gradeDTO)
    {
        $dados = [
            "id_cadastro"             => $this->_usuarioLogadoService->getIdCadastroLogado(),
            "id_grade_atributo_valor" => implode(',', $gradeDTO->getAtributosValores()),
            "id_usuario_alterou"      => $this->_usuarioLogadoService->getIdUsuarioLogado(),
            "codigo_barra"            => $gradeDTO->getCodigoBarra(),
            "codigo_interno"          => $gradeDTO->getCodigoInterno(),
            "qtd_atual"               => $gradeDTO->getQtdAtual(),
            "qtd_minima"              => $gradeDTO->getQtdMinima(),
            "qtd_locacao"             => $gradeDTO->getQtdLocacao(),
            "qtd_locacao_locado"      => $gradeDTO->getQtdLocacaoLocado(),
            "valor_custo"             => $gradeDTO->getValorCusto(),
            "valor_varejo_avista"     => $gradeDTO->getValorVarejoAvista(),
            "valor_varejo_aprazo"     => $gradeDTO->getValorVarejoAprazo(),
            "valor_atacado_avista"    => $gradeDTO->getValorAtacadoAvista(),
            "valor_atacado_aprazo"    => $gradeDTO->getValorAtacadoAprazo(),
            "porc_varejo_avista"      => $gradeDTO->getPorcVarejoAvista(),
            "porc_varejo_aprazo"      => $gradeDTO->getPorcVarejoAprazo(),
            "porc_atacado_avista"     => $gradeDTO->getPorcAtacadoAvista(),
            "porc_atacado_aprazo"     => $gradeDTO->getPorcAtacadoAprazo(),
            "ativo"                   => $gradeDTO->getAtivo(),
        ];

        return $this->update($dados, $idGrade);
    }

    public function vincularFoto(int $idGrade, string $pathImage) {
        $sql = "INSERT INTO base_web_control.grade_foto (id_grade, caminho_imagem) VALUES (?,?)";
        DB::connection($this->model->getConnectionName())
        ->insert($sql, [$idGrade, $pathImage]);
    }

    public function excluirFoto(int $idGrade, int $idFoto) {
        $sql = "DELETE FROM base_web_control.grade_foto where id = ? and id_grade = ?";
        DB::connection($this->model->getConnectionName())
        ->delete($sql, [$idFoto, $idGrade]);
    }
}
