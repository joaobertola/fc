<?php 

Route::prefix('vendas')->group(function () {
    Route::post('finalizar-venda', 'Venda\\VendaController@finalizarVenda');    

    Route::get('{venda}', 'Venda\\VendaController@getVenda'); 
    
    
    /***
     * Consignadas 
     */
    Route::prefix('consignadas')->group(function () {
        Route::put('devolver-produtos', 'Venda\\ConsignacaoController@devolverProdutos');
    });
});
 
