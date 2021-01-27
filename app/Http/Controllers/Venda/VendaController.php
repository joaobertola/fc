<?php

namespace App\Http\Controllers\Venda;

use App\Model\Venda\Venda;
use App\Http\Controllers\Controller;
use App\Services\Vendas\FinalizarVendasService;
use App\Services\Extensions\RequestBodyConverter;
use App\Services\Vendas\SetupFinalizarVendasService;
use App\DTO\Vendas\FinalizarVendas\FinalizarVendaDTO;
use App\Services\Vendas\VendaService;
use Symfony\Component\HttpFoundation\Response;

class VendaController extends Controller
{
    /**
     * @OA\Post(
     *    path="/api/v1/vendas/finalizar-venda",
     *    operationId="Finalização das vendas",
     *    tags={"Vendas"},
     *    summary="Finalização das vendas",
     *    description="Finalização das vendas para inclusão das formas de pagamentos",
     *    security={
     *       {"bearer": {}}
     *    },
     *    @OA\RequestBody(
     *        required=true,
     *        description="Informações das formas de pagamentos da venda",
     *        @OA\JsonContent(
     *              @OA\Property(property="id_venda", type="integer", example=99999999),
     *              @OA\Property(property="id_cliente", type="integer", example=99999999),
     *              @OA\Property(property="id_usuario_fecha_venda", type="integer", example=999999),
     *              @OA\Property(property="id_abertura_caixa", type="integer", example=7898988989),
     *              @OA\Property(property="frete", type="number", example=10.00),
     *              @OA\Property(property="pagamentos", type="array", @OA\Items()),
     *              example={
     *                   "id_venda": "99999999",
     *                   "id_cliente": "99999999",
     *                   "id_usuario_fecha_venda": "99999999",
     *                   "id_abertura_caixa": "99999999",
     *                   "frete": 100.00,
     *                   "observacao": "",
     *                   "pagamentos" : {
     *                       {
     *                           "id_forma_pagamento" : "2(cheque)",
     *                           "cheques" : {
     *                               {
     *                                   "valor" : 13,
     *                                   "cmc7" : 89033333
     *                               },
     *                               {
     *                                   "valor" : 23,
     *                                   "cmc7" : 890333333
     *                               }
     *                           },
     *                       },
     *                       {
     *                           "id_forma_pagamento" : "77(vale_compra_funcionario)",
     *                           "id_funcionario" : 2334,
     *                           "parcelas" : {
     *                               {
     *                                   "parcela" : 13,
     *                                   "vencimento" : "9999-99-99"
     *                               },
     *                               {
     *                                   "parcela" : 23,
     *                                   "vencimento" : "9999-99-99"
     *                               }
     *                           },
     *                       },
     *                       {
     *                           "id_forma_pagamento" : "95(vale_presente)",
     *                           "numero_cartao" : 456,
     *                           "pagamentos" : {
     *                               {
     *                                   "valor" : 13
     *                               },
     *                               {
     *                                   "valor" : 23
     *                               }
     *                           },
     *                       },
     *                       {
     *                           "id_forma_pagamento" : "82(conta_corrente_cliente)",
     *                           "parcelas" : {
     *                               {
     *                                   "valor" : 13,
     *                                   "vencimento" : "9999-99-99"
     *                               },
     *                               {
     *                                   "valor" : 23,
     *                                   "vencimento" : "9999-99-99"
     *                               }
     *                           },
     *                       },
     *                       {
     *                           "id_forma_pagamento" : "37(nota_de_credito)",
     *                           "valor_credito_inicial" : 10.00,
     *                           "numeros_notas" : {
     *                               "123",
     *                               "345",
     *                               "5656"
     *                           },
     *                           "valor_recebido" : 25,
     *                           "cod_aut_cartao" : 232343,
     *                           "id_credenciadora" : 1,
     *                           "cnpj_credenciadora" : 455666,
     *                           "numero_documento" : 5866,
     *                           "parcelas" : {
     *                               {
     *                                   "valor" : 13,
     *                               },
     *                               {
     *                                   "valor" : 23,
     *                               }
     *                           },
     *                       },
     *                       {
     *                           "juros" : 1.33,
     *                           "id_forma_pagamento" : "4(boleto)",
     *                           "desconto_a_vista" : 0.10,
     *                           "desconto_a_prazo" : 0.5,
     *                           "envio_boleto" : "S",
     *                           "desconto_boleto" : "S",
     *                           "radio_msg_boleto" : "N",
     *                           "texto_msg_boleto" : "N",
     *                           "parcelas" : {
     *                               {
     *                                   "parcela" : 13.00,
     *                                   "vencimento" : "9999-99-99"
     *                               },
     *                               {
     *                                   "parcela" : 23.00,
     *                                   "vencimento" : "9999-99-99"
     *                               }
     *                           },
     *                       },
     *                       {
     *                           "id_forma_pagamento" : "55(boleto_proprio)",
     *                           "juros" : 0.23,
     *                           "parcelas" : {
     *                               {
     *                                   "parcela" : 23,
     *                                   "valor_ajustado" : 23.40,
     *                                   "multa" : 2,
     *                                   "vencimento" : "9999-99-99",
     *                               },
     *                               {
     *                                   "parcela" : 13,
     *                                   "valor_ajustado" : 22.60,
     *                                   "multa" : 2,
     *                                   "vencimento" : "9999-99-99",
     *                               },
     *                           },
     *                       },
     *                       {
     *                           "id_forma_pagamento" : "28(nota_promissoria)",
     *                           "chave_promissoria"  : 12333,
     *                           "juros" : 0.23,
     *                           "parcelas" : {
     *                               {
     *                                   "parcela" : 23,
     *                                   "valor_ajustado" : 23.40,
     *                                   "multa" : 2,
     *                                   "vencimento" : "9999-99-99",
     *                               },
     *                               {
     *                                   "parcela" : 13,
     *                                   "valor_ajustado" : 22.60,
     *                                   "multa" : 2,
     *                                   "vencimento" : "9999-99-99",
     *                               },
     *                           },
     *                       },
     *                       {
     *                           "id_forma_pagamento" : "8(cartao_credito_aura)",
     *                           "chave_promissoria"  : 12333,
     *                           "parcelas" : {
     *                               {
     *                                   "parcela" : 12.40,
     *                                   "vencimento" : "9999-99-99",
     *                                   "cod_aut_cartao" : 12333,
     *                                   "id_credenciadora" : 1,
     *                                   "cnpj_credenciadora" : 877689990,
     *                                   "multa" : 2.00,
     *                               },
     *                               {
     *                                   "parcela" : 18.10,
     *                                   "vencimento" : "9999-99-99",
     *                                   "cod_aut_cartao" : 12333,
     *                                   "id_credenciadora" : 1,
     *                                   "cnpj_credenciadora" : 877689990,
     *                                   "multa" : 2.00,
     *                               }
     *                           }
     *                       },
     *                       {
     *                           "id_forma_pagamento" : "33(cartao_credito_sorocred)",
     *                           "parcelas" : {
     *                               {
     *                                   "parcela" : 12.40,
     *                                   "vencimento" : "9999-99-99",
     *                                   "cod_aut_cartao" : 12333,
     *                                   "id_credenciadora" : 1,
     *                                   "cnpj_credenciadora" : 877689990,
     *                                   "multa" : 2.00,
     *                               },
     *                               {
     *                                   "parcela" : 18.10,
     *                                   "vencimento" : "9999-99-99",
     *                                   "cod_aut_cartao" : 12333,
     *                                   "id_credenciadora" : 1,
     *                                   "cnpj_credenciadora" : 877689990,
     *                                   "multa" : 2.00,
     *                               }
     *                           },
     *                           "id_nota" : 123,
     *                       },
     *                       {
     *                           "id_forma_pagamento" : "80(carne)",
     *                           "parcelas" : {
     *                               {
     *                                   "valor" : 23,
     *                                   "valor_ajustado" : 23.40,
     *                                   "multa" : 2,
     *                                   "vencimento" : "9999-99-99",
     *                               },
     *                               {
     *                                   "valor" : 13,
     *                                   "valor_ajustado" : 22.60,
     *                                   "multa" : 2,
     *                                   "vencimento" : "9999-99-99",
     *                               },
     *                           },
     *                           "numero_contrato" : 12243,
     *                           "numero_documento" : 123,
     *                           "id_tipo_documento" : 1,
     *                           "id_fornecedor" : 1,
     *                           "cod_aut_cartao" : 1222,
     *                           "id_credenciadora" : 1,
     *                           "cnpj_credenciadora" : 343345,
     *                       },
     *                       {
     *                           "id_forma_pagamento" : "3(cartao_credito_visa)",
     *                           "chave_promissoria"  : 12333,
     *                           "parcelas" : {
     *                               {
     *                                   "parcela" : 12.40,
     *                                   "vencimento" : "9999-99-99",
     *                                   "cod_aut_cartao" : 12333,
     *                                   "id_credenciadora" : 1,
     *                                   "cnpj_credenciadora" : 877689990,
     *                                   "multa" : 2.00,
     *                               },
     *                               {
     *                                   "parcela" : 18.10,
     *                                   "vencimento" : "9999-99-99",
     *                                   "cod_aut_cartao" : 12333,
     *                                   "id_credenciadora" : 1,
     *                                   "cnpj_credenciadora" : 877689990,
     *                                   "multa" : 2.00,
     *                               }
     *                           }
     *                       },
     *                       {
     *                           "id_forma_pagamento" : "(1-dinheiro)",
     *                           "pagamentos" : {
     *                               {
     *                                   "valor"  : 10.00
     *                               }
     *                           }
     *                       }
     *                   }
     *               }
     *        ),
     *     ),
     *     @OA\Response(
     *          response=201,
     *          description="Success"
     *     ),
     *     @OA\Response(
     *        response=401,
     *        description="Unauthenticated",
     *     ),
     *     @OA\Response(
     *        response=403,
     *        description="Forbidden"
     *     )
     * )   
     * Finalizacao das vendas
     */
    public function finalizarVenda(
        FinalizarVendasService $finalizarVendasService,
        SetupFinalizarVendasService $setupFinalizarVendasService,
        RequestBodyConverter $requestBodyConverter
    ) {
        $finalizarVendaDTO = $requestBodyConverter->deserializer(new FinalizarVendaDTO());
        $finalizarVendasService->finalizarVenda($finalizarVendaDTO, $setupFinalizarVendasService);
        return $this->send("", Response::HTTP_CREATED);
    }


    public function getVenda(Venda $venda, VendaService $vendaService)
    {        
        return $this->send($vendaService->obtemVenda(($venda->id)));
    }
}
