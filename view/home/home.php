<!-- Content Header (Page header) -->
<div class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1 class="m-0 text-dark">Resultados do Dia</h1>
      </div><!-- /.col -->
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a>Home</a></li>
          <li class="breadcrumb-item active">Dashboard</li>
        </ol>
      </div><!-- /.col -->
    </div><!-- /.row -->
  </div><!-- /.container-fluid -->
</div>
<!-- /.content-header -->

<!-- Main content -->
<section class="content">
  <div class="container-fluid">
    <!-- Info boxes -->
    <div class="row">
      <div class="col-12 col-sm-6 col-md-4">
        <div class="info-box">
          <span class="info-box-icon bg-info elevation-1"><i class="fas fa-shopping-cart"></i></span>

          <div class="info-box-content">
            <span class="info-box-text">Vendas Realizadas</span>
            <span id="vendasCard" class="info-box-number">--</span>
          </div>
          <!-- /.info-box-content -->
        </div>
        <!-- /.info-box -->
      </div>
      <!-- /.col -->
      <div class="col-12 col-sm-6 col-md-4">
        <div class="info-box mb-3">
          <span class="info-box-icon bg-danger elevation-1"><i class="fas fa-users"></i></span>

          <div class="info-box-content">
            <span class="info-box-text">Novos Clientes</span>
            <span class="info-box-number">--</span>
          </div>
          <!-- /.info-box-content -->
        </div>
        <!-- /.info-box -->
      </div>
      <!-- /.col -->

      <!-- fix for small devices only -->
      <div class="clearfix hidden-md-up"></div>

      <div class="col-12 col-sm-12 col-md-4">
        <div class="info-box mb-3">
          <span class="info-box-icon bg-success elevation-1"><i class="fas fa-box-open"></i></span>

          <div class="info-box-content">
            <span class="info-box-text">Produtos Vendidos</span>
            <span class="info-box-number">--</span>
          </div>
          <!-- /.info-box-content -->
        </div>
        <!-- /.info-box -->
      </div>
      <!-- /.col -->
    </div>
    <!-- /.row -->

    <!-- Main row -->
    <div class="row">

      <div class="col-md-12">

        <div class="card">
          <div class="card-header">
            <h3 class="card-title">Browser Usage</h3>

            <div class="card-tools">
              <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i>
              </button>
              <button type="button" class="btn btn-tool" data-card-widget="remove"><i class="fas fa-times"></i>
              </button>
            </div>
          </div>
          <!-- /.card-header -->
          <div class="card-body">
            <div class="row">
              <div class="col-md-8">
                <div class="chart-responsive">
                  <canvas id="pieChart" height="150"></canvas>
                </div>
                <!-- ./chart-responsive -->
              </div>
              <!-- /.col -->
              <div class="col-md-4">
                <ul class="chart-legend clearfix">
                  <li><i class="far fa-circle text-danger"></i> Chrome</li>
                  <li><i class="far fa-circle text-success"></i> IE</li>
                  <li><i class="far fa-circle text-warning"></i> FireFox</li>
                  <li><i class="far fa-circle text-info"></i> Safari</li>
                  <li><i class="far fa-circle text-primary"></i> Opera</li>
                  <li><i class="far fa-circle text-secondary"></i> Navigator</li>
                </ul>
              </div>
              <!-- /.col -->
            </div>
            <!-- /.row -->
          </div>
          <!-- /.card-body -->
          <div class="card-footer bg-white p-0">
            <ul class="nav nav-pills flex-column">
              <li class="nav-item">
                <a href="#" class="nav-link">
                  United States of America
                  <span class="float-right text-danger">
                    <i class="fas fa-arrow-down text-sm"></i>
                    12%</span>
                </a>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link">
                  India
                  <span class="float-right text-success">
                    <i class="fas fa-arrow-up text-sm"></i> 4%
                  </span>
                </a>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link">
                  China
                  <span class="float-right text-warning">
                    <i class="fas fa-arrow-left text-sm"></i> 0%
                  </span>
                </a>
              </li>
            </ul>
          </div>
          <!-- /.footer -->
        </div>
        <!-- /.card -->

      </div>
      <!-- /.col -->
    </div>
    <!-- /.row -->
  </div>
  <!--/. container-fluid -->
</section>
<!-- /.content -->

