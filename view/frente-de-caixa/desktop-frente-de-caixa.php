<?php $url = '../view/frente-de-caixa/includes/'; ?>
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
          <span class="btn-info-action">F3</span><?php include "./includes/codigo-barras-produto.php"; ?>
      </label>
      <label id="btn-buscar-produto" class="d-flex" data-url="<?=$url;?>">
          <p><span class="btn-info-action">F4</span>Buscar produto</p>
      </label>
    </div>

    <?php include "./includes/info-itens-produto.php";?>

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
      <div id="btn-fechar-caixa" data-url="<?=$url;?>">
        <p><span class="btn-info-action big">Ctrl + X</span>Fechar Caixa</p>
      </div>
      <div class="btn-actions logout">
        <p><span class="btn-info-action">F12</span> Sair </p>
      </div>
    </div>
  </div>

  <div class="bx tabela-itens">
    <div class="box-right">
     <?php include "./includes/nome-do-produto.php";?>
      <!-- tabela -->
      <?php include "./includes/tabela-lista-de-produtos.php";?>
      <?php include "./includes/valor-total-compra.php"; ?>
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
      <div id="btn-sair" onclick="closeModal();" class="text-right"><p><span class="btn-info-action" >ESC</span>Cancelar</p></div>
        <div id="body-modal"></div>
      </div>
    </div>
  </div>
</div>