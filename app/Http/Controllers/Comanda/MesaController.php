<?php

namespace App\Http\Controllers\Comanda;

use App\DTO\MesaDTO;
use App\DTO\CmHistoricoDTO;
use App\Model\Comanda\CmMesa;
use App\Http\Controllers\Controller;
use App\Services\Comandas\MesasServices;
use Symfony\Component\HttpFoundation\Response;
use App\Services\Extensions\RequestBodyConverter;
use App\Repository\Contracts\Model\Comanda\CmMesaRepositoryInterface;
use App\Services\Repository\Contracts\Model\Comanda\CmMesaRepositoryServiceInterface;

class MesaController extends Controller
{
    /**
     * * @OA\Get(
     *      path="/api/v1/comanda/mesa",
     *      operationId="listagem de mesas da comanda",
     *      tags={"Mesas das Comandas"},
     *      summary="listagem de mesas da comanda",
     *      description="Retorna todas as mesas da comanda",
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
     *                      properties={
     *                          @OA\Property(property="msg", type="string"),
     *                          @OA\Property(property="code", type="integer"),
     *                          @OA\Property(property="conteudo", type="array", @OA\Items(ref="#/components/schemas/mesa_comanda")),
     *                      },
     *                      example={
     *                           "msg": "",
     *                           "code": 200,
     *                           "conteudo": {
     *                               "mesas": { 
     *                                  {
     *                                      "id": 99999,
     *                                      "id_cadastro": 99999,
     *                                      "num_mesa": "999",
     *                                      "status": 1,
     *                                      "id_off": null,
     *                                      "data_alteracao": "2020-08-14 15:19:40",
     *                                      "data_sincronismo": "2020-08-14 15:19:40",
     *                                      "qtde_pessoas": null
     *                                  }
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
     * Função resposável pela listagem de todas as mesas do cliente.
     * @return Json Retorna todas as mesas do cliente
     */
    public function list(CmMesaRepositoryInterface $cmMesaRepository)
    {
        return $this->send(['mesas' => $cmMesaRepository->listarMesas()]);
    }

    /**
     * @OA\Get(
     *      path="/api/v1/comanda/mesa/{idMesa}",
     *      operationId="Consulta informações da mesa",
     *      tags={"Mesas das Comandas"},
     *      summary="Detalhar a mesa",
     *      description="Retorna as informações da mesa, da ultima venda e itens da venda com detalhes dos produtos e os itens enviados a produção",
     *      @OA\Parameter(
     *          name="idMesa",
     *          description="Id da mesa",
     *          required=true,
     *          in="path",
     *          @OA\Schema(
     *              type="string"
     *          )
     *      ),
     *      security={
     *         {"bearer": {}}
     *      },
     *      @OA\Response(
     *          response=200,
     *          description="Success",        
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
     * Função resposável por buscar a mesa que o cliente selecionou.
     * Verifica se já foi cadastrada uma venda e um histórico para mesa, se não, realiza o cadastro.
     * Procura os itens já vendidos para a mesa.
     * 
     * 
     * @return Json Retorna a mesa do cliente com suas vendas.
     */
    public function get(CmMesa $cmMesa, RequestBodyConverter $requestBodyConverter, MesasServices $mesasServices)
    {
        $cmHistoricoDTO = $requestBodyConverter->deserializer(new CmHistoricoDTO());
        return $this->send($mesasServices->recuperarMesa($cmMesa, $cmHistoricoDTO));
    }

    /**
     * @OA\Post(
     *      path="/api/v1/comanda/mesa/{numeroMesa}",
     *      operationId="Criar mesas da comanda",
     *      tags={"Mesas das Comandas"},
     *      summary="Criação das mesas da comanda",
     *      description="Retorna as informações da mesa recem criada ou atualiza a qtde de pessoas em mesas já existentes",
     *      security={
     *         {"bearer": {}}
     *      },
     *     @OA\Parameter(
     *          name="numeroMesa",
     *          description="Número da mesa",
     *          required=true,
     *          in="path",
     *          @OA\Schema(
     *              type="string"
     *          )
     *      ),
     *      @OA\RequestBody(
     *          required=true,
     *          description="Informação da qtde de pessoas a serem remanejadas na mesa",
     *          @OA\JsonContent(
     *               @OA\Property(property="qtde_pessoas", type="integer")
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
     *                          @OA\Property(property="conteudo", type="array", @OA\Items(ref="#/components/schemas/mesa_comanda")),
     *                      },
     *                      example={
     *                           "msg": "",
     *                           "code": 200,
     *                           "conteudo": {
     *                               "mesa": { 
     *                                      "id": 99999,
     *                                      "id_cadastro": 99999,
     *                                      "num_mesa": "999",
     *                                      "status": 1,
     *                                      "id_off": null,
     *                                      "data_alteracao": "2020-08-14 15:19:40",
     *                                      "data_sincronismo": "2020-08-14 15:19:40",
     *                                      "qtde_pessoas": null
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
     * Função resposável por salvar uma nova mesa. (NÃO UTILIZADA[por enquanto])*INCOMPLETA*
     * 
     * @param string  $numeroMesa Número da mesa a ser criada .
     * 
     * @return Json Retorna a mesa do cliente com suas vendas.
     */
    public function save($numeroMesa, RequestBodyConverter $requestBodyConverter, CmMesaRepositoryServiceInterface $cmMesaRepositoryService)
    {
        $mesaDTO = $requestBodyConverter->deserializer(new MesaDTO());
        $mesaDTO->setNumMesa($numeroMesa);
        return $this->send(['mesa' => $cmMesaRepositoryService->criarMesa($mesaDTO)], Response::HTTP_CREATED);
    }


    /**
     * @OA\Put(
     *      path="/api/v1/comanda/mesa/qtd/{idMesa}/{numeroPessoas}",
     *      operationId="Atualizar numero de pessoas presentes na mesa",
     *      tags={"Mesas das Comandas"},
     *      summary="Atualização da qtde de pessoas",
     *      description="Retorna as informações da mesa com a qtde de pessoas atualizadas",
     *      security={
     *         {"bearer": {}}
     *      },
     *     @OA\Parameter(
     *          name="idMesa",
     *          description="Id da mesa",
     *          required=true,
     *          in="path",
     *          @OA\Schema(
     *              type="string"
     *          )
     *      ),
     *      @OA\Parameter(
     *          name="numeroPessoas",
     *          description="Qtde de pessoas",
     *          required=true,
     *          in="path",
     *          @OA\Schema(
     *              type="string"
     *          )
     *      ),
     *      @OA\Response(
     *          response=201,
     *          description="Success",         
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
     *                          @OA\Property(property="conteudo", type="array", @OA\Items(ref="#/components/schemas/mesa_comanda")),
     *                      },
     *                      example={
     *                           "msg": "",
     *                           "code": 200,
     *                           "conteudo": {
     *                               "mesa": { 
     *                                      "id": 99999,
     *                                      "id_cadastro": 99999,
     *                                      "num_mesa": "999",
     *                                      "status": 1,
     *                                      "id_off": null,
     *                                      "data_alteracao": "2020-08-14 15:19:40",
     *                                      "data_sincronismo": "2020-08-14 15:19:40",
     *                                      "qtde_pessoas": null
     *                               }
     *                           }
     *                       }
     *                  )
     *              ) 
     *          }           
     *      ),
     *      @OA\Response(
     *          response=403,
     *          description="Forbidden"
     *      )
     * )
     * 
     * Função resposável por atualizar a quantidade de pessoas na mesa
     * @return Json CmMesaModel Retorna o objeto da mesa ou comanda com a quantidade atualizada.
     */
    public function atualizaQuantidadePessoa(CmMesa $cmMesa, $numeroPessoas, CmMesaRepositoryServiceInterface $cmMesaRepositoryService)
    {
        return $this->send(["mesa" => $cmMesaRepositoryService->atualiarQtdePessoas($cmMesa->id, $numeroPessoas)], Response::HTTP_CREATED);
    }
}
