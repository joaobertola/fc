<?php

namespace App\Model\Relatorio;

use Illuminate\Database\Eloquent\Model;

/**
 * Class RelatorioCampos
 * @package App\Model\Relatorio\RelatorioCampos
 * @OA\Schema(
 *     schema="relatorioCampos",
 *     type="object",
 *     title="RelatorioCampos",
 *     required={"id_campo","id_tabela","nome_campo","tamanho_campo","nome_campo_form","tabela_forenign","campo_forenign","categoria","mascara","ordemApresentacao"},
 *     properties={
 *         @OA\Property(property="id_campo", type="integer"),
 *         @OA\Property(property="id_tabela", type="integer"),
 *         @OA\Property(property="nome_campo", type="string"),
 *         @OA\Property(property="tamanho_campo", type="integer"),
 *         @OA\Property(property="nome_campo_form", type="string"),
 *         @OA\Property(property="tabela_forenign", type="string"),
 *         @OA\Property(property="campo_forenign", type="string"),
 *         @OA\Property(property="categoria", type="string"),
 *         @OA\Property(property="mascara", type="string"),
 *         @OA\Property(property="ordemApresentacao", type="integer"),
 *     }
 * )
 */
class RelatorioCampos extends Model
{
    protected $table = 'base_web_control.relatorios_campos';
    
    const UPDATED_AT = null;
    const CREATED_AT = null;
    public $timestamps = false;  
}
