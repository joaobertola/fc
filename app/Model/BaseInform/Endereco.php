<?php

namespace App\Model\BaseInform;

use Illuminate\Database\Eloquent\Model;

class Endereco extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'base_inform.Endereco';
    const UPDATED_AT = null;
    const CREATED_AT = "data_cadastro";

    protected $fillable = [
        "CPF",
        "Tipo",
        "Origem_Nome_id",
        "Tipo_Log_id",
        "logradouro",
        "numero",
        "complemento",
        "bairro",
        "cidade",
        "uf",
        "cep",
        "data_cadastro",
    ];
}
