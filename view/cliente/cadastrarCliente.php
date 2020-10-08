<!-- Topo do arquivo com os breadCrumbs -->
<?php include 'layout/content-header.php'; ?>
<!-- Inicio do card com o menu de ações -->
<?php include 'layout/card-header.php'; ?>

<!-- Conteudo do Arquivo  -->
<div class="card-body" id="cardUrl" data-url="<?= ENDERECO . '/api/cliente_api.php?op=' . md5('cadastraCliente'); ?>">

  <div class="row left">
    <div class="col-3">
      <label>Tipos de Pessoa:</label>
    </div>
    <div class="col-3">
      <label class="text-dark font-weight-normal" for="PF">Pessoa Física</label>
      <input class="tipoPessoa" checked type="radio" name="tipo_pessoa" value="PF" id="PF" data-url="<?= ENDERECO; ?>/view/cliente/forms/formPF.php">
    </div>
    <div class="col-3">
      <label class="text-dark font-weight-normal" for="PJ">Pessoa Jurídica</label>
      <input class="tipoPessoa" type="radio" name="tipo_pessoa" value="PJ" id="PJ" data-url="<?= ENDERECO; ?>/view/cliente/forms/formPJ.php">
    </div>
    <div class="col-3">
      <label class="text-dark font-weight-normal" for="STR">Estrangeiro</label>
      <input class="tipoPessoa" type="radio" name="tipo_pessoa" value="STR" id="STR" data-url="<?= ENDERECO; ?>/view/cliente/forms/formSTR.php">
    </div>
  </div>

  <!-- Divisor  -->
  <hr>

  <div id="formulario-cadastro">
    <?php include "forms/formPF.php"; ?>
  </div>

</div>
<!-- /.card-body -->

<!-- Fechamento do card e da section  -->
<?php include 'layout/card-footer.php'; ?>
