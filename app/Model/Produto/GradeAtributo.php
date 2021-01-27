<?php

namespace App\Model\Produto;

use Illuminate\Database\Eloquent\Model;

class GradeAtributo extends Model
{
    protected $table = 'base_web_control.grade_atributo';

    const UPDATED_AT = "data_alteracao";
    const CREATED_AT = null;
    
    protected $primaryKey = "id_grade_atributo";

    protected $fillable = [
        "id_cadastro",
        "atributo",
        "ativo",
        "data_alteracao",
        "data_sincronismo",
        "id_off",
    ];
}
