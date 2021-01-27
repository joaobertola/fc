<?php

/**
 *Arquivo de Rotas de Sincronismo com o WEBCONTROL LITE
 */

Route::prefix('lite')->group(function () {
    /**
     * Contador de Tabelas a serem Sincronizadas
     */
    Route::post('verifica-tabelas', 'Lite\\LiteController@verificaTabelas');
    /**
     * Verifica as vendas de determinado caixa que estão na situação solicitada
     */
    Route::prefix('fechamento-caixa')->group(function () {
        Route::get('{idCaixa}/{situacaoVendas?}', 'Lite\\LiteController@consultaCaixa');
    });
});
