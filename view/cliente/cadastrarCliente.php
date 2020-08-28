<!-- Topo do arquivo com os breadCrumbs -->
<?php include 'layout/content-header.php'; ?>
<!-- Inicio do card com o menu de ações -->
<?php include 'layout/card-header.php'; ?>

<!-- Conteudo do Arquivo  -->
<div class="card-body">

  <form id="cadastraCliente" name="cadastraCliente">

    <div class="form-group">
      <label>Date masks:</label>

      <div class="input-group">
        <div class="input-group-prepend">
          <span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
        </div>
        <input type="text" class="form-control" data-inputmask-alias="datetime" data-inputmask-inputformat="dd/mm/yyyy" data-mask>
      </div>
      <!-- /.input group -->
    </div>
    <!-- /.form group -->

    <!-- Date mm/dd/yyyy -->
    <div class="form-group">
      <div class="input-group">
        <div class="input-group-prepend">
          <span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
        </div>
        <input type="text" class="form-control" data-inputmask-alias="datetime" data-inputmask-inputformat="mm/dd/yyyy" data-mask>
      </div>
      <!-- /.input group -->
    </div>
    <!-- /.form group -->

    <!-- phone mask -->
    <div class="form-group">
      <label>US phone mask:</label>

      <div class="input-group">
        <div class="input-group-prepend">
          <span class="input-group-text"><i class="fas fa-phone"></i></span>
        </div>
        <input type="text" class="form-control" data-inputmask='"mask": "(999) 999-9999"' data-mask>
      </div>
      <!-- /.input group -->
    </div>
    <!-- /.form group -->

    <!-- phone mask -->
    <div class="form-group">
      <label>Intl US phone mask:</label>

      <div class="input-group">
        <div class="input-group-prepend">
          <span class="input-group-text"><i class="fas fa-phone"></i></span>
        </div>
        <input type="text" class="form-control" data-inputmask="'mask': ['999-999-9999 [x99999]', '+099 99 99 9999[9]-9999']" data-mask>
      </div>
      <!-- /.input group -->
    </div>
    <!-- /.form group -->

    <!-- IP mask -->
    <div class="form-group">
      <label>IP mask:</label>

      <div class="input-group">
        <div class="input-group-prepend">
          <span class="input-group-text"><i class="fas fa-laptop"></i></span>
        </div>
        <input type="text" class="form-control" data-inputmask="'alias': 'ip'" data-mask>
      </div>
      <!-- /.input group -->
    </div>
    <!-- /.form group -->

  </form>


</div>
<!-- /.card-body -->

<!-- Fechamento do card e da section  -->
<?php include 'layout/card-footer.php'; ?>
