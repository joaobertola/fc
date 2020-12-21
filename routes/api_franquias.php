<?php

/**
 *Arquivo de Rotas do módulo interno de Franquias WEBCONTROL
 */

Route::prefix('franquias')->group(function () {
    /***
     * Cliente
     */
    Route::prefix('clientes')->group(function () {
        Route::get('', 'Cliente\\ClienteController@index');
        Route::get('{cliente}', 'Cliente\\ClienteController@pesquisar');
        Route::post('cadastrar', 'Franquias\\ClienteController@cadastrar');
    });
});
