<?php

$url = ENDERECO . '/view/frente-de-caixa/includes/';

?>

<div class="header-frente-de-caixa d-flex">
  <div id="btn-vendedor" class="bx btn-vendedor" data-url="<?=$url;?>">
    <p><span class="btn-info-action">F1</span> <strong>Vendedor:</strong>Júlio Cezar</p>
  </div>
  <div id="btn-cliente" class="bx btn-cliente" data-url="<?=$url;?>">
    <p><span class="btn-info-action">F2</span> <strong>Cliente:</strong>Hipócritas de cross</p>
  </div>
  <div class="bx btn-usuario">
    <p><strong>Usuário:</strong> Misael Serafim</p>
  </div>
  <div class="bx btn-caixa">
    <p><strong>Caixa:</strong>003</p>
  </div>
</div>

<div class="body-frente-de-caixa wrap">

  <div class="bx controles">
    <!-- pesquisa com o código de barras -->
    <div class="pesquisa-cod-barras">
      <p>Código de barras</p>
      <label class="d-flex">
          <span class="btn-info-action">F3</span><input type="text" value="" name="" id="btn-cadigo-barras">
      </label>
      <label id="btn-buscar-produto" class="d-flex" data-url="<?=$url;?>">
          <p><span class="btn-info-action">F4</span>Buscar produto</p>
      </label>
    </div>

    <div class="item-info">
      <label class="d-flex">
        <span class="nomeclatura">Quantidade:</span><input type="text" value="" name="" id="quantidade_item">
      </label>
      <label class="d-flex">
        <span class="nomeclatura">Valor Unitário:</span><input type="text" value="" name="" id="valor_unitario" class="money">
      </label>
      <label class="d-flex">
        <span class="nomeclatura">Valor Total:</span><input type="text" value="" name="" id="valor_total" class="money">
      </label>
    </div>

    <!-- comandos teclado -->
    <div class="Comandos_teclado grid grid-1 gap-15">
      <div id="btn-localizar_pedido" data-url="<?=$url;?>">
        <p><span class="btn-info-action">F5</span> Localizar Pedido</p>
      </div>
      <div id="btn-desconto" data-url="<?=$url;?>">
        <p><span class="btn-info-action">F6</span> Desconto</p>
      </div>
      <div id="btn-alterar-item" data-url="<?=$url;?>">
        <p><span class="btn-info-action">F7</span> Alterar item</p>
      </div>
      <div id="btn-cancelar-item" data-url="<?=$url;?>">
        <p><span class="btn-info-action">F8</span> Cancelar item</p>
      </div>
      <div id="btn-sangria" data-url="<?=$url;?>">
        <p><span class="btn-info-action big">Ctrl + S</span>Sangria</p>
      </div>
      <div id="Cancelar-venda" class="btn-cancelar">
        <p><span class="btn-info-action big">Ctrl + F11</span>Cancelar Venda</p>
      </div>
      <div id="fechar-caixa">
        <p><span class="btn-info-action big">Ctrl + X</span>Fechar Caixa</p>
      </div>
      <div class="btn-actions logout">
        <p><span class="btn-info-action">F12</span> Sair </p>
      </div>
    </div>
  </div>

  <div class="bx tabela-itens">
    <div class="box-right">
      <h2 class="nome-produto">Smartphone Zenfone max shot M2</h2>
      <!-- tabela -->
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

      <div class="opcVenda flex">
        <div class="acao-caixa">        
            <div class="btn-finalizar">
              <p><span class="btn-info-action big">Ctrl + F10</span>Finalizar Venda</p>
            </div>
        </div>
        <div class="total wrap">
            <?php $desconto= true; if($desconto){ ?><div class="desconto"><p class="d-flex">Desconto: <strong>0,00</strong></P></div><?php } ?>
            <div class="box-valor">
              <h3>Total a pagar</h3>
              <span class="valorTotal">R$ 1.526,66</span>
            </div>
        </div>
      </div>
    </div>
  </div>

  <div class="bx Comandos_teclado wrap">
      <div id="btn-consultar-preco" data-url="<?=$url;?>">
        <p><span class="btn-info-action">F9</span> Consultar preço</p>
      </div>
      <div id="btn-entrada-valores" data-url="<?=$url;?>">
        <p><span class="btn-info-action big">Ctrl + E</span>Entrada de valores</p>
      </div>
      <div id="btn-agrupar-comanda" data-url="<?=$url;?>">
        <p><span class="btn-info-action big">Ctrl + G</span>Agrupar comanda</p>
      </div>
      <div id="btn-recebimentos" data-url="<?=$url;?>">
        <p><span class="btn-info-action big">Ctrl + R</span>Recebimentos</p>
      </div>
      <div id="btn-conta-corrente" data-url="<?=$url;?>">
        <p><span class="btn-info-action big">Ctrl + F</span>Conta Corrente</p>
      </div>
      <div id="btn-devolucoes" data-url="<?=$url;?>">
        <p><span class="btn-info-action big">Ctrl + D</span>Devoluções</p>
      </div>
  </div>

</div>


<div id="ModalActions" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="Modais" aria-hidden="true">
  <div class="modal-dialog modal-lg position-relative">
    <div class="modal-content padding-30">
      <div id="btn-sair" class="text-right"><p><span class="btn-info-action">FSC</span>Cancelar</p></div>
        <div id="body-modal"></div>
      </div>
    </div>
  </div>
</div>
