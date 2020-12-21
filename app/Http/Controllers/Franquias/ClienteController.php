<?php

namespace App\Http\Controllers\Franquias;

use App\DTO\Franquias\ClienteDTO;
use App\Http\Controllers\Controller;
use Symfony\Component\HttpFoundation\Response;
use App\Services\Extensions\RequestBodyConverter;
use App\Services\Repository\Contracts\Model\Franquias\ClienteRepositoryServiceInterface;

class ClienteController extends Controller
{
    public function cadastrar(RequestBodyConverter $requestBodyConverter, ClienteRepositoryServiceInterface $clienteRepositoryService)
    {
        $clienteDTO = $requestBodyConverter->deserializer(new ClienteDTO());
        $cliente    = $clienteRepositoryService->salvarClientes($clienteDTO);

        return $this->send($cliente, Response::HTTP_CREATED);
    }
}
