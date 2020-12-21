<?php


// ROTAS DA COMANDA
Route::prefix('comanda')->group(function () {
    /**
     * Anotações
     */
    Route::prefix('anotacoes')->group(function () {
        Route::post('{itemVenda}', 'Comanda\\ComandaController@salvaAnotacao');
    });

    /**
     * Produtos
     */
    Route::prefix('produtos')->group(function () {
        Route::post('', 'Comanda\\ComandaController@pesquisaProdutoComanda');
    });
    /**
     * Mesas
     */
    Route::prefix('mesa')->group(function () {

        Route::prefix('qtd')->group(function () {
            Route::put('{cmMesa}/{numeroPessoas}',  'Comanda\\MesaController@atualizaQuantidadePessoa');
        });

        Route::get('',  'Comanda\\MesaController@list');
        Route::get('{cmMesa}', 'Comanda\\MesaController@get');
        Route::post('{numeroMesa}', 'Comanda\\MesaController@save');
        Route::put('{cmMesa}', 'Comanda\\MesaController@update');
        Route::delete('{cmMesa}', 'Comanda\\MesaController@delete');
    });

    /**
     * Produção 
     */
    Route::prefix('producao')->group(function () {
        Route::post('envia-producao', 'Comanda\\ProducaoController@enviaProducao');
    });

    /**
     * Vendas refente a comanda 
     */
    Route::prefix('venda')->group(function () {

        Route::prefix('taxa')->group(function () {
            Route::post('comandas',  'Comanda\\VendaComandaController@salvaTaxaComanda');
            Route::post('mesas',  'Comanda\\VendaComandaController@salvaTaxaMesa');
        });

        Route::prefix('itens')->group(function () {

            Route::post('salvar-mesa',  'Comanda\\VendaComandaController@salvarMesa');
            Route::post('salvar-comanda',  'Comanda\\VendaComandaController@salvarComanda');
            Route::delete('', 'Comanda\\VendaComandaController@removeItem');
        });

    });

    Route::prefix('dados')->group(function () {
        Route::post('', 'Comanda\\ComandaController@vincularCliente');
    });

    /**
     * Comandas
     */
    Route::get('', 'Comanda\\ComandaController@list');
    Route::get('{numeroComanda}', 'Comanda\\ComandaController@getComanda');
    Route::post('{numeroComanda}', 'Comanda\\ComandaController@saveComanda');
    Route::put('{cmComanda}', 'Comanda\\ComandaController@update');
    Route::delete('{cmComanda}', 'Comanda\\ComandaController@delete');
    
    Route::prefix('qtd')->group(function () {
        Route::put('{numeroComanda}/{numeroPessoas}',  'Comanda\\ComandaController@atualizaQuantidadePessoa');
    });
});