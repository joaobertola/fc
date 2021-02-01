<div class="content">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h2 class="card-title">Relatórios de vendas</h2>
                </div>
                <div class="col-sm-6">
                    <div class="wrap">
                        <form action="" class="form-modal Filtro-data">
                            <div class="grid grid-3 gap-5">
                                <label>
                                    <p>Período de:</p>
                                    <input type="date">
                                </label>
                                <label>
                                    <p>Até:</p>
                                    <input type="date">
                                </label> 
                                <button type="submit" class="submit">Filtrar</button>                    
                            </div>
                           
                        </form>
                    </div>
                </div>
                
            </div>
        </div><!-- /.container-fluid -->
    </section>
    <div class="card">
        <div class="card-body">
        <div class="col-sm-12 m-left">
            <form action="" class="formstyle Filtros">
                <div class="grid grid-2 gap-10 self-end w-100">
                    <label>
                        <p>Pedido/Venda:</p>
                        <input type="text" placeholder="Código do Pedido (ID WEb / ID Off)">
                    </label>
                    <label>
                        <p>Cliente:</p>
                        <input type="text" placeholder="Nome ou CPF/CNPJ do cliente">
                    </label>
                    <label>
                        <p>Produto:</p>
                        <input type="text" placeholder="Código de barras ou nome do produto">
                    </label>
                    <label>
                        <p>Vendedor:</p>
                        <div class="select">
                            <select class="form-control select2">
                                <option>Vendedor 1</option>
                                <option>Vendedor 2</option>
                                <option>Vendedor 3</option>
                                <option>Vendedor 4</option>
                            </select>
                        </div>
                    </label>
                    <button type="submit" class="submit">Buscar</button>
                </div>
               
            </form>
        </div>
        <h4 class="title">Vendas Realizadas</h4>
            <div class="MyTable wrap">
                <div class="w-100 flex">
                    <span class="w-50"><strong>Total de Pedido(s) Encontrados(s):</strong></span>
                    <span class="w-50">0</span>
                </div>
                <div class="w-100 flex">
                    <span class="w-50"><strong>Total de Itens:</strong></span>
                    <span class="w-50">0</span>
                </div>
                <div class="w-100 flex">
                    <span class="w-50"><strong>Total das Vendas Realizadas(Bruto):</strong></span>
                    <span class="w-50">	R$ 0,00</span>
                </div>
                <div class="w-100 flex">
                    <span class="w-50"><strong>Total de Descontos Concedidos:</strong></span>
                    <span class="w-50">	R$ 0,00</span>
                </div>
                <div class="w-100 flex">
                    <span class="w-50"><strong>Nota de Crédito:</strong></span>
                    <span class="w-50">	R$ 0,00</span>
                </div>
                <div class="w-100 flex">
                    <span class="w-50"><strong>Valor Líquido:</strong></span>
                    <span class="w-50">	R$ 0,00</span>
                </div>
                <div class="w-100 flex">
                    <span class="w-50"><strong>Custo Total:</strong></span>
                    <span class="w-50">	R$ 0,00</span>
                </div>
                <div class="w-100 flex">
                    <span class="w-50"><strong>Total do Lucro Sobre As Vendas:</strong></span>
                    <span class="w-50">	R$ 0,00</span>
                </div>
            </div>
            <table class="Tabelas table table-striped display" style="width:100%">
                <thead>
                    <tr>
                        <th>Data e Hora</th>
                        <th>No. Pedido</th>
                        <th>Origem da Venda</th>
                        <th>Cliente</th>
                        <th>Qtde. Itens</th>
                        <th>Vlr. Bruto</th>
                        <th>Desconto</th>
                        <th>Vlr. Líquido</th>
                        <th>Custo</th>
                        <th>Lucro</th>
                        <th>Pagamento</th>
                        <th>Visualizar NFC</th>
                        <th>Visualizar NFE</th>
                        <th>Visualizar NFS</th>
                        <th>Visualizar CFE</th>
                        <th>Cancelar Venda</th>
                    </tr>
                </thead>
                <tbody>
                    <?php for($looooop=0;$looooop<=10;$looooop++){ ?>
                        <tr>
                            <td><p>22/12/2020</p> <p>09:51:25</p></td>
                            <td><a href="" target="_blank" class="flex align-center">68084888<i class="fas fa-search"></i></a></td>
                            <td>Web</td>
                            <td>CLIENTE BALCAO</td>
                            <td>11.000</td>
                            <td>R$ 275,71</td>
                            <td>R$ 0,00	</td>
                            <td>R$ 275.71</td>
                            <td>R$ 212,10</td>
                            <td>R$ 63,61</td>
                            <td>R$ 350.00 DINHEIRO <p class="troco">Troco: R$ 74,29</p></td>
                            <td>NÃO SOLICITADA</td>
                            <td>NÃO SOLICITADA</td>
                            <td>NÃO SOLICITADA</td>
                            <td>NÃO SOLICITADA</td>
                            <td><i class="fas fa-times"></i></td>
                        </tr>
                    <?php } ?>
                </tbody> 
            </table> 
        </div>
    </div>
</div>