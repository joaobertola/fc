<?php

namespace App\Model\Cs2;

use Illuminate\Database\Eloquent\Model;
/**
 * Class Cadastro
 * @property string $id
 * @property string $nome
 * @package App\Model\Cs2
 * @OA\Schema(
 *     schema="cadastro",
 *     type="object",
 *     title="Cadastro",
 *     properties={
 *        
 *     }
 * )
 */
class Cadastro extends Model
{
    protected $table = 'cs2.cadastro';    

    const UPDATED_AT = null;
    const CREATED_AT = null;
    public $timestamps = false;
}
