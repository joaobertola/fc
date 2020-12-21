<?php

namespace App\Model\Produto;

use Illuminate\Database\Eloquent\Model;
/**
 * Class Grade
 * @package App\Model\Produto\Grade
 * @OA\Schema(
 *     schema="grade",
 *     type="object",
 *     title="Grade",
 *     properties={
 *          @OA\Property(property="id_produto", type="integer"),
 *          @OA\Property(property="id_grade_atributo_valor", type="integer"),
 *          @OA\Property(property="id_usuario_alterou", type="integer"),
 *          @OA\Property(property="codigo_barra_pai", type="string"),
 *          @OA\Property(property="codigo_barra", type="string"),
 *          @OA\Property(property="codigo_interno", type="string"),
 *          @OA\Property(property="qtd_atual", type="number"),
 *          @OA\Property(property="qtd_minima", type="number"),
 *          @OA\Property(property="qtd_locacao", type="number"),
 *          @OA\Property(property="qtd_locacao_locado", type="number"),
 *          @OA\Property(property="valor_custo", type="number"),
 *          @OA\Property(property="valor_varejo_avista", type="number"),
 *          @OA\Property(property="valor_varejo_aprazo", type="number"),
 *          @OA\Property(property="valor_atacado_avista", type="number"),
 *          @OA\Property(property="valor_atacado_aprazo", type="number"),
 *          @OA\Property(property="porc_varejo_avista", type="number"),
 *          @OA\Property(property="porc_varejo_aprazo", type="number"),
 *          @OA\Property(property="porc_atacado_avista", type="number"),
 *          @OA\Property(property="porc_atacado_aprazo", type="number"),
 *          @OA\Property(property="ativo", type="integer"),
 *          @OA\Property(property="data_alteracao", type="string", format="date"),
 *          @OA\Property(property="data_sincronismo", type="string",format="date"),
 *          @OA\Property(property="id_off", type="integer"),
 *          @OA\Property(property="alteracao", type="string"),
 *     }
 * )
 */
class Grade extends Model
{
    protected $table = 'base_web_control.grade';

    const UPDATED_AT = "data_alteracao";
    const CREATED_AT = null;
    
    protected $primaryKey = "id_grade";

    protected $fillable = [
        "id_cadastro",
        "id_produto",
        "id_grade_atributo_valor",
        "id_usuario_alterou",
        "codigo_barra_pai",
        "codigo_barra",
        "codigo_interno",
        "qtd_atual",
        "qtd_minima",
        "qtd_locacao",
        "qtd_locacao_locado",
        "valor_custo",
        "valor_varejo_avista",
        "valor_varejo_aprazo",
        "valor_atacado_avista",
        "valor_atacado_aprazo",
        "porc_varejo_avista",
        "porc_varejo_aprazo",
        "porc_atacado_avista",
        "porc_atacado_aprazo",
        "ativo",
        "data_alteracao",
        "data_sincronismo",
        "id_off",
        "alteracao",
    ];
}
