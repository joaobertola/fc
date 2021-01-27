<?php

namespace App\Model\DadosBancarios;

use App\Entity\Model\DadosBancarios\ContaCorrenteMovimentacaoInterface;
use Illuminate\Database\Eloquent\Model;

/**
 * Class ContaCorrenteMovimentacao
 * @package App\Model\DadosBancarios
 * @OA\Schema(
 *     schema="conta_corrente_movimentacao",
 *     type="object",
 *     title="Conta Corrente Movimentação",
 *     required={"id", "nome"},
 *     properties={
 *          @OA\Property(property="id_cadastro", type="integer", example="23096"),
 *           @OA\Property(property="id_usuario_movimentacao", type="integer", example="1"),
 *           @OA\Property(property="tipo_movimentacao", type="integer", example="C"),
 *           @OA\Property(property="valor_movimentacao", type="integer", example="45"),
 *           @OA\Property(property="descricao", type="integer", example="Teste"),
 *           @OA\Property(property="id_conta_corrente", type="integer", example="5898"),
 *           @OA\Property(property="data_movimentacao", type="integer", example="2020-11-13T21:30:22"),
 *           @OA\Property(property="data_alteracao", type="integer", example="2020-11-13T21:30:22"),
 *           @OA\Property(property="id", type="integer", example="96966"),
 *     }
 * )
 */
class ContaCorrenteMovimentacao extends Model implements  ContaCorrenteMovimentacaoInterface
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'base_web_control.conta_corrente_movimentacao';

    const UPDATED_AT = "data_movimentacao";
    const CREATED_AT = "data_alteracao";
}
