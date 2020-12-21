<?php

namespace App\Http\Controllers\Comanda;

use App\DTO\ProdutoDTO;
use App\DTO\VendaItemDTO;
use App\DTO\CmHistoricoDTO;
use Illuminate\Http\Request;
use App\Model\Venda\VendaItem;
use App\Http\Controllers\Controller;
use App\Services\Comandas\ComandasService;
use Symfony\Component\HttpFoundation\Response;
use App\Services\Extensions\RequestBodyConverter;
use App\Services\Produtos\PesquisaProdutosService;
use App\Repository\Contracts\Model\Comanda\CmComandaRepositoryInterface;
use App\Services\Repository\Contracts\Model\Comanda\CmComandaRepositoryServiceInterface;
use App\Services\Repository\Contracts\Model\Venda\VendaComandaRepositoryServiceInterface;

class ComandaController extends Controller
{
    /**
     * @OA\Get(
     *      path="/api/v1/comanda",
     *      operationId="listagem de comandas",
     *      tags={"Comandas"},
     *      summary="listagem de comandas",
     *      description="Retorna todas as comandas",
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
     *                          @OA\Property(property="conteudo", type="array", @OA\Items(ref="#/components/schemas/comanda")),
     *                      },
     *                      example={
     *                           "msg": "",
     *                           "code": 200,
     *                           "conteudo": {
     *                               {
     *                                   "id": 99999,
     *                                   "id_cadastro": 99999,
     *                                   "num_comanda": "999",
     *                                   "status": 1,
     *                                   "id_off": null,
     *                                   "data_alteracao": "2020-08-14 15:19:40",
     *                                   "data_sincronismo": "2020-08-14 15:19:40",
     *                                   "qtde_pessoas": null
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
     * Função para fazer a listagem de comandas existentes. 
     * 
     * @param Request $request Objeto que recebe os dados do request.
     * 
     * @return Json Retorna todas as mesas do cliente
     */
    public function list(CmComandaRepositoryInterface $cmComandaRepository)
    {
        return $this->send($cmComandaRepository->getComandas());
    }

    /**
     * @OA\Get(
     *      path="/api/v1/comanda/{numeroComanda}",
     *      operationId="Consulta informações da comanda",
     *      tags={"Comandas"},
     *      summary="Detalhar comanda",
     *      description="Retorna as informações da comanda, da ultima venda e itens da venda com detalhes dos produtos e os itens enviados a produção",
     *      @OA\Parameter(
     *          name="numeroComanda",
     *          description="Número da comanda",
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
     * Função para buscar a comanda selecionada. 
     * Buscar vendas já feitas para esta comanda.
     * Buscar os produtos da comanda e se já foram enviados para produção.
     * 
     * @param int $numeroComanda Numero da comanda.
     * 
     * @return Json Retorna os dados da comanda
     */
    public function getComanda(ComandasService $comandasService, $numeroComanda)
    {
        return $this->send($comandasService->getComandaDetalhada($numeroComanda));
    }

    /**
     * @OA\Post(
     *      path="/api/v1/comanda/anotacoes/{itemVenda}",
     *      operationId="Vincular anotaçao no item do pedido",
     *      tags={"Comandas"},
     *      summary="Vínculo da anotação para produção",
     *      description="Retorna status de execução da operação do registro da anotação",
     *      security={
     *         {"bearer": {}}
     *      },
     *     @OA\Parameter(
     *          name="itemVenda",
     *          description="Id do item do pedido",
     *          required=true,
     *          in="path",
     *          @OA\Schema(
     *              type="string"
     *          )
     *      ),
     *      @OA\RequestBody(
     *          required=true,
     *          description="Texto da anotação",
     *          @OA\JsonContent(
     *               @OA\Property(property="observacoes_cozinha", type="string"),
     *          ),
     *      ),
     *      @OA\Response(
     *          response=201,
     *          description="Success",
     *          content={
     *              @OA\MediaType(
     *                  mediaType="application/json",
     *                  @OA\Schema(
     *                      properties={
     *                          @OA\Property(property="msg", type="string"),
     *                          @OA\Property(property="code", type="integer"),
     *                          @OA\Property(property="conteudo", type="array", @OA\Items(ref="#/components/schemas/comanda")),
     *                      },
     *                      example={
     *                          "msg": "",
     *                          "code": 201,
     *                          "conteudo": {
     *                              "venda": 1
     *                          }
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
     * Função para gravar anotação para o item da venda. 
     * 
     * @param Request $request Objeto que recebe os dados do request.
     * @param int $id ID da comanda.
     * 
     * @return Json Retorna os dados do item da venda.
     */
    public function salvaAnotacao(VendaItem $itemVenda, RequestBodyConverter $requestBodyConverter, VendaComandaRepositoryServiceInterface $vendaComandaRepositoryService)
    {
        $vendaItemDTO = $requestBodyConverter->deserializer(new VendaItemDTO());
        return $this->send(['venda' => $vendaComandaRepositoryService->vincularAnotacao($vendaItemDTO->getObservacoesCozinha(), $itemVenda->id)], Response::HTTP_CREATED);
    }

    /**
     * @OA\Post(
     *      path="/api/v1/comanda/{numeroComanda}",
     *      operationId="Criar comandas",
     *      tags={"Comandas"},
     *      summary="Criação de comandas",
     *      description="Retorna as informações da comanda, da ultima venda e itens da venda com detalhes dos produtos e os itens enviados a produção. Caso a comanda 
     *      ja exista, é retorno o mesmo retorno do serviço de detalhes da comanda",
     *      security={
     *         {"bearer": {}}
     *      },
     *     @OA\Parameter(
     *          name="numeroComanda",
     *          description="Número da comanda",
     *          required=true,
     *          in="path",
     *          @OA\Schema(
     *              type="string"
     *          )
     *      ),
     *      @OA\RequestBody(
     *          required=true,
     *          description="Informação do cliente e funcionario a ser vinculado no historico da primeira venda pela comanda",
     *          @OA\JsonContent(
     *               @OA\Property(property="id_cliente", type="integer"),
     *               @OA\Property(
     *                   property="venda", type="object", 
     *                   @OA\Property(property="id_funcionario", type="integer"),
     *                   @OA\Property(property="id_cliente", type="integer")
     *               ),
     *          ),
     *      ),
     *      @OA\Response(
     *          response=201,
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
     * Função responsável por criar nova comanda. 
     * Gera uma nova venda.
     * Salva a venda e a comanda no histórico.
     * 
     * @param int $numeroComanda Numero da comanda.
     * 
     * @return Json Retorna os dados da nova comanda ou de uma comanda já existente.
     */
    public function saveComanda($numeroComanda, ComandasService $comandasService, RequestBodyConverter $requestBodyConverter)
    {
        $cmHistoricoDTO = $requestBodyConverter->deserializer(new CmHistoricoDTO());
        $cmHistoricoDTO->setNumCm($numeroComanda);
        return $this->send($comandasService->salvarComanda($cmHistoricoDTO, $cmHistoricoDTO), Response::HTTP_CREATED);
    }

    /**
     * * @OA\Get(
     *      path="/api/v1/comanda/produtos",
     *      operationId="listagem de produtos de comandas conforme sua descrição",
     *      tags={"Comandas"},
     *      summary="listagem de produtos de comandas",
     *      description="Retorna todos os produtos configurados para as comandas conforme a descriçao informada",
     *      security={
     *         {"bearer": {}}
     *      },
     *      @OA\RequestBody(
     *          required=true,
     *          description="Informação do cliente e funcionario a ser vinculado no historico da primeira venda pela comanda",
     *          @OA\JsonContent(
     *               @OA\Property(property="descricao", type="string", example="Prato Feito")
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
     *                          @OA\Property(property="conteudo", type="object",                           
     *                              @OA\Property(property="produtos", type="array", @OA\Items(ref="#/components/schemas/produto")),
     *                          ),
     *                      },
     *                      example={
     *                           "msg": "",
     *                           "code": 200,
     *                           "conteudo": {
     *                                "produtos": {
     *                                    {
     *                                        "id": 99999,
     *                                        "id_cadastro": 99999,
     *                                        "descricao": "999",
     *                                        "codigo_barra": "556888FR44"
     *                                    }
     *                                }
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
     * Função para fazer pesquisa de produtos ativos dentro da comanda.
     * 
     * @return Json Retorna uma lista com o resultado da pesquisa de produtos;
     */
    public function pesquisaProdutoComanda(PesquisaProdutosService $pesquisaProdutosService, RequestBodyConverter $requestBodyConverter)
    {
        $produtoDTO = $requestBodyConverter->deserializer(new ProdutoDTO());
        return $this->send(["produtos" => $pesquisaProdutosService->getProdutosDeComadas($produtoDTO)]);
    }

    /**
     * @OA\Post(
     *      path="/api/v1/comanda/dados",
     *      operationId="Vincular o cliente e funcionario selecionado a comanda e sua ultima venda ",
     *      tags={"Comandas"},
     *      summary="Vinculo do cliente e funcionario do atendimento",
     *      description="Vincula o cliente ao ultimo historico da comanda e vincular o cliente e funcionario a ultima venda da comandass. Retorna informacoes da venda e do ultimo historico da comanda",
     *      security={
     *         {"bearer": {}}
     *      },
     *      @OA\RequestBody(
     *          required=true,
     *          description="Informação do cliente e funcionario a ser vinculado no historico da primeira venda pela comanda",
     *          @OA\JsonContent(
     *               @OA\Property(property="num_cm", type="integer"),
     *               @OA\Property(property="id_cliente", type="integer"),
     *               @OA\Property(
     *                   property="venda", type="object", 
     *                   @OA\Property(property="id_funcionario", type="integer")
     *               ),
     *          ),
     *      ),
     *      @OA\Response(
     *          response=201,
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
     *  Função responsavel por realizar consulta e alterar dados da venda do cliente.
     *  @author Allan Camargo, 22/08/2019
     *  Alterado por Tiago Franco para funcionamento via injeção de servicos
     */

    public function vincularCliente(RequestBodyConverter $requestBodyConverter, ComandasService $comandasService)
    {
        $cmHistoricoDTO = $requestBodyConverter->deserializer(new CmHistoricoDTO());
        return $this->send($comandasService->vincularClienteComanda($cmHistoricoDTO), Response::HTTP_CREATED);
    }

    /**
     * @OA\Put(
     *      path="/api/v1/comanda/qtd/{numeroComanda}/{numeroPessoas}",
     *      operationId="Atualizar numero de pessoas da comanda",
     *      tags={"Comandas"},
     *      summary="Atualização da qtde de pessoas",
     *      description="Retorna as informações da comanda com a qtde de pessoas atualizadas",
     *      security={
     *         {"bearer": {}}
     *      },
     *     @OA\Parameter(
     *          name="numeroComanda",
     *          description="Número da comanda",
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
     *                               "comanda": { 
     *                                      "id": 99999,
     *                                      "id_cadastro": 99999,
     *                                      "num_comanda": "999",
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
     * Função resposável por atualizar a quantidade de pessoas na comanda
     * @return Json CmMesaModel Retorna o objeto da mesa ou comanda com a quantidade atualizada.
     */
    public function atualizaQuantidadePessoa($numeroComanda, $numeroPessoas, CmComandaRepositoryServiceInterface $cmComandaRepositoryService)
    {
        return $this->send(["comanda" => $cmComandaRepositoryService->atualiarQtdePessoas($numeroComanda, $numeroPessoas)], Response::HTTP_CREATED);
    }
}
