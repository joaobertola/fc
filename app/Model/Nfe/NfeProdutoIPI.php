<?php

namespace App\Model\Nfe;

use Illuminate\Database\Eloquent\Model;

class NfeProdutoIPI extends Model
{
    protected $table = 'base_web_control.nfe_Produto_IPI';

    const UPDATED_AT = "data_alteracao";
    const CREATED_AT = null;
    protected $primaryKey = 'id_produto';
    public $incrementing = false;
    
    protected $fillable = [
        "id_produto",
        "cIEnq",
        "CNPJProd",
        "cSelo",
        "qSelo",
        "cEnq",
        "CST",
        "qUnid",
        "pIPI",
        "tp_calculo",
        "v_aliq",
        "data_alteracao",
        "data_sincronismo",
        "id_cadastro",
    ];
}
