<div class="bx ipi">
    <div class="grid grid-3 gap-5">
        <label>
            <p>Situação tributária</p>
            <div class="select">
                <select id="iptIdSituacaoTributariaIPI" name="iptIdSituacaoTributariaIPI" class="form-control select2">
                    <option value="" selected="selected" disabled> Selecione </option>
                    <option value="1"> 01 - Entrada com recuperação de crédito </option>
                    <option value="2"> 02 - Entrada tributada com alíquota zero </option>
                    <option value="3"> 03 - Entrada isenta </option>
                    <option value="4"> 04 - Entrada não-tributada </option>
                    <option value="5"> 05 - Entrada imune </option>
                    <option value="6"> 06 - Entrada com suspensão </option>
                    <option value="49"> 49 - Outras entradas </option>
                    <option value="50"> 50 - Saída tributada </option>
                    <option value="51"> 51 - Saída tributada com alíquota zero </option>
                    <option value="52"> 52 - Saída isenta </option>
                    <option value="53"> 53 - Saída não-tributada </option>
                    <option value="54"> 54 - Saída imune </option>
                    <option value="55"> 55 - Saída com suspensão </option>
                    <option value="99"> 99 - Outras Saídas </option>
                </select>
            </div>
        </label>
        <label>
            <p>Classe de Enquadramento:</p>
            <input type="text">
        </label>
        <label>
            <p>Côdigo de Enquadramento:</p>
            <input type="text">
        </label>
        <label>
            <p>CNPJ do Produtos:</p>
            <input type="text" class="cpf-cnpj">
        </label>
        <label>
            <p>Côdigo do Selo de Controle:</p>
            <input type="text">
        </label>
        <label class="tipo-calculo focus-none">
            <p>Tipo de Cálculo:</p>
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