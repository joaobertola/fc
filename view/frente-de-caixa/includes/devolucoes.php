<div class="form-modal">
  <h3>Devoluções</h3>

    <div class="tabs">
      <button class="btn_tabs active" data-id="1"><i class="far fa-dolly"></i> Devoluções por Pedido</button>
      <button class="btn_tabs" data-id="2"><i class="fas fa-box-open"></i> Devoluções por Produto</button>
    </div>

    <div class="tabs-info">
      <div id="opc-tab_1" class="opc_tabs active">
      <div class="lista_users">
          <div class="header-lista vendedor flex">
              <span class="cod">Código</span>
              <span class="cliente">Cliente</span>
              <span class="data_compra">Data compra</span>
              <span class="pagamento">Forma pagamento</span>
              <span class="acao text-center">Ação</span>
          </div>
          <div class="scroll-lista">
            <?php for($v=0;$v<=2;$v++){ ?>
                <div class="item wrap" >
                  <span class="cod">54132</span>
                  <span class="cliente">nome do cliente</span>
                  <span class="data_compra">07/07/07</span>
                  <span class="v_unit">Xerecard</span>
                  <span  data-id="<?=$v;?>" class="devolver" onclick="toggleFunction(this);">Devolver </span>
                  <div id="edit_<?=$v;?>" class="itens-edit">
                  <!-- item da lista  -->
                    <div class="header-lista vendedor flex">
                      <span class="cod">Código</span>
                      <span class="cliente">Produto</span>
                      <span class="data_compra text-center">Quantidade</span>
                      <span class="v_unit text-center">V. Unit</span>
                      <span class="v_total text-center">V. Total</span>
                      <span class="">Devolver</span>
                    </div>
                    <?php for($p=0;$p<=2;$p++){ ?>
                      <div class="item flex" >
                      <span class="cod">145286</span>
                        <span class="">Um produto legal</span>
                        <span class="text-center">9</span>
                        <span class="text-center">18,85</span>
                        <span class="text-center">36,85</span>
                        <span class="flex"><input class="item_devolvido">
                        <button class="btn-devolver"><p>&times;</p></button>
                        </span>
                      </div>
                    <?php } ?> 
                  </div>
                </div>
            <?php } ?>
          </div>
        </div>
        <div class="devolucao">
          <h3>Itens devolvido</h3>
          <div class="lista_users">
            <div class="header-lista vendedor flex">
              <span class="cod">Código</span>
              <span class="cliente">Produto</span>
              <span class="data_compra text-center">Quantidade</span>
              <span class="v_unit text-center">V. Unit</span>
              <span class="v_total text-center">V. Total</span>
              <span class="text-center">Devolvido</span>
            </div>
            <div class="scroll-lista">
                <?php for($pa=0;$pa<=2;$pa++){ ?>
                  <div class="item flex" >
                  <span class="cod">145286</span>
                    <span class="">Um produto legal</span>
                    <span class="text-center">9</span>
                    <span class="text-center">18,85</span>
                    <span class="text-center">36,85</span>
                    <span class="text-center">9</span>
                  </div>
                <?php } ?>
              </div> 
            </div> 
        </div>
        <button class="btn cancel">Confirmar</button>
      </div>

      <div id="opc-tab_2" class="opc_tabs">
       <input id="tab-devolucao-produto" type="text" placeholder="Nome produto / Código de barras" class="input-search">
        <button id="selecionar-cliente" class="btn-search"><i class="fas fa-search"></i></button>
      </div>

      <div class="lista_users">
        <div class="header-lista vendedor flex">
          <span class="cod">Código de barras</span>
          <span class="descrticao">Descrição</span>
          <span class="v_unit text-center">Valor</span>
          <span class="text-center">Quantidade</span>
          <span class="text-center">Ação</span>
        </div>
        <div class="scroll-lista">
            <?php for($pa=0;$pa<=2;$pa++){ ?>
              <div class="item flex" >
              <span class="cod">145286</span>
                <span class="">Um produto legal</span>
                <span class="text-center">15,23</span>
                <span class="text-center"><input type="text" class="qtde-devolucao"></span>
                <span class="flex text-center">
                 <button class="btn-devolver"><p>&times;</p></button>
                </span>
              </div>
            <?php } ?>
          </div> 
        </div> 
    </div>           

    </div>
</div>
