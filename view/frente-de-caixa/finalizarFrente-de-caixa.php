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

    <h2 class="titulo-tabela">Resumo da venda</h2>
    <div class="info-venda grid grid-2 gap-10">
        <div class="bx">
            <strong>Total da compra:</strong>
            <strong>Desconto (R$):</strong>
            <strong>Total a pagar:</strong>
        </div>
        <div class="bx">
            <span>R$ 122,00</span>
            <span>R$ 122,00</span>
            <span class="valor">R$ 122,00</span>
        </div>
    </div>

    <h2 class="titulo-tabela">Cartão fidelidade</h2>
    <div class="info-venda fidelidade">
        <div class="grid grid-3 gap-15">
            <label>
                <p>Número do cartão:</p>
                <input type="text">
            </label>
            <label>
                <p>Cpf do cliente</p>
                <strong>125.365.552-85</strong>
            </label>
            <button class="btn- vincualr">Vincular conta</button>
        </div>
    </div>

    <h2 class="titulo-tabela">Pagamento</h2>
    <div class="info-venda grid grid-2 gap-10">
        <label>
            <p>Frete:</p>
            <input type="text" class="money">
        </label>
        <label>
            <p>Forma de pagamento:</p>
            <div class="select">
                <select name="" id="forma-pagamento">
                    <option value="a_vista">À vista</option>
                    <option value="credito">Cartão de crédito</option>
                    <option value="boleto">Boleto</option>
                    <option value="cheque">Cheque</option>
                    <option value="outos">Outros</option>
                </select>
            </div>
        </label>
        <label>
            <p>Valor recebido:</p>
            <input type="text" class="money">
        </label>
        <label id="parcela_credito" class="boxes-hide">
            <p>número de parcelas:</p>
            <div class="select">
                <select name="" id="forma-pagamento">
                    <option value="1">1x de R$ 100,00</option>
                    <option value="2">2x de R$ 50,00</option>
                    <option value="3">3x de R$ 33,35</option>
                    <option value="4">4x de R$ 25,00</option>
                </select>
            </div>
        </label>
    </div>
    <div id="credito" class="boxes-hide">
        <div class="header-parcelas grid grid-3">
            <span>Parcelas</span>
            <span>Valor da parcela</span>
            <span class="text-center">Vencimento</span>
        </div>
        <?php for($parc=0;$parc<=3;$parc++){ ?>
            <div class="lista-parcelas grid grid-3 gap-5">
                <span><?=$parc;?>x</span>
                <span>R$ 18,82</span>
                <span class="text-center"><input class="date text-center" value="12/12/12"></span>
            </div>
        <?php } ?>
    </div>
    <div id="cheque" class="boxes-hide">
        <div class="header-parcelas grid grid-1">
            <span>Informações do Cheque</span>
        </div>
        <div class="lista-cheque grid grid-3 gap-5">
            <span>
               <p>1 - N° do cheque</p>
               <input type="text">
            </span>
            <span>
               <p>Valor do cheque</p>
               <input type="text" value="12,20" class="money">
            </span>
            <span>
                <p>Vencimento</p>
                <input class="date text-center" value="12/12/12">
            </span>
        </div>
    </div>
    <div class="observacoes">
        <div class="header-parcelas grid grid-2">
            <span>Pagamentos informados</span>
            <span>Observações Gerais</span>
        </div>
        <div class="grid grid-2 gap-5">
            <textarea name="" id=""></textarea>
            <textarea name="" id=""></textarea>
        </div>
    </div>
    <button class="btn enviar">Finalizar Venda</button>
</div>