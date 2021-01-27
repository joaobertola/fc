<h4 class="title">Valores do produto</h4>
    <div class="grid grid-3 gap-5">
        <label>
            <p>Preço de custo:</p>
            <input type="text" placeholder="" class="money">
        </label>
        <label>
            <p>Preço de varejo:</p>
            <input type="text" placeholder="" class="money">
        </label>
        <label>
            <p>Preço de atacado:</p>
            <input type="text" placeholder="" class="money">
        </label>
        <label>
            <p>Margem Lucro:</p>
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
        <label>
            <p>Arredondar valor:</p>
            <div class="list-inputs-block">
                <label>
                    <input type="radio" name="arredondar" value="1">Sim
                </label>
                <label>
                <input type="radio" name="arredondar" value="2">Não
                </label>
            </div>
        </label>
    </div>
    <h4 class="title">Exclusivo para estoque</h4>
    <div class="grid grid-3 gap-5">
        <label>
            <p>Preço à Prazo:</p>
            <input type="text" class="money">
        </label>
        <label>
            <p>Preço Atacado:</p>
            <input type="text" class="money">
        </label>
    </div>