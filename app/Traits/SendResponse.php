<?php 

namespace App\Traits;

use App\ResponseApi\ResponseApi;
use App\ResponseApi\ResponseApiDev;
use Symfony\Component\HttpFoundation\Response;

/**
 * @author Tiago Franco
 * Trait a ser utilizado pelos
 * objetos que deve montar respostas 
 * de retorno
 */
trait SendResponse
{
    protected function send($conteudo, $code = Response::HTTP_OK, $msg = "") {
        if(env('APP_ENV') == "production") {
            return new ResponseApi($conteudo, $msg, $code);
        } else {
            return new ResponseApiDev(null, $conteudo, $msg, $code);
        }
    }
}