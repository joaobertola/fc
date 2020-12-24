<div class="login-frente-de-caixa" id="login-frente-de-caixa" data-api="<?= ENDERECO . '/api/frente-de-caixa_api.php'; ?>">
  <div class="box-login">
    <h3>Frente de caixa</h3>

    <form name="login-frente-de-caixa" id="login-frente-de-caixa">
      <label style="display: none;">
        <p>Selecione uma opção:</p>
        <div class="select">
          <select id="opc_caixa">
            <option value="1">Frente de caixa</option>
            <option value="2">Pedido</option>
            <option value="3">Orçamento</option>
            <option value="4">Ordem de serviço</option>
            <option value="5">Assistência técnica</option>
            <option value="6">Venda consignada</option>
            <option value="7">Locação</option>
            <option value="8">Comanda</option>
          </select>
        </div>
      </label>

      <label style="display: none;">
        <p>Selecione o usuário:</p>
        <div class="select">
          <select name="funcionario" id="selectFuncionarios">
            <option selected disabled>Selecione:</option>
          </select>
        </div>
      </label>

      <div class="addcaixa">
        <div class="flex">
          <label>
            <p>Selecione o caixa:</p>
            <div class="select">
              <select class="form-required" name="numeroCaixa" id="selectCaixa">
                <option selected disabled>Selecione:</option>
              </select>
            </div>
          </label>
          <button class="add_caixa">Adicionar caixa</button>
        </div>
        <label id="saldoInicialCaixa" style="display: none;">
          <p>Saldo inicial do caixa:</p>
          <input name="saldoInicialCaixa" type="text" class="saldo money form-required">
        </label>
        <label>
          <p>Senha:</p>
          <input name="senhaCaixa" type="password" class="senha form-required">
        </label>
      </div>
      <a id="logarCaixaAberto" class="submit">Iniciar</a>
    </form>
  </div>
</div>
