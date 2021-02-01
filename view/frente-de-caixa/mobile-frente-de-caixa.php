<div class="header-mob flex">
    <div class="item caixa">
        <p>Caixa: <strong>003</strong></p>
    </div>
    <div class="item">
        <div class="item-menu text-center" onclick="openMenu();"><i class="fas fa-bars"></i></div>
    </div>
    <div class="item usuario">
        <p class="text-right">Misael serafim</p>
    </div>
</div>

<div class="menu-hover">
  <img src="../dist/img/logomarcas/47985.png" alt="">
  <ul id="fc-menu" class="wrap">
    <li onclick="location.reload();"><i class="fas fa-home"></i></li>
    <li class="menu-item" data-link="cadastro-produto"><p>Produtos</p></li>
    <li class="menu-item" data-link="localizar-pedido"><p>Localizar pedido</p></li>
    <li class="menu-item" data-link="selecionar-clientes"><p>Cliente</p></li>
    <li class="menu-item" data-link="selecionar-vendedor"><p>Vendedor</p></li>
    <li class="menu-item" data-link="consultar-preco"><p>Consultar preço</p></li>
    <li class="menu-item" data-link="desconto"><p>Descontos</p></li>
    <li class="menu-item" data-link="sangria"><p>Sangria</p></li>
    <li class="menu-item" data-link="entrada-de-valores"><p>Entrada de valores</p></li>
    <li class="menu-item" data-link="agrupar-comanda"><p>Agrupar comanda</p></li>
    <li class="menu-item" data-link="recebimentos"><p>Recebimentos</p></li>
    <li class="menu-item" data-link="conta-corrente"><p>Conta Corrente </p></li>
    <li class="menu-item" data-link="devolucoes"><p>Devoluções</p></li>
    <li class="menu-item" data-link="fechar-caixa"><p>Fechar caixa</p></li>
    <li class="logout"><p>Sair do sistema</p></li>
  </ul>
  <div class="close-menu" onclick="closeMenu();"><i class="fas fa-times"></i></div>
</div>
<div class="atalhos" onclick="location.reload();"><i class="fas fa-home"></i></div>
<div id="page-mobile">
    <!-- home frente de caixa -->
    <div id="pag-home" class="swiper-slide lista-conteudo">
        <div class="card">
          <div class="cod-barra-mobile">
              <i class="fas fa-barcode"></i>
              <?php include "./includes/codigo-barras-produto.php"; ?>
              <button class="btn-search"><i class="fas fa-search"></i></button>
          </div>
          <?php include "./includes/nome-do-produto.php";?>
          <?php include "./includes/info-itens-produto.php";?>
          <div class="flex acao-item">
              <button class="btns item-cancelar"><i class="fas fa-times"></i> Cancelar item</button>
              <button class="btns item-alterar"><i class="fas fa-sync-alt"></i> Alterar item</button>
          </div>
        </div>
        <!-- tabela de itens -->
        <div class="card p-none">
          <?php include "./includes/tabela-lista-de-produtos.php";?>
        </div>
    </div>
</div>


<!-- valores totais das compras -->
<div class="opc-venda">
  <?php include "./includes/valor-total-compra.php";?>
</div>