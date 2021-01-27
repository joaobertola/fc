<?php

namespace App\Model\BaseInform;

use Illuminate\Database\Eloquent\Model;

class TelefonesBrasil extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'base_inform.Telefones_Brasil';
    const UPDATED_AT = null;
    const CREATED_AT = null;
    public $timestamps = false;

    protected $fillable = [
        "ddd",
        "fone",
        "cpfcnpj",
        "id_tplog",
        "log",
        "numero",
        "compl",
        "bairro",
        "cidade",
        "cep",
        "uf",
    ];
}
