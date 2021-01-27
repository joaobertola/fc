<?php

// ROTAS DA COMANDA
Route::prefix('produtos')->group(function () {

    Route::get('{produto}', 'Produto\\ProdutoController@getProduto');
    Route::get('kit-combos/{termoPesquisa}', 'Produto\\ProdutoController@pesquisaProdutoKitCombo');
    Route::get('pesquisa-detalhada/{termoPesquisa}', 'Produto\\ProdutoController@pesquisaDetalhada');
    Route::post('pesquisa-por-nome', 'Produto\\ProdutoController@pesquisaPeloNome');
    Route::post('pesquisa-pela-classificacao/{classificacao}', 'Produto\\ProdutoController@pesquisaPelaClassificacao');
    Route::post('pesquisa-por-id-interna/{idInterna}', 'Produto\\ProdutoController@pesquisaPelaIdInterna');
    
    Route::get('codigo-barra/buscar-novo', 'Produto\\ProdutoController@gerarValidarCodigoBarras');

    //cadastros
    Route::post('cadastro-rapido', 'Produto\\SalvarEditarProdutoController@incluirProdutoRapido');
    Route::post('cadastro-completo', 'Produto\\SalvarEditarProdutoController@incluirProdutoCompleto');
    
    /***
     * Edicoes 
     */
    Route::prefix('atualizar')->group(function () {
        Route::post('completo/{produto}', 'Produto\\SalvarEditarProdutoController@editarProdutoCompleto');
        Route::post('demais-informacoes/{produto}', 'Produto\\ProdutoController@salvarDemaisInformacoes');
        Route::post('info-nutricionais/{produto}',  'Produto\\ProdutoController@salvarInformacoesNutricionais');
        Route::post('info-fretes/{produto}',        'Produto\\ProdutoController@salvarValoresFrete');
        Route::post('info-fiscais/{produto}',        'Produto\\ProdutoController@salvarInformacoesFiscais');
    });

    /***
     * Classificações 
     */
    Route::prefix('categorias')->group(function () {
        Route::get('listar',     'Produto\\CategoriasProdutosController@categorias');
        Route::get('{idCategoria}', 'Produto\\CategoriasProdutosController@categoria');
    });

    /***
     * Grades 
     */
    Route::prefix('grades')->group(function () {
        Route::get('{produto}/all', 'Grade\\GradeController@gradesProduto');
        Route::post('{produto}/salvar', 'Grade\\GradeController@salvarGrade');
        Route::put('{grade}/editar', 'Grade\\GradeController@editarGrade');
        Route::delete('{grade}/excluir', 'Grade\\GradeController@excluirGrade');

        //Fotos da grade
        Route::post('{grade}/vincular-img', 'Grade\\GradeController@vincularImagemGrade');
        Route::post('{gradeFoto}/excluir-img', 'Grade\\GradeController@excluirImagemGrade');

        Route::get('/atributos/preenchidos', 'Grade\\GradeController@getAtributosPreenchido');
        Route::get('/atributos/{gradeAtributo}/valores-atributo', 'Grade\\GradeController@getValoresDoAtributo');

    });
});
