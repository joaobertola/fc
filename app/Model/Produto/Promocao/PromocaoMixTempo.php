<?php

namespace App\Model\Produto\Promocao;

use Illuminate\Database\Eloquent\Model;

class PromocaoMixTempo extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'base_web_control.promocao_mix_tempo';
    
    const UPDATED_AT = null;
    const CREATED_AT = null;
    public $timestamps = false;

    protected $fillable = [
        'id_cadastro',
        'id_venda',
        'id_venda_item',
        'id_promo_mix',
        'id_produto',
        'id_funcionario',
        'id_cliente',
        'qtd',
        'codigo_barra',
    ];
}
