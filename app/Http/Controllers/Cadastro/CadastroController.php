<?php

namespace App\Http\Controllers\Cadastro;

use App\Http\Controllers\Controller;
use App\Repository\Contracts\Model\Cs2\CadastroRepositoryInterface;
use Illuminate\Http\Request;

class CadastroController extends Controller
{
    /**
     *  @OA\Get(
     *      path="/api/v1/cadastro/config-frente-caixas",
     *      operationId="Consulta configuração dos caixas",
     *      tags={"Frente de Caixa"},
     *      summary="Configuração das operações com caixas da frente de caixa",
     *      description="Retorno de algumas informacoes do cadastro referente ao funcionamento dos caixas",
     *      security={
     *         {"bearer": {}}
     *      },
     *      @OA\Response(
     *          response=200,
     *          description="Success",
     *          content={
     *              @OA\MediaType(
     *                  mediaType="application/json",
     *                  @OA\Schema(
     *                      example={
     *                           "msg": "",
     *                           "code": 200,
     *                           "conteudo": {
     *                              "qtd_pdv_caixa": 10,
     *                              "liberar_nfe": "S",
     *                              "email": "deisemara_andrade@hotmail.com",
     *                              "email2": "",
     *                              "pendencia_frente_caixa": 0,
     *                              "blq_pendencia_senha": 1
     *                          } 
     *                     }
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
    public function getConfigFrenteCaixaCadastro(CadastroRepositoryInterface $cadastroRepository)
    {
        return $this->send($cadastroRepository->getConfigFrenteCaixa());
    }
}
