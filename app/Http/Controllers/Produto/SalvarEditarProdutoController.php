<?php

namespace App\Http\Controllers\Produto;

use App\Model\Produto\Produto;
use App\Http\Controllers\Controller;
use App\DTO\Produtos\CadastroProdutoDTO;
use App\Services\Produtos\ProdutosService;
use Symfony\Component\HttpFoundation\Response;
use App\DTO\Produtos\CadastroProdutoCompletoDTO;
use App\Services\Extensions\RequestBodyConverter;


class SalvarEditarProdutoController extends Controller
{

    /**
     * @OA\Post(
     *    path="/api/v1/produtos/cadastro-rapido",
     *    operationId="Cadastro rápido de produtos",
     *    tags={"Produtos"},
     *    summary="Cadastro rápido de produtos",
     *    description="Cadastro rápido de produtos",
     *    security={
     *       {"bearer": {}}
     *    },
     *    @OA\RequestBody(
     *        required=true,
     *        description="Informações básicas do produto",
     *        @OA\JsonContent(
     *              @OA\Property(property="id_fornecedor", type="integer", example=1),
     *              @OA\Property(property="id_classificacao", type="integer", example=10),
     *              @OA\Property(property="id_marca", type="integer", example=1),
     *              @OA\Property(property="codigo_barra", type="string", example="122343545AVB33"),
     *              @OA\Property(property="codigo_interno", type="string", example="122343545AVB33"),
     *              @OA\Property(property="nome", type="string", example="Novo Produto"),
     *              @OA\Property(property="tipo_unidade", type="integer", example=1),
     *              @OA\Property(property="tipo_unidade_tributaria", type="integer", example=1),
     *              @OA\Property(property="estoque_minimo", type="integer", example=30),
     *              @OA\Property(property="ncm", type="string", example="44898989"),
     *              @OA\Property(property="id_imposto_nota", type="integer", example=""),
     *              @OA\Property(property="cest", type="string", example="454888"),
     *              @OA\Property(property="tipo_margem_lucro", type="char", description="ENUM(P,V) default P", example="P"),
     *              @OA\Property(property="percentual_margem_lucro", type="float", example="0.00"),
     *              @OA\Property(property="preco_custo", type="float", example="0.00"),
     *              @OA\Property(property="preco_prazo", type="float", example="0.00"),
     *              @OA\Property(property="preco_venda", type="float", example="0.00"),
     *              @OA\Property(property="preco_varejo", type="float", example="0.00"),
     *              @OA\Property(property="preco_atacado", type="float", example="0.00"),
     *              @OA\Property(property="truncar_vlr_total", type="char", description="ENUM(S,N) default S", example="S"),
     *        ),
     *     ),
     *     @OA\Response(
     *          response=200,
     *          description="Success",
     *          content={
     *              @OA\MediaType(
     *                  mediaType="application/json",
     *                  @OA\Schema(
     *                      properties={
     *                          @OA\Property(property="msg", type="string"),
     *                          @OA\Property(property="code", type="integer"),
     *                          @OA\Property(property="conteudo", ref="#/components/schemas/produto")
     *                      },
     *                      example={
     *                           "msg": "",
     *                           "code": 201,
     *                           "conteudo": {
     *                               "id_origem": null,
     *                               "vender_estoque_zerado": null,
     *                               "altura": null,
     *                               "largura": null,
     *                               "comprimento": null,
     *                               "fcp": null,
     *                               "glp": null,
     *                               "env_prod": null,
     *                               "peso_liquido": null,
     *                               "solicitar_vrtotal": null,
     *                               "infos_nutricionais": "N",
     *                               "peso_bruto": null,
     *                               "estoque_lojavirtual": 0,
     *                               "id_fornecedor": 1,
     *                               "id_classificacao": 1,
     *                               "id_marca": 1,
     *                               "codigo_barra": "18450646",
     *                               "identificacao_interna": "64542357",
     *                               "descricao": "Produto Teste",
     *                               "id_unidade": 1,
     *                               "id_unidade_trib": 1,
     *                               "qtd_minima": 7,
     *                               "ncm": "45787887",
     *                               "id_ibptax": 0,
     *                               "cest": "558988",
     *                               "custo": 45.56,
     *                               "custo_medio_venda": 48.6,
     *                               "custo_medio_venda_prazo": 50,
     *                               "custo_medio_venda_varejo": 48.6,
     *                               "custo_medio_venda_atacado": 46.8,
     *                               "margem_lucro_tipo": "V",
     *                               "porcentagem_custo_venda": 0,
     *                               "margem_lucro_valor": 0,
     *                               "truncar_vlr_total": "S",
     *                               "ecommerce": "S",
     *                               "obs_preco": "",
     *                               "locacao_quantidade": 0,
     *                               "prod_serv": "P",
     *                               "id_cadastro": 23096,
     *                               "id_usuario": 1,
     *                               "id": 2
     *                           }
     *                       }
     *                  )
     *              ) 
     *          }           
     *    ),
     *    @OA\Response(
     *        response=401,
     *        description="Unauthenticated",
     *    ),
     *    @OA\Response(
     *        response=403,
     *        description="Forbidden"
     *    )
     * )     
     * 
     * Cadastro de Produtos de forma rapida
     * 
     * @return Json Retorna todos os produtos pelo nome
     */
    public function incluirProdutoRapido(RequestBodyConverter $requestBodyConverter, ProdutosService $produtosService)
    {
        $cadastroProdutoDTO = $requestBodyConverter->deserializer(new CadastroProdutoDTO());
        return $this->send($produtosService->cadastroProdutoRapido($cadastroProdutoDTO), Response::HTTP_CREATED);
    }
    /**
     * * @OA\Post(
     *    path="/api/v1/produtos/cadastro-completo",
     *    operationId="Cadastro completo dos produtos",
     *    tags={"Produtos"},
     *    summary="Cadastro completo dos produtos",
     *    description="Cadastro completo dos produtos",
     *    security={
     *       {"bearer": {}}
     *    },
     *    @OA\RequestBody(
     *        required=true,
     *        description="Informações básicas do produto",
     *        @OA\JsonContent(
     *              @OA\Property(property="id_fornecedor", type="integer", example=1),
     *              @OA\Property(property="id_classificacao", type="integer", example=10),
     *              @OA\Property(property="id_marca", type="integer", example=1),
     *              @OA\Property(property="codigo_barra", type="string", example="122343545AVB33"),
     *              @OA\Property(property="codigo_interno", type="string", example="122343545AVB33"),
     *              @OA\Property(property="nome", type="string", example="Novo Produto"),
     *              @OA\Property(property="tipo_unidade", type="integer", example=1),
     *              @OA\Property(property="tipo_unidade_tributaria", type="integer", example=1),
     *              @OA\Property(property="estoque_minimo", type="integer", example=30),
     *              @OA\Property(property="ncm", type="string", example="44898989"),
     *              @OA\Property(property="id_imposto_nota", type="integer", example=""),
     *              @OA\Property(property="cest", type="string", example="454888"),
     *              @OA\Property(property="tipo_margem_lucro", type="char", description="ENUM(P,V) default P", example="P"),
     *              @OA\Property(property="percentual_margem_lucro", type="float", example="0.00"),
     *              @OA\Property(property="preco_custo", type="float", example="0.00"),
     *              @OA\Property(property="preco_prazo", type="float", example="0.00"),
     *              @OA\Property(property="preco_venda", type="float", example="0.00"),
     *              @OA\Property(property="preco_varejo", type="float", example="0.00"),
     *              @OA\Property(property="preco_atacado", type="float", example="0.00"),
     *              @OA\Property(property="truncar_vlr_total", type="char", description="ENUM(S,N) default S", example="S"),
     *              @OA\Property(property="ecommerce", type="char", example="S"),
     *              @OA\Property(property="estoque_loja_virtual", description="default 0 inativo", type="integer", example=1),
     *              @OA\Property(property="obs_preco", type="string", example=""),
     *              @OA\Property(property="qtde_inicial", type="integer", example=12),
     *              @OA\Property(property="locacao_quantidade", type="integer", example=100),
     *              @OA\Property(property="demais_informacoes",ref="#/components/schemas/outras_informacoes_produto_dto"),
     *              @OA\Property(property="informacoes_nutricionais",ref="#/components/schemas/informacoes_nutricionais_produto_dto"),
     *              @OA\Property(property="calculos_fretes",ref="#/components/schemas/informacoes_calculo_fretes_produto_dto"),
     *              @OA\Property(property="informacoes_fiscais",ref="#/components/schemas/informacoes_fiscais_produto_dto")
     *        ),
     *     ),
     *     @OA\Response(
     *          response=200,
     *          description="Success",
     *          content={
     *              @OA\MediaType(
     *                  mediaType="application/json",
     *                  @OA\Schema(
     *                      properties={
     *                          @OA\Property(property="msg", type="string"),
     *                          @OA\Property(property="code", type="integer"),
     *                          @OA\Property(property="conteudo", ref="#/components/schemas/produto")
     *                      },
     *                      example={
     *                          "msg": "",
     *                          "code": 201,
     *                          "conteudo": {
     *                              "id": 2,
     *                              "descricao": "Produto Teste",
     *                              "id_cadastro": 23096,
     *                              "id_usuario": 1,
     *                              "data_cadastro": "2020-10-29 15:49:57",
     *                              "id_classificacao": 1,
     *                              "cor": "LawnGreen",
     *                              "id_cor": null,
     *                              "tamanho": "15",
     *                              "custo": "45.56000",
     *                              "custo_medio_venda": "48.600",
     *                              "custo_medio_venda_prazo": "50.000",
     *                              "custo_medio_venda_varejo": "48.600",
     *                              "custo_medio_venda_atacado": "46.800",
     *                              "porcentagem_custo_venda": "0.000000000000000",
     *                              "porcentagem_venda_prazo": null,
     *                              "porcentagem_atacado_avista": null,
     *                              "porcentagem_atacado_aprazo": null,
     *                              "qtd_atacado": null,
     *                              "ativo": "A",
     *                              "qtd_minima": "7.000",
     *                              "peso": "0.0000",
     *                              "codigo_barra": "61418272",
     *                              "barra": null,
     *                              "sincronizado": 0,
     *                              "iss": 0,
     *                              "icms": "0.00",
     *                              "id_unidade": 1,
     *                              "id_unidade_trib": 1,
     *                              "localizacao": "Akeem Terry DVM",
     *                              "id_fornecedor": 1,
     *                              "fabricante": "Russel Greenholt Jr.",
     *                              "ean": null,
     *                              "ex_tipi": null,
     *                              "ncm": "45787887",
     *                              "cest": "558988",
     *                              "unidade_trib": "13",
     *                              "qtd_trib": "4",
     *                              "vlr_unit_trib": null,
     *                              "genero_produto": null,
     *                              "id_tributacao": null,
     *                              "id_origem": 1,
     *                              "id_especifico": null,
     *                              "id_cfop": 5,
     *                              "id_cfop_itens": null,
     *                              "desconto": 0,
     *                              "vender_estoque_zerado": "S",
     *                              "descricao_detalhada": "Prof. Bobbie Anderson",
     *                              "ecommerce": "N",
     *                              "promocao_ecommerce": "N",
     *                              "produto_destaque_ecommerce": "N",
     *                              "altura": "8162.70",
     *                              "largura": "4425.47",
     *                              "comprimento": "2515.19",
     *                              "id_marca": 1,
     *                              "destaque": "N",
     *                              "valor_frete": "0.00",
     *                              "cofins": null,
     *                              "pis": null,
     *                              "data_fabricacao": "1977-05-23",
     *                              "data_validade": null,
     *                              "lote_produto": null,
     *                              "nr_edicao": "S",
     *                              "peso_bruto": "1848.6143",
     *                              "pis_aliquota": null,
     *                              "pis_cst": null,
     *                              "ipi_aliquota": null,
     *                              "ipi_cst": null,
     *                              "cofins_aliquota": null,
     *                              "cofins_cst": null,
     *                              "icms_cst": null,
     *                              "icms_modalidade": null,
     *                              "peso_caixa": "0.0000",
     *                              "alt_caixa": null,
     *                              "larg_caixa": null,
     *                              "comp_caixa": null,
     *                              "margem_lucro_tipo": "V",
     *                              "margem_lucro_valor": "0.00",
     *                              "desconto_maximo_tipo": null,
     *                              "desconto_maximo_percentual": null,
     *                              "desconto_maximo_valor": null,
     *                              "infos_nutricionais": "S",
     *                              "prod_serv": "P",
     *                              "identificacao_interna": "96526137",
     *                              "solicitar_vrtotal": "N",
     *                              "casas_decimais": 2,
     *                              "locacao_quantidade": "9.000",
     *                              "obs_preco": "Teste Produto Completo",
     *                              "id_bomba_bico": null,
     *                              "id_importacao": null,
     *                              "data_alteracao": "2020-10-29 15:49:57",
     *                              "perc_dif_uf": null,
     *                              "qtd_unidade": null,
     *                              "truncar_vlr_total": "S",
     *                              "codigo_anp": "81618",
     *                              "env_prod": "N",
     *                              "peso_liquido": "6916.7333",
     *                              "estoque_lojavirtual": 0,
     *                              "deletar": "S",
     *                              "comissao_valor": null,
     *                              "num_parcelas": null,
     *                              "data_sincronismo": null,
     *                              "id_off": null,
     *                              "fcp": "S",
     *                              "glp": "S",
     *                              "exibir_grafico": 0,
     *                              "id_ibptax": 0,
     *                              "impostos": {
     *                                  "cod_beneficios_cst": {
     *                                      {
     *                                          "id_produto": 2,
     *                                          "cBeneFiscal": "69660856",
     *                                          "cst": 1,
     *                                          "id": 1
     *                                      },
     *                                      {
     *                                          "id_produto": 2,
     *                                          "cBeneFiscal": "9164780",
     *                                          "cst": 58,
     *                                          "id": 2
     *                                      }
     *                                  },
     *                                  "glp": {
     *                                      "id_produto": 2,
     *                                      "descANP": "Produto Teste",
     *                                      "pGLP": 62.53,
     *                                      "CODIF": "6",
     *                                      "qTemp": 63210122.23,
     *                                      "id": 1
     *                                  },
     *                                  "produto_opcoes": {
     *                                      "id_produto": 2,
     *                                      "tributacao_lucro": "N",
     *                                      "id": 0
     *                                  },
     *                                  "icms": {
     *                                      "id_produto": 2,
     *                                      "orig": 0,
     *                                      "CST": 38,
     *                                      "modBC": 6,
     *                                      "pRedBC": 26584463.771,
     *                                      "pICMS": 2473504.738,
     *                                      "modBCST": "9",
     *                                      "pMVAST": 34.114,
     *                                      "pRedBCST": 112944810.302,
     *                                      "pICMSST": 0,
     *                                      "regimes": "S",
     *                                      "pOpePropria": 33.346,
     *                                      "uf": "PR",
     *                                      "vl_aliq_calc_cre": 50.485,
     *                                      "bc_icms_st_ret_ant": 383358.23,
     *                                      "valor_desoneracao_icms": 37.885,
     *                                      "motivo_desoneracao_icms": 0,
     *                                      "percentual_diferimento_icms": 132624523.734,
     *                                      "uf_retido_remetente_icms_st": "SP",
     *                                      "uf_destino_icms_st": "MG",
     *                                      "id_cadastro": 23096,
     *                                      "data_alteracao": "2020-10-29T18:49:57.000000Z"
     *                                  },
     *                                  "ipi": {
     *                                      "id_produto": 2,
     *                                      "cIEnq": "765",
     *                                      "CNPJProd": "73697666000114",
     *                                      "cSelo": "36",
     *                                      "qSelo": 5,
     *                                      "cEnq": "68",
     *                                      "CST": 14,
     *                                      "pIPI": 125187349.085,
     *                                      "tp_calculo": "P",
     *                                      "v_aliq": 0,
     *                                      "id_cadastro": 23096,
     *                                      "data_alteracao": "2020-10-29T18:49:57.000000Z"
     *                                  },
     *                                  "pis": {
     *                                      "id_produto": 2,
     *                                      "tp_calculo": "P",
     *                                      "CST": "10",
     *                                      "pPIS": "5800.152",
     *                                      "v_aliq": "0.000",
     *                                      "id_cadastro": 23096,
     *                                      "data_alteracao": "2020-10-29T18:49:57.000000Z"
     *                                  },
     *                                  "pis_st": {
     *                                      "id_produto": 2,
     *                                      "tp_calculo": "P",
     *                                      "pPIS": "153.716",
     *                                      "v_aliq": "0.000",
     *                                      "id_cadastro": 23096,
     *                                      "data_alteracao": "2020-10-29T18:49:57.000000Z"
     *                                  },
     *                                  "cofins": {
     *                                      "id_produto": 2,
     *                                      "CST": "35",
     *                                      "tp_calculo": "P",
     *                                      "pCOFINS": 234863128.604,
     *                                      "v_aliq": 0,
     *                                      "id_cadastro": 23096,
     *                                      "data_alteracao": "2020-10-29T18:49:57.000000Z"
     *                                  },
     *                                  "cofins_st": {
     *                                      "produto_id": 2,
     *                                      "tp_calculo": "P",
     *                                      "pCOFINS": 0.368,
     *                                      "v_aliq": 0,
     *                                      "id_cadastro": 23096,
     *                                      "data_alteracao": "2020-10-29T18:49:57.000000Z",
     *                                      "id": 1
     *                                  },
     *                                  "issqn": {
     *                                      "produto_id": 2,
     *                                      "pAliq": 67.256,
     *                                      "uf": "SP",
     *                                      "cMunFG": "211",
     *                                      "cListServ": "2177",
     *                                      "tributacao": "",
     *                                      "id_exigibilidade": 84,
     *                                      "incentivo_fiscal": "S",
     *                                      "valor_deducoes": 0.058,
     *                                      "valor_outras_retencoes": 24922.287,
     *                                      "valor_desconto_condicionado": 154307302.337,
     *                                      "valor_retencao": 5.256,
     *                                      "codigo_servico": 128786.377,
     *                                      "uf_incidencia": "PR",
     *                                      "id_municipio_incidencia": "211",
     *                                      "processo": "80577",
     *                                      "id_cadastro": 23096,
     *                                      "data_alteracao": "2020-10-29T18:49:57.000000Z",
     *                                      "ISSQN_id": 1
     *                                  },
     *                                  "cupom_fiscal": {
     *                                      "id_produto": 2,
     *                                      "id_cfop": 5067,
     *                                      "sped": "5",
     *                                      "percentual_icms": 2.131,
     *                                      "percentual_pis": 32.738,
     *                                      "csosn": "760",
     *                                      "totalizador_parcial": 4,
     *                                      "situacao_tributaria": "46",
     *                                      "iat": "arredondamento",
     *                                      "ippt": "terceiro",
     *                                      "id_cadastro": 23096,
     *                                      "data_alteracao": "2020-10-29T18:49:57.000000Z",
     *                                      "id_cupom_fiscal": 1
     *                                  }
     *                              },
     *                              "informacoes_nutricionais": {
     *                                  "id_produto": 2,
     *                                  "id_cadastro": 23096,
     *                                  "dias": 0,
     *                                  "porcao": "0",
     *                                  "calorias": 8,
     *                                  "caboidrato": 4,
     *                                  "proteinas": 7,
     *                                  "gord_tot": 0,
     *                                  "gord_sat": 8,
     *                                  "colesterol": 9,
     *                                  "gord_trans": 9,
     *                                  "fibra": 4,
     *                                  "calcio": 6,
     *                                  "ferro": 9,
     *                                  "sodio": 5,
     *                                  "data_alteracao": "2020-10-29T18:49:57.000000Z"
     *                              },
     *                              "grade": {
     *                                  "id_grade": 2,
     *                                  "id_cadastro": 23096,
     *                                  "id_produto": 2,
     *                                  "id_grade_atributo_valor": null,
     *                                  "id_usuario_alterou": 1,
     *                                  "codigo_barra_pai": "61418272",
     *                                  "codigo_barra": "61418272",
     *                                  "codigo_interno": "96526137",
     *                                  "qtd_atual": "12.000",
     *                                  "qtd_minima": "7.000",
     *                                  "qtd_locacao": "9.000",
     *                                  "qtd_locacao_locado": "0.000",
     *                                  "valor_custo": "45.56000",
     *                                  "valor_varejo_avista": null,
     *                                  "valor_varejo_aprazo": "48.60",
     *                                  "valor_atacado_avista": null,
     *                                  "valor_atacado_aprazo": "46.80",
     *                                  "porc_varejo_avista": null,
     *                                  "porc_varejo_aprazo": "6.672519754170325",
     *                                  "porc_atacado_avista": null,
     *                                  "porc_atacado_aprazo": null,
     *                                  "ativo": 1,
     *                                  "data_alteracao": "2020-10-29 15:49:57",
     *                                  "data_sincronismo": null,
     *                                  "id_off": null,
     *                                  "alteracao": null
     *                              }
     *                          }
     *                      }
     *                  )
     *              ) 
     *          }           
     *    ),
     *    @OA\Response(
     *        response=401,
     *        description="Unauthenticated",
     *    ),
     *    @OA\Response(
     *        response=403,
     *        description="Forbidden"
     *    )
     * )
     * Cadastro de Produtos de forma completa
     * 
     * @return Json Retorna todos os produtos pelo nome
     */
    public function incluirProdutoCompleto(RequestBodyConverter $requestBodyConverter, ProdutosService $produtosService)
    {
        $cadastroProdutoDTO = $requestBodyConverter->deserializer(new CadastroProdutoCompletoDTO());
        return $this->send($produtosService->cadastroProdutoCompleto($cadastroProdutoDTO), Response::HTTP_CREATED);
    }

    /**
     * Edição de Produtos de forma completa
     * 
     * @return Json Retorna todos os produtos pelo nome
     */
    public function editarProdutoCompleto(Produto $produto, RequestBodyConverter $requestBodyConverter, ProdutosService $produtosService)
    {
        $cadastroProdutoDTO = $requestBodyConverter->deserializer(new CadastroProdutoCompletoDTO());
        return $this->send($produtosService->edicaoProdutoCompleto($produto, $cadastroProdutoDTO), Response::HTTP_CREATED);
    }
}
