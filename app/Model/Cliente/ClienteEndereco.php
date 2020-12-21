<?php

namespace App\Model\Cliente;

use Illuminate\Database\Eloquent\Model;

/**
 * Class ClienteEndereco
 * @property string $id
 * @property string $nome
 * @package App\Model\ClienteEndereco
 * @OA\Schema(
 *     schema="cliente_endereco",
 *     type="object",
 *     title="Cliente Endereço",
 *     required={"id", "nome"},
 *     properties={
 *          @OA\Property(property="id", type="integer"),
 *          @OA\Property(property="tipo_endereco", type="string"),
 *          @OA\Property(property="cnpj_cpf", type="string"),
 *          @OA\Property(property="nome", type="string"),
 *          @OA\Property(property="razao_social", type="string"),
 *          @OA\Property(property="id_tipo_log", type="integer"),
 *          @OA\Property(property="endereco", type="string"),
 *          @OA\Property(property="numero", type="string"),
 *          @OA\Property(property="complemento", type="string"),
 *          @OA\Property(property="bairro", type="string"),
 *          @OA\Property(property="cidade", type="string"),
 *          @OA\Property(property="uf", type="string"),
 *          @OA\Property(property="cep", type="string"),
 *          @OA\Property(property="pais", type="string"),
 *     }
 * )
 */
class ClienteEndereco extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'base_web_control.cliente_endereco';
    const UPDATED_AT = null;
    const CREATED_AT = null;
    public $timestamps = false;

    public $fillable = [
        "tipo_endereco",
        "cnpj_cpf",
        "nome",
        "razao_social",
        "id_tipo_log",
        "endereco",
        "numero",
        "complemento",
        "bairro",
        "cidade",
        "uf",
        "cep",
        "pais",
    ];

}
