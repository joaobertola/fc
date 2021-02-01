<div class="content">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h2 class="card-title">Listagem dos Produtos</h2>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="<?=ENDERECO?>">Home</a></li>
                        <li class="breadcrumb-item active"><a href="<?=ENDERECO?>/produto/cadastrar">Cadastro de Produto</a></li>
                        <li class="breadcrumb-item active">Lista de Produto</li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>

    <div class="card">
        <div class="card-body">
            <div class="col-sm-12">
                <h4 class="title">Lista de produtos</h4>

                <table class="ListaGrade table table-striped display" style="width:100%">
                <thead>
                    <tr>
                        <th>Nome do Produto</th>
                        <th>Código de barras</th>
                        <th>Qtde. Estoque</th>
                        <th>Classificação</th>
                        <th>Valor Custo</th>
                        <th>Valor Valor venda</th>
                        <th>Fabricante</th>
                        <th>Opções</th>
                    </tr>
                </thead>
                <tbody >
                    <?php for($looooop=0;$looooop<=10;$looooop++){ ?>
                        <tr>
                            <td>Banana verde</td>
                            <td>289435</td>
                            <td>5</td>
                            <td>Suco</td>
                            <td>R$ 12,50</td>
                            <td>R$ 10,50</td>
                            <td>Banana Boat</td>
                            <td>
                                <div class="flex items-actions">
                                    <i class="fas fa-search " title="Editar Grade"></i>
                                    <i class="fas fa-times" title="Excluir Grade"></i>
                                </div>
                            </td>
                        </tr>
                    <?php } ?>
                </tbody> 
            </table> 
        </div>
    </div>
</div>