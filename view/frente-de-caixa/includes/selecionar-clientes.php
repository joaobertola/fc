<div class="form-modal">
  <h3>Selecionar Cliente</h3>

   <div class="tabs">
      <button class="btn_tabs active" data-id="1"><i class="fas fa-search"></i> Selecionar cliente</button>
      <button class="btn_tabs" data-id="2"><i class="fas fa-user-plus"></i> Cadastrar cliente</button>
   </div>

   <div class="tabs-info">
      <div id="opc-tab_1" class="opc_tabs active">

        <input id="tab-busca-cliente" type="text" placeholder="Nome/Razão Social, CPF/CNPJ, Telefone, Placa" class="input-search">
        <button id="selecionar-cliente" class="btn-search"><i class="fas fa-search"></i></button>

        <div class="lista_users">
          <div class="header-lista vendedor flex">
              <span class="nome">Nome Completo</span>
              <span class="cpf">CPF</span>
              <span class="acao text-center">Ação</span>
          </div>
          <div class="scroll-lista">
            <?php for($v=0;$v<=6;$v++){ ?>
                <div class="item wrap">
                  <span class="nome">Nome do cliente</span>
                  <span class="cfp">685.589.885-98</span>
                  <span class="wrap">
                    <i id="selecionarCleiente" class="far fa-check-square"><span class="toltip-ms">Selecionar</span></i>
                    <i data-id="<?=$v;?>" id="editarCleinte" onclick="editarCliente(this);" class="fas fa-pen"><span class="toltip-ms" >Editar cliente</span></i>
                  </span>
                  <div id="edit_<?=$v;?>" class="itens-edit">
                      <form>
                        <div class="grid-3 grid gap-10">
                          <label>
                            <p>Nome:</p>
                            <input type="text" value="Nome do ciente">
                          </label>
                          <label>
                          <p>CPF/Cnpj:</p>
                            <input type="text" value="685.589.885-98">
                          </label>
                          <label>
                          <p>Endereço:</p>
                            <input type="text" value="Rua fulano de tal">
                          </label>
                          <label>
                            <p>Telefone:</p>
                            <input type="text" value="55 41 99568-5985">
                          </label>
                          <label>
                            <p>Data de Nascimento:</p>
                            <input type="text" value="10/52/21">
                          </label>
                        </div>
                        <button class="submit"><i class="fas fa-save"></i> Salvar</button>
                      </form>
                  </div>
                </div>
            <?php } ?>
          </div>
        </div>

      </div>

      <div id="opc-tab_2" class="opc_tabs">
        <form id="cadastroRapidoCliente" action="#" method="post" class="grid grid-2 gap-10">
          <label>
            <p>Nome:</p>
            <input type="text" class="nome">
          </label>
          <label>
            <p>CPF:</p>
            <input type="text" class="cpf">
          </label>
          <label>
            <p>Telefone:</p>
            <input type="text" class="telefone">
          </label>
          <label>
            <p>E-mail:</p>
            <input type="text" class="email">
          </label>
          <button class="submit">Cadastrar Cliente</button>
        </form>
      </div>
   </div>

</div>
