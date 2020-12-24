<div class="Recibo">
    <div class="box-impresao grid grid-2">
        <div class="item-img wrap">
            <img src="<?=ENDERECO;?>/dist/img/logomarcas/47985.png" alt="">
        </div>
        <div class="items-rec">
            <p>WEBCONTROL EMPRESAS - CPD FANTASIA</p>
            <p>AVENIDA CANDIDO DE ABREU,70-CENTRO CiVICO</p>
            <p>CURITIBA-PR--80530000-(41) 6546-5465 / (41) 99880-7070</p>
            <p>06.866.893/0001-39</p>
        </div>
    </div><hr>
    <div class="center items-rec">
        <h3>RECIBO</h3>
    </div><hr>
    <div class="box-impresao grid grid-3">
        <div class="item">
            <p><strong>Cliente:</strong> Nome do Cliente</p>
        </div>
        <div class="item">
            <p><strong>RG:</strong> 50.458.265-6</p>
        </div>
        <div class="item">
            <p><strong>CPF/CNPJ:</strong> 158.682.996-51</p>
        </div>
    </div>
    <div class="box-impresao grid grid-1">
        <div class="item">
            <p><strong>Razão Social:</strong> Noma da razão social</p>
        </div>
    </div>
    <div class="box-impresao grid grid-3">
        <div class="item">
            <p><strong>Endereço: </strong> endereço da emrpesa do Cliente</p>
        </div>
        <div class="item">
            <p><strong>Bairro: </strong> Fazendinha PR</p>
        </div>
        <div class="item">
            <p><strong>Cidade: </strong>Cidade onde fica a empresa PR</p>
        </div>
    </div>
    <div class="box-impresao grid grid-3">
        <div class="item">
            <p><strong>Celular:</strong>(41)99685-6742</p>
        </div>
        <div class="item">
            <p><strong>Fone Residencial:</strong>(41)99685-6742</p>
        </div>
    </div><hr>
    <div class="box-impresao grid grid-2">
        <div class="item">
            <p><strong>N° Pedido: </strong>842151428</p>
        </div>
        <div class="item text-right">
            <p><strong>PRODUTO/SERVIÇO</strong></p>
        </div>
    </div><hr>
    <div class="box-impresao flex">
        <span class="w-5"><strong>N°</strong></span>
        <span class="w-45"><strong>Descrição</strong></span>
        <span class="w-5 center"><strong>Qtde</strong></span>
        <span class="w-15"><strong>V. Unitário</strong></span>
        <span class="w-15"><strong>Desconto</strong></span>
        <span class="w-15"><strong>Sub-Total</strong></span>
    </div>
    <?php for($loop=0;$loop<=4;$loop++){ ?>
        <div class="box-impresao flex">
            <span class="w-5"><p><?=$loop;?></p></span>
            <span class="w-45"><p>Descrição do produto aqui.</p></span>
            <span class="w-5 center"><p><?=$loop;?></p></span>
            <span class="w-15"><p>R$ 12,50</p></span>
            <span class="w-15"><p>R$ 0,00</p></span>
            <span class="w-15"><p>R$ 12,50</p></span>
        </div>
    <?php } ?>
    <hr>
    <div class="box-impresao flex">
        <div class="w-85"><strong>Sub-total</strong></div><hr>
        <div class="w-15"><strong>R$ 272.10</strong></div>
    </div><hr>
    <div class="box-impresao flex">
        <div class="w-85"><strong>Valor Total a Pagar</strong></div><hr>
        <div class="w-15"><strong>R$ 272.10</strong></div>
    </div><hr>
    <div class="center items-rec">
        <h5>FORMA(s) DE PAGAMENTO</h5>
    </div><hr>
    <div class="box-impresao flex">
        <span class="w-5"><strong>N°</strong></span>
        <span class="w-35"><strong>Forma de Pagamento</strong></span>
        <span class="w-20"><strong>Número</strong></span>
        <span class="w-20"><strong>Vencimento</strong></span>
        <span class="w-20"><strong>Valor</strong></span>
    </div>
    <div class="box-impresao flex">
        <span class="w-5"><p>1</p></span>
        <span class="w-35"><p>Dinheiro</p></span>
        <span class="w-20"><p>4513</p></span>
        <span class="w-20"><p>12/12/20</p></span>
        <span class="w-20"><p>R$ 350,30</p></span>
    </div><hr>
    <div class="box-impresao flex">
        <div class="w-85"><strong>Total</strong></div><hr>
        <div class="w-15"><strong>R$ 272.10</strong></div>
    </div><hr>
    <div class="box-impresao flex">
        <div class="w-85"><strong>Troco</strong></div><hr>
        <div class="w-15"><strong>R$ 0,00</strong></div>
    </div><hr>
    <div class="box-impresao flex">
        <div class="w-85"><p><strong>Atendente/Vededor:</strong> Nome do vendedor</p></div><hr>
        <div class="w-15"><p><strong>Data/Hora Venda:</strong><br>22/11/2019 09:58:20</p></div>
    </div><hr>
    <div class="box-impresao flex">
        <p><strong>Observações:</strong></p>
    </div><hr>
    <div class="box-impresao flex">
        <p><strong>Entegue:</strong></p>
    </div>
</div>