<?php

namespace App\Http\Controllers\Grade;

use App\DTO\Grades\GradeDTO;
use App\Model\Produto\Grade;
use App\Model\Produto\Produto;
use App\Http\Controllers\Controller;
use App\Model\Produto\GradeAtributo;
use App\Model\Produto\GradeFoto;
use App\Services\Grade\GradeService;
use Symfony\Component\HttpFoundation\Response;
use App\Services\Extensions\RequestBodyConverter;
use App\Repository\Contracts\Model\Produto\GradeRepositoryInterface;
use App\Services\Repository\Contracts\Model\Produto\GradeRepositoryServiceInterface;
use Illuminate\Http\Request;

class GradeController extends Controller
{
    /**
     * @OA\Get(
     *      path="/api/v1/produtos/grades/{produto}/all",
     *      operationId="listagem de grades",
     *      tags={"Grades Produtos"},
     *      summary="listagem de grades",
     *      description="Returna todass as grades do produto",
     *      security={
     *         {"bearer": {}}
     *      },
     *      @OA\Parameter(
     *          name="produto",
     *          description="Id do produto",
     *          required=true,
     *          in="path",
     *          @OA\Schema(
     *              type="integer"
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
     *                          @OA\Property(property="conteudo", type="array", @OA\Items(ref="#/components/schemas/grade")),
     *                      },
     *                      example={
     *                         "msg":"",
     *                         "code":200,
     *                         "conteudo":{
     *                              {
     *                                  "id_grade": 9999999,
     *                                  "id_produto": 9999999,
     *                                  "descricao": "Produto - (Principal)",
     *                                  "codigo_barra": "9999999",
     *                                  "codigo_barra_pai": "9999999",
     *                                  "valor_custo": "12.90000",
     *                                  "qtd_minima": "0.000",
     *                                  "valor_varejo_aprazo": "16.77",
     *                                  "valor_atacado_aprazo": "0.00",
     *                                  "qtd_atual": "-8.000",
     *                                  "sigla": "UNID",
     *                                  "atributos": "(Principal)",
     *                                  "pai": 1
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
     * Retorna as grades do produto
     */
    public function gradesProduto(Produto $produto, GradeRepositoryInterface $gradeRepository)
    {
        return $this->send($gradeRepository->getGradesProduto($produto->id));
    }

    /**
     *  @OA\Post(
     *      path="/api/v1/produtos/grades/{produto}/salvar",
     *      operationId="Salvar nova grade ao produto",
     *      tags={"Grades Produtos"},
     *      summary="Salvar grade",
     *      description="Vínculos de grades a produtos",
     *      security={
     *         {"bearer": {}}
     *      },
     *      @OA\Parameter(
     *          name="produto",
     *          description="Id do produto para anexar a nova grade",
     *          required=true,
     *          in="path",
     *          @OA\Schema(
     *              type="string"
     *          )
     *      ),
     *      @OA\RequestBody(
     *          required=true,
     *          description="Informação para cadastro da grade",
     *          @OA\JsonContent(type="object", ref="#components/schemas/grade_dto"),
     *       ),
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
     *                          @OA\Property(
     *                              property="conteudo", type="object", ref="#components/schemas/grade"
     *                          ),
     *                      },
     *                      example={
     *                           "msg": "",
     *                           "code": 200,
     *                           "conteudo": {
     *                               "id_grade": 1011702720,
     *                               "id_produto": 1002733801,
     *                               "id_grade_atributo_valor": "7594",
     *                               "id_usuario_alterou": 1,
     *                               "codigo_barra_pai": "2733801",
     *                               "codigo_barra": "10057421",
     *                               "codigo_interno": "344444444",
     *                               "qtd_atual": "9.000",
     *                               "qtd_minima": "12.000",
     *                               "qtd_locacao": "0.000",
     *                               "qtd_locacao_locado": null,
     *                               "valor_custo": null,
     *                               "valor_varejo_avista": "30.00",
     *                               "valor_varejo_aprazo": "0.00",
     *                               "valor_atacado_avista": "30.00",
     *                               "valor_atacado_aprazo": "0.00",
     *                               "porc_varejo_avista": "0.000000000000000",
     *                               "porc_varejo_aprazo": "0.000000000000000",
     *                               "porc_atacado_avista": "0.000000000000000",
     *                               "porc_atacado_aprazo": "0.000000000000000",
     *                               "ativo": 1,
     *                               "data_alteracao": "2020-12-15T18:18:58.000000Z",
     *                               "data_sincronismo": null,
     *                               "id_off": null,
     *                               "alteracao": null
     *                           }
     *                           
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
     * Criação de grades
     */
    public function salvarGrade(Produto $produto, RequestBodyConverter $requestBodyConverter, GradeService $gradeService) {
        $gradeDTO = $requestBodyConverter->deserializer(new GradeDTO());
        return $this->send($gradeService->salvarNovaGrade($produto, $gradeDTO), Response::HTTP_CREATED);

    }
    /**
     *  @OA\Put(
     *      path="/api/v1/produtos/grades/{grade}/editar",
     *      operationId="Edição de grade",
     *      tags={"Grades Produtos"},
     *      summary="Editar grade",
     *      description="Edição de grades dos produtos",
     *      security={
     *         {"bearer": {}}
     *      },
     *      @OA\Parameter(
     *          name="grade",
     *          description="Id da grade para edição",
     *          required=true,
     *          in="path",
     *          @OA\Schema(
     *              type="string"
     *          )
     *      ),
     *      @OA\RequestBody(
     *          required=true,
     *          description="Informação para edição da grade",
     *          @OA\JsonContent(type="object", ref="#components/schemas/grade_dto"),
     *       ),
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
     *                          @OA\Property(
     *                              property="conteudo", type="object", ref="#components/schemas/grade"
     *                          ),
     *                      },
     *                      example={
     *                           "msg": "",
     *                           "code": 200,
     *                           "conteudo": {
     *                               "id_grade": 1011702720,
     *                               "id_produto": 1002733801,
     *                               "id_grade_atributo_valor": "7594",
     *                               "id_usuario_alterou": 1,
     *                               "codigo_barra_pai": "2733801",
     *                               "codigo_barra": "10057421",
     *                               "codigo_interno": "344444444",
     *                               "qtd_atual": "9.000",
     *                               "qtd_minima": "12.000",
     *                               "qtd_locacao": "0.000",
     *                               "qtd_locacao_locado": null,
     *                               "valor_custo": null,
     *                               "valor_varejo_avista": "30.00",
     *                               "valor_varejo_aprazo": "0.00",
     *                               "valor_atacado_avista": "30.00",
     *                               "valor_atacado_aprazo": "0.00",
     *                               "porc_varejo_avista": "0.000000000000000",
     *                               "porc_varejo_aprazo": "0.000000000000000",
     *                               "porc_atacado_avista": "0.000000000000000",
     *                               "porc_atacado_aprazo": "0.000000000000000",
     *                               "ativo": 1,
     *                               "data_alteracao": "2020-12-15T18:18:58.000000Z",
     *                               "data_sincronismo": null,
     *                               "id_off": null,
     *                               "alteracao": null
     *                           }
     *                           
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
     * Edição de grades
     */
    public function editarGrade(Grade $grade, RequestBodyConverter $requestBodyConverter, GradeService $gradeService) {
        $gradeDTO = $requestBodyConverter->deserializer(new GradeDTO());
        return $this->send($gradeService->editarGrade($grade, $gradeDTO), Response::HTTP_CREATED);

    }

    /**
     *  @OA\Delete(
     *      path="/api/v1/produtos/grades/{grade}/excluir",
     *      operationId="Exclusão de grade",
     *      tags={"Grades Produtos"},
     *      summary="Excluir grades",
     *      description="Desabilita a grade do produto",
     *      security={
     *         {"bearer": {}}
     *      },
     *      @OA\Parameter(
     *          name="grade",
     *          description="Id da grade para edição",
     *          required=true,
     *          in="path",
     *          @OA\Schema(
     *              type="string"
     *          )
     *      ),
     *      @OA\Response(
     *          response=204,
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
     * Exclusão de grades
     */
    public function excluirGrade(Grade $grade, GradeService $gradeService) {
        return $this->send($gradeService->excluirGrade($grade), Response::HTTP_NO_CONTENT);
    }

     /**
     * Retorna os atributos de grades configurados pelo usuario no cadastro
     */
    public function vincularImagemGrade(Grade $grade, Request $request, GradeService $gradeService) {
        return $this->send($gradeService->vincularImagemGrade($grade, $request), Response::HTTP_CREATED);
    }

    /**
     * Retorna os atributos de grades configurados pelo usuario no cadastro
     */
    public function excluirImagemGrade(GradeFoto $gradeFoto , GradeService $gradeService) {
        return $this->send($gradeService->excluirFotoGrade($gradeFoto), Response::HTTP_CREATED);
    }

    /**
     * @OA\Get(
     *      path="/api/v1/produtos/grades/atributos/preenchidos",
     *      operationId="Listagem dos atributos configurados para funcionamento com a grade",
     *      tags={"Grades Produtos"},
     *      summary="Atributos Preenchidos",
     *      description="Retorna os atributos já preenchidos",
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
     *                              {
     *                                  "id_grade_atributo": 1343,
     *                                  "atributo": "OLHOS DE DIAMANTE"
     *                              },
     *                              {
     *                                  "id_grade_atributo": 9109,
     *                                  "atributo": "TAMANHO"
     *                              },
     *                              {
     *                                  "id_grade_atributo": 12028,
     *                                  "atributo": "COR"
     *                              }
     *                          }
     *                           
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
     * Retorna os atributos de grades configurados pelo usuario no cadastro
     */
    public function getAtributosPreenchido(GradeRepositoryInterface $gradeRepository) {
        return $this->send($gradeRepository->getAtributosPreenchidos());
    }

    /**
     * @OA\Get(
     *      path="/api/v1/produtos/grades/atributos/{gradeAtributo}/valores-atributo",
     *      operationId="Listagem dos valores do atributo selecionado",
     *      tags={"Grades Produtos"},
     *      summary="Valores de Atributos",
     *      description="Retorna os valores do atributo",
     *      security={
     *         {"bearer": {}}
     *      },
     *      @OA\Parameter(
     *          name="gradeAtributo",
     *          description="Id do atributo preenchido",
     *          required=true,
     *          in="path",
     *          @OA\Schema(
     *              type="string"
     *          )
     *      ),
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
     *                              {
     *                                  "id_grade_atributo_valor": 7594,
     *                                  "valor": "100"
     *                              },
     *                              {
     *                                  "id_grade_atributo_valor": 7596,
     *                                  "valor": "100"
     *                              },
     *                              {
     *                                  "id_grade_atributo_valor": 7531,
     *                                  "valor": "30"
     *                              }
     *                          }
     *                           
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
     * Retorna os valores do atributo selecionado 
     */
    public function getValoresDoAtributo(GradeAtributo $gradeAtributo, GradeRepositoryInterface $gradeRepository) {
        return $this->send($gradeRepository->getValoresByAtributo($gradeAtributo->id_grade_atributo));
    }

    /**
     * Qtualiza a qtde atual de estoque da grade
     */
    public function atualizarEstoqueAtualGrade(Grade $grade, int $qtdAtual, GradeRepositoryServiceInterface $gradeRepositoryService)
    {
        return $this->send($gradeRepositoryService->atualizarQtdeEstoque($grade->id, $qtdAtual));
    }
}
