<?php

namespace App\Model\Franquias;

use Illuminate\Database\Eloquent\Model;

class Cliente extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'cs2.cadastro';
    const UPDATED_AT = 'data_alteracao';
    const CREATED_AT = 'dt_cad';
}
