
<div class="form-modal">
  <h3>Consultar preço</h3>
    <div class="class_busca_produto wrap">
        <div  class="select">
            <select name="localiza_pedido" id="localiza_pedido">
                <option value="pedido">Cód. Barras</option>
                <option value="classificacao">Classificação</option>
                <option value="nome">Nome / Descrição</option>
                <option value="cd_interno">Cód. interno</option>
                <option value="mesa">Kit/ Combo</option>
            </select>
        </div>
        <input id="input-consultar-preco" type="text" placeholder="" class="input-search">
        <button id="btn-cons-preco" class="btn-search"><i class="fas fa-search"></i></button>
        </div>

        <div class="lista_users">
        <div class="header-lista vendedor flex">
            <span class="no_pedido">Código</span>
            <span class="status"> Cód. Interno</span>
            <span class="data">Nome/Descrição do Produto</span>
            <span class="calssificacao">Classificação</span>
            <span class="qtde text-center">Quantidade</span>
            <span class="origem text-right">Preço Varejo	</span>
            <span class="vendeddor text-right">Preço Atacado</span>
        </div>
        <div class="scroll-lista">
            <?php for($v=0;$v<=6;$v++){ ?>
                <div class="item flex">
                  <span class="no_pedido">82164</span>
                  <span class="status">73281</span>
                  <span class="data">Nome do produto ou descrição</span>
                  <span class="calssificacao">importado</span>
                  <span class="qtde text-center">21 | Un</span>
                  <span class="origem text-right">15,35	</span>
                  <span class="vendeddor text-right">14,85</span>
                </div>
            <?php } ?>
        </div>
    </div>

</div>
