<?php

namespace App\Model\Nfe;

use Illuminate\Database\Eloquent\Model;

class NfeProdutoCofinsSt extends Model
{
    protected $table = 'base_web_control.nfe_Produto_COFINSST';

    const UPDATED_AT = "data_alteracao";
    const CREATED_AT = null;
    
    protected $fillable = [
        "imposto_id",
        "pCOFINS",
        "qBCProd",
        "v_aliq",
        "tp_calculo",
        "produto_id",
        "tp_imposto",
        "data_alteracao",
        "data_sincronismo",
        "id_cadastro",
        "id_off",
    ];
}
