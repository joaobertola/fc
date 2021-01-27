<?php

namespace App\Http\Controllers\Api;

use App\Traits\SendResponse;
use Illuminate\Http\Request;
use App\Services\Utils\CodesApi;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Exceptions\ApiWebControlException;
use Tymon\JWTAuth\Exceptions\JWTException;
use App\Repository\Contracts\UserRepositoryInterface;

class JwtAuthController extends Controller
{
    use SendResponse;
    /**
     * Get a JWT token via given credentials.
     *
     * @param  \Illuminate\Http\Request  $request
     *
     * @return \Illuminate\Http\JsonResponse
     *
     * @OA\Post(
     *      path="/api/v1/login",
     *      operationId="Login",
     *      tags={"Login"},
     *      summary="Login",
     *      description="Autenticação do usuário para retorno do token JWT de acesso",
     *      @OA\RequestBody(
     *          required=true,
     *          @OA\MediaType(
     *              mediaType="application/x-www-form-urlencoded",
     *              @OA\Schema(
     *                  type="object",
     *                  @OA\Property(
     *                      property="login",
     *                      description="Login do usuário",
     *                      type="string"
     *                  ),
     *                  @OA\Property(
     *                      property="senha",
     *                      description="Senha do usuário",
     *                      type="string"
     *                  ),
     *              )
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
     *                          @OA\Property(property="access_token", type="string"),
     *                          @OA\Property(property="bearer", type="string"),
     *                          @OA\Property(property="expires_in", type="integer"),
     *                      },
     *                      example={
     *                           "access_token": "JWT",
     *                           "token_type": "bearer",
     *                           "expires_in": 3600
     *                       }
     *                  )
     *              )
     *          }
     *      ),
     *      @OA\Response(
     *          response=401,
     *          description="Unauthenticated",
     *      )
     * )
     */
    public function login(Request $request)
    {
        $credentials = $request->only('login', 'senha');

        if ($token = $this->attempt($credentials)) {
            return $this->respondWithToken($token);
        }

        return response()->json(['error' => 'Login invalido'], 401);
    }

    /**
     * Attempt to authenticate the user using the given credentials and return the token.
     *
     * @param  array  $credentials
     * @param  bool  $login
     *
     * @return bool|string
     */
    private function attempt(array $credentials = [], $login = true)
    {
        $userRepository = app(UserRepositoryInterface::class);
        $user           = $userRepository->getUsuarioLogin($credentials['login'], $credentials['senha']);

        if ($user) {
            return $login ? $this->guard()->login($user) : true;
        }

        return false;
    }

    /**
     * Get the authenticated User
     * @OA\Get(
     *      path="/api/v1/me",
     *      operationId="Dados do usuário",
     *      tags={"Login"},
     *      summary="Login",
     *      description="Rota para retorno dos dados do usuário logado",
     *      security={
     *          {"bearer": {}}
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
     *                          @OA\Property(property="conteudo", ref="#/components/schemas/usuario")
     *                      },
     *                      example={
     *                          "msg": "",
     *                          "code": 200,
     *                          "conteudo": {
     *                              "id": 999999,
     *                              "id_cadastro": 99999,
     *                              "nome_usuario": "FUNCIONARIO MASTER",
     *                              "login": "99999",
     *                              "senha": "99999",
     *                              "data_criacao": "2018-08-07T15:29:15.000000Z",
     *                              "ativo": "A",
     *                              "id_funcionario": null,
     *                              "login_master": "S",
     *                              "email": "",
     *                              "data_desabilita": "1899-12-31",
     *                              "percentual_desconto_autorizado": "50.00",
     *                              "percentual_desconto_item": "50.00",
     *                              "cnpj_cpf": "07062719714",
     *                              "id_tipo_permissao_usuario": 3,
     *                              "array_permissao": "34,45,55",
     *                              "agenda": 1,
     *                              "horario_inicio": "00:00:00",
     *                              "horario_fim": "23:59:00",
     *                              "data_alteracao": "2018-08-07T15:29:15.000000Z",
     *                              "data_sincronismo": "2018-08-07 15:24:52",
     *                              "id_off": 1,
     *                              "dias_semana": "1,2,3,4,5,6,7"
     *                          }
     *                      }
     *                  )
     *              )
     *          }
     *      ),
     *      @OA\Response(
     *          response=401,
     *          description="Unauthenticated",
     *      )
     * ) 
     * @return \Illuminate\Http\JsonResponse
     */
    public function me()
    {
        return response()->json($this->send($this->guard()->user()));
    }

    /**
     * Log the user out (Invalidate the token)
     *
     * @return \Illuminate\Http\JsonResponse
     *
     * @OA\Post(
     *      path="/api/v1/logout",
     *      operationId="Logout",
     *      tags={"Login"},
     *      summary="Logout",
     *      description="Loggout do usuário e inválidacao do token JWT de acesso",
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
     *                          @OA\Property(property="message", type="string")
     *                      },
     *                      example={
     *                          "message": "Logged out realizado com sucesso"
     *                      }
     *                  )
     *              )
     *          }
     *      ),
     *      @OA\Response(
     *          response=401,
     *          description="Unauthenticated",
     *      )
     * )
     */
    public function logout()
    {
        $this->guard()->logout();

        return response()->json(['message' => 'Logged out realizado com sucesso']);
    }

    /**
     * Refresh a token.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function refresh()
    {
        try {
            return $this->respondWithToken($this->guard()->refresh());
        } catch (JWTException $th) {
            throw new ApiWebControlException("Erro ao atualizar token de acesso", CodesApi::ERROOPERACAO);
        }
    }

    /**
     * Get the token array structure.
     *
     * @param  string $token
     *
     * @return \Illuminate\Http\JsonResponse
     */
    protected function respondWithToken($token)
    {
        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer',
            'expires_in' => $this->guard()->factory()->getTTL() * 60
        ]);
    }

    /**
     * Get the guard to be used during authentication.
     *
     * @return \Illuminate\Contracts\Auth\Guard
     */
    public function guard()
    {
        return Auth::guard('api');
    }
}
