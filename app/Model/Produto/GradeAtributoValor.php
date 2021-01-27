<?php

namespace App\Model\Produto;

use Illuminate\Database\Eloquent\Model;

class GradeAtributoValor extends Model
{
    protected $table = 'base_web_control.grade_atributo_valor';

    const UPDATED_AT = "data_alteracao";
    const CREATED_AT = null;
    
    protected $primaryKey = "id_grade_atributo_valor";

    protected $fillable = [
        "id_atributo",
        "valor",
        "ativo",
        "data_alteracao",
        "data_sincronismo",
        "id_off",
        "id_cadastro",
    ];
}
