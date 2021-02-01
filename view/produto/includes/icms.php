<div class="grid grid-2 gap-5">
    <label>
        <p>Regime Fiscal:</p>
        <div class="select">
            <select name="" id="" class="form-control select2">
                <option value="">Regime nacional </option>
                <option value="">Outra opção</option>
                <option value="">Aqui mais uma opção</option>
                <option value="">E outra</option>
                <option value="">E mais uma</option>
            </select>
        </div>
    </label>
    <label>
        <p>Origem do Produto:</p>
        <div class="select">
            <select name="" id="" class="form-control select2">
                <option value="">Carga roubada </option>
                <option value="">Saquamento de mercado</option>
                <option value="">Carreta tombada</option>
                <option value="">outras opções</option>
            </select>
        </div>
    </label>
</div>
<div class="grid grid-1">
    <label>
        <p>Situação Tributária:</p>
        <div class="select">
            <select class="form-control select2" name="iptIdSituacaoTibutariaProduto" id="iptIdSituacaoTibutariaProduto">
                <option value="" selected="selected"> Selecione o Situação Tributária </option>
                <option value="0">0 - Tributada integralmente</option>
                <option value="10">10 - Tributada com cobrança do ICMS por ST</option>
                <option value="11">10 - Tributada com cobrança do ICMS por ST (com partilha do ICMS entre a UF de origem e a UF de destino ou a UF definida na legislação)</option>
                <option value="20">20 - Com  redução da base de cálculo</option>
                <option value="30">30 - Isenta ou não tributada e com cobrança do ICMS por ST</option>
                <option value="40">40 - Isenta</option>
                <option value="41">41 - Não Tributada</option>
                <option value="42">41 - Não Tributada (ICMSST devido para a UF de destino, nas operações interestaduais de produtos que tiverem retenção antecipada de ICMS por ST na UF do remetente)</option>
                <option value="50">50 - Suspensão</option>
                <option value="51">51 - Deferimento</option>
                <option value="60">60 - Cobrado anteriormente por ST</option>
                <option value="70">70 - Com redução da base de cálculo e cobrança do ICMS por ST</option>
                <option value="90">90 - Outras (com partilha do ICMS entre a UF de origem e a UF de destino ou a UF definida na legislação)</option>
                <option value="91">90 - Outras</option>
            </select>
        </div>
    </label>
    <div id="situacaoTributaria">
        <?php include "./situacao-tributaria.php";?>
    </div>
</div>