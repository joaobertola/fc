<div class="box-impressao">
    <img src="<?=ENDERECO;?>/dist/img/logomarcas/47985.png" alt="">
    <div class="center item-recibo">
        <p>WEBCONTROL EMPRESAS - CPD FANTASIA</p>
        <p>AVENIDA CANDIDO DE ABREU,70-CENTRO CiVICO</p>
        <p>CURITIBA-PR--80530000-(41) 6546-5465 / (41) 99880-7070</p>
        <p>06.866.893/0001-39</p>
    </div>
    <div class="center item-recibo">
        <p>RECIBO</p>
    </div>
    <div class="center item-recibo">
        <p>Cliente: CLIENTE BALCAO</p>
        <p>CPF/CNPJ: 00000000000</p>
        <p>Fone:</p>
        <p>Endereço: CLIENTE BALCAO,</p>
        <p>Bairro: CLIENTE BALCAO</p>
        <p>Cidade: CLIENTE BALCAO/PR</p>
    </div>
    <div class="center item-recibo">
        <div class="grid grid-3 gap-5">
            <p>Qtd x Vr UnitTotal</p>
            <p>Produto</p>
            <p class="text-right">Total</p>
        </div>
    </div>
    <?php for($prod=0;$prod<=2;$prod++){ ?>
        <div class="center flex item-recibo">
            <span class="w-70">001 2958228 ANCLA GRAN RESERVA CARBERNET SAUVI 1 x 74,0974,09</span>
            <span class="w-30 text-right">40,52</span>
        </div>
    <?php } ?>   
    <div class="grid grid-2 item-recibo">
        <p>SubTotal:</p><p class="text-right">R$ 74,09</p>
        <p>Valor a Pagar:</p><p class="text-right">R$ 74,09</p>
    </div>
    <div class="center item-recibo">
        <p>FORMA DE PAGAMENTO</p>
    </div>
    <div class="grid grid-2 item-recibo">
        <p>DINHEIRO:</p><p class="text-right"> R$: 100,00</p>
    </div>
    <div class="grid grid-2 item-recibo">
        <p>TOTAL PAGO:</p><p class="text-right"> R$: 100,00</p>
        <p>TROCO:</p><p class="text-right"> R$: 25,00</p>
    </div>
    <div class="center item-recibo">
        <p>Atendente/Vendedor: PEDRO</p>
        <p>Data/Hora Venda: 17/12/2020 - 14:15:10</p>
    </div>
    <img src="<?=ENDERECO;?>/view/frente-de-caixa/image/codigo_barra.png" alt="">
</div>