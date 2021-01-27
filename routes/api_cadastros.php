<?php 

Route::group(['middleware' => ['jwt.verify'], 'prefix' => 'v1/cadastro'], function(){
    
    Route::get('config-frente-caixas', 'Cadastro\\CadastroController@getConfigFrenteCaixaCadastro')->name("config-frente-caixas");
});