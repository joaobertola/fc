<?php

namespace App\Http\Controllers\FrenteCaixa\Cliente;

use App\Model\Cliente\Cliente;
use App\Http\Controllers\Controller;
use App\Services\FrenteCaixa\Clientes\ClientesService;
use App\Repository\Contracts\Model\Cliente\ClienteFrenteCaixaRepositoryInterface;

class ClienteController extends Controller
{
    /**
     * @OA\Get(
     *      path="/api/v1/frente-caixa/clientes/{termoPesquisa}",
     *      operationId="listagem de clientes pelo nome,cnpj_cpf,placa,telefone,celular,razao_social,endereco de pesquisa",
     *      tags={"Frente de Caixa"},
     *      summary="Consulta de clientes",
     *      description="Returna os clientes pesquisados",
     *      @OA\Parameter(
     *          name="termoPesquisa",
     *          description="termo de pesquisa",
     *          required=true,
     *          in="path",
     *          @OA\Schema(
     *              type="string"
     *          )
     *      ),
     *      security={
     *         {"bearer": {}}
     *      },
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
     *                          @OA\Property(
     *                              property="conteudo", type="object", 
     *                              properties={
     *                                   @OA\Property(property="id", type="integer", example=1),
     *                                   @OA\Property(property="nome", type="string", example="ANINHOET"),
     *                                   @OA\Property(property="razao_social", type="string", example="CAETANO VELOSO ME"),
     *                                   @OA\Property(property="endereco", type="string", example="Rua teste"), 
     *                                   @OA\Property(property="numero", type="string", example="122"), 
     *                                   @OA\Property(property="cnpj_cpf", type="string", example="671100014060"),
     *                                   @OA\Property(property="telefone", type="string", example="33333333"),
     *                                   @OA\Property(property="placa", type="string", example="AOS458")
     *                              } 
     *                          ),
     *                      },
     *                      example={
     *                         "msg":"",
     *                         "code":200,
     *                         "conteudo":{
     *                              {
     *                               "id": 7812590,
     *                               "nome": "Cliente teste",
     *                               "razao_social": "SILVA E SILVA BEBIDAS",
     *                               "endereco": "Endereco",
     *                               "numero": "15487",
     *                               "cnpj_cpf": "08427848000103",
     *                               "telefone": "41999999999",
     *                               "placa": null
     *                           },
     *                           {
     *                               "id": 6573831,
     *                               "nome": "CAETANINHO",
     *                               "razao_social": "CAETANO VELOSO ME",
     *                               "endereco": "",
     *                               "numero": "",
     *                               "cnpj_cpf": "39606711000140",
     *                               "telefone": "41999999999",
     *                               "placa": "AOS8995"
     *                           }
     *                         }
     *                      }
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
     * Servico para busca dos clientes para selecao nao tela de frente de caixa
     */
    public function buscarClientes(string $termoPesquisa, ClienteFrenteCaixaRepositoryInterface $clienteFrenteCaixaRepository)
    {
        return $this->send($clienteFrenteCaixaRepository->getClientesPreVenda($termoPesquisa));
    }

    /**
     * @OA\Get(
     *      path="/api/v1/frente-caixa/clientes/{idCliente}/qtde-inadimplencia",
     *      operationId="Pesquisa de inadimplência de cliente selecionado para efeturar compras na frente de caixa",
     *      tags={"Frente de Caixa"},
     *      summary="Consulta de dados de inadimplência",
     *      description="Retorna qtde boletos, nota promissorias e carnês inadimplentes do cliente",
     *      @OA\Parameter(
     *          name="idCliente",
     *          description="id do cliente",
     *          required=true,
     *          in="path",
     *          @OA\Schema(
     *              type="string"
     *          )
     *      ),
     *      security={
     *         {"bearer": {}}
     *      },
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
     *                          @OA\Property(
     *                              property="conteudo", type="object", 
     *                              properties={
     *                                   @OA\Property(property="nota_promissoria", type="integer", example=8),
     *                                   @OA\Property(property="boleto", type="integer", example=8),
     *                                   @OA\Property(property="carne", type="integer", example=8),
     *                              } 
     *                          ),
     *                      },
     *                      example={
     *                         "msg":"",
     *                         "code":200,
     *                         "conteudo":{
     *                              "nota_promissoria": 4,
     *                              "boleto": 0,
     *                              "carne": 8
     *                         }
     *                      }
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
     * Servico para buscar informacoes de qrde de 
     * inadimplencia do cliente selecionado na frente de caixa
     */
    public function buscarQtdeInadimplencia(Cliente $cliente, ClientesService $clientesService)
    {
        return $this->send($clientesService->getInadimplencia($cliente->id));
    }
}
