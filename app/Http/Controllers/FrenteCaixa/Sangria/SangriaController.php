<?php

namespace App\Http\Controllers\FrenteCaixa\Sangria;

use App\DTO\FrenteCaixa\SangriaDTO;
use App\Http\Controllers\Controller;
use App\Services\Extensions\RequestBodyConverter;
use App\Services\FrenteCaixa\Sangria\SangriasService;
use Symfony\Component\HttpFoundation\Response;

class SangriaController extends Controller
{
    /**
     * @OA\Get(
     *    path="/api/v1/frente-caixa/sangrias/limite",
     *    operationId="Serviço para consulta do limite restante no caixa para saques de sangrias",
     *    tags={"Frente de Caixa"},
     *    summary="Consulta limite para sangrias",
     *    description="Consulta limite para sangrias",
     *    security={
     *       {"bearer": {}}
     *    },
     *    @OA\Parameter(
     *        name="fc_token",
     *        description="Token de acesso ao caixa aberto para operações da sangria",
     *        required=true,
     *        in="header",
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
     *                                  @OA\Property(property="operacoes_caixa", type="object",
     *                                      properties={
     *                                          @OA\Property(property="max_sangria", type="number"),
     *                                          @OA\Property(property="v_inicial", type="number"),
     *                                          @OA\Property(property="v_extra", type="number"),
     *                                          @OA\Property(property="sangria", type="number"),
     *                                      }    
     *                                  ),
     *                                  @OA\Property(property="recebimentos", type="number", example="400.00")
     *                              } 
     *                          ),
     *                      },
     *                      example={
     *                           "msg": "",
     *                           "code": 200,
     *                           "conteudo": {
     *                              "operacoes-caixa": {
     *                                  "max_sangria": "0.00",
     *                                  "v_inicial": "0.00",
     *                                  "v_extra": "0.00",
     *                                  "sangria": "0.00"
     *                              },
     *                              "recebimentos": 0
     *                          }
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
     * Servico para busca do limite total disponivel para a sangria
     */
    public function getLimite(SangriasService $sangriasService)
    {
        return $this->send($sangriasService->consultarLimite());
    }

    /**
     * @OA\Post(
     *    path="/api/v1/frente-caixa/sangrias/efetuar",
     *    operationId="Serviço para realizar as operações das sangrias",
     *    tags={"Frente de Caixa"},
     *    summary="Lançamentos de sangria",
     *    description="Efetua uma sangria no caixa",
     *    security={
     *       {"bearer": {}}
     *    },
     *    @OA\Parameter(
     *        name="fc_token",
     *        description="Token de acesso ao caixa aberto para operações da sangria",
     *        required=true,
     *        in="header",
     *        @OA\Schema(
     *            type="string"
     *        )
     *    ),
     *    @OA\RequestBody(
    *          required=true,
    *          description="Informações para a realização das sangrias",
    *          @OA\JsonContent(
    *               @OA\Property(property="senha_operador", type="string", example="senha do operador criptografado"),
    *               @OA\Property(property="motivo", type="string", example="Motivo da sangria"),
    *               @OA\Property(property="valor", type="number", example="50.06")
    *          ),
    *      ),
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
     * Servico para efetuar as sangrias
     */
    public function efetuarSangria(SangriasService $sangriasService, RequestBodyConverter $requestBodyConverter)
    {
        $sangriaDTO = $requestBodyConverter->deserializer(new SangriaDTO());

        return $this->send($sangriasService->addSangria($sangriaDTO), Response::HTTP_CREATED);

    }
}
