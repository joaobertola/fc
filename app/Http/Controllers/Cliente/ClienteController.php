<?php

namespace App\Http\Controllers\Cliente;

use App\DTO\ClienteDTO;
use App\Http\Controllers\Controller;
use App\Services\Clientes\ClientesService;
use Symfony\Component\HttpFoundation\Response;
use App\Services\Extensions\RequestBodyConverter;
use App\Services\Repository\Contracts\Model\Cliente\ClienteRepositoryServiceInterface;

class ClienteController extends Controller
{
    /**
     * 
     * @OA\Get(
     *      path="/api/v1/clientes",
     *      operationId="listagem de clientes",
     *      tags={"Clientes"},
     *      summary="listagem de clientes",
     *      description="Returna todos os clientes",
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
     *                          @OA\Property(property="conteudo", type="array", @OA\Items(ref="#/components/schemas/cliente")),
     *                      },
     *                      example={
     *                         "msg":"",
     *                         "code":200,
     *                         "conteudo":{
     *                              {
     *                                  "id": 7637076,
     *                                  "nome": " TESTE OSHOS",
     *                                  "cnpj_cpf": "",
     *                                  "telefone": "",
     *                                  "razao_social": ""
     *                              },
     *                              {
     *                                  "id": 6832129,
     *                                  "nome": "AMY SANTIAGO",
     *                                  "cnpj_cpf": "89473693907",
     *                                  "telefone": "4112345678",
     *                                  "razao_social": ""
     *                              }
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
     * Retorna os clientes do cadastro
     */
    public function index(ClienteRepositoryServiceInterface $clienteRepositoryService)
    {
        return $this->send($clienteRepositoryService->getClientes());
    }

    /**
     * @OA\Get(
     *      path="/api/v1/clientes/{cliente}",
     *      operationId="listagem de clientes pelo nome de pesquisa",
     *      tags={"Clientes"},
     *      summary="Consulta de clientes pelo nome",
     *      description="Returna os clientes pesquisados",
     *      @OA\Parameter(
     *          name="cliente",
     *          description="nome do cliente",
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
     *                          @OA\Property(property="conteudo", type="array", @OA\Items(ref="#/components/schemas/cliente")),
     *                      },
     *                      example={
     *                         "msg":"",
     *                         "code":200,
     *                         "conteudo":{
     *                              {
     *                                  "id": 7637076,
     *                                  "nome": " TESTE OSHOS",
     *                                  "cnpj_cpf": "",
     *                                  "telefone": "",
     *                                  "razao_social": ""
     *                              },
     *                              {
     *                                  "id": 6832129,
     *                                  "nome": "AMY SANTIAGO",
     *                                  "cnpj_cpf": "89473693907",
     *                                  "telefone": "4112345678",
     *                                  "razao_social": ""
     *                              }
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
     * Função para pesquisa de clientes
     * do cadastro pelo nome
     */
    public function pesquisar(ClienteRepositoryServiceInterface $clienteRepositoryService, string $cliente)
    {
        return $this->send($clienteRepositoryService->pesquisarClientesPeloNome($cliente));
    }

    /**
     * Função que recebe um cadastro de um novo cliente
     * 
     * * @OA\Post(
     *    path="/api/v1/clientes/cadastrar",
     *    operationId="Cadastro de cliente",
     *    tags={"Clientes"},
     *    summary="Cadastro de cliente",
     *    description="Cadastro de cliente",
     *    security={
     *       {"bearer": {}}
     *    },
     *    @OA\RequestBody(
     *        required=true,
     *        description="Informações básicas do cliente",
     *        @OA\JsonContent(
     *              @OA\Property(property="tipo_pessoa", type="char", description="ENUM(F,J,B,E,'')", example="F"),
     *              @OA\Property(property="cnpj_cpf", type="string", description="Não obrigatṕrio para estrangeiros", example="99999999999999"),
     *              @OA\Property(property="rg", type="99999999999"),
     *              @OA\Property(property="inscricao_municipal", type="string", example="99.999.999-99"),
     *              @OA\Property(property="inscricao_estadual", type="string", description="aceita ISENTO", example="999999999"),
     *              @OA\Property(property="inscricao_suframa", type="string", example="999999999"),
     *              @OA\Property(property="nome", type="string", example="Nome do cliente"),
     *              @OA\Property(property="razao_social", type="string",example="Razão social do cliente, quando PJ"),
     *              @OA\Property(property="id_tipo_log", type="integer",example=1),
     *              @OA\Property(property="endereco", type="string",example="Rua do Cliente"),
     *              @OA\Property(property="numero", type="string",example="445A"),
     *              @OA\Property(property="complemento", type="string",example=""),
     *              @OA\Property(property="bairro", type="string",example="Cidade Sorriso"),
     *              @OA\Property(property="cidade", type="string",example="Sao Paulo"),
     *              @OA\Property(property="uf", type="string", description="Sigla de estado válido", example="SP"),
     *              @OA\Property(property="cep", type="string",example="99999999"),
     *              @OA\Property(property="pais", type="string",example="BRASIL"),
     *              @OA\Property(property="informacoes_adicionais", type="string",example=""),
     *              @OA\Property(property="email", type="email",description="email válido para contato do cliente", example="cliente@teste.com"),
     *              @OA\Property(property="telefone", type="string",example="41999999999"),
     *              @OA\Property(property="celular", type="string",example="41999999999"),
     *              @OA\Property(property="fax", type="string",example="41999999999"),
     *              @OA\Property(property="ativo", type="string",description="A,I,E,'']", example="A"),
     *              @OA\Property(property="renda_media", type="decimal",example=0.00),
     *              @OA\Property(property="empresa_trabalha", type="string",example=""),
     *              @OA\Property(property="cargo", type="string",example=""),
     *              @OA\Property(property="fone_empresa", type="string",example="41999999999"),
     *              @OA\Property(property="endereco_empresa", type="string",example="Rua da empresa"),
     *              @OA\Property(property="nome_referencia_comercial", type="string",example=""),
     *              @OA\Property(property="referencia_comercial", type="string",example=""),
     *              @OA\Property(property="nome_referencia", type="string",example=""),
     *              @OA\Property(property="referencia_pessoal", type="string",example=""),
     *              @OA\Property(property="data_nascimento", type="string",example="2000-10-01"),
     *              @OA\Property(property="nome_pai", type="string",example="Nome do pai"),
     *              @OA\Property(property="nome_mae", type="string",example="Nome da mae"),
     *              @OA\Property(property="numero_titulo", type="string",example=""),
     *              @OA\Property(property="zona", type="string",example=""),
     *              @OA\Property(property="secao", type="string",example=""),
     *              @OA\Property(property="placa", type="string",example=""),
     *              @OA\Property(property="fone_pai", type="string",example=""),
     *              @OA\Property(property="fone_mae", type="string",example=""),
     *              @OA\Property(property="socio1", type="string",example="41999999999"),
     *              @OA\Property(property="socio2", type="string",description="Obrigatṕrio para pessoas jurídicas",example="41999999999"),
     *              @OA\Property(property="fone_socio1", type="string",example="fone_socio1"),
     *              @OA\Property(property="fone_socio2", type="string",example="fone_socio1"),
     *              @OA\Property(property="isento_icms", type="string",description="ENUM(S,N)",example="N"),
     *              @OA\Property(property="obs", type="string",example=""),
     *              @OA\Property(property="tabela_preco", type="string",example=""),
     *              @OA\Property(property="estado_civil", type="string",example=""),
     *              @OA\Property(property="nome_conjuge", type="string",example=""),
     *              @OA\Property(property="tipo_residencia", type="integer",example=1),
     *              @OA\Property(property="orgao_expedidor", type="string",example="SSPPR"),
     *              @OA\Property(property="naturalidade", type="string",example="SAO PAULO|SP"),
     *              @OA\Property(property="id_importacao", type="string",example=""),
     *              @OA\Property(property="id_funcionario", type="string",example=""),
     *              @OA\Property(property="limite_credito", type="decimal",example=99.99),
     *              @OA\Property(property="limite_credito_cc", type="decimal",example=99.999),
     *              @OA\Property(property="tipo_compra", type="string",description="ENUM(A,V)",example="V"),
     *              @OA\Property(property="origem_cadastro", type="string",example=""),
     *              @OA\Property(property="data_cadastro_user", type="string",example=""),
     *              @OA\Property(property="data_sincronismo", type="string",example="2020-10-20"),
     *              @OA\Property(property="id_off", type="string",example=""),
     *              @OA\Property(property="substituto_tributario", type="integer",example=3),
     *              @OA\Property(property="senha", type="string",example=""),
     *              @OA\Property(property="enderecos", type="array", 
     *                    @OA\Items(ref="#/components/schemas/cliente_endereco")
     *              )    
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
     *                          @OA\Property(property="conteudo", ref="#/components/schemas/cliente")
     *                      },
     *                      example={
     *                          "msg": "",
     *                          "code": 201,
     *                          "conteudo": {
     *                              "id_cadastro": 23096,
     *                              "tipo_pessoa": "F",
     *                              "cnpj_cpf": "05674315922",
     *                              "nome": "DARIO HODKIEWICZ I",
     *                              "razao_social": "Prosacco, Ledner and Powlowski",
     *                              "id_tipo_log": "1",
     *                              "endereco": "23034 Kertzmann Key\nLake Catherineville, NH 75842",
     *                              "numero": "8",
     *                              "complemento": "Suite 148",
     *                              "bairro": "Stephan Hill",
     *                              "cidade": "Laurynborough",
     *                              "uf": "PR",
     *                              "cep": "00089684",
     *                              "pais": "BRASIL",
     *                              "email": "madalyn52@example.com",
     *                              "telefone": "614460712852537",
     *                              "celular": "12294776475",
     *                              "empresa_trabalha": "",
     *                              "socio2": "Dr. Rhianna Schneider",
     *                              "fax": "",
     *                              "id_usuario": 1,
     *                              "endereco_empresa": "551 Toy Track\nJewelton, IL 77545-5173",
     *                              "data_cadastro": "2020-11-03T12:28:19.000000Z",
     *                              "data_alteracao": "2020-11-03T12:28:19.000000Z",
     *                              "id": 1,
     *                              "enderecos": {
     *                                  {
     *                                      "id": 1,
     *                                      "tipo_endereco": "C",
     *                                      "cnpj_cpf": "99999999999",
     *                                      "nome": "Nome contato",
     *                                      "razao_social": "",
     *                                      "id_tipo_log": "1",
     *                                      "endereco": "Rua Teste",
     *                                      "numero": "134",
     *                                      "complemento": "Complemente teste",
     *                                      "bairro": "Bairro",
     *                                      "cidade": "Cidade",
     *                                      "uf": "PR",
     *                                      "cep": "81825310",
     *                                      "pais": "BRASIL"
     *                                  },
     *                              }
     *                          }
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
     */
    public function cadastrar(RequestBodyConverter $requestBodyConverter, ClientesService $clientesService)
    {
        $clienteDTO = $requestBodyConverter->deserializer(new ClienteDTO());
        $cliente    = $clientesService->salvarCliente($clienteDTO);

        return $this->send($cliente, Response::HTTP_CREATED);
    }

    public function testarFila()
    {

        /*$json = '{
            "resource": "/orders/MLB866539393",
            "user_id": 1234,
            "topic": "orders_v2",
            "received": "2011-10-19T16:38:34.425Z",
            "sent" : "2011-10-19T16:40:34.425Z"
        }';

        RabbitMQJob::dispatch([
            "queue"      => "notificacoes_meli",
            "connection" => "rabbitmq",
            "job"        => "App\Jobs\NotificacoesMercadoLivreJob",
            "data"       => json_decode($json, true),
        ])->onConnection("rabbitmq")->onQueue("geral");*/
    }
}
