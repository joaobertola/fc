<?php

namespace App\Model\Produto;

use Illuminate\Database\Eloquent\Model;

class ProdutoBeneficioFiscal extends Model
{
    protected $table = 'base_web_control.produto_beneficio_fiscal';
    const UPDATED_AT = null;
    const CREATED_AT = null;
    public $timestamps = false;

    protected $fillable = [
        'id_produto',
        'cst',
        'cBeneFiscal',
    ];
}
