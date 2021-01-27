<?php

namespace App\Model\Cliente;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Cliente
 * @property string $id
 * @property string $nome
 * @package App\Model\Cliente
 * @OA\Schema(
 *     schema="cliente",
 *     type="object",
 *     title="Cliente",
 *     required={"id", "nome"},
 *     properties={
 *         @OA\Property(property="id", type="integer"),
 *         @OA\Property(property="nome", type="string"),
 *         @OA\Property(property="enderecos", type="array", 
 *         @OA\Items(ref="#/components/schemas/cliente_endereco"))
 *     }
 * )
 */
class Cliente extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'base_web_control.cliente';
    const UPDATED_AT = 'data_cadastro';
    const CREATED_AT = 'data_alteracao';
}
