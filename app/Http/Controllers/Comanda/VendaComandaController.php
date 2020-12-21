<?php

namespace App\Http\Controllers\Comanda;

use App\DTO\CancelarVendaItemComandaDTO;
use App\DTO\SalvarItensVendaComandaDTO;
use App\Http\Controllers\Controller;
use App\Services\Comandas\ComandasService;
use App\Services\Comandas\MesasServices;
use App\Services\Extensions\RequestBodyConverter;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class VendaComandaController extends Controller
{
    /**
     * Função para salvar um novo item no "carrinho" em venda_itens 
     * @return Json Retorna dados do registro na tabela de venda_itens.
     */
    public function salvarMesa(RequestBodyConverter $requestBodyConverter, MesasServices $mesasServices)
    {

        $dto        = $requestBodyConverter->deserializer(new SalvarItensVendaComandaDTO());
        $vendaItens = $mesasServices->salvarItemVendaMesa($dto);
        return $this->send(['venda_item' => $vendaItens], Response::HTTP_CREATED);
    }

    /**
     * Função para salvar um novo item no "carrinho" em venda_itens 
     * @return Json Retorna dados do registro na tabela de venda_itens.
     */
    public function salvarComanda(RequestBodyConverter $requestBodyConverter, ComandasService $comandasService)
    {

        $dto = $requestBodyConverter->deserializer(new SalvarItensVendaComandaDTO());
        $vendaItens = $comandasService->salvarItemVendaComanda($dto);

        return $this->send(['venda_item' => $vendaItens], Response::HTTP_CREATED);
    }

    /**
     * Função que remove item do "carrinho" em venda_itens.
     * Verifica se o item já está em produção. Se estiver, valida a senha que o usuário digitou.
     * 
     * @return Json Retorna dados do registro na tabela de venda_itens.
     */
    public function removeItem(ComandasService $comandasService, RequestBodyConverter $requestBodyConverter) {
        $dtoCancelar = $requestBodyConverter->deserializer(new CancelarVendaItemComandaDTO());
        $comandasService->removerItemVendaComanda($dtoCancelar);

        return $this->send("Item removido com sucesso", Response::HTTP_ACCEPTED);
    }

     /**
     * Função que remove item do "carrinho" em venda_itens.
     * Verifica se o item já está em produção. Se estiver, valida a senha que o usuário digitou.
     * 
     * @param Request $request Objeto que recebe os dados do request.
     * 
     * @return Json Retorna dados do registro na tabela de venda_itens.
     */
    public function salvaTaxaComanda(RequestBodyConverter $requestBodyConverter, ComandasService $comandasService) {
    
        $dto   = $requestBodyConverter->deserializer(new SalvarItensVendaComandaDTO());
        $venda = $comandasService->salvarTaxaComanda($dto);
                                        
        return $this->send(['gorjeta'=> $venda], Response::HTTP_CREATED);
    }

    /**
     * Função que remove item do "carrinho" em venda_itens.
     * Verifica se o item já está em produção. Se estiver, valida a senha que o usuário digitou.
     * 
     * @param Request $request Objeto que recebe os dados do request.
     * 
     * @return Json Retorna dados do registro na tabela de venda_itens.
     */
    public function salvaTaxaMesa(RequestBodyConverter $requestBodyConverter, MesasServices $mesasServices) {
    
        $dto   = $requestBodyConverter->deserializer(new SalvarItensVendaComandaDTO());
        $venda = $mesasServices->salvarTaxaMesa($dto);
                                
        return $this->send(['gorjeta'=> $venda], Response::HTTP_CREATED);
    }
}
