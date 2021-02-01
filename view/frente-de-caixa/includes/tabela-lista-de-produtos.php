<div class="table wrap">
  <span class="opc data-emissao">13/10/95 10:23:35</span>
  <span class="opc num_pedido">N° Pedido: <strong>362943365</strong></span>
  <!-- tabelas dos itens -->
  <div class="lista-itens-tabela">
      <div class="header-lista-itens for flex">
          <span class="mobi-none item">item</span>
          <span class="mobi-none cod">código</span>
          <span class="descricao">descrição do item</span>
          <span class="mobi-none unidade">un.</span>
          <span class="qtde">qtde.</span>
          <span class="valor_unidade">v. unit</span>
          <span class="mobi-none desc">% desc</span>
          <span class="mobi-none valor_desc">desconto</span>
          <span class="valor_total">total</span>
      </div>
      <div id="scrollEvent" class="body-lista-itens" data-clone-name="listaItens">
        <!-- loop dos itens -->
        <?php  for($loop=0;$loop<=35;$loop++){ ?>
          <div id="listaItens<?=$loop;?>" data-id="<?=$loop;?>" class="item item-clone flex for">
            <span class="clone mobi-none itm"><?=$loop;?></span>
            <span class="clone mobi-none cod">666999666</span>
            <span class="descricao">Smartphone Zenfone max shot M2</span>
            <span class="clone mobi-none unidade">Un.</span>
            <span class="qtde">1</span>
            <span class="valor_unidade">1.366,00</span>
            <span class="clone mobi-none desc">0</span>
            <span class="clone mobi-none valor_desc">0.00</span>
            <span class="valor_total">1.366,00</span>
          </div>
        <?php } ?>
      </div>
  </div>
</div>