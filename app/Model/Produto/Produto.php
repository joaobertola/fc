<?php

namespace App\Model\Produto;

use App\Entity\Model\Produto\ProdutoInterface;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Produto
 * @package App\Model\Produto\Produto
 * @OA\Schema(
 *     schema="produto",
 *     type="object",
 *     title="Produto",
 *     required={"id","id_cadastro","descricao","codigo_barra"},
 *     properties={
 *          @OA\Property(property="id", type="integer"),
 *          @OA\Property(property="id_cadastro", type="integer"),
 *          @OA\Property(property="descricao", type="string"),
 *          @OA\Property(property="codigo_barra", type="string")
 *     }
 * )
 */
class Produto extends Model implements ProdutoInterface
{
    protected $table = 'base_web_control.produto';

     /**
     * The model's default values for attributes.
     *
     * @var array
     */
    protected $attributes = [
        'id_origem' => null,
        'vender_estoque_zerado' => null,
        'altura' => null,
        'largura' => null,
        'comprimento' => null,
        'fcp' => null,
        'glp' => null,
        'env_prod' => null,
        'peso_liquido' => null,
        'solicitar_vrtotal' => null,
        'infos_nutricionais' => null,
        'peso_bruto' => null,
        'estoque_lojavirtual' => null
    ];

    protected $fillable = [
        "descricao",
        "id_cadastro",
        "id_usuario",
        "data_cadastro",
        "id_classificacao",
        "cor",
        "id_cor",
        "tamanho",
        "custo",
        "custo_medio_venda",
        "custo_medio_venda_prazo",
        "custo_medio_venda_varejo",
        "custo_medio_venda_atacado",
        "porcentagem_custo_venda",
        "porcentagem_venda_prazo",
        "porcentagem_atacado_avista",
        "porcentagem_atacado_aprazo",
        "qtd_atacado",
        "ativo",
        "qtd_minima",
        "peso",
        "codigo_barra",
        "barra",
        "sincronizado",
        "iss",
        "icms",
        "id_unidade",
        "id_unidade_trib",
        "localizacao",
        "id_fornecedor",
        "fabricante",
        "ean",
        "ex_tipi",
        "ncm",
        "cest",
        "unidade_trib",
        "qtd_trib",
        "vlr_unit_trib",
        "genero_produto",
        "id_tributacao",
        "id_origem",
        "id_especifico",
        "id_cfop",
        "id_cfop_itens",
        "desconto",
        "vender_estoque_zerado",
        "descricao_detalhada",
        "ecommerce",
        "promocao_ecommerce",
        "produto_destaque_ecommerce",
        "altura",
        "largura",
        "comprimento",
        "id_marca",
        "destaque",
        "valor_frete",
        "cofins",
        "pis",
        "data_fabricacao",
        "data_validade",
        "lote_produto",
        "nr_edicao",
        "peso_bruto",
        "pis_aliquota",
        "pis_cst",
        "ipi_aliquota",
        "ipi_cst",
        "cofins_aliquota",
        "cofins_cst",
        "icms_cst",
        "icms_modalidade",
        "peso_caixa",
        "alt_caixa",
        "larg_caixa",
        "comp_caixa",
        "margem_lucro_tipo",
        "margem_lucro_valor",
        "desconto_maximo_tipo",
        "desconto_maximo_percentual",
        "desconto_maximo_valor",
        "infos_nutricionais",
        "prod_serv",
        "identificacao_interna",
        "solicitar_vrtotal",
        "casas_decimais",
        "locacao_quantidade",
        "obs_preco",
        "id_bomba_bico",
        "id_importacao",
        "data_alteracao",
        "perc_dif_uf",
        "qtd_unidade",
        "truncar_vlr_total",
        "codigo_anp",
        "env_prod",
        "peso_liquido",
        "estoque_lojavirtual",
        "deletar",
        "comissao_valor",
        "num_parcelas",
        "data_sincronismo",
        "id_off",
        "fcp",
        "glp",
        "exibir_grafico",
        "id_ibptax",
    ];
    const UPDATED_AT = null;
    const CREATED_AT = null;
    public $timestamps = false;

    public function venda_item() 
    {
        return $this->belongsTo('App\Model\Venda\VendaItem','id_produto','id');
    }
    public function classificacao() 
    {
        return $this->belongsTo('App\Model\Produto\Classificacao','id_classificacao','id');
    }

    /**
     * Get the photos
     */
    public function fotos()
    {
        return $this->hasMany('App\Model\Produto\ProdutoFoto', 'id_produto','id');
    }
}
