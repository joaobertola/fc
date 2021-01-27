<?php

namespace App\Model\Produto;

use Illuminate\Database\Eloquent\Model;
/**
 * Class Grade
 * @package App\Model\Produto\GradeFoto
 * @OA\Schema(
 *     schema="grade_foto",
 *     type="object",
 *     title="Grade Foto",
 *     properties={
 *          @OA\Property(property="id_grade", type="integer"),
 *          @OA\Property(property="caminho_imagem", type="string"),
 *     }
 * )
 */
class GradeFoto extends Model
{
    protected $table = 'base_web_control.grade_foto';

    const UPDATED_AT = "data_alteracao";
    const CREATED_AT = null;
    public $timestamps = false;    

    protected $fillable = [
        "id_grade",
        "caminho_imagem",
    ];
}
