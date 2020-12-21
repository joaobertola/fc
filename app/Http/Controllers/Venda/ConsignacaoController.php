<?php

namespace App\Http\Controllers\Venda;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Services\Vendas\ConsignacaoService;
use App\Services\Extensions\RequestBodyConverter;
use App\DTO\Vendas\Consignacao\DevolverProdutosDTO;

class ConsignacaoController extends Controller
{
    public function devolverProdutos(RequestBodyConverter $requestBodyConverter, ConsignacaoService $consignacaoService)
    {
        $devolverDTO = $requestBodyConverter->deserializer(new DevolverProdutosDTO());
        $consignacaoService->devolverProdutos($devolverDTO);    
        
        return $this->send('');
    }
}
