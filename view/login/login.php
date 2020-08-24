<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>WebControl Empresas | Login</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<?= ENDERECO; ?>/plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="<?= ENDERECO; ?>/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<?= ENDERECO; ?>/dist/css/adminlte.css">
</head>

<body class="hold-transition login-page float-right" style="background: url(dist/img/background.jpg);background-size: cover;background-repeat: no-repeat;">
  <div class="login-box mr-5">
    <div class="login-logo">
      <a href="#">
        <img src="dist/img/logomarcas/47985.png" alt="Nome da Empresa" class="brand-image">
      </a>
    </div>
    <!-- /.login-logo -->
    <div class="card float">
      <div class="card-body login-card-body">
        <p class="login-box-msg">Seja Bem Vindo!</p>

        <form id="login" name="login">
          <div class="input-group mb-3">
            <input type="number" class="form-control" placeholder="Código:">
            <div class="input-group-append">
              <div class="input-group-text">
                <span class="fas fa-envelope"></span>
              </div>
            </div>
          </div>
          <div class="input-group mb-3">
            <input type="password" class="form-control" placeholder="Senha:">
            <div class="input-group-append">
              <div class="input-group-text">
                <span class="fas fa-lock"></span>
              </div>
            </div>
          </div>
          <div class="row">

            <!-- /.col -->
            <div class="col-12 mb-2">
              <button type="submit" class="btn btn-primary btn-block float-right">Entrar</button>
            </div>
            <!-- /.col -->
          </div>
        </form>

        <!-- /.social-auth-links -->

        <p class="mb-1">
          <a href="forgot-password.html">Esqueci Minha Senha</a>
        </p>
        <p class="mb-0">
          <a href="register.html" class="text-center">Quero Ser Cliente</a>
        </p>
      </div>
      <!-- /.login-card-body -->
    </div>
  </div>
  <!-- /.login-box -->

  <!-- jQuery -->
  <script src="<?= ENDERECO; ?>/plugins/jquery/jquery.min.js"></script>
  <!-- Bootstrap 4 -->
  <script src="<?= ENDERECO; ?>/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- AdminLTE App -->
  <script src="<?= ENDERECO; ?>/dist/js/adminlte.min.js"></script>
</body>

</html>