<?php

namespace App\Model\MercadoLivre;

use Illuminate\Database\Eloquent\Model;

class MercadoLivre extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'base_web_control.mercado_livre_produto';
    
    protected $fillable = [
        "id_mercado_livre",
        "id_produto",
    ];
}