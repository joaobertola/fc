<?php

namespace App\Model\BaseInform;

use App\Model\HasCompositePrimaryKey;
use Illuminate\Database\Eloquent\Model;

class NomeDataNascimento extends Model
{
    use HasCompositePrimaryKey;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'base_inform.Nome_DataNascimento';
    const UPDATED_AT = null;
    const CREATED_AT = null;
    public $timestamps = false;
    protected $primaryKey = ["CPF","Tipo"];

    protected $fillable = [
        "CPF",
        "Tipo",
        "data_nascimento",
    ];
}
