<?php

namespace App\Model\Fornecedor;

use Illuminate\Database\Eloquent\Model;
/**
 * Class Fornecedor
 * @property string $id
 * @property string $nome
 * @package App\Model\Fornecedor
 * @OA\Schema(
 *     schema="fornecedor",
 *     type="object",
 *     title="Fornecedor",
 *     properties={
 *         @OA\Property(property="id", type="integer"),
 *         @OA\Property(property="razao_social", type="string")
 *     }
 * )
 */
class Fornecedor extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'base_web_control.fornecedor';
    const CREATED_AT = 'data_cadastro';
    const UPDATED_AT = 'data_alteracao';

    protected $fillable = [
        'razao_social',
        'fantasia',
        'contato',
        'cnpj_cpf',
        'telefone',
        'fax',
        'celular',
        'email',
        'site',
        'skype',
        'endereco',
        'numero',
        'complemento',
        'cep',
        'bairro',
        'cidade',
        'uf',
        'informacoes_adicionais',
        'id_cadastro',
        'id_usuario',
        'tipo_pessoa',
        'ativo',
        'data_cadastro',
        'id_tipo_log',
        'tipo_cadastro',
        'id_fornecedor_servico',
        'id_tmp',
        'rgie',
        'fone_tmp',
        'insc_estadual',
        'insc_municipal',
        'id_forn_master',
        'data_fundacao',
        'prazo_entrega_produtos',
        'id_importacao',
        'isento_icms',
        'data_alteracao',
        'data_sincronismo',
        'id_off',
        'pais',
        'id_pais',
    ];
}
