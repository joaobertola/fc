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
  <script src="plugins/jquery-mousewheel/jquery.mousewheel.js"></script>
  <script src="plugins/raphael/raphael.min.js"></script>
  <script src="plugins/jquery-mapael/jquery.mapael.min.js"></script>
  <script src="plugins/jquery-mapael/maps/usa_states.min.js"></script>
  <!-- ChartJS -->
  <script src="plugins/chart.js/Chart.min.js"></script>
  <script src="dist/js/demo.js"></script>
  <script src="dist/js/pages/dashboard2.js"></script>

  <!-- REQUIRED SCRIPTS -->
  <script src="<?= ENDERECO; ?>/dist/js/pages/<?= $modulo; ?>.js"></script>

</body>

</html>
