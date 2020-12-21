<?php

namespace App\Model\Nfe;

use Illuminate\Database\Eloquent\Model;

class NfeCupomFiscal extends Model
{
    protected $table = 'base_web_control.nfe_cupom_fiscal';

    const UPDATED_AT = "data_alteracao";
    const CREATED_AT = null;
    protected $primaryKey = 'id_cupom_fiscal';
    
    protected $fillable = [
        "id_produto",
        "id_cfop",
        "ncm",
        "sped",
        "percentual_issqn",
        "cst",
        "codigo_balanca",
        "percentual_icms",
        "percentual_pis",
        "csosn",
        "totalizador_parcial",
        "percentual_ipi",
        "percentual_cofins",
        "icmsst",
        "situacao_tributaria",
        "iat",
        "ippt",
        "data_alteracao",
        "data_sincronismo",
        "id_off",
        "id_cadastro",
    ];
}
