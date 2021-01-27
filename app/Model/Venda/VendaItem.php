<?php

namespace App\Model\Venda;

use Illuminate\Database\Eloquent\Model;
/**
 * Class VendaItem
 * @package App\Model\VendaItem
 * @OA\Schema(
 *     schema="venda_item",
 *     type="object",
 *     title="Venda Item",
 *     properties={
 *          @OA\Property(property="id", type="integer", example=9999),
 *          @OA\Property(property="qtd", type="integer",  example="1.000"),
 *          @OA\Property(property="id_venda", type="integer", example="9999999"),
 *          @OA\Property(property="id_produto", type="integer", example=9999999),
 *          @OA\Property(property="nome_produto", type="string", example="Nome do produto"),
 *          @OA\Property(property="preco_tabela", type="decimal", example="25.00000000000"),
 *          @OA\Property(property="nome_classificacao", type="string", example="Horti Frut"),
 *          @OA\Property(property="codigo_barra", type="string",example="55488989"),
 *          @OA\Property(property="preco_venda", type="decimal", example="25.00000000000"),
 *          @OA\Property(property="id_autoriza_desconto", type="integer", example=0),
 *          @OA\Property(property="id_autoriza_cancelamento", type="integer", example=0),
 *          @OA\Property(property="id_unidade", type="integer", example=2),
 *          @OA\Property(property="estornado", type="string", example="N"),
 *          @OA\Property(property="data_hora_estorno", type="string", format="date", example="2020-10-10 00:00:00"),
 *          @OA\Property(property="desconto", type="string", example="N"),
 *          @OA\Property(property="cfop", type="integer", example=0),
 *          @OA\Property(property="percentual_desconto", type="decimal", example="0.0000"),
 *          @OA\Property(property="valor_preco_custo", type="decimal", example="2.500"),
 *          @OA\Property(property="seq_ecf", type="integer", example=0),
 *          @OA\Property(property="observacoes_cozinha", type="string", example="Obs em produto de comandas"),
 *          @OA\Property(property="id_grade", type="integer", example=999999),
 *          @OA\Property(property="id_promocao", type="integer", example=0),
 *          @OA\Property(property="id_kit", type="integer", example=0),
 *          @OA\Property(property="informacoes_item", type="string", example=""),
 *          @OA\Property(property="atacado_varejo", type="string", example="A"),
 *          @OA\Property(property="data_alteracao", type="string", format="date", example="2020-10-10 00:00:00"),
 *          @OA\Property(property="data_sincronismo", type="string", format="date", example="2020-10-10 00:00:00"),
 *          @OA\Property(property="id_off", type="integer", example=99999),
 *          @OA\Property(property="xped", type="string", example=null),
 *          @OA\Property(property="icms", type="decimal", example="0.00"),
 *          @OA\Property(property="ipi_cst", type="decimal", example=null),
 *          @OA\Property(property="pis", type="decimal", example=null),
 *          @OA\Property(property="cofins", type="decimal", example=null)
 *     }
 * )
 */
class VendaItem extends Model
{
     /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'base_web_control.venda_itens';
    
    const UPDATED_AT = null;
    const CREATED_AT = null;
    public $timestamps = false;

    public function produto() 
    {
        return $this->hasMany('App\Model\Produto\Produto','id','id_produto');
    }

    public function item_producao() 
    {
        return $this->hasOne('App\Model\Comanda\CmProducao','idvenda_item','id');
    }
}
