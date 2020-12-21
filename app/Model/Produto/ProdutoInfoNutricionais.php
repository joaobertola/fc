<?php

namespace App\Model\Produto;

use Illuminate\Database\Eloquent\Model;

class ProdutoInfoNutricionais extends Model
{
    protected $table = 'base_web_control.produto_info_nutricionais';

    const UPDATED_AT = "data_alteracao";
    const CREATED_AT = null;
    protected $primaryKey = 'id_produto';
    public $incrementing = false;

    protected $fillable = [
        'id_produto',
        'dias',
        'porcao',
        'calorias',
        'caboidrato',
        'proteinas',
        'gord_tot',
        'gord_sat',
        'colesterol',
        'gord_trans',
        'fibra',
        'calcio',
        'ferro',
        'sodio',
        'data_alteracao',
        'data_sincronismo',
        'id_cadastro',
        'id_off',
    ];
}
