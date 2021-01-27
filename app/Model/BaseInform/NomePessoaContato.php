<?php

namespace App\Model\BaseInform;

use Illuminate\Database\Eloquent\Model;

class NomePessoaContato extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'base_inform.Nome_PessoaContato';
    const UPDATED_AT = null;
    const CREATED_AT = null;
    public $timestamps = false;

    protected $fillable = [
        "cpf",
        "cpf_contato",
        "nome_contato",
        "log_contato",
        "bairro_contato",
        "cidade_contato",
        "cep_contato",
        "uf_contato",
    ];
}
