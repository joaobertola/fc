<h4 class="title">Dados do Produto</h4>
<div class="grid grid-1 ">
    <label>
        <p>Nome do Produto:</p>
        <input type="text" placeholder="">
    </label>
</div>
<div class="grid grid-3 gap-5">
    <label>
        <p>Marcas:</p>
        <div class="select">
            <select name="id_marca" id="id_marca" class="form-control select2">
                <option value="1">Bugatti</option>
                <option value="2">Koenigsegg</option>
                <option value="3">Marrusia</option>
            </select>
        </div>
    </label>
    <label>
        <p>Fabricante:</p>
        <input type="text" id="fabricante" name="fabricante" placeholder="">
    </label>
    <label>
        <p>Tipo de unidade:</p>
        <div class="select">
            <select name="id_unidade" id="id_unidade" class="form-control select2">
                <option value="1">Kg</option>
                <option value="2">gramas</option>
                <option value="3">Un</option>
            </select>
        </div>
    </label>
    <label>
        <p>Unidade para tributar:</p>
        <div class="select">
            <select name="id_unidade_trib" id="id_unidade_trib" class="form-control select2">
                <option value="1">Kg</option>
                <option value="2">gramas</option>
                <option value="3">Un</option>
            </select>
        </div>
    </label>
    <label>
        <p>Cor do Produto:</p>
        <input id="cor" name="cor" type="text" placeholder="">
    </label>
    <label>
        <p>Tamanho do Produto:</p>
        <input id="tamanho" name="tamanho" type="text" placeholder="">
    </label>
    <label>
        <p>Código de Barras:</p>
        <input id="codigo_barra" name="codigo_barra" type="text" placeholder="">
    </label>
    <label>
        <p>Data de fabricação:</p>
        <input id="data_fabricacao" name="data_fabricacao" type="text" placeholder="">
    </label>
    <label>
        <p>Data de validade:</p>
        <input id="data_validade" name="data_validade" type="text" placeholder="">
    </label>
    <label>
        <p>Saldo Inicial do Estoque:</p>
        <input id="iptEstoqueInicial" name="iptEstoqueInicial" type="text" placeholder="" class="value">
    </label>
    <label>
        <p>Estoque Mínimo:</p>
        <input type="text" placeholder="" class="value">
    </label>
    <label>
        <p>Origem:</p>
        <div class="select">
            <select name="" id="" class="form-control select2">
                <option value="">1 Nacional</option>
                <option value="">2 internacional</option>
                <option value="">3 Etc</option>
            </select>
        </div>
    </label>
    <label class="focus-none">
        <p>Produto Para Locação?</p>
        <p class="small-input"><input type="radio" name="opc_" value="">Sim</p>
        <p class="small-input"><input type="radio" name="opc_" value="">Não</p>
    </label>
    <label class="focus-none">
        <p>Enviar para Produção?</p>
        <p class="small-input"><input type="radio" name="opc_" value="">Sim</p>
        <p class="small-input"><input type="radio" name="opc_" value="">Não</p>
    </label>
    <label class="focus-none">
        <p>Inserir por valor? ( Funciona apenas para código de barra)</p>
        <p class="small-input"><input type="radio" name="opc_" value="">Sim</p>
        <p class="small-input"><input type="radio" name="opc_" value="">Não</p>
    </label>
    <label class="focus-none">
        <p>Permitir vender estoque 0? (funciona apenas na frentede caixa)</p>
        <p class="small-input"><input type="radio" name="opc_" value="">Sim</p>
        <p class="small-input"><input type="radio" name="opc_" value="">Não</p>
    </label>
</div>
<div class="grid grid-1">
    <label>
        <p>Observação do produto:</p>
        <textarea></textarea>
    </label>
</div>