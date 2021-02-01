
<div class="form-modal">
  <h3>Localizar Pedido</h3>
    <div class="class_busca_produto flex formstyle">
        <div class="select w-30">
            <select name="localiza_pedido" id="localiza_pedido" class="form-control select2">
                <option value="pedido">N° Pedido</option>
                <option value="data">Data</option>
                <option value="nome">Nome</option>
                <option value="ass_tecnica">N° Assistência técnica</option>
                <option value="mesa">Mesa</option>
                <option value="cpf">CPF</option>
                <option value="comanda">Comanda</option>
                <option value="vinculada">Vínculada à</option>
            </select>
        </div>
            <input id="input-localizar-pedido" type="text" placeholder="" class="input-search">
            <button id="btn-loc-pedido-produto" class="btn-search"><i class="fas fa-search"></i></button>
        </div>

        <div class="lista_users">
        <div class="header-lista vendedor flex">
            <span class="w-10 mobi-none no_pedido">No. Pedido</span>
            <span class="w-10 status"> Status</span>
            <span class="w-10 data">Data</span>
            <span class="w-20 cliente_pedido">Cliente</span>
            <span class="w-20 mobi-none cpf">CPF</span>
            <span class="w-10 mobi-none origem">Origem</span>
            <span class="w-20 mobi-none vendedor">Vendedor</span>
        </div>
        <div class="scroll-lista" data-clone-name="listaPedidos">
            <?php for($v=0;$v<=6;$v++){ ?>
                <div id="listaPedidos<?=$v;?>" data-id="<?=$v;?>" class="item item-clone three flex">
                  <span class="w-10 clone mobi-none no_pedido">910438</span>
                  <span class="w-10 status">Devendo</span>
                  <span class="w-10 data">20/11/29</span>
                  <span class="w-20 cliente_pedido">Alexandre o Grande</span>
                  <span class="w-20 clone mobi-none cpf">15695855628</span>
                  <span class="w-10 clone mobi-none origem">Gênesis</span>
                  <span class="w-20 clone mobi-none vendedor">Osvaldo Pereira</span>
                </div>
            <?php } ?>
        </div>
    </div>

</div>
