<!-- Pessoa Física  -->
<form id="cadastroClientePF" name="cadastroClientePF">
  <div class="form-row align-items-center">
    <div class="col-md-12">
      <!-- Nome -->
      <div class="form-group">
        <label>Pessoa Física:</label>
        <div class="input-group">
          <div class="input-group-prepend">
            <span class="input-group-text"><i class="fas fa-user"></i></span>
          </div>
          <input name="nome" type="text" class="form-control form-required" placeholder="Nome">
        </div>
      </div>
    </div>
  </div>
  <div class="form-row align-items-center">
    <!-- CPF  -->
    <div class="col-md-6">
      <div class="form-group">
        <div class="input-group">
          <div class="input-group-prepend">
            <span class="input-group-text"><i class="fas fa-id-card"></i></span>
          </div>
          <input name="cnpj_cpf" type="text" class="form-control cpf mask" placeholder="CPF">
        </div>
      </div>
    </div>
    <!-- RG  -->
    <div class="col-md-6">
      <div class="form-group">
        <div class="input-group">
          <div class="input-group-prepend">
            <span class="input-group-text"><i class="fas fa-address-card"></i></span>
          </div>
          <input name="rg" type="text" class="form-control rg mask" placeholder="RG">
        </div>
      </div>
    </div>
  </div>
  <div class="form-row align-items-center">
    <!-- Órgão Expedidor  -->
    <div class="col-md-6">
      <div class="form-group">
        <div class="input-group">
          <div class="input-group-prepend">
            <span class="input-group-text"><i class="fas fa-university"></i></span>
          </div>
          <input name="orgao_expedidor" type="text" class="form-control" placeholder="Órgão Expedidor">
        </div>
      </div>
    </div>
    <!-- Naturalidade  -->
    <div class="col-md-6">
      <div class="form-group">
        <div class="input-group">
          <div class="input-group-prepend">
            <span class="input-group-text"><i class="fas fa-flag"></i></span>
          </div>
          <input name="naturalidade" type="text" class="form-control" placeholder="Naturalidade">
        </div>
      </div>
    </div>
  </div>
  <div class="form-row align-items-center">
    <!-- Data de Nascimento  -->
    <div class="col-md-6">
      <div class="form-group">
        <div class="input-group">
          <div class="input-group-prepend">
            <span class="input-group-text"><i class="fas fa-calendar-alt"></i></span>
          </div>
          <input name="data_nascimento" type="date" class="form-control date mask" placeholder="Data de Nascimento">
        </div>
      </div>
    </div>
    <!-- Estado Civil  -->
    <div class="col-md-6">
      <div class="form-group">
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
    </div>
  </div>
  <div class="form-row align-items-center">
    <div class="col-md-12">
      <!-- Nome do Conjugue -->
      <div class="form-group">
        <div class="input-group">
          <div class="input-group-prepend">
            <span class="input-group-text"><i class="fas fa-user-friends"></i></span>
          </div>
          <input maxlength="50" name="nome_conjuge" type="text" class="form-control " placeholder="Nome do Cônjugue">
        </div>
      </div>
    </div>
  </div>
  <div class="form-row align-items-center">
    <div class="col-md-6">
      <!-- Inscrição Rural -->
      <div class="form-group">
        <div class="input-group">
          <div class="input-group-prepend">
            <span class="input-group-text"><i class="fas fa-tractor"></i></span>
          </div>
          <input name="inscricao_municipal" type="text" class="form-control " placeholder="Inscrição Rural">
        </div>
      </div>
    </div>
    <!-- Tipo de Residência  -->
    <div class="col-md-6">
      <div class="form-group">
        <select name="tipo_residencia" class="form-control select2" style="width: 100%;">
          <option disabled selected>Tipo de Residência</option>
          <option value="1">Alugada</option>
          <option value="2">Cedida</option>
          <option value="3">Financiada</option>
          <option value="4">Própria</option>
        </select>
      </div>
    </div>
  </div>
  <div class="form-row align-items-center">
    <div class="col-md-6">
      <!-- Nome do Pai -->
      <div class="form-group">
        <div class="input-group">
          <div class="input-group-prepend">
            <span class="input-group-text"><i class="fas fa-user"></i></span>
          </div>
          <input maxlength="50" name="nome_pai" type="text" class="form-control telefone" placeholder="Nome do Pai">
        </div>
      </div>
    </div>
    <div class="col-md-6">
      <!-- Telefone do Pai -->
      <div class="form-group">
        <div class="input-group">
          <div class="input-group-prepend">
            <span class="input-group-text"><i class="fas fa-phone-alt"></i></span>
          </div>
          <input name="telefone_pai" type="text" class="form-control telefone  mask" placeholder="Telefone do Pai">
        </div>
      </div>
    </div>
  </div>
  <div class="form-row align-items-center">
    <div class="col-md-6">
      <!-- Nome da Mãe -->
      <div class="form-group">
        <div class="input-group">
          <div class="input-group-prepend">
            <span class="input-group-text"><i class="fas fa-user"></i></span>
          </div>
          <input maxlength="50" name="nome_mae" type="text" class="form-control " placeholder="Nome da Mãe">
        </div>
      </div>
    </div>
    <div class="col-md-6">
      <!-- Telefone da Mãe -->
      <div class="form-group">
        <div class="input-group">
          <div class="input-group-prepend">
            <span class="input-group-text"><i class="fas fa-phone-alt"></i></span>
          </div>
          <input name="telefone_mae" type="text" class="form-control telefone mask" placeholder="Telefone da Mãe">
        </div>
      </div>
    </div>
  </div>
  <div class="form-row align-items-center">
    <!-- Título de Eleitor -->
    <div class="col-md-6">
      <div class="form-group">
        <div class="input-group">
          <div class="input-group-prepend">
            <span class="input-group-text"><i class="far fa-id-card"></i></span>
          </div>
          <input name="numero_titulo" type="text" class="form-control " placeholder="Título de Eleitor">
        </div>
      </div>
    </div>
    <!-- Zona -->
    <div class="col-md-3">
      <div class="form-group">
        <div class="input-group">
          <div class="input-group-prepend">
            <span class="input-group-text"><i class="fas fa-university"></i></span>
          </div>
          <input name="zona" type="text" class="form-control " placeholder="Zona">
        </div>
      </div>
    </div>
    <!-- Seção -->
    <div class="col-md-3">
      <div class="form-group">
        <div class="input-group">
          <div class="input-group-prepend">
            <span class="input-group-text"><i class="fas fa-map-pin"></i></span>
          </div>
          <input name="secao" type="text" class="form-control " placeholder="Seção">
        </div>
      </div>
    </div>
  </div>
  <div class="form-row align-items-center">
    <!-- Data Cadastro -->
    <div class="col-md-12">
      <div class="form-group">
        <div class="input-group">
          <div class="input-group-prepend">
            <span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
          </div>
          <input name="data_cadastro" type="date" class="form-control date mask" placeholder="Data Cadastro">
        </div>
      </div>
    </div>
  </div>
  <!-- Divisor  -->
  <hr>
  <!-- Foto -->
  <div class="form-row align-items-center">
    <div class="col-md-12">
      <div class="form-group">
        <label for="foto"><i class="fas fa-image"></i> Foto</label>
        <div class="input-group">
          <div class="custom-file">
            <input name="foto" type="file" class="custom-file-input" id="foto">
            <label class="custom-file-label" for="foto">Escolher Arquivo</label>
          </div>
        </div>
      </div>
      <?php
      $tamanho = explode('M', ini_get('upload_max_filesize'));
      $tamanho = $tamanho[0];
      ?>
      <span><strong>O arquivo não pode ser maior que:</strong>
        <?php echo $tamanho . 'MB'; ?>
      </span>
    </div>
  </div>
  <!-- Divisor  -->
  <hr>
  <!-- Dados de Contato  -->
  <label>Contato</label>
  <div class="form-row align-items-center">
    <!-- Telefone -->
    <div class="col-md-6">
      <div class="form-group">
        <div class="input-group">
          <div class="input-group-prepend">
            <span class="input-group-text"><i class="fas fa-phone"></i></span>
          </div>
          <input name="telefone" type="text" class="form-control telefone mask" placeholder="Telefone *">
        </div>
      </div>
    </div>
    <!-- Celular -->
    <div class="col-md-6">
      <div class="form-group">
        <div class="input-group">
          <div class="input-group-prepend">
            <span class="input-group-text"><i class="fas fa-mobile-alt"></i></span>
          </div>
          <input name="celular" type="text" class="form-control celular mask" placeholder="Celular">
        </div>
      </div>
    </div>
  </div>
  <div class="form-row align-items-center">
    <!-- Fax -->
    <div class="col-md-6">
      <div class="form-group">
        <div class="input-group">
          <div class="input-group-prepend">
            <span class="input-group-text"><i class="fas fa-fax"></i></span>
          </div>
          <input name="fax" type="text" class="form-control fax mask" placeholder="Fax">
        </div>
      </div>
    </div>
    <!-- E-mail -->
    <div class="col-md-6">
      <div class="form-group">
        <div class="input-group">
          <div class="input-group-prepend">
            <span class="input-group-text"><i class="fas fa-envelope"></i></span>
          </div>
          <input name="email" type="mail" class="form-control " placeholder="E-mail">
        </div>
      </div>
    </div>
  </div>
  <!-- Divisor  -->
  <hr>
  <!-- Endereço  -->
  <label><i class="fas fa-map-marker-alt"></i> Endereço</label>
  <div class="form-row align-items-center">
    <!-- CEP -->
    <div class="col-md-6">
      <div class="form-group">
        <div class="input-group">
          <input name="cep" type="text" class="form-control cep mask" placeholder="Cep">
        </div>
      </div>
    </div>
    <!-- Tipo de Endereço -->
    <div class="col-md-6">
      <div class="form-group">
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
    </div>
  </div>
  <div class="form-row align-items-center">
    <div class="col-md-8">
      <div class="form-group">
        <div class="input-group">
          <input name="endereco" type="text" class="form-control " placeholder="Endereço">
        </div>
      </div>
    </div>
    <!-- Número -->
    <div class="col-md-2">
      <div class="form-group">
        <div class="input-group">
          <input name="numero" type="text" class="form-control " placeholder="Número">
        </div>
      </div>
    </div>
    <!-- Complemento -->
    <div class="col-md-2">
      <div class="form-group">
        <div class="input-group">
          <input name="complemento" type="text" class="form-control " placeholder="Complemento">
        </div>
      </div>
    </div>
  </div>
  <div class="form-row align-items-center">
    <!-- Bairro  -->
    <div class="col-md-5">
      <div class="form-group">
        <div class="input-group">
          <input name="bairro" type="text" class="form-control " placeholder="Bairro">
        </div>
      </div>
    </div>
    <!-- Cidade -->
    <div class="col-md-5">
      <div class="form-group">
        <div class="input-group">
          <input name="cidade" type="text" class="form-control " placeholder="Cidade">
        </div>
      </div>
    </div>
    <!-- Estado -->
    <div class="col-md-2">
      <div class="form-group">
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
    </div>
  </div>
  <div class="form-row align-items-center">
    <!-- País -->
    <div class="col-md-12">
      <div class="form-group">
        <div class="input-group">
          <input name="pais" type="text" class="form-control " placeholder="País">
        </div>
      </div>
    </div>
  </div>
  <!-- Divisor  -->
  <hr>
  <!-- Referência  -->
  <label><i class="fas fa-chart-pie"></i> Referência</label>
  <div class="form-row align-items-center">
    <!-- Referência Comercial -->
    <div class="col-md-6">
      <div class="form-group">
        <div class="input-group">
          <input name="nome_referencia_comercial" type="text" class="form-control telefone mask" placeholder="Referência Comercial">
        </div>
      </div>
    </div>
    <!-- Telefone Referência Comercial -->
    <div class="col-md-6">
      <div class="form-group">
        <div class="input-group">
          <input name="referencia_comercial" type="text" class="form-control telefone mask" placeholder="Telefone Ref. Comercial">
        </div>
      </div>
    </div>
  </div>
  <div class="form-row align-items-center">
    <!-- Referência Pessoal -->
    <div class="col-md-6">
      <div class="form-group">
        <div class="input-group">
          <input name="nome_referencia" type="text" class="form-control " placeholder="Referência Pessoal">
        </div>
      </div>
    </div>
    <!-- Telefone Referência Pessoal -->
    <div class="col-md-6">
      <div class="form-group">
        <div class="input-group">
          <input name="referencia_pessoal" type="text" class="form-control telefone mask" placeholder="Telefone Ref. Pessoal">
        </div>
      </div>
    </div>
  </div>
  <!-- Divisor  -->
  <hr>
  <!-- Trabalho  -->
  <label><i class="fas fa-briefcase"></i> Trabalho</label>
  <div class="form-row align-items-center">
    <!-- Empresa Onde Trabalha -->
    <div class="col-md-6">
      <div class="form-group">
        <div class="input-group">
          <input name="empresa_trabalha" type="text" class="form-control " placeholder="Empresa Onde Trabalha">
        </div>
      </div>
    </div>
    <!-- Cargo -->
    <div class="col-md-6">
      <div class="form-group">
        <div class="input-group">
          <input name="cargo" type="text" class="form-control " placeholder="Cargo">
        </div>
      </div>
    </div>
  </div>
  <div class="form-row align-items-center">
    <!-- Renda Média -->
    <div class="col-md-6">
      <div class="form-group">
        <div class="input-group">
          <input name="renda_media" type="text" class="form-control money mask" placeholder="Renda Média">
        </div>
      </div>
    </div>
    <!-- Telefone Empresa -->
    <div class="col-md-6">
      <div class="form-group">
        <div class="input-group">
          <input name="telefone_empresa" type="text" class="form-control telefone mask" placeholder="Telefone Empresa">
        </div>
      </div>
    </div>
  </div>
  <div class="form-row align-items-center">
    <!-- Endereço Empresa -->
    <div class="col-md-12">
      <div class="form-group">
        <div class="input-group">
          <input name="endereco_empresa" type="text" class="form-control " placeholder="Endereço Empresa">
        </div>
      </div>
    </div>
  </div>
  <!-- Divisor  -->
  <hr>
  <!-- Vincular à PETS, equipamentos e etc  -->
  <label><i class="fas fa-building"></i> Vincular à (Pets, Equipamentos, etc)</label>
  <div id="vincularCliente">
    <div class="form-row align-items-center">
      <!-- Vincular à -->
      <div class="col-md-11">
        <div class="form-group">
          <div class="input-group">
            <div class="input-group-prepend">
              <span class="input-group-text"><i class="fas fa-plus"></i></span>
            </div>
            <input type="text" class="form-control " placeholder="Vincular à">
          </div>
        </div>
      </div>
      <div class="col-md-1">
        <a id="adicionaVincular" data-url="<?= ENDERECO; ?>/view/cliente/includes/divVincular.php" class="btn btn-block btn-success mb-3 text-white"><i class="fas fa-plus"></i></a>
      </div>
    </div>
  </div>
  <!-- Divisor  -->
  <hr>
  <!-- Vincular à Veículos  -->
  <div class="title-line d-flex align-items-center mb-3">
    <label class="mb-0"><i class="fas fa-car"></i> Vincular à Veículo</label>
    <a id="adicionaVeiculo" data-url="<?= ENDERECO; ?>/view/cliente/includes/divVincularVeiculo.php" class="btn-sm btn-block btn-success ml-3 text-white text-center w-5"><i class="fas fa-plus"></i></a>
  </div>
  <div id="vincularVeiculos">
    <!-- Divs Veículos        -->
  </div>
  <!-- Divisor  -->
  <hr>
  <!-- Vendedor/Atendente  -->
  <label><i class="fas fa-user-tie"></i> Vendedor/Atendente</label>
  <div class="form-row align-items-center">
    <!-- Vendedor -->
    <div class="col-md-6">
      <div class="form-group">
        <select class="form-control select2" style="width: 100%;">
          <option disabled selected>Selecione: </option>
          <option value="308119">PEDRO </option>
          <option value="308558">Funcionario MASTER </option>
          <option value="309199">JOAO VITOR FUNCIONARIO </option>
          <option value="309523">FUNCIONARIO ELGIN </option>
        </select>
      </div>
    </div>
  </div>
  <!-- Divisor  -->
  <hr>
  <!-- Informações Adicionais  -->
  <label><i class="fas fa-user-plus"></i> Informações Adicionais</label>
  <div class="form-row align-items-center">
    <!-- Informações Adicionais -->
    <div class="col-md-12">
      <div class="form-group">
        <textarea name="informacoes_adicionais" class="form-control" placeholder="Observações"></textarea>
      </div>
    </div>
  </div>
  <div class="form-row align-items-center">
    <!-- Limite de Crédito -->
    <div class="col-md-6">
      <div class="form-group">
        <div class="input-group">
          <div class="input-group-prepend">
            <span class="input-group-text"><i class="fas fa-money-bill-wave"></i></span>
          </div>
          <input name="limite_credito" type="text" class="form-control money mask" placeholder="Limite de Crédito">
        </div>
      </div>
    </div>
    <!-- Limite de Crédito -->
    <div class="col-md-6">
      <div class="form-group">
        Boleto/ Crediário/ Nota Promissória / Cheques / Carnê
      </div>
    </div>
  </div>
  <div class="form-row align-items-center">
    <!-- Tipo de Compras -->
    <div class="col-md-6">
      <div class="form-group">
        <select name="tipo_compra" class="form-control select2" style="width: 100%;">
          <option disabled selected>Tipo de Compra: </option>
          <option value="V">Varejo</option>
          <option value="A">Atacado</option>
        </select>
      </div>
    </div>
  </div>
  <div class="form-row align-items-center flex-row-reverse">
    <!-- Salvar  -->
    <div class="col-md-2 mb-2">
      <button type="button" data-tipo="PF" class="btn btn-block btn-success text-bold cadastraCliente">Salvar &nbsp; <i class="fas fa-save"></i></button>
    </div>
    <!-- Cancelar -->
    <div class="col-md-2 mb-2">
      <button type="button" class="btn btn-block btn-danger text-bold">Cancelar</button> </div>
  </div>


</form>
<!-- Fim Pessoa Física  -->
