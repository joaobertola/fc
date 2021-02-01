<?php $url = ENDERECO . '/view/produto/includes/';?>
<div class="content">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h2 class="card-title">Cadastrar Produto</h2>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="<?=ENDERECO?>">Home</a></li>
                        <li class="breadcrumb-item active">Cadastro de Produto</li>
                        <li class="breadcrumb-item active"><a href="<?=ENDERECO?>/produto/listar">Lista de Produto</a></li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>
    <div class="card" data-url="<?= ENDERECO . '/api/produto_api.php?op=' . md5('cadastraProdutoCompleto'); ?>">
        <div class="card-body">
            <div class="col-sm-12 m-left">
                <div class="tabs">
                    <button class="btn_tabs active" data-id="tab_1">Dados do produto</button>
                    <button class="btn_tabs" data-id="tab_2">Valores do produto</button>
                    <button class="btn_tabs" data-id="tab_3">Informações fiscais</button>
                    <button class="btn_tabs" data-id="tab_4">Frete</button>
                    <button class="btn_tabs" data-id="tab_5">Informações nutricionais</button>
                    <button class="btn_tabs" data-id="tab_6">Informações para a loja</button>
                    <button class="btn_tabs" data-id="tab_7">Grade</button>
                </div>
                <form id="CadastoProdutoCompleto" action="" class="formstyle" method="post" encType="multipart/form-data">
                    <div id="tab_1" class="opc_tabs active">
                        <?php include "./view/produto/includes/dados-do-produto.php";?>
                    </div>
                    <div id="tab_2" class="opc_tabs">
                        <?php include "./view/produto/includes/valores-do-produto.php";?>
                    </div>
                    <div id="tab_3" class="opc_tabs">
                        <?php include "./view/produto/includes/informacoes-fiscais.php";?>
                    </div>
                    <div id="tab_4" class="opc_tabs">
                        <?php include "./view/produto/includes/informacoes-do-frete.php";?>
                    </div>
                    <div id="tab_5" class="opc_tabs">
                        <?php include "./view/produto/includes/informacoes-nutricionais.php";?>
                    </div>
                    <div id="tab_6" class="opc_tabs">
                        <?php include "./view/produto/includes/informacoes-para-loja.php";?>
                    </div>
                    <div id="tab_7" class="opc_tabs">
                        <?php include "./view/produto/includes/grade.php";?>
                    </div>
                    <div>
                        <button class="submit">Cadastrar Produto</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
