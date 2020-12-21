<?php

namespace App;

use Tymon\JWTAuth\Contracts\JWTSubject;
use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;

/**
 * Class User
 * @package App\User
 * @OA\Schema(
 *     schema="usuario",
 *     type="object",
 *     title="Usuario",
 *     properties={
 *         @OA\Property(property="id", type="integer"),
 *         @OA\Property(property="nome_usuario", type="string"),
 *         @OA\Property(property="login", type="string"),
 *         @OA\Property(property="data_criacao", type="string",format="datetime"),
 *         @OA\Property(property="ativo", type="string"),
 *         @OA\Property(property="id_funcionario", type="integer"),
 *         @OA\Property(property="login_master", type="string"),
 *         @OA\Property(property="email", type="string"),
 *         @OA\Property(property="data_desabilita", type="string",format="datetime"),
 *         @OA\Property(property="percentual_desconto_autorizado", type="number"),
 *         @OA\Property(property="percentual_desconto_item", type="number"),
 *         @OA\Property(property="cnpj_cpf", type="string"),
 *         @OA\Property(property="id_tipo_permissao_usuario", type="integer"),
 *         @OA\Property(property="array_permissao", type="array", @OA\Items()),
 *         @OA\Property(property="agenda", type="integer"),
 *         @OA\Property(property="horario_inicio", type="string", format="time"),
 *         @OA\Property(property="horario_fim", type="string",format="time"),
 *         @OA\Property(property="data_alteracao", type="string", format="datetime"),
 *         @OA\Property(property="data_sincronismo", type="string", format="datetime"),
 *         @OA\Property(property="id_off", type="integer"),
 *         @OA\Property(property="dias_semana", type="string"),
 *     }
 * )
 */
class User extends Authenticatable implements JWTSubject
{
    const CREATED_AT = 'data_criacao';
    const UPDATED_AT = 'data_alteracao';

    use Notifiable;

    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'base_web_control.webc_usuario';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token', 'api_key', 'senha'
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    /**
     * Get the identifier that will be stored in the subject claim of the JWT.
     *
     * @return mixed
     */
    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    /**
     * Return a key value array, containing any custom claims to be added to the JWT.
     *
     * @return array
     */
    public function getJWTCustomClaims()
    {
        return [];
    }
}
