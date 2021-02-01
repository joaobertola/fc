<div class="form-modal">
  <h3>Buscar  Produto</h3>

   <div class="tabs">
      <button class="btn_tabs active" data-id="1"><i class="fas fa-search"></i> Buscar Produtos</button>
      <button class="btn_tabs" data-id="2"><i class="fas fa-box-open"></i> Adicionar Produto</button>
      <button class="btn_tabs" data-id="3"><i class="fas fa-truck-loading"></i> Cadastrar Fornecedor</button>
      <button class="btn_tabs" data-id="4"><i class="fas fa-briefcase"></i> Novo Serviço</button>
      <button class="btn_tabs" data-id="5"><i class="fas fa-signal"></i> Nova Classificação</button>
   </div>

   <div id="opc-tab_1" class="opc_tabs active">
     <?php include "./busca-produto.php";?>
   </div>

   <div id="opc-tab_2" class="opc_tabs">
      <?php include "./cadastro-produto.php";?>
   </div>

   <div id="opc-tab_3" class="opc_tabs">
      <form id="cadastroProduto" action="#" method="post" class="formstyle">
          <h3>Dados pessoais</h3>
            <div class="radio w-100 grid grid-3 gap-5">
              <label class="flex">
                  <input type="radio" name="tipo_pessoa" id="iptTipoPessoaPF" value="Fisica" class="tipoPessoa">
                  <div class="floatSide">Pessoa Física</div>
              </label>
              <label class="flex">
                  <input type="radio" name="tipo_pessoa" id="iptTipoPessoaPJ" value="Juridica" class="tipoPessoa">
                  <div class="floatSide">Pessoa Jurídica</div>
              </label>
              <label class="flex">
                  <input type="radio" name="tipo_pessoa" id="iptTipoPessoaE" value="estrangeiro" class="tipoPessoa">
                  <div class="floatSide">Estranjeiro</div>
              </label>
            </div>
          <div id="tipoPessoa" class="w-100 grid grid-3 gap-5" data-url="./view/frente-de-caixa/includes/">
          </div>
          <h3>Contato</h3>
          <div class="w-100 grid grid-2 gap-10">
            <label>
              <p>Nome:</p>
              <input type="text">
            </label>
            <label>
              <p>Telefone:</p>
              <input type="text" class="telefone">
            </label>
            <label>
              <p>e-mail:</p>
              <input type="text" class="email">
            </label>
            <label>
              <p>Data de Nascimento:</p>
              <input type="text">
            </label>
          </div>
          <h3>Endereço</h3>
          <div class="w-100 grid grid-2 gap-5">
            <label>
              <p>CEP:</p>
              <input type="text">
            </label>
            <label class="ender_class">
              <label>
                <p>Endereço:</p>
                <input type="text">
              </label>
              <label>
                <p>Número:</p>
                <input type="text">
              </label>
            </label>
          </div>
          <div class="w-100 grid grid-3 gap-5">
            <label>
              <p>Complemento:</p>
              <input type="text">
            </label>
            <label>
              <p>Cidade:</p>
              <input type="text">
            </label>
            <label>
              <p>Estado:</p>
              <div class="select">
                <select class="form-control select2 select_estados" name="iptIdEstado" id="iptEstado">
                  <option value=""> Selecione</option>AC<option value="AC">AC</option>AL<option value="AL">AL</option>AM<option value="AM">AM</option>AP<option value="AP">AP</option>BA<option value="BA">BA</option>CE<option value="CE">CE</option>DF<option value="DF">DF</option>ES<option value="ES">ES</option>GO<option value="GO">GO</option>MA<option value="MA">MA</option>MG<option value="MG">MG</option>MS<option value="MS">MS</option>MT<option value="MT">MT</option>PA<option value="PA">PA</option>PB<option value="PB">PB</option>PE<option value="PE">PE</option>PI<option value="PI">PI</option>PR<option value="PR">PR</option>RJ<option value="RJ">RJ</option>RN<option value="RN">RN</option>RO<option value="RO">RO</option>RR<option value="RR">RR</option>RS<option value="RS">RS</option>SC<option value="SC">SC</option>SE<option value="SE">SE</option>SP<option value="SP">SP</option>TO<option value="TO">TO</option>EX<option value="EX">EX</option>
                </select>
              </div>
            </label>
          </div>
          <h3>Produtos</h3>
          <div class="w-100 grid grid-1">
          <span class="add_input"><p>+</p><span class="btn-toltip">Adicionar um Produto</span></span>
            <label>
              <p>Novo produto:</p>
              <input type="text">
            </label>
          </div>
          <button class="submit">Cadastrar Fornecedor</button>
      </form>
  </div>

  <div id="opc-tab_4" class="opc_tabs">
    <form id="novoServico" action="#" method="post" class="formstyle">
       <div class="w-100 grid grid-1">
          <label>
            <p>Nome do serviço:</p>
            <input type="text">
          </label>
       </div>
       <div class="w-100 grid grid-3 gap-5">
          <label>
            <p>Fornecedor:</p>
            <div class="select">
              <select name="" id="" class="form-control select2">
                <option>Fornecedor 1</option>
                <option>Fornecedor 2</option>
                <option>Fornecedor 3</option>
              </select>
            </div>
          </label>
          <label>
            <p>Classificação:</p>
            <div class="select">
              <select name="" id="" class="form-control select2"> 
                <option>Classificação 1</option>
                <option>Classificação 2</option>
                <option>Classificação 3</option>
              </select>
            </div>
          </label>
          <label>
            <p>Unidade:</p>
            <div class="select">
              <select name="" id="" class="form-control select2">
                <option>Km/h 1</option>
                <option>Tonelada 2</option>
                <option>Gramas 3</option>
              </select>
            </div>
          </label>
          <label>
            <p>Preço de Custo:</p>
            <input type="text" class="money">
          </label>
          <label>
            <p>Preço do Serviço:</p>
            <input type="text" class="money">
          </label>
          <label>
            <p>Código do Serviço:</p>
            <input type="text" class="money">
          </label>
          <label>
            <p>Alíquota:</p>
            <input type="text" class="porcent">
          </label>
          <label class="focus-none">
            <p>Situação:</p>
            <div class="block-inputs">
              <label class="focus-none">
                <input type="radio" name="status_serv" value="1">Ativar
              </label>
              <label class="focus-none">
                <input type="radio" name="status_serv" value="2">desativar
              </label>
              <label class="focus-none">
                <input type="radio" name="status_serv" value="3">Excluir
              </label>
             </div>
          </label>
          <label class="focus-none">
            <p>Mostrar na Loja Virtual:</p>
            <div class="block-inputs">
              <label class="focus-none">
                <input type="radio" name="loja_virtual" value="1">Sim
              </label>
              <label class="focus-none">
                <input type="radio" name="loja_virtual" value="2">Não
              </label>
             </div>
          </label>
       </div>
       <button class="submit">Cadastrar Serviço</button>
    </form>
  </div>

  <div id="opc-tab_5" class="opc_tabs">
    <form id="novoServico" action="#" method="post" class="formstyle">
      <div class="w-100 grid grid-1">
        <label>
          <p>Nome da Classificação:</p>
          <input type="text">
        </label>
      </div>
      <div class="w-100 grid grid-3 gap-15">
         <label class="focus-none">
            <p>Ativo:</p>
            <div class="block-inputs">
              <label class="focus-none">
                <input type="radio" name="status_class" value="1">Sim
              </label>
              <label class="focus-none">
                <input type="radio" name="status_class" value="2">Não
              </label>
             </div>
          </label>
          <label class="focus-none">
            <p>Mostrar na Loja Virtual:</p>
            <div class="block-inputs">
              <label class="focus-none">
                <input type="radio" name="loja_virtual" value="1">Sim
              </label>
              <label class="focus-none">
                <input type="radio" name="loja_virtual" value="2">Não
              </label>
             </div>
          </label>
          <label class="focus-none">
            <p>Mostrar na Comanda:</p>
            <div class="block-inputs">
              <label class="focus-none">
                <input type="radio" name="mostrar_comanda" value="1">Sim
              </label>
              <label class="focus-none">
                <input type="radio" name="mostrar_comanda" value="2">Não
              </label>
             </div>
          </label>
          <label class="focus-none">
            <p>Imagem (para uso de mesa/comanda)</p>
            <div class="block-inputs">
              <label class="focus-none">
                <input type="radio" name="mostrar_imagem" value="1">Não
              </label>
              <label class="focus-none">
                <input type="radio" name="mostrar_imagem" value="2">Banco de imagens
              </label>
              <label class="focus-none">
                <input type="radio" name="mostrar_imagem" value="3">Minhas prórpias imagens
              </label>
             </div>
          </label>
      </div>
      <div class="w-100 grid grid-1">
      <h3>Mercado livre</h3>
        <label>
          <p>Classificação:</p>
          <div class="select">
              <select name="" id="">
                <option>Km/h 1</option>
                <option>Tonelada 2</option>
                <option>Gramas 3</option>
              </select>
            </div>
        </label>
      </div>
      <button class="submit">Salvar Classificação</button>
    </form>
  </div>

</div>
