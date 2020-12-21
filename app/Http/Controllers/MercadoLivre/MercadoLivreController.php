<?php

namespace App\Http\Controllers\MercadoLivre;

use App\Jobs\RabbitMQJob;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\DTO\SincronizarMercadoLivreDTO;
use App\Services\Extensions\RequestBodyConverter;
use App\Exceptions\MercadoLivre\MercadoLivreException;
use App\Services\MercadoLivre\ManterMercadoLivreService;
use App\Repository\Contracts\Model\Produto\ProdutoRepositoryInterface;

class MercadoLivreController extends Controller
{
    public function sincronizar(RequestBodyConverter $requestBodyConverter, ManterMercadoLivreService $manterMercadoLivreService)
    {
        $synMeLiDTO = $requestBodyConverter->deserializer(new SincronizarMercadoLivreDTO());

        try {
            return $this->send(
                [
                    "produto" => $manterMercadoLivreService->syncronizeMeLivre($synMeLiDTO), 
                    "retorno" => []
                ]
            );
        } catch (MercadoLivreException $th) {
            return $this->send(
                    ["produto" => $th->getDescricaoProduto(), "retorno" => $th->getRetorno()], 
                    $th->getHttpCode(),
                    $th->getMsgErro()
            );
        }
    }

    public function getProdutosASincrolizar(ProdutoRepositoryInterface $produtoRepository)
    {

        return $this->send($produtoRepository->getProdutosSincronizar());
    }

    public function receberNotificacoesMeLivre(Request $request)
    {
        $notificacao = json_decode($request->getContent());

        RabbitMQJob::dispatch(['job' => 'App\Jobs\NotificacoesMercadoLivreJob', 'data' => $notificacao, 'queue' => 'notificacoes_meli', 'connection' => 'rabbitmq'])->onConnection("rabbitmq")->onQueue('geral');

        return "Ok";
    }
}
