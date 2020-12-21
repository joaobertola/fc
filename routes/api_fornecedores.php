<?php

Route::prefix('fornecedor')->group(function () {
   /**
    *  Pesquisa de fornecedores
    */

    #Route::get('combo', 'Fornecedor\\FornecedorController@combo');
    Route::post('salvar', 'Fornecedor\\FornecedorController@salvarFornecedor');
    Route::put('editar/{fornecedor}', 'Fornecedor\\FornecedorController@editarFornecedor');
});
