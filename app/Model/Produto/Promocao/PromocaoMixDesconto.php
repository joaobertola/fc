<?php

namespace App\Model\Produto\Promocao;

use Illuminate\Database\Eloquent\Model;

class PromocaoMixDesconto extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'base_web_control.promocao_mix_desconto';
    
    const UPDATED_AT = null;
    const CREATED_AT = null;
    public $timestamps = false;

    protected $fillable = [
        'id_cadastro',
        'id_promocao_mix',
        'id_produto',
        'valor_desconto'
    ];
}
