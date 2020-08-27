<!-- DataTables -->
<link rel="stylesheet" href="<?= ENDERECO; ?>/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="<?= ENDERECO; ?>/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">

<!-- Content Header (Page header) -->
<section class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1>Clientes</h1>
      </div>
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a href="<?= ENDERECO; ?>">Home</a></li>
          <li class="breadcrumb-item active">Clientes</li>
        </ol>
      </div>
    </div>
  </div><!-- /.container-fluid -->
</section>

<!-- Main content -->
<section class="content">
  <div class="container-fluid">
    <div class="row">
      <div class="col-12">

        <div class="card">
          <div class="card-header">
            <h3 class="card-title">Gerenciamento de Clientes</h3>
            <div class="float-right">
              <a>Cadastro</a>
            </div>
          </div>
          <!-- /.card-header -->
          <div class="card-body">
            <table id="clientesDataTable" data-url="<?= ENDERECO . '/api/cliente_api.php?op=' . md5('buscaClientes'); ?>" class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th>Código Cliente</th>
                  <th>Nome</th>
                  <th>Razão Social</th>
                  <th>CPF/CNPJ</th>
                  <th>Telefone</th>
                  <th>Ações</th>
                </tr>
              </thead>
              <tbody id="bodyClientes">

              </tbody>
              <tfoot>
                <tr>
                  <th>Código Cliente</th>
                  <th>Nome</th>
                  <th>Razão Social</th>
                  <th>CPF/CNPJ</th>
                  <th>Telefone</th>
                  <th>Ações</th>
                </tr>
              </tfoot>
            </table>
          </div>
          <!-- /.card-body -->
        </div>
        <!-- /.card -->
      </div>
      <!-- /.col -->
    </div>
    <!-- /.row -->
  </div>
  <!-- /.container-fluid -->
</section>
<!-- /.content -->
