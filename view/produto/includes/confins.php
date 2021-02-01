<div class="opc-confins">
    <label>
        <p>Situação Tributária</p>
        <div class="select">
            <select class="form-control select2" name="iptIdSituacaoTributariaCOFINS" id="iptIdSituacaoTributariaCOFINS">
                <option value="" selected="selected"> Selecione </option>
                <option value="01" data-opc="cofins"> 01 - Operação Tributável - Base de Cálculo = Valor da Operação Alíquota Normal (Cumulativo / Não Cumulativo) </option>
                <option value="02" data-opc="cofins"> 02 - Operação Tributável - Base de Cálculo = Valor da Operação (Alíquota Diferenciada) </option>
                <option value="03" data-opc="cofins"> 03 - Operação Tributável - Base de Cálculo = Quantidade Vendida x Alíquota por Unidade de Produto </option>
                <option value="04"> 04 - Operação Tributável - Tributação Monofásica - (Aliquota Zero) </option>
                <option value="05" data-opc="cofins-st"> 05 - Operação Tributável (ST) </option>
                <option value="06"> 06 - Operação Tributável - Alíquota Zero </option>
                <option value="07"> 07 - Operação Isenta da Contribuição </option>
                <option value="08"> 08 - Operação sem Incidência da Constribuição </option>
                <option value="09"> 09 - Operação com Suspensão da Contribuição </option>
                <option value="49" data-opc="cofins"> 49 - Outras Operações de Saída </option>
                <option value="50" data-opc="cofins"> 50 - Operação com Direito a Crédito - Vinculado Exclusivamente a Receita Tributada no Mercado Interno </option>
                <option value="51" data-opc="cofins"> 51 - Operação com Direito a Crédito - Vinculada Exclusivamente a Receita Não Tributada no Mercado Interno </option>
                <option value="52" data-opc="cofins"> 52 - Operação com Direito a Crédito - Vinculada Exclusivamente a Receita de Exportação </option>
                <option value="53" data-opc="cofins"> 53 - Operação com Direito a Crédito - Vinculada a Receitas Tributadas e Não-Tributadas no Mercado Interno </option>
                <option value="54" data-opc="cofins"> 54 - Operação com Direito a Crédito - Vinculada a Receitas Tributadas no Mercado Interno e de Exportação </option>
                <option value="55" data-opc="cofins"> 55 - Operação com Direito a Crédito - Vinculada a Receitas Não - Tributadas no Mercado Interno e de Exportação </option>
                <option value="56" data-opc="cofins"> 56 - Operação com Direito a Crédito - Vinculada a Receitas Tributadas e Não-Tributadas no Mercado Interno, e de Exportação </option>
                <option value="60" data-opc="cofins"> 60 - Crédito Presumido - Operação de Aquisição Vinculada Exlusivamente a Receita Tributada no Mercado Interno </option>
                <option value="61" data-opc="cofins"> 61 - Crédito Presumido - Operação de Aquisição Vinculada Exclusivamente a Receita Não-Tributada no Mercado Interno </option>
                <option value="62" data-opc="cofins"> 62 - Crédito Presumido - Operação de Aquisição Vinculada Exclusivamente a Receita de Exportação </option>
                <option value="63" data-opc="cofins"> 63 - Crédito Presumido - Operação de Aquisição Vinculada a Receitas Tributadas e Não-Tributadas no Mercado Interno </option>
                <option value="64" data-opc="cofins"> 64 - Crédito Presumido - Operação de Aquisição Vinculada a Receitas Tributadas no Mercado Interno e de Exportação </option>
                <option value="65" data-opc="cofins"> 65 - Crédito Presumido - Operação de Aquisição Vinculada a Receitas Não-Tributadas no Mercado Interno e de Exportação </option>
                <option value="66" data-opc="cofins"> 66 - Crédito Presumido - Operação de Aquisição Vinculada a Receitas Tributadas e Não-Tributadas no Mercado Interno, e de Exportação </option>
                <option value="67" data-opc="cofins"> 67 - Crédito Presumido - Outras Operações </option>
                <option value="70" data-opc="cofins"> 70 - Operação de Aquisição sem Direito a Crédito </option>
                <option value="71" data-opc="cofins"> 71 - Operação de Aquisição com Isenção </option>
                <option value="72" data-opc="cofins"> 72 - Operação de Aquisição com Suspensão </option>
                <option value="73" data-opc="cofins"> 73 - Operação de Aquisição a Alíquota Zero </option>
                <option value="74" data-opc="cofins"> 74 - Operação de Aquisição sem Incidência da Contribuição </option>
                <option value="75" data-opc="cofins"> 75 - Operação de Aquisição por Substituição Tributária </option>
                <option value="98" data-opc="cofins"> 98 - Outras Operações de Entrada </option>
                <option value="99" data-opc="cofins"> 99 - Outras Operações </option>
            </select>
        </div>
    </label>
    <div class="confins conf">
        <h3 class="title small bg">COFINS</h3>
        <div class="grid grid-3 gap-5">
            <label class="tipo-calculo focus-none">
                <p>Alíquota:</p>
                <div class="flex ">
                    <div id="opc_lucro" class="opc-inputs ">
                        <label>
                            <input type="radio" name="opc_lucro" value="1">Percentual
                        </label>
                        <label>
                            <input type="radio" name="opc_lucro" value="2">Em valor
                        </label>
                    </div>
                    <input type="text" class="percent">
                </div>
            </label>
        </div>
    </div>
    <div class="confins st">
        <h3 class="title small bg">COFINS ST</h3>
        <label class="tipo-calculo focus-none">
            <p>Tipo de Cálculo ST:</p>
            <div class="flex ">
                <div id="opc_lucro" class="opc-inputs ">
                    <label>
                        <input type="radio" name="opc_lucro" value="1">Percentual
                    </label>
                    <label>
                        <input type="radio" name="opc_lucro" value="2">Em valor
                    </label>
                </div>
                <input type="text" class="percent">
            </div>
        </label>
    </div>
</div>