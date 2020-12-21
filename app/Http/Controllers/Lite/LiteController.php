<?php

namespace App\Http\Controllers\Lite;

use App\DTO\Lite\LiteDTO;
use App\Jobs\RabbitMQJob;
use App\Http\Controllers\Controller;
use App\Services\Extensions\RequestBodyConverter;
use App\Services\Repository\Contracts\Model\Lite\LiteRepositoryServiceInterface;

class LiteController extends Controller
{
    /**
     *
     * @OA\Post(
     *      path="/api/v1/lite/verifica-tabelas",
     *      operationId="Verificar tabelas alteradas.",
     *      tags={"Lite"},
     *      summary="OffLite",
     *      description="Retorna as tabelas que sofreram alterações  pela WEB desde a última data de sincronismo.",
     *      security={
     *         {"bearer": {}}
     *      },
     *      @OA\RequestBody(
     *          required=true,
     *          description="Data do último sincronismo e tabelas a serem consultadas.",
     *          @OA\JsonContent(
     *               @OA\Property(property="data_ultimo_sincronismo", type="string"),
     *               @OA\Property(property="tabelas", type="object",),
     *               example={"data_ultimo_sincronismo": "2020-10-01 00:00:00", "tabelas": {"cliente", "venda", "venda_itens", "webc_usuario"}}
     *          ),
     *      ),
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
     *                          @OA\Property(property="conteudo", type="object"),
     *                      },
     *                      example={
     *                           "msg": "",
     *                           "code": 200,
     *                           "conteudo": {
     *                                "cliente",
     *                                 "venda",
     *                                 "venda_itens"
     *                           }
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
     *
     * Retorna as tabelas que sofreram alterações pela WEB desde a última data de sincronismo
     *
     * return Json Retorna as tabelas alteradas.
     */
    public function verificaTabelas(RequestBodyConverter $requestBodyConverter, LiteRepositoryServiceInterface $liteRepositoryService)
    {
        $inicio = microtime(true);

        $liteDTO = $requestBodyConverter->deserializer(new LiteDTO());

        $totalTime = microtime(true) - $inicio;

        RabbitMQJob::dispatch([
            "queue"      => "consulta_tables_lite",
            "connection" => "rabbitmq",
            "job"        => "App\Jobs\ConsultaTablesLiteJob",
            "data"       => ["totalTime" => $totalTime],
        ])->onConnection("rabbitmq")->onQueue("geral");

        return $this->send($liteRepositoryService->verificaTabelas($liteDTO));
    }

    /**
     * Retorna id das vendas de determinado caixa e suas situações
     *
     * @return Json Retorna o id das vendas e situacoes.
     *
     * @OA\Get(
     *      path="/api/v1/lite/fechamento-caixa/{idCaixa}/{situacaoVendas}/",
     *      operationId="Verificar a situação das venda de determinado caixa.",
     *      tags={"Lite"},
     *      summary="OffLite",
     *      description="Retorna o ID das venda e a situação.",
     *      security={
     *         {"bearer": {}}
     *      },
     *     @OA\Parameter(
     *          name="idCaixa",
     *          description="Id do caixa a ser consultado.",
     *          required=true,
     *          in="path",
     *          example="1414250",
     *          @OA\Schema(
     *              type="integer"
     *          )
     *      ),
     *      @OA\Parameter(
     *          name="situacaoVendas",
     *          description="Situação da Venda (A - Aguardando Aprovação, C - Encerrada , E Cancelada, X -Aprovado, Y-Aguardando Peças, I - Pedido Impresso Para Cozinha G - Comanda Agrupada, N - Não aprovado F - Faturado)",
     *          required=true,
     *          in="path",
     *          example="E",
     *          @OA\Schema(
     *              type="string",
     *          )
     *      ),
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
     *                          @OA\Property(property="conteudo", type="object"),
     *                      },
     *                      example={
     *                           "msg": "",
     *                           "code": 200,
     *                           "conteudo": {
     *                               {
     *                                   "id": 65820294,
     *                                   "situacao": "E"
     *                               },
     *                               {
     *                                   "id": 66043940,
     *                                   "situacao": "E"
     *                               }
     *                           }
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
     *
     */
    public function consultaCaixa($idCaixa, $situacaoCaixa = null, LiteRepositoryServiceInterface $liteRepositoryService)
    {
        return $this->send($liteRepositoryService->consultaCaixa($idCaixa, $situacaoCaixa));
    }
}
