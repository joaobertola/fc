<?php

namespace App\Model\Nfe;

use Illuminate\Database\Eloquent\Model;

class NfeProdutoPISST extends Model
{
    protected $table = 'base_web_control.nfe_Produto_PISST';

    const UPDATED_AT = "data_alteracao";
    const CREATED_AT = null;
    protected $primaryKey = 'id_produto';
    public $incrementing = false;
    
    protected $fillable = [
        "id_produto",
        "tp_calculo",
        "pPIS",
        "qBCProd",
        "vAliqProd",
        "v_aliq",
        "tp_imposto",
        "data_alteracao",
        "data_sincronismo",
        "id_cadastro",
    ];
}
