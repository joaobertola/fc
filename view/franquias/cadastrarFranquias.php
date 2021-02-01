<!-- Topo do arquivo com os breadCrumbs -->
<!-- Inicio do card com o menu de ações -->
<?php include 'layout/card-header.php'; ?>

<!-- Conteudo do Arquivo  -->
<div class="col-12 wrap">
  <div class="card form_cad">
      <form id="" action="" class="formstyle">
        <h3 class="title">Dados da Empresa</h3>
        <div class="grid grid-2 gap-10 w-100">
          <label>
              <p>Cnpj</p>
              <input type="text" name="cnpj" class="required cnpj">
          </label>
          <label>
              <p>Funcionário responsável</p>
              <input type="text" name="funcionario_franquia" class="required funcionario_franquia">
          </label>
          <label>
              <p>Razão Social</p>
              <input type="text" name="razao_social" class="required razao_social">
          </label>
          <label>
              <p>Nome Fantasia</p>
              <input type="text" name="nome_fantasia" class="required nome_fantasia">
          </label>
          <label>
              <p>Inscrição Estadual</p>
              <input type="text" name="inscricao_estadual" class="required inscricao_estadual">
          </label>
          <label>
              <p>Inscrição Estadual (Subst. Tributária)	</p>
              <input type="text" name="i_e_tributaria" class="required i_e_tributaria">
          </label>
          <label>
              <p>Inscrição Municipal</p>
              <input type="text" name="inscricao_municipal" class="required inscricao_municipal">
          </label>
          <label>
              <p>CNAE Fiscal</p>
              <input type="text" name="cnae" class="required cnae">
          </label>
        </div>

        <h3 class="title">Endereço</h3>
        <div class="grid grid-1 w-100">
          <label>
              <p>Cep</p>
              <input type="text" name="cep" class="required cep">
          </label>
        </div>
        <div class="grid grid-2 gap-10 w-100">
          <label>
              <p>Endereço</p>
              <input type="text" name="endereco" class="required endereco">
          </label>
          <label>
              <p>Número</p>
              <input type="text" name="numero" class="required numero">
          </label>
          <label>
              <p>Complemento</p>
              <input type="text" name="complemento" class="required complemento">
          </label>
          <label>
              <p>Bairro</p>
              <input type="text" name="bairro" class="required bairro">
          </label>
          <label>
              <p>Uf</p>
              <div class="select">
                <select class="form-control select2">
                  <option>SC</option>
                  <option>RJ</option>
                  <option>RS</option>
                  <option>BE</option>
                </select>
              </div>
          </label>
          <label>
              <p>Cidade</p>
              <input type="text" name="cidade" class="required cidade">
          </label>

          <label>
              <p>Telefone</p>
              <input type="text" name="telefone" class="required telefone">
          </label>
          <label>
              <p>Celular</p>
              <input type="text" name="celular" class="required celular">
          </label>
          <label>
              <p>Telefone Residencial</p>
              <input type="text" name="telefone" class="required telefone">
          </label>
          <label>
              <p>E-mail</p>
              <input type="text" name="email" class="required email">
          </label>
          <label>
              <p>Fax</p>
              <input type="text" name="faz" class="required faz">
          </label>
        </div>

        <h3 class="title">Dados do Proprietário(s)</h3>
        
        <div class="lista_inputs w-100">
          <div class="box_inputs grid grid-2 gap-10">
            <label>
              <p>Proprietário 1</p>
              <input type="text" name="proprietario_1" class="required proprietarios">
            </label>
            <label>
              <p>Cpf</p>
              <input type="text" name="cpf_proprietario" class="required cpf_proprietarios">
            </label>
          </div>
          <span class="add_input"><i class="fas fa-plus"></i><span class="btn-toltip">Adicionar um Proprietário</span></span>
        </div>
        <div class="grid grid-2 gap-10 w-100">
          <label>
            <p>Nome do Contador</p>
            <input type="text" name="nome_contador" class="required nome_contador">
          </label>
          <label>
            <p>Telefone do Contador</p>
            <input type="text" name="tel_contador" class="required telefone">
          </label>
          <label>
            <p>Celular do Contador</p>
            <input type="text" name="cel_contador" class="required celular">
          </label>
          <label>
            <p>Celular do Contador</p>
            <input type="text" name="cel_contador" class="required celular">
          </label>

          <div class="lista_inputs">
            <div class="box_inputs grid grid-1 w-100">
              <label>
                <p>E-mail do Contador</p>
                <input type="text" name="email_contador" class="required email">
              </label>
            </div>
            <span class="add_input"><i class="fas fa-plus"></i><span class="btn-toltip">Adicionar mais um e-mail</span></span>
          </div>

          <label>
            <p>Segmento Empresarial</p>
            <input type="text" name="segmento" class="required segmento">
          </label>
          <label>
            <p>Segmento Empresarial</p>
            <input type="text" name="segmento" class="required segmento">
          </label>
          <label>
              <p>Franqueado</p>
              <div class="select">
                <select class="form-control select2">
                  <option selected disabled>Selecione a Franquia</option>
                  <option value="2">Franquia A</option>
                  <option value="2">Franquia B</option>
                  <option value="2">Franquia C</option>
                </select>
              </div>
          </label>
          <label>
              <p>Agendador</p>
              <div class="select">
                <select class="form-control select2">
                  <option selected disabled>Selecione alguma coisa</option>
                  <option value=""></option>
                  <option value=""></option>
                  <option value=""></option>
                </select>
              </div>
          </label>
          <label>
              <p>Vendedor</p>
              <div class="select">
                <select class="form-control select2">
                  <option selected disabled>Selecione alguma coisa</option>
                  <option value=""></option>
                  <option value=""></option>
                  <option value=""></option>
                </select>
              </div>
          </label>
          <label>
              <p>Origem do Cliente	</p>
              <div class="select">
                <select class="form-control select2">
                  <option selected disabled>Selecione a Origem</option>
                  <option value="1">CHECK CHECK</option>
                  <option value="2">SERASA</option>
                  <option value="3">CHECK OK</option>
                  <option value="4">CHECK EXPRESS</option>
                  <option value="5">EQUIFAX</option>
                  <option value="6">ASSOCIAÇÕES COMERCIAIS / CDLs</option>
                  <option value="7">VERICHECK</option>
                  <option value="8">AUTOFAX</option>
                  <option value="10">OUTROS</option>
                  <option value="11">NENHUM CONCORRENTE</option>
                  <option value="12">FOX CHECK</option>
                  <option value="13">TELECHECK</option>
                </select>
              </div>
          </label>
        </div>

        <h3 class="title">Tabela de Preços</h3>
        <div class="grid grid-2 gap-10 w-100">
            <label class="line_2">
              <p>Pacote Sistema Gestão</p>
              <div class="select">
                <select class="form-control select2">
                  <option selected disabled>Selecione um pacote</option>
                  <option value="1">pacote 1</option>
                  <option value="1">pacote 2</option>
                </select>
              </div>
            </label>
            <label class="line_2">
              <p>Módulo Loja Virtual E-commerce</p>
              <div class="select">
                <select class="form-control select2">
                  <option value="NULL">Nenhum</option>
                  <option value="22,50">R$ 22,50</option>
                </select>
              </div>
            </label>
            <label class="line_2">
              <p>Módulo Receber de Devedores</p>
              <div class="select">
                <select class="form-control select2">
                  <option value="NULL">Nenhum</option>
                  <option value="8,30">R$ 8,30</option>
                </select>
              </div>
            </label>
            <label class="line_2">
              <p>Módulo Consulta de Crédito	</p>
              <div class="select">
                <select class="form-control select2">
                  <option value="NULL">Nenhum</option>
                  <option value="6,50">R$ 6,50</option>
                </select>
              </div>
            </label>
            <label class="line_2">
              <p>Módulo Aumentar Clientes e Faturamento</p>
              <div class="select">
                <select class="form-control select2">
                  <option value="NULL">Nenhum</option>
                  <option value="11,40">R$ 11,40</option>
                </select>
              </div>
            </label>
            <label class="line_2">
              <p>Faturamento</p>
              <div class="select">
                <select class="form-control select2">
                  <option selected disabled>Selecione o Faturamento</option>
                  <option value="">Emissão de fatura</option>
                  <option value="">Emissão de Nota Fiscal</option>
                  <option value="">Emissão de fatura e NF</option>
                </select>
              </div>
            </label>
        </div>
        <div class="grid grid-1 w-100">
            <label>
              <p>Observações</p>
              <textarea></textarea>
            </label>
            <button class="enviar" type="submit">Incluir Cliente</button>
        </div>

      </form>
  </div>

  <div class="card dicas">
    <div class="bx">
      <h3 class="title alert"><i class="fas fa-exclamation-triangle"></i>Atenção Franquados<i class="fas fa-exclamation-triangle"></i></h3>
      <p class="text">Contratos à partir de <strong> SEGUNDA-FEIRA </strong> dia <strong>08/03/2010</strong> deverão ser enviados para a MATRIZ junto com a:</p>
      <div class="text">
        <ul>
          <li><strong>Empresas: </strong> Cópia do contrato social da empresa afiliada.</li>
          <li><strong>Profissionais Liberais:</strong> Cópia do RG, CPF e Carteira do conselho.</li>
        </ul>
      </div>
    </div>

    <div class="bx">
      <h4 class="title">Emissão de Comprovante, Consulta de dados e Roteiro de Conferência</h4>
      <div class="wrap btns">
        <a href="https://servicos.receita.fazenda.gov.br/Servicos/cnpjreva/Cnpjreva_Solicitacao.asp?cnpj=" target="_blank">Cartão CNPJ</a>
        <a href="http://dadoscadastraiscco.curitiba.pr.gov.br/frmDados.aspx" target="_blank">Alvará Prefeitura</a>
        <a href="https://webcontrolempresas.com.br/franquias/php/clientes/documentos/ROTEIRO-DE-CONFERENCIA-ATUALIZADO.pdf" target="_blank">Roteiro de Conferência</a>
      </div>
    </div>

    <div class="bx">
      <h4 class="title">Dicas</h4>
      <div class="text">
        <ul>
          <li>O cadastro é realizado apenas uma vez. Sempre que você quiser alterar alguma informação basta acessar na alteração de clientes.</li>
          <li>Depois você poderá utilizar a área restrita para modificar tabelas de preços, valores e cadastrar novos usuários.</li>
          <li>O cadastro será utilizado apenas para a prestação dos serviços, sendo mantido em caráter confidencial.</li>
        </ul>
      </div>
    </div>

  </div>
</div>