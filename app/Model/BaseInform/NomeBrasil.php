<?php

namespace App\Model\BaseInform;

use Illuminate\Database\Eloquent\Model;

class NomeBrasil extends Model
{
     /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'base_inform.Nome_Brasil';
    const UPDATED_AT = null;
    const CREATED_AT = "Dt_Cad";

    protected $fillable=[
        "Origem_Nome_id",
        "Nom_CPF",
        "Nom_Tp",
        "Nom_Nome",
        "Dt_Cad",
    ];
}
