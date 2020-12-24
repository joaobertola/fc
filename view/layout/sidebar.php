<aside class="main-sidebar elevation-4 sidebar-light-navy">
  <!-- Brand Logo -->
  <a href="<?= ENDERECO; ?>" class="brand-link">
    <img src="<?= ENDERECO; ?>/dist/img/logomarcas/47985.png" alt="WebControl Empresas" class="brand-image">
  </a>

  <!-- Sidebar -->
  <div class="sidebar">

    <!-- Sidebar Menu -->
    <nav class="mt-2">
      <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
        <li class="nav-item">
          <a href="#" class="nav-link">
            <i class="fas fa-money-bill-alt"></i>
            <p>
              Gestão Empresarial
              <i class="right fas fa-angle-left"></i>
            </p>
          </a>
          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="<?= ENDERECO; ?>/cliente/listar" class="nav-link <?= $_SESSION['modulo'] == 'cliente' ? 'active' : ''; ?>">
                <i class="fas fa-user-tag"></i>
                <p>Clientes</p>
              </a>
            </li>
          </ul>
        </li>
        <li class="nav-item">
          <a href="#" class="nav-link">
            <i class="fas fa-dollar-sign"></i>
            <p>
              Financeiro
              <i class="right fas fa-angle-left"></i>
            </p>
          </a>
          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="<?= ENDERECO; ?>/frente-de-caixa" class="nav-link <?= $_SESSION['modulo'] == 'frente-de-caixa' ? 'active' : ''; ?>">
                <i class="fas fa-shopping-cart"></i>
                <p>Frente de Caixa</p>
              </a>
            </li>
          </ul>
        </li>
        <li class="nav-item">
          <a href="#" class="nav-link">
            <i class="fas fa-cogs"></i>
            <p>
              Franquias
              <i class="right fas fa-angle-left"></i>
            </p>
          </a>
          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="<?= ENDERECO; ?>/franquias/cadastrar" class="nav-link <?= $_SESSION['modulo'] == 'franquias' ? 'active' : ''; ?>">
                <i class="fas fa-user-tag"></i>
                <p>Cadastrar clientes</p>
              </a>
            </li>
          </ul>
        </li>
        <li class="nav-item">
          <a href="#" class="nav-link">
            <i class="fas fa-list-ul"></i>
            <p>
              Relatórios
              <i class="right fas fa-angle-left"></i>
            </p>
          </a>
          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="<?= ENDERECO; ?>/relatorios/vendas-realizadas" class="nav-link <?= $_SESSION['modulo'] == 'vendas-realizadas' ? 'active' : ''; ?>">
              <i class="fas fa-clipboard-list"></i>
                <p>Vendas Realizadas</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="<?= ENDERECO; ?>/relatorios/fluxo-de-caixa" class="nav-link <?= $_SESSION['modulo'] == 'fluxo-de-caixa' ? 'active' : ''; ?>">
              <i class="fas fa-project-diagram"></i>
                <p>Fluxo de caixa</p>
              </a>
            </li>
          </ul>
        </li>
      </ul>
    </nav>
    <!-- /.sidebar-menu -->
  </div>
  <!-- /.sidebar -->
</aside>
