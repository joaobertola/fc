<?php

namespace App\Http\Controllers\FrenteCaixa;

use App\Model\FrenteCaixa\FcVenda;
use App\DTO\FrenteCaixa\FCVendaDTO;
use App\Http\Controllers\Controller;
use App\DTO\FrenteCaixa\FCItemVendaDTO;
use App\DTO\FrenteCaixa\CadastroServicoDTO;
use App\DTO\FrenteCaixa\LoginFrenteCaixaDTO;
use Symfony\Component\HttpFoundation\Response;
use App\DTO\FrenteCaixa\CalculoTotalDescontosDTO;
use App\Services\Extensions\RequestBodyConverter;
use App\Services\FrenteCaixa\FrenteCaixaServices;
use App\Services\FrenteCaixa\LoginFrenteCaixaServices;
use App\Repository\Contracts\Model\Funcionario\FuncionarioRepositoryInterface;
use App\Repository\Contracts\Model\Produto\PromocaoQuantidadeRepositoryInterface;
use App\Services\Repository\Contracts\Model\Produto\ProdutoFrenteCaixaRepositoryServiceInterface;



class FrenteCaixaController extends Controller
{
    /**
     * @OA\Get(
     *    path="/api/v1/frente-caixa/{numeroCaixa}",
     *    operationId="Passo inicial referente a verificacao do caixa em aberto e em qual operador se encontra aberto",
     *    tags={"Frente de Caixa"},
     *    summary="Verifica status do caixa",
     *    description="Consulta status do caixa",
     *    security={
     *       {"bearer": {}}
     *    },
     *    @OA\Parameter(
     *        name="numeroCaixa",
     *        description="Número do caixa para consultar seu status",
     *        required=true,
     *        in="path",
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
     *                              @OA\Property(property="num_caixa", type="string",example="001"),
     *                              @OA\Property(property="id_operador", type="integer", example=99999),
     *                          ),
     *                      }
     *                 )
     *              )
     *          }
     *    ),
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
     *
     * Passo inicial do login na frente de caixa referente a verificacao do caixa em aberto
     * e em qual operador se encontra aberto
     */
    public function verificaCaixaAberto(string $numeroCaixa, LoginFrenteCaixaServices $loginFrenteCaixaServices)
    {
        $caixaAberto = $loginFrenteCaixaServices->consultaCaixaAberto($numeroCaixa);
        $idUsuario   = isset($caixaAberto->id_usuario) ? $caixaAberto->id_usuario : 0;
        $numeroCaixa = isset($caixaAberto->num_caixa) ? $caixaAberto->num_caixa : $numeroCaixa;
        $numeroCaixa = str_pad($numeroCaixa, 3, '0', STR_PAD_LEFT);
        $valorInicial = isset($caixaAberto->vlr_inicial) ? $caixaAberto->vlr_inicial : 00.00;
        return $this->send(["num_caixa" => $numeroCaixa, "id_operador" => $idUsuario, "valor_inicial_caixa" => $valorInicial]);
    }

    /**
     * @OA\Post(
     *    path="/api/v1/frente-caixa/{numeroCaixa}/logar-caixa-aberto",
     *    operationId="Passo seguinte para abertura do caixa",
     *    tags={"Frente de Caixa"},
     *    summary="Realiza a abertura do caixa",
     *    description="Realiza a abertura do caixa",
     *    security={
     *       {"bearer": {}}
     *    },
     *    @OA\Parameter(
     *        name="numeroCaixa",
     *        description="Número do caixa para a abertura do seu caixa",
     *        required=true,
     *        in="path",
     *        @OA\Schema(
     *            type="string"
     *        )
     *    ),
     *    @OA\RequestBody(
     *          required=true,
     *          description="Informações para a realização das sangrias",
     *          @OA\JsonContent(
     *               @OA\Property(property="id_operador", type="integer", example=1),
     *               @OA\Property(property="senha_operador", type="string", description="senha do operador criptografado para a abertura do caixa")
     *          ),
     *     ),
     *    @OA\Response(
     *          response=200,
     *          description="Successo, após a realização do login é retornado o token do caixa para as futuras operações.",
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
     * Passo seuinte para logar no caixa
     */
    public function logarCaixaAberto(string $numeroCaixa, LoginFrenteCaixaServices $loginFrenteCaixaServices, RequestBodyConverter $requestBodyConverter)
    {
        $loginFrenteCaixaDTO = $requestBodyConverter->deserializer(new LoginFrenteCaixaDTO());
        $loginFrenteCaixaDTO->setNumeroCaixa($numeroCaixa);

        return $this->send($loginFrenteCaixaServices->getTokenCaixaAberto($loginFrenteCaixaDTO));
    }

    public function getFuncionarios(FuncionarioRepositoryInterface $funcionarioRepository)
    {
        return $this->send($funcionarioRepository->buscaFuncionariosAtivos());
    }

    public function incluirServico(RequestBodyConverter $requestBodyConverter, ProdutoFrenteCaixaRepositoryServiceInterface $produtoFrenteCaixaRepositoryService)
    {
        $cadastroServicoDTO = $requestBodyConverter->deserializer(new CadastroServicoDTO());
        return $this->send($produtoFrenteCaixaRepositoryService->novoServicoFromFrenteCaixa($cadastroServicoDTO), Response::HTTP_CREATED);
    }

    public function getPromocaoKitsCodBarras(FrenteCaixaServices $frenteCaixaServices, string $codigoBarras)
    {
        return $this->send($frenteCaixaServices->pesquisaKitsCodigoBarras($codigoBarras));
    }

    public function buscaTotalDescontos(RequestBodyConverter $requestBodyConverter, FrenteCaixaServices $frenteCaixaServices)
    {
        $calculoDTO = $requestBodyConverter->deserializer(new CalculoTotalDescontosDTO());
        return $this->send($frenteCaixaServices->getTotalDescontos($calculoDTO));
    }

    /**
     * Action para buscar o total de desconto do mais por menos
     */
    public function buscaTotalDescontosDaVenda(FcVenda $venda, PromocaoQuantidadeRepositoryInterface $promocaoQuantidadeRepository)
    {
        return $this->send($promocaoQuantidadeRepository->getTotalDescontosVenda($venda->id));
    }

    /**
     * Action responsavel por criar um registro de venda pela frente de caixa e devolver os dados da venda
     */
    public function novaVenda(RequestBodyConverter $requestBodyConverter, FrenteCaixaServices $frenteCaixaServices)
    {
        $fCVendaDTO = $requestBodyConverter->deserializer(new FCVendaDTO());
        return $this->send($frenteCaixaServices->salvarVenda($fCVendaDTO), Response::HTTP_CREATED);
    }

    /**
     * Action responsavel por lancar o item de venda pela frente de caixa
     */
    public function novoItemVenda(FcVenda $venda, RequestBodyConverter $requestBodyConverter, FrenteCaixaServices $frenteCaixaServices)
    {
        $fCItemVendaDTO = $requestBodyConverter->deserializer(new FCItemVendaDTO());
        $fCItemVendaDTO->setIdVenda($venda->id);

        return $this->send($frenteCaixaServices->salvarItemVenda($fCItemVendaDTO), Response::HTTP_CREATED);
    }
}
