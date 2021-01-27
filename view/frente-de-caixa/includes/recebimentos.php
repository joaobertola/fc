
<div class="form-modal">
  <h3>Recebimentos</h3>
    <div class="class_busca_produto wrap">
        <div  class="select">
            <select name="localiza_pedido" id="localiza_pedido">
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
            <span class="no_pedido">N°. Doc</span>
            <span class="nome"> Nome</span>
            <span class="data">Vencimento</span>
            <span class="text-center">Valor</span>
            <span class="text-center">Parcela</span>
            <span class="text-center">V. Pago</span>
            <span class="text-center">data. Pagamento</span>
            <span class="">Baixar</span>
        </div>
        <div class="scroll-lista">
            <?php for($v=0;$v<=6;$v++){ ?>
                <div class="item flex">
                  <span class="no_pedido">245136</span>
                  <span class="nome"> Nome do pedido</span>
                  <span class="data">Vencimento</span>
                  <span class="text-center">102,12</span>
                  <span class="text-center">Á vista</span>
                  <span class="text-center">102,12</span>
                  <span class="text-center">12/12/12</span>
                  <span class=""></span>
                </div>
            <?php } ?>
        </div>
    </div>
</div>
