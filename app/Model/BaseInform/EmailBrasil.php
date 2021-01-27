<?php

namespace App\Model\BaseInform;

use Illuminate\Database\Eloquent\Model;

class EmailBrasil extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'base_inform.Email_Brasil';
    const UPDATED_AT = null;
    const CREATED_AT = null;
    public $timestamps = false;

    protected $fillable=[
        "CPF",
        "Tipo",
        "Email",
    ];
}
