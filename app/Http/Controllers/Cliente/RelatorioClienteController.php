<?php

namespace App\Http\Controllers\Cliente;

use App\Http\Controllers\Controller;
use App\DTO\Relatorios\RelatorioClienteDTO;
use App\Services\Extensions\RequestBodyConverter;
use App\Services\Clientes\RelatoriosClientesService;

class RelatorioClienteController extends Controller
{
    /**
     *  @OA\Post(
     *      path="/api/v1/relatorios/clientes",
     *      operationId="Relatório de pesquisa de clientes",
     *      tags={"Clientes"},
     *      summary="Relatório de clientes",
     *      description="Retorno dos clientes confirme filtros informados",
     *      security={
     *         {"bearer": {}}
     *      },
     *      @OA\RequestBody(
     *          required=true,
     *          description="Filtros do relatório",
     *          @OA\JsonContent(
     *               @OA\Property(property="data_inicial", type="string", format="date", example="2020-01-01"),
     *               @OA\Property(property="data_final", type="string", format="date", example="2020-01-01"),
     *               @OA\Property(property="aniversario_inicial", type="string", format="date", example="2020-01-01"),
     *               @OA\Property(property="aniversario_final", type="string", format="date", example="2020-01-01"),
     *               @OA\Property(property="ipt_uf", type="string", example="PR"),
     *               @OA\Property(property="cidade", type="string",example="CURITIBA"),
     *               @OA\Property(property="situacao", type="string", example="E"),
     *               @OA\Property(property="bairro", type="string",example="CENTRO"),
     *               @OA\Property(property="campos", type="array", @OA\Items(), example={1,2,3}),
     *          ),
     *       ),
     *      @OA\Response(
     *          response=200,
     *          description="Success",
     *          content={
     *              @OA\MediaType(
     *                  mediaType="application/json",
     *                  @OA\Schema(
     *                      properties={
     *                          @OA\Property(property="msg", type="string"),
     *                          @OA\Property(property="code", type="integer"),
     *                          @OA\Property(
     *                              property="conteudo", type="object", 
     *                              properties={
     *                                  @OA\Property(property="clientes", type="array", @OA\Items(ref="#/components/schemas/cliente")),
     *                                  @OA\Property(property="filtros", type="array", @OA\Items(ref="#/components/schemas/relatorioCampos"))
     *                              } 
     *                          ),
     *                      },
     *                      example={
     *                           "msg": "",
     *                           "code": 200,
     *                           "conteudo": {
     *                               "clientes": {
     *                                   {
     *                                       "id": 999999,
     *                                       "id_cadastro": 99999,
     *                                       "tipo_pessoa": null,
     *                                       "cnpj_cpf": null,
     *                                       "rg": null,
     *                                       "inscricao_municipal": null,
     *                                       "inscricao_estadual": null,
     *                                       "inscricao_suframa": null,
     *                                       "nome": null,
     *                                       "razao_social": null,
     *                                       "id_tipo_log": null,
     *                                       "endereco": null,
     *                                       "numero": null,
     *                                       "complemento": null,
     *                                       "bairro": null,
     *                                       "cidade": null,
     *                                       "uf": null,
     *                                       "cep": null,
     *                                       "pais": null,
     *                                       "informacoes_adicionais": null,
     *                                       "data_cadastro": "2020-10-09 14:00:32",
     *                                       "email": null,
     *                                       "telefone": null,
     *                                       "celular": null,
     *                                       "fax": null,
     *                                       "ativo": "A",
     *                                       "renda_media": null,
     *                                       "empresa_trabalha": null,
     *                                       "cargo": null,
     *                                       "fone_empresa": null,
     *                                       "endereco_empresa": null,
     *                                       "nome_referencia_comercial": null,
     *                                       "referencia_comercial": null,
     *                                       "nome_referencia": null,
     *                                       "referencia_pessoal": null,
     *                                       "data_nascimento": null,
     *                                       "nome_pai": null,
     *                                       "nome_mae": null,
     *                                       "numero_titulo": null,
     *                                       "zona": null,
     *                                       "secao": null,
     *                                       "placa": null,
     *                                       "fone_pai": null,
     *                                       "fone_mae": null,
     *                                       "socio1": null,
     *                                       "socio2": null,
     *                                       "fone_socio1": null,
     *                                       "fone_socio2": null,
     *                                       "id_usuario": 1,
     *                                       "senha_ecommerce": null,
     *                                       "isento_icms": "S",
     *                                       "sincronizado": 0,
     *                                       "obs": null,
     *                                       "tabela_preco": 1,
     *                                       "estado_civil": null,
     *                                       "nome_conjuge": null,
     *                                       "tipo_residencia": null,
     *                                       "foto": null,
     *                                       "orgao_expedidor": null,
     *                                       "naturalidade": null,
     *                                       "id_importacao": null,
     *                                       "id_funcionario": null,
     *                                       "limite_credito": "0.00",
     *                                       "limite_credito_cc": "0.000",
     *                                       "tipo_compra": "V",
     *                                       "origem_cadastro": null,
     *                                       "data_cadastro_user": null,
     *                                       "data_alteracao": "2020-10-09 14:00:32",
     *                                       "data_sincronismo": null,
     *                                       "id_off": null,
     *                                       "substituto_tributario": 0,
     *                                       "senha": null
     *                                   }
     *                               },
     *                               "filtros": {
     *                                   {
     *                                       "id_campo": 1,
     *                                       "id_tabela": 1,
     *                                       "nome_campo": "teste",
     *                                       "tamanho_campo": 0,
     *                                       "nome_campo_form": "Teste",
     *                                       "tabela_forenign": null,
     *                                       "campo_forenign": null,
     *                                       "categoria": "teste",
     *                                       "mascara": null,
     *                                       "ordemApresentacao": 0
     *                                   },
     *                                   {
     *                                       "id_campo": 2,
     *                                       "id_tabela": 1,
     *                                       "nome_campo": "teste",
     *                                       "tamanho_campo": 0,
     *                                       "nome_campo_form": "Teste",
     *                                       "tabela_forenign": null,
     *                                       "campo_forenign": null,
     *                                       "categoria": "teste",
     *                                       "mascara": null,
     *                                       "ordemApresentacao": 0
     *                                   },
     *                                   {
     *                                       "id_campo": 3,
     *                                       "id_tabela": 1,
     *                                       "nome_campo": "teste",
     *                                       "tamanho_campo": 0,
     *                                       "nome_campo_form": "Teste",
     *                                       "tabela_forenign": null,
     *                                       "campo_forenign": null,
     *                                       "categoria": "teste",
     *                                       "mascara": null,
     *                                       "ordemApresentacao": 0
     *                                   }
     *                               }
     *                           }
     *                       }
     *                  )
     *              ) 
     *          }           
     *      ),
     *      @OA\Response(
     *          response=401,
     *          description="Unauthenticated",
     *      ),
     *      @OA\Response(
     *          response=403,
     *          description="Forbidden"
     *      )
     * )
     * 
     * Função responsável por fazer a pesquisa do relatorio de clientes
     */
    public function pesquisaRelatorioClientes(
        RequestBodyConverter $requestBodyConverter,
        RelatoriosClientesService $relatoriosClientesService
    ) {
        $relatorioClienteDTO = $requestBodyConverter->deserializer(new RelatorioClienteDTO());

        return $this->send($relatoriosClientesService->relatorioDeClientes($relatorioClienteDTO));
    }
}
