<!-- Pessoa Física  -->
<form id="cadastroClientePF" name="cadastroClientePF" class="formstyle">
  <div class="grid grid-3 gap-5 w-100">
      <!-- Nome -->
      <label>
        <p>Pessoa Física</p>
        <input name="nome" type="text">
      </label>
      <label for="">
        <p>CPF</p>
        <input name="cnpj_cpf" type="text" class="cpf mask">
      </label>
      <label>
        <p>RG</p>
        <input name="rg" type="text" class="rg mask">
      </label>
      <label>
          <p>Órgão expedidor</p>
          <input name="orgao_expedidor" type="text">
      </label>
      <label>
          <p>Naturalidade</p>
          <input name="naturalidade" type="text">
      </label>
      <label>
          <p>Data de nascimento</p>
          <input name="data_nascimento" type="date" class="date mask">
      </label>
      <label>
        <p>Estado Civil</p>
          <div class="select">
            <select name="estado_civil" class="form-control select2" style="width: 100%;">
              <option disabled selected>Estado Civil</option>
              <option value=""> Selecione </option>
              <option value="1">Solteiro</option>
              <option value="2">Casado</option>
              <option value="3">União Estável</option>
              <option value="4">Separado</option>
              <option value="5">Viúvo</option>
              <option value="6">Divorciado</option>
              <option value="7">Outros</option>
            </select>
          </div>
      </label>
      <label>
        <p>Nome do Conjugue</p>
        <input maxlength="50" name="nome_conjuge" type="text">
      </label>
      <label>
        <p>Inscrição Rural</p>
        <input name="inscricao_municipal" type="text">
      </label>
      <label>
        <p>Inscrição Rural</p>
        <div class="select">
          <select name="tipo_residencia" class="form-control select2" style="width: 100%;">
            <option disabled selected>Tipo de Residência</option>
            <option value="1">Alugada</option>
            <option value="2">Cedida</option>
            <option value="3">Financiada</option>
            <option value="4">Própria</option>
          </select>
        </div>
      </label>
      <label>
        <p>Nome do Pai</p>
        <input maxlength="50" name="nome_pai" type="text">
      </label>
      <label>
        <p>Telefone do Pai</p>
        <input name="telefone_pai" type="text" class="telefone  mask">
      </label>
      <label>
        <p>Nome da Mãe</p>
        <input maxlength="50" name="nome_mae" type="text">
      </label>
      <label>
        <p>Telefone da Mãe</p>
        <input name="telefone_mae" type="text" class="telefone mask">
      </label>
      <label>
        <p>Título de Eleitor</p>
        <input name="numero_titulo" type="text">
      </label>
      <label>
        <p>Zona</p>
        <input name="zona" type="text">
      </label>
      <label>
        <p>Seção</p>
        <input name="secao" type="text">
      </label>
      <label>
        <p>Data Cadastro</p>
        <input name="data_cadastro" type="date" class="date mask">
      </label>
      <label>
        <p><i class="fas fa-image"></i> Foto</p>
        <div class="custom-file">
          <input name="foto" type="file" class="custom-file-input" id="foto" style="display: none;">
          <label class="custom-file-label" for="foto">Escolher Arquivo</label>
        </div>
        <?php
          $tamanho = explode('M', ini_get('upload_max_filesize'));
          $tamanho = $tamanho[0];
        ?>
        <span class="notice"><strong>O arquivo não pode ser maior que:</strong>
          <?php echo $tamanho . 'MB'; ?>
        </span>
      </label>
  </div>

  <h3 class="title">Dados de contato</h3>
  <div class="grid grid-3 gap-5 w-100">
      <label>
        <p>Telefone</p>
        <input name="telefone" type="text" class="telefone mask">
      </label>
      <label>
        <p>Celular</p>
        <input name="celular" type="text" class="celular mask">
      </label>
      <label>
        <p>Fax</p>
        <input name="fax" type="text" class="fax mask">
      </label>
      <label>
        <p>E-mail</p>
        <input name="email" type="mail">
      </label>
  </div>

  <h3 class="title">Dados de Endereço</h3>
  <div class="grid grid-3 gap-5 w-100">
      <label>
        <p>Endereço</p>
        <input name="endereco" type="text">
      </label>
      <label>
        <p>CEP</p>
        <input name="cep" type="text" class="cep mask">
      </label>
      <label>
        <p>Tipo de Endereço</p>
        <div class="select">
          <select name="id_tipo_log" class="form-control select2" style="width: 100%;">
            <option disabled selected>Tipo de Endereço</option>
            <option value="1">RUA</option>
            <option value="2">AEROPORTO</option>
            <option value="3">ALAMEDA</option>
            <option value="5">AVENIDA</option>
            <option value="10">CONJUNTO</option>
            <option value="11">DISTRITO</option>
            <option value="15">FAZENDA</option>
            <option value="17">JARDIM</option>
            <option value="18">LADEIRA</option>
            <option value="19">LAGO</option>
            <option value="21">LOTEAMENTO</option>
            <option value="24">PARQUE</option>
            <option value="25">PASSARELA</option>
            <option value="26">PATIO</option>
            <option value="27">PRACA</option>
            <option value="28">QUADRA</option>
            <option value="29">RECANTO</option>
            <option value="31">RODOVIA</option>
            <option value="34">TRAVESSA</option>
            <option value="36">TREVO</option>
            <option value="39">VIA</option>
            <option value="40">VIADUTO</option>
            <option value="41">VIELA</option>
            <option value="42">VILA</option>
            <option value="43">RUA</option>
            <option value="44">BECO</option>
            <option value="45">GALERIA</option>
            <option value="46">ESTRADA</option>
            <option value="47">PARQUE</option>
            <option value="48">PONTE</option>
            <option value="50">LARGO</option>
            <option value="51">PASSAGEM</option>
            <option value="52">VIA DE PEDESTRE</option>
            <option value="53">TRAVESSA PARTICULAR</option>
            <option value="54">VEREDA</option>
            <option value="55">ESTRADA</option>
            <option value="56">RUA DE LIGACAO</option>
            <option value="57">RUA PARTICULAR</option>
            <option value="58">VEL</option>
            <option value="59">VILA</option>
            <option value="60">CAMINHO</option>
            <option value="61">ESTRADA VELHA</option>
            <option value="62">TRAVESSA</option>
            <option value="63">PRACA</option>
            <option value="64">RODOVIA</option>
            <option value="65">TERMINAL</option>
            <option value="66">POVOADO</option>
            <option value="67">LADEIRA</option>
            <option value="4">AREA</option>
            <option value="6">CAMPO</option>
            <option value="7">CHACARA</option>
            <option value="8">COLONIA</option>
            <option value="9">CONDOMINIO</option>
            <option value="12">ESPLANADA</option>
            <option value="13">ESTACAO</option>
            <option value="14">FAVELA</option>
            <option value="16">FEIRA</option>
            <option value="20">LAGOA</option>
            <option value="22">MORRO</option>
            <option value="23">NUCLEO</option>
            <option value="30">RESIDENCIAL</option>
            <option value="32">SETOR</option>
            <option value="33">SITIO</option>
            <option value="35">TRECHO</option>
            <option value="37">VALE</option>
            <option value="38">VENEDA</option>
            <option value="68">ZONA RURAL</option>
            <option value="69">SETOR</option>
          </select>
        </div>
      </label>
      <label>
        <p>Número</p>
        <input name="numero" type="text">
      </label>
      <label>
        <p>Complemento</p>
        <input name="complemento" type="text">
      </label>
      <label>
        <p>Bairro</p>
        <input name="bairro" type="text">
      </label>
      <label>
        <p>Cidade</p>
        <input name="cidade" type="text">
      </label>
      <label>
        <p>Estado</p>
        <div class="select">
          <select name="uf" class="form-control select2" style="width: 100%;">
            <option disabled selected>Estado</option>
            <option value=""> Selecione </option>
            <option value="AC">AC</option>
            <option value="AL">AL</option>
            <option value="AP">AP</option>
            <option value="AM">AM</option>
            <option value="BA">BA</option>
            <option value="CE">CE</option>
            <option value="DF">DF</option>
            <option value="ES">ES</option>
            <option value="GO">GO</option>
            <option value="MA">MA</option>
            <option value="MT">MT</option>
            <option value="MS">MS</option>
            <option value="MG">MG</option>
            <option value="PA">PA</option>
            <option value="PB">PB</option>
            <option value="PR">PR</option>
            <option value="PE">PE</option>
            <option value="PI">PI</option>
            <option value="RJ">RJ</option>
            <option value="RN">RN</option>
            <option value="RS">RS</option>
            <option value="RO">RO</option>
            <option value="RR">RR</option>
            <option value="SC">SC</option>
            <option value="SP">SP</option>
            <option value="SE">SE</option>
            <option value="TO">TO</option>
            <option value="EX">EX</option>
          </select>
        </div>
      </label>
  </div>
  <hr>

  <h3 class="title">Referência</h3>
  <div class="grid grid-3 gap-5 w-100">
    <label>
      <p>País</p>
      <input name="pais" type="text">
    </label>
    <label>
      <p>Referência Comercial</p>
      <input name="nome_referencia_comercial" type="text">
    </label>
    <label>
      <p>Telefone Referência Comercial</p>
      <input name="referencia_comercial" type="text" class="telefone mask">
    </label>
    <label>
      <p>Referência Pessoal</p>
      <input name="nome_referencia" type="text">
    </label>
    <label>
      <p>Telefone Referência Pessoal</p>
      <input name="referencia_pessoal" type="text" class="telefone mask">
    </label>
    <label>
      <p>Tipo de Compras</p>
      <div class="select">
        <select name="tipo_compra" class="form-control select2" style="width: 100%;">
          <option disabled selected>Tipo de Compra: </option>
          <option value="V">Varejo</option>
          <option value="A">Atacado</option>
        </select>
      </div>
    </label>
  </div>

  <h3 class="title">Trabalho</h3>
  <div class="grid grid-3 gap-5 w-100">
    <label>
      <p>Empresa Onde Trabalha</p>
      <input name="empresa_trabalha" type="text">
    </label>
    <label>
      <p>Cargo</p>
      <input name="cargo" type="text">
    </label>
    <label>
      <p>Renda Média</p>
      <input name="renda_media" type="text" class="money mask">
    </label>
    <label>
      <p>Telefone Empresa</p>
      <input name="telefone_empresa" type="text" class="telefone mask">
    </label>
    <label>
      <p>Endereço Empresa</p>
      <input name="endereco_empresa" type="text">
    </label>
    <label>
      <p>Limite de Crédito</p>
      <input name="limite_credito" type="text" class=" money mask">
    </label>
    
  </div>

  <div class="grid grid-1 w-100">
    <label class="focus-none">
      <p> Vincular à (Pets, Equipamentos, etc)</p>
      <div id="vincularCliente">
        <!-- Vincular à -->
        <div class="form-group">
            <input type="text"placeholder="Vincular à">
        </div>
        <a id="adicionaVincular" data-url="<?= ENDERECO; ?>/view/cliente/includes/divVincular.php" class="btn btn-block btn-success mb-3 text-white"><i class="fas fa-plus"></i></a>
      </div>
    </label>
  </div>
  
  <div class="padding-10">
    <!-- Vincular à Veículos  -->
    <div class="title-line d-flex align-items-center mb-3">
      <label class="mb-0"><i class="fas fa-car"></i> Vincular à Veículo</label>
      <a id="adicionaVeiculo" data-url="<?= ENDERECO; ?>/view/cliente/includes/divVincularVeiculo.php" class="btn-sm btn-block btn-success ml-3 text-white text-center w-5"><i class="fas fa-plus"></i></a>
    </div>
    <div id="vincularVeiculos"></div>
  </div>

  <!-- Vendedor/Atendente  -->
  <h3 class="title"> Vendedor/Atendente</h3>
  <div class="grid grid-3 gap-5 w-100">
    <!-- Vendedor -->
      <div class="select">
        <select class="form-control select2" style="width: 100%;">
          <option disabled selected>Selecione: </option>
          <option value="308119">PEDRO </option>
          <option value="308558">Funcionario MASTER </option>
          <option value="309199">JOAO VITOR FUNCIONARIO </option>
          <option value="309523">FUNCIONARIO ELGIN </option>
        </select>
      </div>
  </div>
  <br>
  <h3 class="title">Informações Adicionais</h3>
  <div class="grid grid-1 w-100">
    <label>
      <p>Informações Adicionais</p>
      <textarea name="informacoes_adicionais"></textarea>
    </label>
  </div>
  <!-- <div class="form-row align-items-center">
    <div class="col-md-6">
      <div class="form-group">
        Boleto/ Crediário/ Nota Promissória / Cheques / Carnê
      </div>
    </div>
  </div> -->
  <div class="text-right">
    <button type="button" data-tipo="PF" class="submit cadastraCliente">Salvar &nbsp; <i class="fas fa-save"></i></button>
    <!-- <button type="button" class="btn btn-block btn-danger text-bold">Cancelar</button> -->
  </div>


</form>
<!-- Fim Pessoa Física  -->
