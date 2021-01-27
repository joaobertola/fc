<?php

namespace App\Model\Venda;

use Illuminate\Database\Eloquent\Model;
/**
 * Class VendaDevolucao
 * @property string $id
 * @property string $nome
 * @package App\Model\Venda
 * @OA\Schema(
 *     schema="venda_devolucao",
 *     type="object",
 *     title="Venda Devolução",
 *     properties={
 *         @OA\Property(property="id", type="integer"),
 *         @OA\Property(property="id_venda", type="integer"),
 *         @OA\Property(property="id_cadastro", type="integer"),
 *         @OA\Property(property="data", type="string", format="date"),
 *         @OA\Property(property="hora", type="string", format="time"),
 *         @OA\Property(property="id_nota_credito", type="integer"),
 *         @OA\Property(property="valor_devolucao", type="decimal"),
 *         @OA\Property(property="nota_credito", type="decimal"),
 *         @OA\Property(property="finalizada", type="string", description="enum('S','N')"),
 *         @OA\Property(property="nfe_status", type="string", description="enum('0','1','2','3','4','5','6','7','8')"),
 *         @OA\Property(property="doc_cliente", type="string"),
 *         @OA\Property(property="id_cliente", type="integer"),
 *     }
 * )
 */
class VendaDevolucao extends Model
{
    protected $table = 'base_web_control.venda_devolucao';

    const UPDATED_AT = null;
    const CREATED_AT = null;
    public $timestamps = false;

    /**
     * Get itens da devolucao
     */
    public function itensDevolucao()
    {
        return $this->hasMany('App\Model\Venda\VendaItemDevolucao', 'id_venda_devol','id');
    }
}
