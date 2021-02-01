<div class="form-modal">

    <div class="tabs">
      <button class="btn_tabs active" data-id="1"><i class="fas fa-percent"></i> Desconto geral</button>
      <button class="btn_tabs" data-id="2"><i class="fas fa-percent"></i> Desconto por item</button>
    </div>

    <div class="tabs-info">
      <div id="opc-tab_1" class="opc_tabs active">
        <h3>Desconto geral</h3><br>
        <form id="descontoGeral" action="#" method="post" class="formstyle grid grid-2 gap-10">
            <label>
              <p>Preço de Custo Geral:</p>
              <input type="text" class="money">
            </label>
            <label>
              <p>Preço de Venda:</p>
              <input type="text" class="money">
            </label>
            <label>
              <p>Desconto %:</p>
              <input type="text" class="percent">
            </label>
            <label>
              <p>Desconto R$:</p>
              <input type="text" class="money">
            </label>
            <button class="submit">Aplicar desconto Geral</button>
          </form>
      </div>
      <div id="opc-tab_2" class="opc_tabs">
        <h3>Desconto por item</h3><br>
          <form id="descontoItem" action="#" method="post" class="formstyle grid grid-2 gap-10">
            <label>
              <p>Número do Ítem:</p>
              <input type="text">
            </label>
            <label>
              <p>Preço de Venda:</p>
              <input type="text" class="money">
            </label>
            <label>
              <p>Desconto %:</p>
              <input type="text" class="percent">
            </label>
            <label>
              <p>Desconto R$:</p>
              <input type="text" class="money">
            </label>
            <button class="submit">Desconto no Item</button>
          </form>
      </div>
    </div>
</div>
