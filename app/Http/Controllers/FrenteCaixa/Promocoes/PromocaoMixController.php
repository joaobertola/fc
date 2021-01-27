<?php

namespace App\Http\Controllers\FrenteCaixa\Promocoes;

use App\Model\Venda\Venda;
use App\Http\Controllers\Controller;
use App\DTO\FrenteCaixa\PromocaoMixDTO;
use App\Model\Produto\Promocao\PromocaoMix;
use App\DTO\FrenteCaixa\PromocaoMixTempoDTO;
use Symfony\Component\HttpFoundation\Response;
use App\Services\Extensions\RequestBodyConverter;
use App\Services\FrenteCaixa\Promocoes\PromocaoMixService;
use App\Services\Repository\Contracts\Model\Produto\Promocao\PromocaoMixRepositoryServiceInterface;

class PromocaoMixController extends Controller
{
    /**
     * @OA\Get(
     *    path="/api/v1/frente-caixa/promocao-multi-itens/calcular-desconto/{venda}",
     *    operationId="Detalha informações de descontos multiitens já aplicados na venda",
     *    tags={"Promoção MultiItens"},
     *    summary="Cálculo de descontos em produtos multiitens",
     *    description="Cálculo de descontos em produtos multiitens",
     *    security={
     *       {"bearer": {}}
     *    },
     *    @OA\Parameter(
     *        name="venda",
     *        description="Id da venda para calculo do total de descontos multi itens",
     *        required=true,
     *        in="path",
     *        @OA\Schema(
     *            type="string"
     *        )
     *    ),
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
     *                              title="1",description="id da promoção aplicada em itens da venda",
     *                              example={
     *                                  1:{
     *                                      "produtos": {
     *                                          {
     *                                          "id_produto": 0,
     *                                          "id_promo_mix": 0,
     *                                          "quantidade_add_produto": 0,
     *                                          "quantidade_promo": 0,
     *                                          "total_desconto": 0
     *                                          }
     *                                      },
     *                                      "qtd_desconto": 0,
     *                                      "total_desconto": 0
     *                                  },
     *                              },   
     *                              @OA\AdditionalProperties(
     *                                  properties={
     *                                      @OA\Property(
     *                                          property="produtos", type="array", @OA\Items(
     *                                                properties={
     *                                                    @OA\Property(property="id_produto", type="integer"),
     *                                                    @OA\Property(property="id_promo_mix", type="integer"),
     *                                                    @OA\Property(property="quantidade_add_produto", type="integer"),
     *                                                    @OA\Property(property="quantidade_promo", type="integer"),
     *                                                    @OA\Property(property="total_desconto", type="number"),                                     
     *                                                }   
     *                                          )
     *                                      ),
     *                                      @OA\Property(property="qtd_desconto", type="integer"),
     *                                      @OA\Property(property="total_desconto", type="number"),
     *                                  }                                  
     *                              ),
     *                          ),                              
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
     * Action para calculo do total de descontos conforme os itens 
     * incluidos na venda
     */
    public function calcularDescontoTotal(PromocaoMixService $promocaoMixService, Venda $venda)
    {
        return $this->send($promocaoMixService->calcularDescontoVenda($venda));
    }
    /**
     * @OA\Get(
     *    path="/api/v1/promocao-multi-itens/create",   
     *    operationId="Serviço para criação de promoção multi itens",
     *    tags={"Promoção MultiItens"},
     *    summary="Cria promoção itens",
     *    description="Cria uma promoção item e realiza os vinculos dos produtos na promoção",
     *    security={
     *       {"bearer": {}}
     *    },
     *    @OA\RequestBody(
    *          required=true,
    *          description="Informações da promoção multi itens",
    *          @OA\JsonContent(
    *               @OA\Property(property="id_venda", type="integer", example="9999999"),
    *               @OA\Property(property="id_cliente", type="string", example="9999999"),
    *               @OA\Property(property="quantidade", type="integer", example="1"),
    *               @OA\Property(property="descricao_produto", type="string", example="Nome do produto"),
    *               @OA\Property(property="codigo_barra", type="string", example="99999"),
    *               @OA\Property(property="valor", type="decimal",example="2.55"),
    *               @OA\Property(property="id_grade", type="integer", example="889894456456546"),
    *          ),
    *      ),
     *    @OA\Response(
     *          response=201,
     *          description="Successo, retorna os dados da promocao criada com o seu id",       
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
     * Action para criacao das promocoes mix (Gula)
     * Cria tb os registros de descontos para cada produto presente no array de produtos 
     * vinculados na promocao
     */
    public function salvarPromocao(PromocaoMixService $promocaoMixService, RequestBodyConverter $requestBodyConverter)
    {
        $promocaoMixDTO = $requestBodyConverter->deserializer(new PromocaoMixDTO());

        $promocaoMix = $promocaoMixService->gravarPromocaoMix($promocaoMixDTO);

        return $this->send($promocaoMix, Response::HTTP_CREATED);
    }

    /**
     * @OA\Put(
     *    path="/api/v1/promocao-multi-itens/editar/{promocaoMix}",
     *    operationId="Serviço para edição de promoção multi itens",
     *    tags={"Promoção MultiItens"},
     *    summary="Edita promoção itens",
     *    description="Edita uma promoção item e realiza os vinculos dos produtos na promoção",
     *    security={
     *       {"bearer": {}}
     *    },
     *    @OA\Parameter(
     *        name="promocaoMix",
     *        description="Id da promoção multi itens para edição",
     *        required=true,
     *        in="path",
     *        @OA\Schema(
     *            type="integer"
     *        )
     *    ),
     *    @OA\RequestBody(
    *          required=true,
    *          description="Informações da promoção multi itens",
    *          @OA\JsonContent(
    *               @OA\Property(property="id_venda", type="integer", example="9999999"),
    *               @OA\Property(property="id_cliente", type="string", example="9999999"),
    *               @OA\Property(property="quantidade", type="integer", example="1"),
    *               @OA\Property(property="descricao_produto", type="string", example="Nome do produto"),
    *               @OA\Property(property="codigo_barra", type="string", example="99999"),
    *               @OA\Property(property="valor", type="decimal",example="2.55"),
    *               @OA\Property(property="id_grade", type="integer", example="889894456456546"),
    *          ),
    *      ),
     *    @OA\Response(
     *          response=201,
     *          description="Successo, retorna os dados da promocao editada",       
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
     * Action para edição das promocoes mix (Gula)
     * Cria tb os registros de descontos para cada produto presente no array de produtos 
     * vinculados na promocao
     */
    public function editarPromocao(PromocaoMixService $promocaoMixService, RequestBodyConverter $requestBodyConverter, PromocaoMix $promocaoMix)
    {
        $promocaoMixDTO = $requestBodyConverter->deserializer(new PromocaoMixDTO());
        $promocaoMixDTO->setId($promocaoMix->id);

        $promocaoMix = $promocaoMixService->editarPromocaoMix($promocaoMixDTO);

        return $this->send($promocaoMix, Response::HTTP_CREATED);
    }

    /**
     * @OA\Get(
     *    path="/api/v1/promocao-multi-itens/lancar-itens-venda",
     *    operationId="Serviço para criação de historico de venda associado a promoção multi itens",
     *    tags={"Promoção MultiItens"},
     *    summary="Cria historico de venda por promoção multiitens",
     *    description="Cria historico de venda por promoção multiitens",
     *    security={
     *       {"bearer": {}}
     *    },
     *    @OA\RequestBody(
    *          required=true,
    *          description="Id da venda, da promoção e do produto para registro de venda de promoção",
    *          @OA\JsonContent(
    *               @OA\Property(property="id_venda_item", type="integer", example=9999999),
    *               @OA\Property(property="id_promo_mix", type="integer", example=9999999),
    *               @OA\Property(property="id_produto", type="integer", example=9999999)
    *          ),
    *      ),
     *    @OA\Response(
     *          response=201,
     *          description="Successo, retorna os dados do vinculo do item da venda com a promoção",       
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
     * Action para lançamentos dos itens de compras dos produtos que percem a kits de promocao multi itens
     */
    public function salvarItensVendas(PromocaoMixService $promocaoMixService, RequestBodyConverter $requestBodyConverter)
    {
        $promocaoMixTempoDTO = $requestBodyConverter->deserializer(new PromocaoMixTempoDTO());
        $promocaoMixTempo = $promocaoMixService->registarItemVendaDesconto($promocaoMixTempoDTO);

        return $this->send($promocaoMixTempo, Response::HTTP_CREATED);
    }

    /**
     * @OA\Get(
     *    path="/api/v1/promocao-multi-itens/ativar-promocao/{promocaoMix}",
     *    operationId="Serviço para criação de historico de venda associado a promoção multi itens",
     *    tags={"Promoção MultiItens"},
     *    summary="Cria historico de venda por promoção multiitens",
     *    description="Cria historico de venda por promoção multiitens",
     *    security={
     *       {"bearer": {}}
     *    },
     *    @OA\Parameter(
     *        name="promocaoMix",
     *        description="Id da promoção multi itens para ativação",
     *        required=true,
     *        in="path",
     *        @OA\Schema(
     *            type="integer"
     *        )
     *    ),
     *    @OA\Response(
     *          response=201,
     *          description="Successo, retorna os dados do vinculo do item da venda com a promoção",       
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
     * Action para ativar as promocoes
     */
    public function ativarPromocao(PromocaoMixRepositoryServiceInterface $promocaoMixRepositoryService, PromocaoMix $promocaoMix)
    {
        $promocaoMixRepositoryService->ativaInativaPromocaoMix($promocaoMix->id);

        return $this->send("", Response::HTTP_CREATED);
    }
    /**
     * @OA\Get(
     *    path="/api/v1/promocao-multi-itens/inativar-promocao/{promocaoMix}",
     *    operationId="Serviço para criação de historico de venda associado a promoção multi itens",
     *    tags={"Promoção MultiItens"},
     *    summary="Cria historico de venda por promoção multiitens",
     *    description="Cria historico de venda por promoção multiitens",
     *    security={
     *       {"bearer": {}}
     *    },
     *    @OA\Parameter(
     *        name="promocaoMix",
     *        description="Id da promoção multi itens para inativação",
     *        required=true,
     *        in="path",
     *        @OA\Schema(
     *            type="integer"
     *        )
     *    ),
     *    @OA\RequestBody(
    *          required=true,
    *          description="Id da venda, da promoção e do produto para registro de venda de promoção",
    *          @OA\JsonContent(
    *               @OA\Property(property="id_venda_item", type="integer", example=9999999),
    *               @OA\Property(property="id_promo_mix", type="integer", example=9999999),
    *               @OA\Property(property="id_produto", type="integer", example=9999999)
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
     * Action para ativar as promocoes
     */
    public function inativarPromocao(PromocaoMixRepositoryServiceInterface $promocaoMixRepositoryService, PromocaoMix $promocaoMix)
    {
        $promocaoMixRepositoryService->ativaInativaPromocaoMix($promocaoMix->id, 0);

        return $this->send("", Response::HTTP_CREATED);
    }
}
