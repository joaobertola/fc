<div class="header-frente-de-caixa d-flex">
  <div id="btn-vendedor" class="bx btn-vendedor" data-url="<?=$url;?>">
    <p><span class="btn-info-action">F1</span> <strong>Vendedor:</strong>Júlio Cezar</p>
  </div>
  <div id="btn-cliente" class="bx btn-cliente" data-url="<?=$url;?>">
    <p><span class="btn-info-action">F2</span> <strong>Cliente:</strong>Hipócritas de cross</p>
  </div>
  <div class="bx btn-usuario">
    <p><strong>Usuário:</strong> Misael Serafim</p>
  </div>
  <div class="bx btn-caixa">
    <p><strong>Caixa:</strong>003</p>
  </div>
</div>

<div class="tablea-finalizar">

    <h2 class="titulo-tabela">Detalhe do pedido</h2>
    <div class="info-venda grid grid-2 gap-10">
        <div class="bx">
            <strong>Número do pedido:</strong>
            <strong>Data/Hora do pedido:</strong>
            <strong>CPF/CNPJ - Cliente:</strong>
            <strong>Funcionário:</strong>
        </div>
        <div class="bx">
            <span>52396</span>
            <span>15/12/2020 | 11:53:58</span>
            <span>31488431 - cliente balcão</span>
            <span>Pedro</span>
        </div>
    </div>

    <h2 class="titulo-tabela">Produto e serviço</h2>
    <div class="lista-items">
        <div class="item-header flex">
            <span class="w-5">N°</span>
            <span class="w-35">descrição</span>
            <span class="w-10 text-center">Qtde</span>
            <span class="w-10 ">V. Unit</span>
            <span class="w-10 text-center">Desconto</span>
            <span class="w-20 text-center">Total</span>
            <span class="w-10">CFOP</span>
        </div>
        <?php for($prod=0;$prod<=3;$prod++){?>
            <div class="lista-produto item flex">
                <span class="w-5"><?=$prod;?></span>
                <span class="w-35">Nome do produto</span>
                <span class="w-10 text-center">1</span>
                <span class="w-10">1.200,00</span>
                <span class="w-10 text-center">00,00</span>
                <span class="w-20 text-center">12.200,00</span>
                <span class="w-10">
                    <div class="select">
                        <select name="" id="">
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                            <option>6</option>
                        </select>
                    </div>
                </span>
            </div>
        <?php } ?>
        <div class="sub-total text-right">
            <p><strong>Subtotal:</strong> R$ 78,50</p>
            <p><strong>Valor total a pagar:</strong> R$ 2.078,50</p>
        </div>
    </div>

    <h2 class="titulo-tabela">Forma de Pagamento</h2>
    <div class="lista-items">
        <div class="item-header flex">
            <span class="w-5">N°</span>
            <span class="w-25">Forma Pagamento</span>
            <span class="w-20 text-center">Credenciadora</span>
            <span class="w-10 ">Cod. Autorização</span>
            <span class="w-10 text-center">Número</span>
            <span class="w-20 text-center">Vencimento</span>
            <span class="w-10">Valor</span>
        </div>
        <?php for($prod=0;$prod<=3;$prod++){?>
            <div class="lista-produto item flex">
            <span class="w-5"><?=$prod;?></span>
            <span class="w-25">Dinheiro</span>
            <span class="w-20 text-center">418323</span>
            <span class="w-10 ">666999666</span>
            <span class="w-10 text-center">152362555</span>
            <span class="w-20 text-center">12/12/21</span>
            <span class="w-10">18.52,22</span>
            </div>
        <?php } ?>
        <div class="sub-total text-right">
            <p><strong>Subtotal:</strong> R$ 78,50</p>
            <p><strong>Valor total a pagar:</strong> R$ 2.078,50</p>
        </div>
    </div>

    <h2 class="titulo-tabela">Impressões</h2>
    <div class="btns-impressoes wrap">
        <button data-arquivo="reciboTermica" class="btn">Imprimir Recibo (Térmica)</button>
        <button class="btn">Imprimir Recibo</button>
        <button data-arquivo="semValorFiscal" class="btn">Imprimir Sem valor Fiscal</button>
        <button class="btn">Solicitar NF do consumidor</button>
        <button  data-toggle="modal" data-target="#SolicitatNotaEletronica" class="btn">Solicitar NF eletrônica</button>
        <button data-arquivo="pedidoProducao" class="btn">Imprimir Produção</button>
    </div>
</div>

<div id="print_impressao">
    <?php //include "/impressoes/recibo.php"; ?> 
</div>

<div id="SolicitatNotaEletronica" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="Modais" aria-hidden="true">
  <div class="modal-dialog modal-lg position-relative">
    <div class="modal-content padding-30">
      <div id="btn-sair" class="text-right"><p><span class="btn-info-action">FSC</span>Cancelar</p></div>
        <div class="form-modal">
          <h3>Emissão de Nota Fiscal Eletrônica - NFe</h3>
            <form method="post">
              <div class="grid grid-3 gap-5">
                <div  class="select">
                  <p>Indicador de presença:</p>
                  <select name="" id="">
                      <option value="pedido">Cód. Barras</option>
                      <option value="classificacao">Classificação</option>
                      <option value="nome">Nome / Descrição</option>
                      <option value="cd_interno">Cód. interno</option>
                      <option value="mesa">Kit/ Combo</option>
                  </select>
                </div>
                <div  class="select">
                  <p>Forma Pagamento:</p>
                  <select name="" id="">
                      <option value="">Fiado</option>
                      <option value="">Dinheiro</option>
                      <option value="">Crédito</option>
                  </select>
                </div>
                <div  class="select">
                  <p>Tipo Operação:</p>
                  <select name="" id="">
                      <option value="">Operação</option>
                      <option value="">Operação 2</option>
                      <option value="">Operação 3</option>
                  </select>
                </div>
                <div  class="select">
                  <p>Consumidor Final:</p>
                  <select name="" id="">
                      <option value="">Sim</option>
                      <option value="">Não</option>
                  </select>
                </div>
                <label>
                    <p>Natureza da Operação:</p>
                    <input type="text" value="Venda de mercadoria">
                </label>
                <label>
                    <p>Data Saída Mercadoria:</p>
                    <input type="text" value="12/12/20">
                </label>
                <label>
                    <p>Hora Saída Mercadoria:</p>
                    <input type="text" value="16:41:05">
                </label>
                <label>
                    <p>Quantidade de Volumes:</p>
                    <input type="text" value="1">
                </label>
                <label>
                    <p>Espécie:</p>
                    <input type="text" value="Caixa grande">
                </label>
                <label>
                    <p>Numeração:</p>
                    <input type="text">
                </label>
                <div  class="select">
                  <p>Frete por Conta de:</p>
                  <select name="" id="">
                      <option value="">Sem frete</option>
                      <option value="">frete 2</option>
                      <option value="">frete 3</option>
                  </select>
                </div>
                <label>
                    <p>Valor do Frete:</p>
                    <input type="text" value="0.00" disabled>
                </label>
                <div  class="select">
                  <p>Transportadora:</p>
                  <select name="" id="" disabled>
                      <option value="">Sem frete</option>
                      <option value="">frete 2</option>
                      <option value="">frete 3</option>
                  </select>
                </div>
                <div  class="select">
                  <p>Placa:</p>
                  <select name="" id="" disabled>
                      <option value="">Sem placa</option>
                      <option value="">placa 2</option>
                      <option value="">placa 3</option>
                  </select>
                </div>
                <label>
                    <p>Peso Liquido:</p>
                    <input type="text">
                </label>
                <label>
                    <p>Outras Despesas:</p>
                    <input type="text">
                </label>
              </div>
             <div class="grid grid-1">
              <label>
                  <p>Observações da Venda:</p>
                  <input type="text">
                </label>
              </div>
              <button class="submit">Geral Nota</button>
            </form>
        </div>
      </div>
    </div>
  </div>
</div>
