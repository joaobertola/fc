<h4 class="title">Informações fiscais</h4>
    <div class="grid grid-3 gap-5">
        <label>
            <p>NCM:</p>
            <input type="text">
        </label>
        <label>
            <p>Imposto Nota:</p>
            <div class="select">
                <select name="" id="" class="form-control select2">
                    <option value="">Imposto 1</option>
                    <option value="">Imposto 2</option>
                    <option value="">Imposto 3</option>
                    <option value="">Imposto 4</option>
                    <option value="">Imposto 5</option>
                    <option value="">Imposto 6</option>
                </select>
            </div>
        </label>
        <label>
            <p>NCM:</p>
            <input type="text">
        </label>
        <label>
            <p>Código ANP:</p>
            <input type="text">
        </label>
        <label>
            <p>Código Benefício / CST:</p>
            <input type="text">
        </label>
        <label class="focus-none">
            <p>Combate a pobreza:</p>
            <p class="small-input"><input type="radio" name="combate" value="">Sim</p>
            <p class="small-input"><input type="radio" name="combate" value="">Não</p>
        </label>
        <label class="focus-none">
            <p>Produto GLP:</p>
            <p class="small-input">
                <input type="radio" name="glp" value="sim" data-url="<?=$url;?>" class="produto_glp">Sim
            </p>
            <p class="small-input">
                <input type="radio" name="glp" value="nao" class="produto_glp">Não
            </p>
        </label>
    </div>
    <div id="ProdutoGlp" class="grid-3 gap-5"></div>
    <label class="tributacao focus-none">
        <p>Este produto possui <strong>TRIBUTAÇÃO ESPECIAL?</strong></p>
        <p class="small-input">
            <input type="radio" name="tributacao_especial" value="sim" data-url="<?=$url;?>" class="t_especial">Sim
        </p>
        <p class="small-input">
            <input type="radio" name="tributacao_especial" value="nao" class="t_especial">Não
        </p>
    </label>
    <div id="tributacao_especial"></div>

<h4 class="title">Cupom Fiscal</h4>
<div class="grid grid-3 gap-5">
    <label>
        <p>CFOP: (Código Fiscal de Operações e Prestações)</p>
        <div class="select">
            <select name="" id="" class="form-control select2">
                <option value="">CFOP 1</option>
                <option value="">CFOP 2</option>
                <option value="">CFOP 3</option>
            </select>
        </div>
    </label>
    <label>
        <p>Sped:</p>
        <input type="text">
    </label>
    <label>
        <p>Código Balança:</p>
        <input type="text">
    </label>
    <label>
        <p>% ICMS:</p>
        <input type="text">
    </label>
    <label>
        <p>% PIS:</p>
        <input type="text">
    </label>
    <label>
        <p>CSOSN:</p>
        <input type="text">
    </label>
    <label>
        <p>Totalizador Parcial:</p>
        <input type="text">
    </label>
</div>
<div class="grid grid-2 gap-10">
    <div class="bx">
        <h3 class="title small bg">Situação tributária</h3>
        <div class="list-inputs-block">
            <p class="small-input"><input type="radio" name="opc_" value="">T - Tributado Integralmente</p>
            <p class="small-input"><input type="radio" name="opc_" value="" class="t_especial">S - Somente Serviços</p>
            <p class="small-input"><input type="radio" name="opc_" value="" class="t_especial">I - Isento de Tributação</p>
            <p class="small-input"><input type="radio" name="opc_" value="" class="t_especial">F - Tributado por Sibstituição Tributária</p>
            <p class="small-input"><input type="radio" name="opc_" value="" class="t_especial">N - Não Tributado</p>
        </div>
    </div>
    <div class="bx">
        <h3 class="title small bg">IPPT - Indicador de Produção</h3>
        <div class="list-inputs-block">
            <p class="small-input"><input type="radio" name="opc_" value="">Próprio</p>
            <p class="small-input"><input type="radio" name="opc_" value="">Terceiro</p>
        </div>
    </div>
</div>
