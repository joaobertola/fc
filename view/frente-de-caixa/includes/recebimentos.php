
<div class="form-modal">
  <h3>Recebimentos</h3>
    <div class="class_busca_produto formstyle flex">
        <div class="w-30 select">
            <select name="localiza_pedido" id="localiza_pedido" class="form-control select2">
                <option value="boletos">Boletos</option>
                <option value="drediario">Crediário</option>
                <option value="parcelar_debitos">Parcelar débitos</option>
                <option value="carne">Carnê</option>
                <option value="nota-promissoria">Nota promissória</option>
                <option value="recebimento_avulso">Recebimento avulso</option>
                <option value="">Comanda</option>
                <option value="">Vínculada à</option>
            </select>
        </div>
            <input id="input-localizar-pedido" type="text" placeholder="" class="input-search">
            <button id="btn-loc-pedido-produto" class="btn-search"><i class="fas fa-search"></i></button>
        </div>

        <div class="lista_users">
            <div class="header-lista vendedor flex">
                <span class="w-100 no_pedido">N°. Doc</span>
                <span class="w-100 nome"> Nome</span>
                <span class="w-100 data mobi-none">Vencimento</span>
                <span class="w-100 text-center valor mobi-none">Valor</span>
                <span class="w-100 text-center forma_pag mobi-none">Parcela</span>
                <span class="w-100 text-center v_pago">V. Pago</span>
                <span class="w-100 text-center data_pagamento mobi-none">data. Pagamento</span>
            </div>
            <div class="scroll-lista" data-clone-name="recebimentos">
                <?php for($v=0;$v<=615;$v++){ ?>
                    <div id="recebimentos<?=$v;?>" data-id="<?=$v;?>" class="item item-clone three flex">
                        <span class="w-100 no_pedido">245136</span>
                        <span class="w-100 nome"> Nome do pedido</span>
                        <span class="w-100 clone  mobi-none data">12/12/21</span>
                        <span class="w-100 clone  mobi-none text-center valor">102,12</span>
                        <span class="w-100 clone  mobi-none text-center forma_pag">Á vista</span>
                        <span class="w-100 text-center v_pago">102,12</span>
                        <span class="w-100 clone  mobi-none text-center data_pagamento">12/12/12</span>
                    </div>
                <?php } ?>
            </div>
        </div>
</div>
