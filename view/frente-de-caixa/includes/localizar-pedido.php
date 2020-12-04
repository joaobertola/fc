
<div class="form-modal">
  <h3>Localizar Pedido</h3>
    <div class="class_busca_produto wrap">
        <div  class="select">
            <select name="localiza_pedido" id="localiza_pedido">
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
        <span class="no_pedido">No. Pedido</span>
            <span class="status"> Status</span>
            <span class="data">Data</span>
            <span class="cliente_pedido">Cliente</span>
            <span class="cpf text-center">CPF</span>
            <span class="origem text-center">Origem</span>
            <span class="vendeddor text-right">Vendedor</span>
        </div>
        <div class="scroll-lista">
            <?php for($v=0;$v<=6;$v++){ ?>
                <div class="item flex">
                  <span class="no_pedido">910438</span>
                  <span class="status">Devendo</span>
                  <span class="data">20/11/29</span>
                  <span class="cliente_pedido">Alexandre o Grande</span>
                  <span class="cpf text-center">15695855628</span>
                  <span class="origem text-center">Gênesis</span>
                  <span class="vendeddor text-right">Vaginaldo</span>
                </div>
            <?php } ?>
        </div>
    </div>

</div>
