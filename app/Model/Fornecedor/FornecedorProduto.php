<?php

namespace App\Model\Fornecedor;

use Illuminate\Database\Eloquent\Model;
/**
 * Class FornecedorProduto
 * @package App\Model\FornecedorProduto
 * @OA\Schema(
 *     schema="fornecedor_produto",
 *     type="object",
 *     title="Fornecedor Produto",
 *     properties={
 *         @OA\Property(property="id_fornecedor", type="integer"),
 *         @OA\Property(property="descricao", type="string"),
 *         @OA\Property(property="data_alteracao", type="string", format="date"),
 *         @OA\Property(property="data_sincronismo", type="string", format="date"),
 *         @OA\Property(property="id_off", type="integer")
 *     }
 * )
 */
class FornecedorProduto extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'base_web_control.fornecedor_produto';
    const CREATED_AT = null;
    const UPDATED_AT = 'data_alteracao';

    protected $fillable = [
        "id_fornecedor",
        "descricao",
        "data_alteracao",
        "data_sincronismo",
        "id_off",
        "id_cadastro",
    ];
}
