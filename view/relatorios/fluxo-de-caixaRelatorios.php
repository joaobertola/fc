<div class="content">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h2 class="card-title">Fluxo de Caixa</h2>
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
        <div class="card-body padding-20">
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
                    <span class="w-50"><strong>Total das Vendas Realizadas (QUITADAS):</strong></span>
                    <span class="w-50">	R$ 0,00</span>
                </div>
                <div class="w-100 flex">
                    <span class="w-50"><strong>Total das Vendas Realizadas (EM ABERTO):</strong></span>
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
                    <span class="w-50"><strong>Custo Total:</strong></span>
                    <span class="w-50">	R$ 0,00</span>
                </div>
                <div class="w-100 flex">
                    <span class="w-50"><strong>Total do Lucro Sobre as Vendas:</strong></span>
                    <span class="w-50">	R$ 0,00</span>
                </div>
                <div class="w-100 flex">
                    <span class="w-50"><strong>Total de adiantamento(s) Encontrados(s):</strong></span>
                    <span class="w-50">	R$ 0,00</span>
                </div>
            </div>

            <h4 class="title">Contas Pagas</h4>
            <div class="MyTable wrap">
                <?php for($lp=0;$lp<=2;$lp++){?>
                    <div class="w-100 flex">
                        <span class="w-50"><strong>Cartão de Crédito MasterCard</strong></span>
                        <span class="w-50">	R$ 1<?=$lp;?>0,90</span>
                    </div>
                <?php } ?>
            </div>

            <h4 class="title">Contas à Pagar</h4>
            <div class="MyTable wrap">
                <div class="w-100 flex">
                    <span class="w-50"><strong>Cartão de Crédito MasterCard</strong></span>
                    <span class="w-50">	R$ 1250,00</span>
                </div>
            </div>

            <h4 class="title">Contas Recebidas</h4>
            <div class="MyTable wrap">
                <?php for($lp1=0;$lp1<=2;$lp1++){?>
                    <div class="w-100 flex">
                        <span class="w-50"><strong>Cartão de Crédito MasterCard</strong></span>
                        <span class="w-50">	R$ 1.001,00</span>
                    </div>
                <?php } ?>
                <div class="w-100 flex">
                    <span class="w-50 text-right"><strong>Sub-Total</strong></span>
                    <span class="w-50 valor">	R$ 3.003,00</span>
                </div>
            </div>

            <h4 class="title">Contas à Receber</h4>
            <div class="MyTable wrap">
                <?php for($lp1=0;$lp1<=2;$lp1++){?>
                    <div class="w-100 flex">
                        <span class="w-50"><strong>Cartão de Crédito MasterCard</strong></span>
                        <span class="w-50">	R$ 1.001,00</span>
                    </div>
                <?php } ?>
                <div class="w-100 flex">
                    <span class="w-50 text-right"><strong>Sub-Total</strong></span>
                    <span class="w-50 valor">	R$ 3.003,00</span>
                </div>
            </div>

            <h4 class="title"><i class="fas fa-dollar-sign"></i> Lucro</h4>
            <div class="MyTable lucro wrap">
                <div class="w-100 flex">
                    <span class="w-50"><strong>Vendas Realizadas (QUITADAS)</strong></span>
                    <span class="w-50">R$ 1.900,22</span>
                </div>
                <div class="w-100 flex">
                    <span class="w-50"><strong>Vendas Realizadas (EM ABERTO)</strong></span>
                    <span class="w-50">	R$ 1.520,00</span>
                </div>
                <div class="w-100 flex">
                    <span class="w-50"><strong>Nota de Crédito</strong></span>
                    <span class="w-50">	R$ 0,00</span>
                </div>
                <div class="w-100 flex">
                    <span class="w-50"><strong>Contas Pagas</strong></span>
                    <span class="w-50">	R$ 0,00</span>
                </div>
                <div class="w-100 flex">
                    <span class="w-50"><strong>Contas Recebidas</strong></span>
                    <span class="w-50">	R$ 820,00</span>
                </div>
                <div class="w-100 flex">
                    <span class="w-50"><strong>Lucro Total:</strong></span>
                    <span class="w-50 valor"><h4><strong>R$ 20.450,00</strong></h4></span>
                </div>
                <div class="w-100 flex">
                    <span class="w-50"><strong>Lucro Real:</strong></span>
                    <span class="w-50 valor"><h4><strong>R$ 20.450,00</strong></h4></span>
                </div>
            </div> 
            <div class="alert alert-warning" role="alert">
                Obs: Não faz parte do lucro as vendas realizadas com pagamentos em aberto.
            </div>
        </div>
    </div>
</div>