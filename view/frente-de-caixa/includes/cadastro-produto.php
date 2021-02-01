<form id="cadastroProduto" action="#" method="post" class="formstyle">
<h3>Dados do produto</h3>
<div class="w-100 grid grid-2 gap-10">
    <label>
    <p>Nome do Produto:</p>
    <input type="text">
    </label>
    <label>
    <p>Fornecedor:</p>
    <div class="select">
        <select name="" id="" class="form-control select2">
            <option value="">Fornecedor 1</option>
            <option value="">Fornecedor 2</option>
        </select>
    </div>
    </label>
    <label>
    <p>Classificação:</p>
    <div class="select">
        <select name="" id="" class="form-control select2">
            <option value="">Categoria 1</option>
            <option value="">Categoria 2</option>
        </select>
    </div>
    </label>
    <label>
    <p>Marcas:</p>
    <div class="select">
        <select name="" id="" class="form-control select2">
            <option value="">Marca 1</option>
            <option value="">Marca 2</option>
        </select>
    </div>
    </label>
</div>
<div class="w-100 grid grid-3 gap-5">
    <label>
    <p>Código de barras:</p>
    <input type="text">
    </label>
    <label>
    <p>Código interno do produto:</p>
    <input type="text">
    </label>
    <label>
    <p>Tipo da Unidade:</p>
    <div class="select">
        <select class="form-control select2" id="iptIdTipoUnidade" name="iptIdTipoUnidade">
            <option value="1">Un</option>
            <option value="2">Kilo</option>
        </select>
    </div>
    </label>
    <label>
    <p>Tipo da Unidade Tributária:</p>
    <div class="select">
        <select class="form-control select2" id="iptIdTipoUnidadeTributaria" name="iptIdTipoUnidadeTributaria">
            <option value="1">Métro</option>
            <option value="2">km</option>
            <option value="2">kmh</option>
            <option value="2">Knot</option>
        </select>
    </div>
    </label>
    <label>
    <p>Tipo da Unidade Tributária:</p>
    <div class="select">
        <select class="form-control select2" id="iptIdTipoUnidadeTributaria" name="iptIdTipoUnidadeTributaria">
            <option value="1">Métro</option>
            <option value="2">km</option>
            <option value="2">kmh</option>
            <option value="2">Knot</option>
        </select>
    </div>
    </label>
    <label>
        <p>Estoque Mínimo:</p>
        <input type="text" class="money">
    </label>
    <label>
        <p>Saldo Inicial do Estoque:</p>
        <input type="text"  class="money">
    </label>
    <label>
        <p>Preço de Custo:</p>
        <input type="text"  class="money">
    </label>
    <label>
        <p>Preço Atacado:</p>
        <input type="text" class="money">
    </label>
    <label class="focus-none">
        <p>Margem Lucro:</p>
        <div class="flex class-m-lucro">
            <div id="opc_lucro" class="opc-inputs">
            <label class="focus-none">
                <input type="radio" name="opc_lucro" value="1">Percentual
            </label>
            <label class="focus-none">
                <input type="radio" name="opc_lucro" value ="2">Em valor
            </label>
            </div>
            <input type="text" class="percent">
        </div>
    </label>
    <label class="focus-none">
        <p>Arredondar valor:</p>
        <div class="block-inputs">
        <label class="focus-none">
            <input type="radio" name="arredondar" value="1">Sim
        </label>
        <label class="focus-none">
            <input type="radio" name="arredondar" value ="2">Não
        </label>
        </div>
    </label>
</div>
    <h3>Informações fiscais</h3>
    <div class="w-100 grid grid-3 gap-5">
    <label>
        <p>NCM:</p>
        <input class="completeInput" type="text">
    </label>
    <label>
        <p>Imposto Nota:</p>
        <input class="completeInput" type="text">
    </label>
    <label>
        <p>CEST:</p>
        <input class="completeInput" type="text">
    </label>
    </div>
<button class="submit">Cadastrar Produto</button>
</form>