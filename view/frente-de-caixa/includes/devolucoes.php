<div class="form-modal">

    <div class="tabs">
      <button class="btn_tabs active" data-id="1"><i class="far fa-dolly"></i> Devoluções por Pedido</button>
      <button class="btn_tabs" data-id="2"><i class="fas fa-box-open"></i> Devoluções por Produto</button>
    </div>

    <div class="tabs-info">
      <div id="opc-tab_1" class="opc_tabs active">
        <h3>Devolução por pedido</h3>
        <div class="class_busca_produto formstyle flex">
          <input id="tab-devolucao-pedido" type="text" placeholder="Código do pedido / Cliente" class="input-search">
          <button id="selecionar-pedido" class="btn-search"><i class="fas fa-search"></i></button>
        </div>
        <div class="lista_users">
            <div class="header-lista vendedor flex">
                <span class="w-100 cod">Código</span>
                <span class="w-100 cliente">Cliente</span>
                <span class="w-100 mobi-none data_compra">Data compra</span>
                <span class="w-100 mobi-none pagamento">Forma pagamento</span>
                <span class="w-100 acao text-center">Ação</span>
            </div>
            <div class="scroll-lista" data-clone-name="pedido">
              <?php for($v=0;$v<=2;$v++){ ?>
                  <div id="pedido<?=$v;?>" data-id="<?=$v;?>" class="item three wrap" >
                    <span class="w-20 cod">54132</span>
                    <span class="w-20 clone cliente">nome do cliente</span>
                    <span class="w-20 clone mobi-none data_compra">07/07/07</span>
                    <span class="w-20 clone mobi-none forma_pag">Débito</span>
                    <span  data-id="<?=$v;?>" class="w-20 devolver" onclick="toggleFunction(this);">Devolver </span>
                    <div id="edit_<?=$v;?>" class="itens-edit">
                    <!-- item da lista  -->
                      <div class="header-lista vendedor flex">
                        <span class="w-100 cod mobi-none">Código</span>
                        <span class="w-100 cliente">Produto</span>
                        <span class="w-100 data_compra text-center">Quantidade</span>
                        <span class="w-100 v_unit mobi-none text-center">V. Unit</span>
                        <span class="w-100 v_total mobi-none text-center">V. Total</span>
                        <span class="w-100">Devolver</span>
                      </div>
                      <?php for($p=0;$p<=2;$p++){ ?>
                        <div class="item flex" >
                          <span class="w-100 cod mobi-none">145286</span>
                          <span class="w-100">Um produto legal</span>
                          <span class="w-100 text-center">9</span>
                          <span class="w-100 mobi-none text-center">18,85</span>
                          <span class="w-100 mobi-none text-center">36,85</span>
                          <span class="w-100 flex">
                            <input class="item_devolvido">
                            <button class="btn-devolver"><p>&times;</p> </button>
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
                <span class="w-100 cod">Código</span>
                <span class="w-100 descricao">Produto</span>
                <span class="w-100 mobi-none qtde text-center">Quantidade</span>
                <span class="w-100 mobi-none v_unit text-center">V. Unit</span>
                <span class="w-100 mobi-none v_total text-center">V. Total</span>
                <span class="w-100 retorno text-center">Devolvido</span>
              </div>
              <div class="scroll-lista" data-clone-name="devolvidos">
                  <?php for($pa=1;$pa<=3;$pa++){ ?>
                    <div id="devolvidos<?=$pa;?>" data-id="<?=$pa;?>" class="item item-clone three flex">
                      <span class="w-100 cod">145286</span>
                      <span class="w-100 descricao">Um produto legal</span>
                      <span class="w-100 clone mobi-none qtde text-center">9</span>
                      <span class="w-100 clone mobi-none v_unit text-center">18,85</span>
                      <span class="w-100 clone mobi-none v_total text-center">36,85</span>
                      <span class="w-100 retorno text-center">9</span>
                    </div>
                  <?php } ?>
                </div> 
              </div> 
          </div>
          <button class="btn submit">Confirmar</button>
        </div>
      </div>

      <div id="opc-tab_2" class="opc_tabs">
        <h3>Devolução por produto</h3>
        <div class="class_busca_produto formstyle flex">
          <input id="tab-devolucao-produto" type="text" placeholder="Nome produto / Código de barras" class="input-search">
          <button id="selecionar-cliente" class="btn-search"><i class="fas fa-search"></i></button>
        </div>
        
        <div class="lista_users">
          <div class="header-lista vendedor flex">
            <span class="w-100 mobi-none cod">Código de barras</span>
            <span class="w-100 descricao">Descrição</span>
            <span class="w-100 mobi-none v_unit text-center">Valor</span>
            <span class="w-100 text-center">Quantidade</span>
            <span class="w-100 text-center">Ação</span>
          </div>
          <div class="scroll-lista">
            <?php for($pa=0;$pa<=2;$pa++){ ?>
              <div class="item flex" >
                <span class="w-100 cod">145286</span>
                <span class="w-100 descricao">Um produto legal</span>
                <span class="w-100 text-center">5</span>
                <span class="w-100 text-center"><input type="text" class="qtde-devolucao"></span>
                <span class="w-100 flex text-center">
                <button class="btn-devolver"><p>&times;</p></button>
                </span>
              </div>
            <?php } ?>
          </div> 
        </div>
        <button class="btn submit">Confirmar</button>
      </div>
    </div>           
  </div>
