<?php

namespace App\Model\Produto\Promocao;

use Illuminate\Database\Eloquent\Model;

class PromocaoMix extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'base_web_control.promocao_mix';
    
    const UPDATED_AT = null;
    const CREATED_AT = null;
    public $timestamps = false;

    protected $fillable = [
        'id',
        'id_cadastro',
        'descricao',
        'array_id_produto',
        'qtd',
        'valor',
        'data_inicio',
        'data_fim',
        'status',
        'total_desconto',
    ];
}
