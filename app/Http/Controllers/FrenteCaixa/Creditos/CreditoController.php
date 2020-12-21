<?php

namespace App\Http\Controllers\FrenteCaixa\Creditos;

use App\DTO\FrenteCaixa\MovimentacoesDTO;
use App\Http\Controllers\Controller;
use App\Services\Extensions\RequestBodyConverter;
use App\Services\FrenteCaixa\Movimentacoes\CreditosService;
use Symfony\Component\HttpFoundation\Response;

class CreditoController extends Controller
{
    /**
     * @OA\Post(
     *    path="/api/v1/frente-caixa/movimentacoes/add-credito-cc",
     *    operationId="Inclusao de creditos atraves de movimentacao em conta corrente",
     *    tags={"Frente de Caixa"},
     *    summary="Lançamento de valor extra no caixa ",
     *    description="Cadastro rápido de produtos",
     *    security={
     *       {"bearer": {}}
     *    },
     *    @OA\Parameter(
     *        name="fc_token",
     *        description="Token de acesso ao caixa aberto",
     *        required=true,
     *        in="header",
     *        @OA\Schema(
     *            type="string"
     *        )
     *    ),
     *    @OA\RequestBody(
     *        required=true,
     *        description="Informações básicas do produto",
     *        @OA\JsonContent(
     *              @OA\Property(property="id_cliente", type="integer", example=5941342),
     *              @OA\Property(property="descricao", type="string", example="Teste"),
     *              @OA\Property(property="valor_movimentacao", type="decimal", example=45.56)
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
     *                          @OA\Property(property="conteudo", ref="#/components/schemas/conta_corrente_movimentacao")
     *                      },
     *                      example={
     *                           "msg": "",
     *                           "code": 201,
     *                           "conteudo": {
     *                               "id_cadastro": 23096,
     *                               "id_usuario_movimentacao": 1,
     *                               "tipo_movimentacao": "C",
     *                               "valor_movimentacao": 45.56,
     *                               "descricao": "Teste",
     *                               "id_conta_corrente": 5898,
     *                               "data_movimentacao": "2020-11-13T21:30:22.000000Z",
     *                               "data_alteracao": "2020-11-13T21:30:22.000000Z",
     *                               "id": 96966
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
     * Servico para inclusao de creditos atraves de movimentacao em conta corrente
     */
    public function incluirCreditos(RequestBodyConverter $requestBodyConverter, CreditosService $creditosService)
    {
        $movimentacaoDTO = $requestBodyConverter->deserializer(new MovimentacoesDTO());

        return $this->send($creditosService->lancarNovoCredito($movimentacaoDTO), Response::HTTP_CREATED);
    }

    /**
     * Servico para inclusao de valores extras no caixa (nao inclui creditos via movimentacao em conta corrente)
     */
    public function entradaValores(RequestBodyConverter $requestBodyConverter, CreditosService $creditosService)
    {
        $movimentacaoDTO = $requestBodyConverter->deserializer(new MovimentacoesDTO());

        return $this->send($creditosService->addValorExtra($movimentacaoDTO), Response::HTTP_CREATED);
    }
}
