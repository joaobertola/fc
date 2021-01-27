<aside class="main-sidebar elevation-4 sidebar-light-navy">

<<<<<<< HEAD
  <a href="index3.html" class="brand-link">
=======
  <a href="<?= ENDERECO; ?>" class="brand-link">
>>>>>>> f007ec01dc5d85a156f510f99433da2a58cc394b
    <!--    <img src="dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">-->
    <span class="brand-text font-weight-light">SmartStore MG</span>
  </a>

  <!-- Brand Logo -->
  <!--  <a href="index3.html" class="brand-link">-->
  <!--    <img src="dist/img/logomarcas/avatar.png" alt="SmartStore MG" class="brand-image">-->
  <!--  </a>-->

  <!-- Sidebar -->
  <div class="sidebar">

    <div class="user-panel mt-3 pb-3 mb-3 d-flex">
      <div class="image">
<<<<<<< HEAD
        <img src="dist/img/user6-128x128.jpg" class="img-circle elevation-2" alt="User Image">
      </div>
      <div class="info">
        <a href="#" class="d-block">João Buti</a>
      </div>
=======
<!--        <img src="--><?//=ENDERECO?><!--/dist/img/logomarcas/47985.png" class="img-circle elevation-2" alt="User Image">-->
        <img src="<?=ENDERECO?>/dist/img/logomarcas/quick.jpeg" class="brand-image" alt="Logomarca">
      </div>
<!--      <div class="info">-->
<!--        <a href="#" class="d-block">--><?//= $_SESSION['user']['nome_usuario']?><!--</a>-->
<!--      </div>-->
>>>>>>> f007ec01dc5d85a156f510f99433da2a58cc394b
    </div>

    <div class="form-inline">
      <div class="input-group" data-widget="sidebar-search">
        <input class="form-control form-control-sidebar" type="buscar" placeholder="Search" aria-label="Search">
        <div class="input-group-append">
          <button class="btn btn-sidebar">
            <i class="fas fa-search fa-fw"></i>
          </button>
        </div>
      </div>
    </div>


<<<<<<< HEAD
<!-- INIT MENU WC -->
 <!-- Sidebar Menu -->
=======
    <!-- INIT MENU WC -->
    <!-- Sidebar Menu -->
<!--    <nav class="mt-2">-->
<!--      <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">-->
<!--        <li class="nav-item">-->
<!--          <a href="#" class="nav-link active">-->
<!--            <i class="fas fa-money-bill-alt"></i>-->
<!--            <p>-->
<!--              Gestão Empresarial-->
<!--              <i class="right fas fa-angle-left"></i>-->
<!--            </p>-->
<!--          </a>-->
<!--          <ul class="nav nav-treeview">-->
<!--            <li class="nav-item">-->
<!--              <a href="--><?//= ENDERECO; ?><!--/cliente/listar" class="nav-link">-->
<!--                <i class="fas fa-user-tag"></i>-->
<!--                <p>Clientes</p>-->
<!--              </a>-->
<!--            </li>-->
<!--          </ul>-->
<!--        </li>-->
<!--        <li class="nav-item">-->
<!--          <a href="#" class="nav-link active">-->
<!--            <i class="fas fa-cogs"></i>-->
<!--            <p>-->
<!--              Inclusão de Clientes-->
<!--              <i class="right fas fa-angle-left"></i>-->
<!--            </p>-->
<!--          </a>-->
<!--          <ul class="nav nav-treeview">-->
<!--            <li class="nav-item">-->
<!--              <a href="--><?//= ENDERECO; ?><!--/franquias/cadastrar" class="nav-link">-->
<!--                <i class="fas fa-user-tag"></i>-->
<!--                <p>Cadastrar clientes</p>-->
<!--              </a>-->
<!--            </li>-->
<!--          </ul>-->
<!--        </li>-->
<!--      </ul>-->
<!--    </nav>-->

    <!-- FIM MENU WC -->

    <!-- Sidebar Menu -->
>>>>>>> f007ec01dc5d85a156f510f99433da2a58cc394b
    <nav class="mt-2">
      <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
        <li class="nav-item">
          <a href="#" class="nav-link active">
            <i class="fas fa-briefcase"></i>
            <p>
              Admin
              <i class="right fas fa-angle-left"></i>
            </p>
          </a>
          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="<?= ENDERECO; ?>/franquias/cadastrar" class="nav-link <?= $_SESSION['modulo'] == 'franquias' ? 'active' : ''; ?>">
                <i class="fas fa-store"></i>
                <p>Empresas</p>
              </a>
            </li>
          </ul>
        </li>
      </ul>
    </nav>
    <!-- /.sidebar-menu -->

    <!-- Sidebar Menu -->
    <nav class="mt-2">
      <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
        <li class="nav-item">
          <a href="#" class="nav-link active">
            <i class="fas fa-cog"></i>
            <p>
              Gerenciar
              <i class="right fas fa-angle-left"></i>
            </p>
          </a>

          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="<?= ENDERECO; ?>/usuario/listar" class="nav-link">
                <i class="fas fa-users"></i>
                <p>Usuários</p>
              </a>
            </li>
          </ul>

          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="<?= ENDERECO; ?>/funcionario/listar" class="nav-link">
                <i class="fas fa-handshake"></i>
                <p>Funcionários</p>
              </a>
            </li>
          </ul>

          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="<?= ENDERECO; ?>/cliente/listar" class="nav-link <?= $_SESSION['modulo'] == 'cliente' ? 'active' : ''; ?>">
                <i class="fas fa-user-tie"></i>
                <p>Clientes
                  </br>Fornecedores
                  </br>Transportadoras</p>
              </a>
            </li>
          </ul>

          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="./index.html" class="nav-link">
                <i class="fas fa-barcode"></i>
                <p>Produtos</p>
              </a>
            </li>
          </ul>

        </li>
      </ul>
    </nav>
	
<!-- FIM MENU WC -->

    <!-- Sidebar Menu -->
    <nav class="mt-2">
      <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
        <li class="nav-item">
          <a href="#" class="nav-link active">
            <i class="fas fa-briefcase"></i>
            <p>
              Admin
              <i class="right fas fa-angle-left"></i>
            </p>
          </a>
          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="<?= ENDERECO; ?>/empresa/listar" class="nav-link">
                <i class="fas fa-store"></i>
                <p>Empresas</p>
              </a>
            </li>
          </ul>
        </li>
      </ul>
    </nav>
    <!-- /.sidebar-menu -->

    <!-- Sidebar Menu -->
    <nav class="mt-2">
      <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
        <li class="nav-item">
          <a href="#" class="nav-link active">
            <i class="fas fa-cog"></i>
            <p>
              Gerenciar
              <i class="right fas fa-angle-left"></i>
            </p>
          </a>

          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="<?= ENDERECO; ?>/usuario/listar" class="nav-link">
                <i class="fas fa-users"></i>
                <p>Usuários</p>
              </a>
            </li>
          </ul>

          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="<?= ENDERECO; ?>/funcionario/listar" class="nav-link">
                <i class="fas fa-handshake"></i>
                <p>Funcionários</p>
              </a>
            </li>
          </ul>

          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="<?= ENDERECO; ?>/cliente/listar" class="nav-link">
                <i class="fas fa-user-tie"></i>
                <p>Clientes
                </br>Fornecedores
                </br>Transportadoras</p>
              </a>
            </li>
          </ul>

          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="./index.html" class="nav-link">
                <i class="fas fa-barcode"></i>
                <p>Produtos</p>
              </a>
            </li>
          </ul>

        </li>
      </ul>
    </nav>
    <!-- /.sidebar-menu -->

    <!-- Sidebar Menu -->
    <nav class="mt-2">
      <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
        <li class="nav-item">
          <a href="#" class="nav-link active">
            <i class="fas fa-hand-holding-usd"></i>
            <p>
              Financeiro
              <i class="right fas fa-angle-left"></i>
            </p>
          </a>
          <ul class="nav nav-treeview">
            <li class="nav-item">
<<<<<<< HEAD
              <a href="<?= ENDERECO; ?>/frentecaixa/home" class="nav-link">
=======
              <a href="<?= ENDERECO; ?>/frente-de-caixa" class="nav-link <?= $_SESSION['modulo'] == 'frente-de-caixa' ? 'active' : ''; ?>">
>>>>>>> f007ec01dc5d85a156f510f99433da2a58cc394b
                <i class="fas fa-cash-register"></i>
                <p>Frente de Caixa</p>
              </a>
            </li>
          </ul>
        </li>
      </ul>
    </nav>
    <!-- /.sidebar-menu -->

<<<<<<< HEAD
      <!-- Sidebar Menu -->
      <nav class="mt-2">
          <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
              <li class="nav-item">
                  <a href="#" class="nav-link active">
                      <i class="fas fa-chart-line"></i>
                      <p>
                          Relatórios
                          <i class="right fas fa-angle-left"></i>
                      </p>
                  </a>
                  <ul class="nav nav-treeview">
                      <li class="nav-item">
                          <a href="<?= ENDERECO; ?>/relatorio/fluxocaixa" class="nav-link">
                              <i class="fas fa-chart-bar"></i>
                              <p>Fluxo de Caixa</p>
                          </a>
                      </li>
                  </ul>
                  <ul class="nav nav-treeview">
                      <li class="nav-item">
                          <a href="<?= ENDERECO; ?>/relatorio/vendas" class="nav-link">
                              <i class="fas fa-store"></i>
                              <p>Venda</p>
                          </a>
                      </li>
                  </ul>
                  <ul class="nav nav-treeview">
                      <li class="nav-item">
                          <a href="<?= ENDERECO; ?>/relatorio/vendas" class="nav-link">
                              <i class="fas fa-file-invoice-dollar"></i>
                              <p>Notas Fiscais</p>
                          </a>
                      </li>
                  </ul>
              </li>
          </ul>
      </nav>
      <!-- /.sidebar-menu -->
=======
    <!-- Sidebar Menu -->
    <nav class="mt-2">
      <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
        <li class="nav-item">
          <a href="#" class="nav-link active">
            <i class="fas fa-chart-line"></i>
            <p>
              Relatórios
              <i class="right fas fa-angle-left"></i>
            </p>
          </a>
          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="<?= ENDERECO; ?>/relatorios/fluxo-de-caixa" class="nav-link <?= $_SESSION['modulo'] == 'fluxo-de-caixa' ? 'active' : ''; ?>">
                <i class="fas fa-chart-bar"></i>
                <p>Fluxo de Caixa</p>
              </a>
            </li>
          </ul>
          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="<?= ENDERECO; ?>/relatorios/vendas-realizadas" class="nav-link <?= $_SESSION['modulo'] == 'vendas-realizadas' ? 'active' : ''; ?>">
                <i class="fas fa-store"></i>
                <p>Vendas</p>
              </a>
            </li>
          </ul>
          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="<?= ENDERECO; ?>/relatorios/notas-fiscais" class="nav-link <?= $_SESSION['modulo'] == 'notas-fiscais' ? 'active' : ''; ?>">
                <i class="fas fa-file-invoice-dollar"></i>
                <p>Notas Fiscais</p>
              </a>
            </li>
          </ul>
        </li>
      </ul>
    </nav>
    <!-- /.sidebar-menu -->
>>>>>>> f007ec01dc5d85a156f510f99433da2a58cc394b

    <!-- Sidebar Menu -->
    <nav class="mt-2">
      <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
        <li class="nav-item">
<<<<<<< HEAD
          <a href="#" class="nav-link active">
            <i class="fas fa-tools"></i>
=======
<<<<<<< HEAD
          <a href="#" class="nav-link active">
            <i class="fas fa-tools"></i>
=======
          <a href="#" class="nav-link">
            <i class="fas fa-box-open"></i>
            <p>
              Produto
              <i class="right fas fa-angle-left"></i>
            </p>
          </a>
          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="<?= ENDERECO; ?>/produto/cadastrar" class="nav-link <?= $_SESSION['modulo'] == 'produto' ? 'active' : ''; ?>">
                <i class="fas fa-cash-register"></i>
                <p>Cadastrar Produto</p>
              </a>
            </li>
          </ul>
        </li>
        <li class="nav-item">
          <a href="#" class="nav-link">
            <i class="fas fa-list-ul"></i>
>>>>>>> dcbcb2145d3e9f58c93ca037f3745d3bd99d2eab
>>>>>>> f007ec01dc5d85a156f510f99433da2a58cc394b
            <p>
              Configurações
              <i class="right fas fa-angle-left"></i>
            </p>
          </a>
          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="<?= ENDERECO; ?>/configuracoes/dadosempresariais" class="nav-link">
                <i class="fas fa-dollar-sign"></i>
                <p>Dados Empresariais</p>
              </a>
            </li>
          </ul>

          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="<?= ENDERECO; ?>/configuracoes/formaspagamento" class="nav-link">
                <i class="fas fa-dollar-sign"></i>
                <p>Formas de Pagamento</p>
              </a>
            </li>
          </ul>

          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="<?= ENDERECO; ?>/configuracoes/permissoes" class="nav-link">
                <i class="fas fa-lock-open"></i>
                <p>Permissões</p>
              </a>
            </li>
          </ul>

          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="<?= ENDERECO; ?>/configuracoes/customizacoes" class="nav-link">
                <i class="fas fa-laptop"></i>
                <p>Customizações</p>
              </a>
            </li>
          </ul>

        </li>
      </ul>
    </nav>
    <!-- /.sidebar-menu -->

    </br>

  </div>
  <!-- /.sidebar -->
</aside>



<<<<<<< HEAD
<!---->
<!--<aside class="main-sidebar elevation-4 sidebar-light-navy">-->
<!--<!--  <!-- Brand Logo -->-->-->
<!--<!--  <a href="-->--><?////= ENDERECO; ?><!--<!--" class="brand-link">-->-->
<!--<!--    <img src="-->--><?////= ENDERECO; ?><!--<!--/dist/img/logomarcas/47985.png" alt="WebControl Empresas" class="brand-image">-->-->
<!--<!--  </a>-->-->
<!---->
<!--  <!-- Sidebar -->-->
<!--  <div class="sidebar">-->
<!---->
<!--    <!-- Sidebar Menu -->-->
<!--    <nav class="mt-2">-->
<!--      <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">-->
<!--        <li class="nav-item">-->
<!--          <a href="#" class="nav-link active">-->
<!--            <i class="fas fa-cogs"></i>-->
=======
<!--<aside class="main-sidebar elevation-4 sidebar-light-navy">-->
<!-- Brand Logo -->
<!--  <a href="--><?//= ENDERECO; ?><!--" class="brand-link">-->
<!--    <img src="--><?//= ENDERECO; ?><!--/dist/img/logomarcas/47985.png" alt="WebControl Empresas" class="brand-image">-->
<!--  </a>-->

  <!-- Sidebar -->
<!--  <div class="sidebar">-->

    <!-- Sidebar Menu -->
<!--    <nav class="mt-2">-->
<!--      <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">-->
<!--        <li class="nav-item">-->
<!--          <a href="#" class="nav-link">-->
<!--            <i class="fas fa-money-bill-alt"></i>-->
>>>>>>> f007ec01dc5d85a156f510f99433da2a58cc394b
<!--            <p>-->
<!--              Gestão Empresarial-->
<!--              <i class="right fas fa-angle-left"></i>-->
<!--            </p>-->
<!--          </a>-->
<!--          <ul class="nav nav-treeview">-->
<!--            <li class="nav-item">-->
<<<<<<< HEAD
<!--              <a href="--><?//= ENDERECO; ?><!--/cliente/listar" class="nav-link">-->
=======
<!--              <a href="--><?//= ENDERECO; ?><!--/cliente/listar" class="nav-link --><?//= $_SESSION['modulo'] == 'cliente' ? 'active' : ''; ?><!--">-->
>>>>>>> f007ec01dc5d85a156f510f99433da2a58cc394b
<!--                <i class="fas fa-user-tag"></i>-->
<!--                <p>Clientes</p>-->
<!--              </a>-->
<!--            </li>-->
<!--          </ul>-->
<!--        </li>-->
<<<<<<< HEAD
<!--      </ul>-->
<!--    </nav>-->
<!--    <!-- /.sidebar-menu -->-->
<!--  </div>-->
<!--  <!-- /.sidebar -->-->
=======
<!--        <li class="nav-item">-->
<!--          <a href="#" class="nav-link">-->
<!--            <i class="fas fa-dollar-sign"></i>-->
<!--            <p>-->
<!--              Financeiro-->
<!--              <i class="right fas fa-angle-left"></i>-->
<!--            </p>-->
<!--          </a>-->
<!--          <ul class="nav nav-treeview">-->
<!--            <li class="nav-item">-->
<!--              <a href="--><?//= ENDERECO; ?><!--/frente-de-caixa" class="nav-link --><?//= $_SESSION['modulo'] == 'frente-de-caixa' ? 'active' : ''; ?><!--">-->
<!--                <i class="fas fa-shopping-cart"></i>-->
<!--                <p>Frente de Caixa</p>-->
<!--              </a>-->
<!--            </li>-->
<!--          </ul>-->
<!--        </li>-->
<!--        <li class="nav-item">-->
<!--          <a href="#" class="nav-link">-->
<!--            <i class="fas fa-cogs"></i>-->
<!--            <p>-->
<!--              Franquias-->
<!--              <i class="right fas fa-angle-left"></i>-->
<!--            </p>-->
<!--          </a>-->
<!--          <ul class="nav nav-treeview">-->
<!--            <li class="nav-item">-->
<!--              <a href="--><?//= ENDERECO; ?><!--/franquias/cadastrar" class="nav-link --><?//= $_SESSION['modulo'] == 'franquias' ? 'active' : ''; ?><!--">-->
<!--                <i class="fas fa-user-tag"></i>-->
<!--                <p>Cadastrar clientes</p>-->
<!--              </a>-->
<!--            </li>-->
<!--          </ul>-->
<!--        </li>-->
<!--        <li class="nav-item">-->
<!--          <a href="#" class="nav-link">-->
<!--            <i class="fas fa-list-ul"></i>-->
<!--            <p>-->
<!--              Relatórios-->
<!--              <i class="right fas fa-angle-left"></i>-->
<!--            </p>-->
<!--          </a>-->
<!--          <ul class="nav nav-treeview">-->
<!--            <li class="nav-item">-->
<!--              <a href="--><?//= ENDERECO; ?><!--/relatorios/vendas-realizadas" class="nav-link --><?//= $_SESSION['modulo'] == 'vendas-realizadas' ? 'active' : ''; ?><!--">-->
<!--                <i class="fas fa-clipboard-list"></i>-->
<!--                <p>Vendas Realizadas</p>-->
<!--              </a>-->
<!--            </li>-->
<!--            <li class="nav-item">-->
<!--              <a href="--><?//= ENDERECO; ?><!--/relatorios/fluxo-de-caixa" class="nav-link --><?//= $_SESSION['modulo'] == 'fluxo-de-caixa' ? 'active' : ''; ?><!--">-->
<!--                <i class="fas fa-project-diagram"></i>-->
<!--                <p>Fluxo de caixa</p>-->
<!--              </a>-->
<!--            </li>-->
<!--          </ul>-->
<!--        </li>-->
<!--      </ul>-->
<!--    </nav>-->
    <!-- /.sidebar-menu -->
<!--  </div>-->
  <!-- /.sidebar -->
>>>>>>> f007ec01dc5d85a156f510f99433da2a58cc394b
<!--</aside>-->
