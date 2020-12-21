<?php

namespace App\Model\Fornecedor;

use Illuminate\Database\Eloquent\Model;
/**
 * Class FornecedorBanco
 * @property string $id
 * @property string $nome
 * @package App\Model\FornecedorBanco
 * @OA\Schema(
 *     schema="fornecedor_banco",
 *     type="object",
 *     title="Fornecedor Banco",
 *     properties={
 *         @OA\Property(property="id_fornecedor", type="integer"),
 *         @OA\Property(property="id_banco", type="integer"),
 *         @OA\Property(property="agencia", type="integer"),
 *         @OA\Property(property="conta", type="integer"),
 *         @OA\Property(property="titular", type="integer"),
 *         @OA\Property(property="titular_cpfcnpj", type="integer"),
 *         @OA\Property(property="tipo_conta", type="string"),
 *         @OA\Property(property="data_alteracao", type="string", format="datetime"),
 *         @OA\Property(property="id", type="integer"),
 *     }
 * )
 */
class FornecedorBanco extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'base_web_control.fornecedor_banco';
    const CREATED_AT = null;
    const UPDATED_AT = 'data_alteracao';

    protected $fillable = [
        "id_fornecedor",
        "id_banco",
        "agencia",
        "conta",
        "titular",
        "titular_cpfcnpj",
        "tipo_conta",
        "data_alteracao",
        "data_sincronismo",
        "id_off",
    ];
}
