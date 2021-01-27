<?php

namespace App\Model\Venda;

use Illuminate\Database\Eloquent\Model;

class VendaConsignacaoDevolucao extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'base_web_control.venda_consignacao_devolucao';

    const UPDATED_AT = null;
    const CREATED_AT = "data_cadastro";
    
    protected $fillable = [        
        'id_cadastro',
        'id_venda',
        'id_venda_item',
        'id_usuario',
        'qtd',
        'qtd_anterior',
        'data_cadastro',
    ];
 
}