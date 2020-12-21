<?php

namespace App\Model\Comanda;

use Illuminate\Database\Eloquent\Model;

/**
 * Class CmMesa
 * @package App\Model\Comanda
 * @OA\Schema(
 *     schema="mesa_comanda",
 *     type="object",
 *     title="Mesa Comanda",
 *     required={"id","id_cadastro","num_mesa","status","id_off","data_alteracao","data_sincronismo","qtde_pessoas"},
 *     properties={
 *          @OA\Property(property="id", type="integer"),
 *          @OA\Property(property="id_cadastro", type="integer"),
 *          @OA\Property(property="num_mesa", type="string"),
 *          @OA\Property(property="status", type="integer"),
 *          @OA\Property(property="id_off", type="integer"),
 *          @OA\Property(property="data_alteracao", type="datetime"),
 *          @OA\Property(property="data_sincronismo", type="datetime"),
 *          @OA\Property(property="qtde_pessoas", type="integer"),
 *     }
 * )
 */
class CmMesa extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'base_web_control.cm_mesa';

    const UPDATED_AT = null;
    const CREATED_AT = null;
    public $timestamps = false;
}
