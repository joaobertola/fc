<div class="table wrap">
        <span class="opc data-emissao">13/10/95 10:23:35</span>
        <span class="opc num_pedido">N° Pedido: <strong>362943365</strong></span>
        <!-- tabelas dos itens -->
        <div class="lista-itens-tabela">
            <div class="header-lista-itens flex">
                <span class="item">item</span>
                <span class="cod">código</span>
                <span class="descricao">descrição do item</span>
                <span class="unidade">un.</span>
                <span class="qtde">qtde.</span>
                <span class="valor_unidade">v. unit</span>
                <span class="desc">% desc</span>
                <span class="valor_desc">desconto</span>
                <span class="valor_total">total</span>
            </div>
            <div id="scrollEvent" class="body-lista-itens">
              <!-- loop dos itens -->
              <?php  for($loop=0;$loop<=35;$loop++){ ?>
                <div class="item flex">
                  <span class="itm"><?=$loop;?></span>
                  <span class="cod">666999666</span>
                  <span class="descricao">Smartphone Zenfone max shot M2</span>
                  <span class="unidade">Un.</span>
                  <span class="qtde">1</span>
                  <span class="valor_unidade">1.366,00</span>
                  <span class="desc">0</span>
                  <span class="valor_desc">0.00</span>
                  <span class="valor_total">1.366,00</span>
                </div>
              <?php } ?>
            </div>
        </div>
      </div>