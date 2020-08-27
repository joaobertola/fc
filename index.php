<?php include "view/layout/head.php"; ?>

<body class="hold-transition sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed">
  <div class="wrapper">

    <!-- Navbar -->
    <?php include "view/layout/navbar.php"; ?>
    <!-- /.navbar -->

    <!-- Main Sidebar Container -->
    <?php include "view/layout/sidebar.php"; ?>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">

      <?php
      $file = $action . $modulo . '.php';

      $caminho = 'view/' . $modulo . '/' . $file;

      $caminho = file_exists($caminho) ? $caminho : 'view/404/404.php';

      include $caminho;

      ?>

    </div>
    <!-- /.content-wrapper -->

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
      <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->

    <!-- Main Footer -->
    <?php include "view/layout/footer.php"; ?>

  </div>
  <!-- ./wrapper -->


  <!-- General Scripts  -->
  <?php include "includes/scripts.php"; ?>

  <!-- PAGE SPECIFY PLUGINS -->
  <!-- jQuery Mapael -->
  <script src="<?= ENDERECO; ?>/plugins/jquery-mousewheel/jquery.mousewheel.js"></script>
  <script src="<?= ENDERECO; ?>/plugins/raphael/raphael.min.js"></script>
  <script src="<?= ENDERECO; ?>/plugins/jquery-mapael/jquery.mapael.min.js"></script>
  <script src="<?= ENDERECO; ?>/plugins/jquery-mapael/maps/usa_states.min.js"></script>
  <!-- ChartJS -->
  <script src="<?= ENDERECO; ?>/plugins/chart.js/Chart.min.js"></script>
  <script src="<?= ENDERECO; ?>/dist/js/demo.js"></script>
  <script src="<?= ENDERECO; ?>/dist/js/pages/dashboard2.js"></script>
  <!-- REQUIRED SCRIPTS -->
  <script src="<?= ENDERECO; ?>/dist/js/pages/<?= $modulo; ?>.js"></script>

  <!-- DataTables -->
  <script src="<?= ENDERECO; ?>/plugins/datatables/jquery.dataTables.min.js"></script>
  <script src="<?= ENDERECO; ?>/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
  <script src="<?= ENDERECO; ?>/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
  <script src="<?= ENDERECO; ?>/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>


</body>

</html>
