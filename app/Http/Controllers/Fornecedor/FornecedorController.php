<?php

namespace App\Http\Controllers\Fornecedor;

use App\Http\Controllers\Controller;
use App\DTO\Fornecedor\CadastrarFornecedorDTO;
use App\Model\Fornecedor\Fornecedor;
use App\Services\Extensions\RequestBodyConverter;
use App\Services\Fornecedor\CadastroEditarFornecedorService;
use Symfony\Component\HttpFoundation\Response;

class FornecedorController extends Controller
{
    /**
     * @OA\Post(
     *    path="/api/v1/fornecedor/salvar",
     *    operationId="Cadastro de fornecedores",
     *    tags={"Fornecedores"},
     *    summary="Cadastro de fornecedores",
     *    description="Cadastro de fornecedores",
     *    security={
     *       {"bearer": {}}
     *    },
     *    @OA\RequestBody(
     *        required=true,
     *        description="Informações básicas do fornecedor para o cadastro",
     *        @OA\JsonContent(   
     *           @OA\Property(property="cnpj_cpf", type="string"),
     *           @OA\Property(property="rgie", type="string"),
     *           @OA\Property(property="contato", type="string"),
     *           @OA\Property(property="razao_social", type="string"),
     *           @OA\Property(property="fantasia", type="string"),
     *           @OA\Property(property="id_tipo_log", type="integer"),
     *           @OA\Property(property="tipo_pessoa", type="string"),
     *           @OA\Property(property="endereco", type="string"),
     *           @OA\Property(property="numero", type="string"),
     *           @OA\Property(property="complemento", type="string"),
     *           @OA\Property(property="bairro", type="string"),
     *           @OA\Property(property="cidade", type="string"),
     *           @OA\Property(property="uf", type="string"),
     *           @OA\Property(property="cep", type="string"),
     *           @OA\Property(property="informacoes_adicionais", type="string"),
     *           @OA\Property(property="email", type="string"),
     *           @OA\Property(property="site", type="string"),
     *           @OA\Property(property="skype", type="string"),
     *           @OA\Property(property="telefone", type="string"),
     *           @OA\Property(property="celular", type="string"),
     *           @OA\Property(property="fax", type="string"),
     *           @OA\Property(property="insc_municipal", type="string"),
     *           @OA\Property(property="insc_estadual", type="string"),
     *           @OA\Property(property="data_fundacao", type="string", format="date"),
     *           @OA\Property(property="prazo_entrega_produtos", type="integer"),
     *           @OA\Property(property="isento_icms", type="string"),
     *           @OA\Property(property="id_pais", type="integer"),
     *           @OA\Property(property="produtos", type="array", @OA\Items(), example={"Produto 1", "Produto 2"}),
     *           @OA\Property(property="transportadoras", type="array", @OA\Items(), example={"Transportadora 1", "Transportadora 2"}),
     *           @OA\Property(property="dados_bancarios", type="array", @OA\Items(ref="#/components/schemas/fornecedor_banco")),
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
     *                          @OA\Property(property="conteudo", type="object")
     *                      },
     *                      example={
     *                           "msg": "",
     *                           "code": 201,
     *                           "conteudo": {
     *                                 "fornecedor": {
     *                                     "cnpj_cpf": "99999999999999",
     *                                     "rgie": "",
     *                                     "contato": "",
     *                                     "razao_social": "Fornecedor",
     *                                     "fantasia": "Fornecedor Fantasia",
     *                                     "id_tipo_log": 1,
     *                                     "id_cadastro": 9999999,
     *                                     "tipo_pessoa": "J",
     *                                     "endereco": "Rua teste fornecedor",
     *                                     "numero": "458",
     *                                     "complemento": "complemento teste",
     *                                     "bairro": "Pinehiros",
     *                                     "cidade": "Sao Paulo",
     *                                     "uf": "SP",
     *                                     "cep": "1178589",
     *                                     "informacoes_adicionais": "Teste stes",
     *                                     "email": "teste@gmail.com",
     *                                     "site": "api.webcontrol.com.br",
     *                                     "skype": "",
     *                                     "telefone": "4199999999",
     *                                     "celular": "4199999999",
     *                                     "fax": "",
     *                                     "insc_municipal": "4145784",
     *                                     "insc_estadual": "5447744",
     *                                     "data_fundacao": "2020-20-20",
     *                                     "prazo_entrega_produtos": "10",
     *                                     "isento_icms": "S",
     *                                     "id_pais": 1058,
     *                                     "data_alteracao": "2020-12-01T12:43:00.000000Z",
     *                                     "data_cadastro": "2020-12-01T12:43:00.000000Z",
     *                                     "id": 659420
     *                                 },
     *                                 "produtos": {
     *                                     {
     *                                         "id_fornecedor": 659420,
     *                                         "descricao": "produto 1",
     *                                         "data_alteracao": "2020-12-01T12:43:00.000000Z",
     *                                         "id": 17505
     *                                     },
     *                                     {
     *                                         "id_fornecedor": 659420,
     *                                         "descricao": "produto 2",
     *                                         "data_alteracao": "2020-12-01T12:43:00.000000Z",
     *                                         "id": 17506
     *                                     }
     *                                 },
     *                                 "transportadoras": {
     *                                     {
     *                                         "id_fornecedor": 659420,
     *                                         "descricao": "transportadora 1",
     *                                         "data_alteracao": "2020-12-01T12:43:00.000000Z",
     *                                         "id_transportadora": 1919
     *                                     },
     *                                     {
     *                                         "id_fornecedor": 659420,
     *                                         "descricao": "transportadora 2",
     *                                         "data_alteracao": "2020-12-01T12:43:00.000000Z",
     *                                         "id_transportadora": 1920
     *                                     }
     *                                 },
     *                                 "dados_bancarios": {
     *                                     {
     *                                         "id_fornecedor": 659420,
     *                                         "id_banco": 237,
     *                                         "agencia": 3052,
     *                                         "conta": 512480,
     *                                         "titular": "Titular",
     *                                         "titular_cpfcnpj": 6866893000133,
     *                                         "tipo_conta": "C",
     *                                         "data_alteracao": "2020-12-01T12:43:00.000000Z",
     *                                         "id": 2922
     *                                     }
     *                                 },
     *                                 "base_inform": {
     *                                     "nome": {
     *                                         "id": 117422784,
     *                                         "Origem_Nome_id": 2,
     *                                         "Nom_CPF": 5674315922,
     *                                         "Nom_Tp": 1,
     *                                         "Nom_Nome": "Fornecedor",
     *                                         "Dt_Cad": "2020-12-01T00:00:00.000000Z"
     *                                     },
     *                                     "endereco": {
     *                                         "id": 113663326,
     *                                         "CPF": "05674315922",
     *                                         "Tipo": 1,
     *                                         "Origem_Nome_id": 2,
     *                                         "Tipo_Log_id": 1,
     *                                         "logradouro": "Rua teste fornecedor",
     *                                         "numero": "458",
     *                                         "complemento": "complemento teste",
     *                                         "bairro": "Pinehiros",
     *                                         "cidade": "Sao Paulo Capital",
     *                                         "uf": "SP",
     *                                         "cep": "1178589",
     *                                         "data_cadastro": null
     *                                     },
     *                                     "email": {
     *                                         "id": 33749181,
     *                                         "CPF": 5674315922,
     *                                         "Tipo": 1,
     *                                         "Email": "teste@gmail.com"
     *                                     },
     *                                     "nascimento_fundacao": {
     *                                         "CPF": "05674315922",
     *                                         "Tipo": 1,
     *                                         "data_nascimento": 2020
     *                                     },
     *                                     "telefone": {
     *                                         "cpfcnpj": "05674315922",
     *                                         "fone": "99999999",
     *                                         "ddd": "41",
     *                                         "id": 51284580
     *                                     },
     *                                     "celular": {
     *                                         "id": 51284580,
     *                                         "ddd": "41",
     *                                         "fone": "99999999",
     *                                         "cpfcnpj": 5674315922,
     *                                         "id_tplog": null,
     *                                         "log": null,
     *                                         "numero": null,
     *                                         "compl": null,
     *                                         "bairro": null,
     *                                         "cidade": null,
     *                                         "cep": null,
     *                                         "uf": null
     *                                     }
     *                                 }
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
     * 
     * Cadastro de Fornecedores
     * 
     * @return Json Retorna todos os produtos pelo nome
     */
    public function salvarFornecedor(RequestBodyConverter $requestBodyConverter,  CadastroEditarFornecedorService $cadastroEditarFornecedorService)
    {
        $cadastrarFornecedorDTO = $requestBodyConverter->deserializer(new CadastrarFornecedorDTO());
        return $this->send($cadastroEditarFornecedorService->salvarFornecedor($cadastrarFornecedorDTO, Response::HTTP_CREATED));
    }

    /**
     * @OA\Put(
     *    path="/api/v1/fornecedor/editar/{fornecedor}",
     *    operationId="Edição de fornecedores",
     *    tags={"Fornecedores"},
     *    summary="Edição de fornecedores",
     *    description="Edição de fornecedores",
     *    security={
     *       {"bearer": {}}
     *    },
     *    @OA\Parameter(
     *          name="fornecedor",
     *          description="Id do fornecedor para edição",
     *          required=true,
     *          in="path",
     *          @OA\Schema(
     *              type="string"
     *          )
     *    ),
     *    @OA\RequestBody(
     *        required=true,
     *        description="Informações básicas do fornecedor para o cadastro",
     *        @OA\JsonContent(   
     *           @OA\Property(property="cnpj_cpf", type="string"),
     *           @OA\Property(property="rgie", type="string"),
     *           @OA\Property(property="contato", type="string"),
     *           @OA\Property(property="razao_social", type="string"),
     *           @OA\Property(property="fantasia", type="string"),
     *           @OA\Property(property="id_tipo_log", type="integer"),
     *           @OA\Property(property="tipo_pessoa", type="string"),
     *           @OA\Property(property="endereco", type="string"),
     *           @OA\Property(property="numero", type="string"),
     *           @OA\Property(property="complemento", type="string"),
     *           @OA\Property(property="bairro", type="string"),
     *           @OA\Property(property="cidade", type="string"),
     *           @OA\Property(property="uf", type="string"),
     *           @OA\Property(property="cep", type="string"),
     *           @OA\Property(property="informacoes_adicionais", type="string"),
     *           @OA\Property(property="email", type="string"),
     *           @OA\Property(property="site", type="string"),
     *           @OA\Property(property="skype", type="string"),
     *           @OA\Property(property="telefone", type="string"),
     *           @OA\Property(property="celular", type="string"),
     *           @OA\Property(property="fax", type="string"),
     *           @OA\Property(property="insc_municipal", type="string"),
     *           @OA\Property(property="insc_estadual", type="string"),
     *           @OA\Property(property="data_fundacao", type="string", format="date"),
     *           @OA\Property(property="prazo_entrega_produtos", type="integer"),
     *           @OA\Property(property="isento_icms", type="string"),
     *           @OA\Property(property="id_pais", type="integer"),
     *           @OA\Property(property="produtos", type="array", @OA\Items(), example={"Produto 1", "Produto 2"}),
     *           @OA\Property(property="transportadoras", type="array", @OA\Items(), example={"Transportadora 1", "Transportadora 2"}),
     *           @OA\Property(property="dados_bancarios", type="array", @OA\Items(ref="#/components/schemas/fornecedor_banco")),
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
     *                          @OA\Property(property="conteudo", type="object")
     *                      },
     *                      example={
     *                           "msg": "",
     *                           "code": 201,
     *                           "conteudo": {
     *                                 "fornecedor": {
     *                                     "cnpj_cpf": "99999999999999",
     *                                     "rgie": "",
     *                                     "contato": "",
     *                                     "razao_social": "Fornecedor",
     *                                     "fantasia": "Fornecedor Fantasia",
     *                                     "id_tipo_log": 1,
     *                                     "id_cadastro": 9999999,
     *                                     "tipo_pessoa": "J",
     *                                     "endereco": "Rua teste fornecedor",
     *                                     "numero": "458",
     *                                     "complemento": "complemento teste",
     *                                     "bairro": "Pinehiros",
     *                                     "cidade": "Sao Paulo",
     *                                     "uf": "SP",
     *                                     "cep": "1178589",
     *                                     "informacoes_adicionais": "Teste stes",
     *                                     "email": "teste@gmail.com",
     *                                     "site": "api.webcontrol.com.br",
     *                                     "skype": "",
     *                                     "telefone": "4199999999",
     *                                     "celular": "4199999999",
     *                                     "fax": "",
     *                                     "insc_municipal": "4145784",
     *                                     "insc_estadual": "5447744",
     *                                     "data_fundacao": "2020-20-20",
     *                                     "prazo_entrega_produtos": "10",
     *                                     "isento_icms": "S",
     *                                     "id_pais": 1058,
     *                                     "data_alteracao": "2020-12-01T12:43:00.000000Z",
     *                                     "data_cadastro": "2020-12-01T12:43:00.000000Z",
     *                                     "id": 659420
     *                                 },
     *                                 "produtos": {
     *                                     {
     *                                         "id_fornecedor": 659420,
     *                                         "descricao": "produto 1",
     *                                         "data_alteracao": "2020-12-01T12:43:00.000000Z",
     *                                         "id": 17505
     *                                     },
     *                                     {
     *                                         "id_fornecedor": 659420,
     *                                         "descricao": "produto 2",
     *                                         "data_alteracao": "2020-12-01T12:43:00.000000Z",
     *                                         "id": 17506
     *                                     }
     *                                 },
     *                                 "transportadoras": {
     *                                     {
     *                                         "id_fornecedor": 659420,
     *                                         "descricao": "transportadora 1",
     *                                         "data_alteracao": "2020-12-01T12:43:00.000000Z",
     *                                         "id_transportadora": 1919
     *                                     },
     *                                     {
     *                                         "id_fornecedor": 659420,
     *                                         "descricao": "transportadora 2",
     *                                         "data_alteracao": "2020-12-01T12:43:00.000000Z",
     *                                         "id_transportadora": 1920
     *                                     }
     *                                 },
     *                                 "dados_bancarios": {
     *                                     {
     *                                         "id_fornecedor": 659420,
     *                                         "id_banco": 237,
     *                                         "agencia": 3052,
     *                                         "conta": 512480,
     *                                         "titular": "Titular",
     *                                         "titular_cpfcnpj": 6866893000133,
     *                                         "tipo_conta": "C",
     *                                         "data_alteracao": "2020-12-01T12:43:00.000000Z",
     *                                         "id": 2922
     *                                     }
     *                                 },
     *                                 "base_inform": {
     *                                     "nome": {
     *                                         "id": 117422784,
     *                                         "Origem_Nome_id": 2,
     *                                         "Nom_CPF": 5674315922,
     *                                         "Nom_Tp": 1,
     *                                         "Nom_Nome": "Fornecedor",
     *                                         "Dt_Cad": "2020-12-01T00:00:00.000000Z"
     *                                     },
     *                                     "endereco": {
     *                                         "id": 113663326,
     *                                         "CPF": "05674315922",
     *                                         "Tipo": 1,
     *                                         "Origem_Nome_id": 2,
     *                                         "Tipo_Log_id": 1,
     *                                         "logradouro": "Rua teste fornecedor",
     *                                         "numero": "458",
     *                                         "complemento": "complemento teste",
     *                                         "bairro": "Pinehiros",
     *                                         "cidade": "Sao Paulo Capital",
     *                                         "uf": "SP",
     *                                         "cep": "1178589",
     *                                         "data_cadastro": null
     *                                     },
     *                                     "email": {
     *                                         "id": 33749181,
     *                                         "CPF": 5674315922,
     *                                         "Tipo": 1,
     *                                         "Email": "teste@gmail.com"
     *                                     },
     *                                     "nascimento_fundacao": {
     *                                         "CPF": "05674315922",
     *                                         "Tipo": 1,
     *                                         "data_nascimento": 2020
     *                                     },
     *                                     "telefone": {
     *                                         "cpfcnpj": "05674315922",
     *                                         "fone": "99999999",
     *                                         "ddd": "41",
     *                                         "id": 51284580
     *                                     },
     *                                     "celular": {
     *                                         "id": 51284580,
     *                                         "ddd": "41",
     *                                         "fone": "99999999",
     *                                         "cpfcnpj": 5674315922,
     *                                         "id_tplog": null,
     *                                         "log": null,
     *                                         "numero": null,
     *                                         "compl": null,
     *                                         "bairro": null,
     *                                         "cidade": null,
     *                                         "cep": null,
     *                                         "uf": null
     *                                     }
     *                                 }
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
     * 
     * Edição de Fornecedores
     * 
     * @return Json Retorna todos os produtos pelo nome
     */
    public function editarFornecedor(Fornecedor $fornecedor, RequestBodyConverter $requestBodyConverter, CadastroEditarFornecedorService $cadastroEditarFornecedorService)
    {
        $cadastrarFornecedorDTO = $requestBodyConverter->deserializer(new CadastrarFornecedorDTO());
        return $this->send($cadastroEditarFornecedorService->editarFornecedor($fornecedor, $cadastrarFornecedorDTO ), Response::HTTP_CREATED);
    }
}
