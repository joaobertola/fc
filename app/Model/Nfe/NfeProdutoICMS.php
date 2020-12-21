<?php

namespace App\Model\Nfe;

use Illuminate\Database\Eloquent\Model;

class NfeProdutoICMS extends Model
{
    protected $table = 'base_web_control.nfe_Produto_ICMS';

    const UPDATED_AT = "data_alteracao";
    const CREATED_AT = null;
    protected $primaryKey = 'id_produto';
    public $incrementing = false;
    
    protected $fillable = [
        "id_produto",
        "orig",
        "CST",
        "modBC",
        "pRedBC",
        "pICMS",
        "modBCST",
        "pMVAST",
        "pRedBCST",
        "pICMSST",
        "regimes",
        "pOpePropria",
        "uf",
        "vl_aliq_calc_cre",
        "bc_icms_st_ret_ant",
        "pMVAST_LR",
        "valor_desoneracao_icms",
        "motivo_desoneracao_icms",
        "percentual_diferimento_icms",
        "uf_retido_remetente_icms_st",
        "uf_destino_icms_st",
        "data_alteracao",
        "data_sincronismo",
        "id_off",
        "id_cadastro",
    ];
}
