<?php

namespace App\Model\Nfe;

use Illuminate\Database\Eloquent\Model;

class NfeProdutoIssqn extends Model
{
    protected $table = 'base_web_control.nfe_Produto_ISSQN';

    const UPDATED_AT = "data_alteracao";
    const CREATED_AT = null;
    protected $primaryKey = 'ISSQN_id';
    
    protected $fillable = [
        "imposto_id",
        "pAliq",
        "uf",
        "cMunFG",
        "cListServ",
        "tributacao",
        "produto_id",
        "id_exigibilidade",
        "incentivo_fiscal",
        "valor_deducoes",
        "valor_outras_retencoes",
        "valor_desconto_condicionado",
        "valor_retencao",
        "codigo_servico",
        "uf_incidencia",
        "id_municipio_incidencia",
        "processo",
        "data_alteracao",
        "data_sincronismo",
        "id_cadastro",
        "id_off",
    ];

    
}
