<div class="form-modal">
  <h3>Agrupar Comandas</h3>

   <div class="tabs-info">
        <input id="tab-busca-cliente" type="text" placeholder="Comanda" class="input-search">
        <button id="selecionar-cliente" class="btn-search"><i class="fas fa-search"></i></button>

        <div class="Comanda lista_users">
          <div class="header-lista vendedor flex">
              <span class="qtde">Quantidade</span>
              <span class="item-c">Item</span>
              <span class="valor text-center">Valor</span>
          </div>
          <div class="scroll-lista">
            <?php for($v=0;$v<=6;$v++){ ?>
                <div class="item wrap">
                  <span class="qtde">215</span>
                  <span class="item-c">item comanda</span>
                  <span class="valor text-center">1.125,32</span>
                </div>
            <?php } ?>

      </div>
   </div>
</div>
