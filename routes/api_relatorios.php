<?php

// ROTAS DA COMANDA
Route::prefix('relatorios')->group(function () {

    Route::post('clientes', 'Cliente\\RelatorioClienteController@pesquisaRelatorioClientes');
    
});