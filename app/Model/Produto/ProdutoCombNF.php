<?php

namespace App\Model\Produto;

use Illuminate\Database\Eloquent\Model;

class ProdutoCombNF extends Model
{
    protected $table = 'base_web_control.produto_combNF';

    const UPDATED_AT = null;
    const CREATED_AT = null;
    public $timestamps = false;

    protected $fillable = [
        'id_produto',
        'descANP',
        'pGLP',
        'CODIF',
        'qTemp',
    ];
}
