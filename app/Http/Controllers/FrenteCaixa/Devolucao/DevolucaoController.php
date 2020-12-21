<?php

namespace App\Http\Controllers\FrenteCaixa\Devolucao;

use App\Model\Venda\Venda;
use App\Model\Cliente\Cliente;
use App\Http\Controllers\Controller;
use App\DTO\FrenteCaixa\DevolucaoDTO;
use Symfony\Component\HttpFoundation\Response;
use App\Services\Extensions\RequestBodyConverter;
use App\Services\FrenteCaixa\Devolucoes\DevolucoesService;
use App\Repository\Contracts\Model\Venda\VendaRepositoryInterface;
use App\Repository\Contracts\Model\Produto\ProdutoRepositoryInterface;

class DevolucaoController extends Controller
{
    /**
     * 
     * @OA\Get(
     *    path="/api/v1/frente-caixa/devolucao/busca-pedidos/cliente/{cliente}",
     *    operationId="Busca de vendas confirmadas realizadas pelo cliente que possui itens ainda não estornados",
     *    tags={"Frente de Caixa"},
     *    summary="Busca de vendas para devolução",
     *    description="Busca de vendas para devolução",
     *    security={
     *       {"bearer": {}}
     *    },
     *    @OA\Parameter(
     *        name="cliente",
     *        description="Id do cliente para busca dos pedidos para devolução",
     *        required=true,
     *        in="path",
     *        @OA\Schema(
     *            type="string"
     *        )
     *    ),
     *    @OA\Response(
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
     *                                  @OA\Property(property="id", type="integer", example=65603544),
     *                                  @OA\Property(property="nome", type="string", example="CLIENTE BALCAO"),
     *                                  @OA\Property(property="data_venda", type="string", example="2020-11-09 00:00:00"),
     *                                  @OA\Property(property="nome_produto", type="string", example="ANDTEST"),
     *                                  @OA\Property(property="codigo_barra", type="string", example="57261522"),
     *                                  @OA\Property(property="pagamento", type="string", example="DINHEIRO"),
     *                                  @OA\Property(property="valor_pgto", type="decimal", example="50.00"),
     *                                  @OA\Property(property="vencimento", type="string", example=null),
     *                                  @OA\Property(property="possui_nota", type="integer", example=0),
     *                              } 
     *                          ),
     *                      },
     *                      example={
     *                           "msg": "",
     *                           "code": 200,
     *                           "conteudo": {
     *                               {
     *                                   "id": 9999999,
     *                                   "nome": "CLIENTE BALCAO",
     *                                   "data_venda": "2020-11-09 00:00:00",
     *                                   "nome_produto": "Banana Caturra",
     *                                   "codigo_barra": "9999999",
     *                                   "pagamento": "DINHEIRO",
     *                                   "valor_pgto": "1.00",
     *                                   "vencimento": null,
     *                                   "possui_nota": 0
     *                               }
     *                           }
     *                       }
     *                 )
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
     * Servivo para busca de pedidos do cliente concluidos para a devolucao
     */
    public function getVendasConcluidasCliente(Cliente $cliente, VendaRepositoryInterface $vendaRepository)
    {
        return $this->send($vendaRepository->getVendasConcluidas($cliente->id));
    }

    /**
     * 
     * @OA\Get(
     *    path="/api/v1/frente-caixa/devolucao/busca-pedidos/produto/{produto}",
     *    operationId="Busca de informações básicos dos produtos listados para a pesquisa",
     *    tags={"Frente de Caixa"},
     *    summary="Busca dados de produto para devolução",
     *    description="Busca dos dados básicos dos produtos para devolução",
     *    security={
     *       {"bearer": {}}
     *    },
     *    @OA\Parameter(
     *        name="produto",
     *        description="Código de barras ou descrição do produto",
     *        required=true,
     *        in="path",
     *        @OA\Schema(
     *            type="string"
     *        )
     *    ),
     *    @OA\Response(
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
     *                                  @OA\Property(property="id_grade", type="integer", example=65603544),
     *                                  @OA\Property(property="codigo_barra", type="string", example="57261522"),
     *                                  @OA\Property(property="descricao", type="string", example="Nome do Produto"),
     *                                  @OA\Property(property="valor", type="decimal", example="50.00"),
     *                                  @OA\Property(property="valor_atacado", type="decimal", example="50.00"),
     *                              } 
     *                          ),
     *                      },
     *                      example={
     *                           "msg": "",
     *                           "code": 200,
     *                           "conteudo": {
     *                               {
     *                                   "id_grade": 999999,
     *                                   "codigo_barra": "codigo barra",
     *                                   "descricao": "Nome do Produto",
     *                                   "valor": "6.00",
     *                                   "valor_atacado": "6.00"
     *                               }
     *                           }
     *                       }
     *                 )
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
     * Servivo para busca de pedidos do cliente por produto
     */
    public function getVendasConcluidasClienteProduto($codigoBarra, ProdutoRepositoryInterface $produtoRepository)
    {
        return $this->send($produtoRepository->getVendasConcluidasProduto($codigoBarra));
    }

    /**
     * 
     * @OA\Post(
     *    path="/api/v1/frente-caixa/devolucao/devolver-produto",
     *    operationId="Serviço para confirmar a devolução do item pela frente de caixa",
     *    tags={"Frente de Caixa"},
     *    summary="Confirma a devolução do(s) item(s)",
     *    description="Devolve para o estoque os produtos da venda",
     *    security={
     *       {"bearer": {}}
     *    },
     *    @OA\RequestBody(
     *          required=true,
     *          description="Filtros do relatório",
     *          @OA\JsonContent(
     *               @OA\Property(property="nome", type="string", example="nome da promoção"),
     *               @OA\Property(property="valor", type="number", example=5.4),
     *               @OA\Property(property="quantidade", type="integer", example=3),
     *               @OA\Property(property="data_inicial", type="string", format="date", example="2020-09-01 12:00:00"),
     *               @OA\Property(property="data_final", type="string", format="date", example="2020-09-30 12:00:00"),
     *               @OA\Property(property="produtos", type="array", @OA\Items(), example={1001453168,1001046163,1001273650}),
     *               @OA\Property(property="status", type="integer", example="1"),
     *          ),
     *    ),
     *    @OA\Response(
     *          response=201,
     *          description="Success",       
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
     * Servivo para devolver um produto
     */
    public function devolverProduto(RequestBodyConverter $requestBodyConverter, DevolucoesService $devolucoesService)
    {
        $devolucaoDTO = $requestBodyConverter->deserializer(new DevolucaoDTO());
        return $this->send($devolucoesService->devolverProduto($devolucaoDTO), Response::HTTP_CREATED);
    }

    /**
     * 
     * @OA\Get(
     *    path="/api/v1/frente-caixa/devolucao/detalha-pedido/{venda}",
     *    operationId="Detalhamento de pedido com pelo menos um item a ser devolvido",
     *    tags={"Frente de Caixa"},
     *    summary="Detalhes de pedido que possui item que pode ser devolvido",
     *    description="Detalha informações do pedido, dado da venda, itens da venda, cliente da venda, funcionario e informações de devoluções já realizadas",
     *    security={
     *       {"bearer": {}}
     *    },
     *    @OA\Parameter(
     *        name="venda",
     *        description="Id da venda que possui itens que pode ser devolvido",
     *        required=true,
     *        in="path",
     *        @OA\Schema(
     *            type="string"
     *        )
     *    ),
     *    @OA\Response(
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
     *                                  @OA\Property(property="venda", type="object", ref="#/components/schemas/venda"),
     *                                  @OA\Property(property="itens_venda", type="array", @OA\Items(ref="#/components/schemas/venda_item")),
     *                                  @OA\Property(property="cliente", type="object", ref="#/components/schemas/cliente"),
     *                                  @OA\Property(property="funcionario", type="object", ref="#/components/schemas/funcionario"),
     *                                  @OA\Property(property="venda_devolucao", type="object", ref="#/components/schemas/venda_devolucao"),
     *                                  @OA\Property(property="cadastro", type="object", ref="#/components/schemas/cadastro"),
     *                                  
     *                              } 
     *                          ),
     *                      },
     *                      example={
     *                           "msg": "",
     *                           "code": 200,
     *                           "conteudo": {
     *                               "venda":{"id":1},
     *                               "itens_venda":{{"id":1}},
     *                               "cliente":{"id":1},
     *                               "funcionario":{"id":1},
     *                               "cadastro":{"id":1},
     *                               "devolucao":{"id":1},
     *                           }
     *                       }
     *                 )
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
     * Servivo para retornar os dados necessarios para apresentacao da viw de confirmacao da
     * devolucao
     */
    public function detalharPedido(Venda $venda, DevolucoesService $devolucoesService)
    {
        return $this->send($devolucoesService->getViewDetalhes($venda));
    }

    /**
     * @OA\Post(
     *    path="/api/v1/frente-caixa/devolucao/finalizar-pedido/{venda}",
     *    operationId="Devolução inteira da venda e de seus pedidos",
     *    tags={"Frente de Caixa"},
     *    summary="Realiza o processo de devolução total da venda",
     *    description="Realiza a devoluçõs dos itens",
     *    security={
     *       {"bearer": {}}
     *    },
     *    @OA\Parameter(
     *        name="venda",
     *        description="Id da venda a ser devolvido todos os itens",
     *        required=true,
     *        in="path",
     *        @OA\Schema(
     *            type="string"
     *        )
     *    ),
     *    @OA\Response(
     *          response=201,
     *          description="Success ao devolver a venda",       
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
     * Servivo para finalizar as devolucoes e seus itens da venda
     */
    public function finalizarDevolucao(Venda $venda, DevolucoesService $devolucoesService)
    {
        return $this->send($devolucoesService->finalizarDevolucao($venda), Response::HTTP_CREATED);
    }
}
