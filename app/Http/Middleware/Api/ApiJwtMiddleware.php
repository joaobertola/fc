<?php

namespace App\Http\Middleware\Api;

use Closure;
use App\Traits\SendResponse;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Tymon\JWTAuth\Facades\JWTAuth;
use Tymon\JWTAuth\Http\Middleware\BaseMiddleware;

class ApiJwtMiddleware extends BaseMiddleware
{
    use SendResponse;
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        try {
            $user = JWTAuth::parseToken()->authenticate();
        } catch (\Exception $e) {
            if ($e instanceof \Tymon\JWTAuth\Exceptions\TokenInvalidException) {
                return response()->json($this->send("token-error", Response::HTTP_UNAUTHORIZED, 'Token invalido'));
            } else if ($e instanceof \Tymon\JWTAuth\Exceptions\TokenExpiredException) {
                return response()->json($this->send("token-expirado", Response::HTTP_UNAUTHORIZED, 'Token expirado'));
            } else {
                return response()->json($this->send("token-error", Response::HTTP_UNAUTHORIZED, 'Token Authorization no encontrado'));
            }
        }
        return $next($request);
    }
}
