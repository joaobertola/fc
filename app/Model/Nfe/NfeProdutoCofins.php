<?php

namespace App\Model\Nfe;

use Illuminate\Database\Eloquent\Model;

class NfeProdutoCofins extends Model
{
    protected $table = 'base_web_control.nfe_Produto_COFINS';

    const UPDATED_AT = "data_alteracao";
    const CREATED_AT = null;
    protected $primaryKey = 'id_produto';
    public $incrementing = false;
    
    protected $fillable = [
        "id_produto",
        "p_aliq",
        "CST",
        "pCOFINS",
        "qBCProd",
        "v_aliq",
        "tp_calculo",
        "tp_imposto",
        "data_alteracao",
        "data_sincronismo",
        "id_cadastro",
        "id_off",
    ];
}
