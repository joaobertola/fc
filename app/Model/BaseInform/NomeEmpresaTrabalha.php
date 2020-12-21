<?php

namespace App\Model\BaseInform;

use Illuminate\Database\Eloquent\Model;

class NomeEmpresaTrabalha extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'base_inform.Nome_Empresa_Trabalha';
    const UPDATED_AT = null;
    const CREATED_AT = null;
    public $timestamps = false;

    protected $fillable = [
        "CPF",
        "Tipo",
        "cnpj_empresa",
        "empresa",
        "cargo",
        "endereco_empresa",
    ];
}
