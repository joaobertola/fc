<div class="class_busca_produto formstyle flex">
    <div class="select w-30">
        <select class="form-control select2" name="iptTipoPesquisaProduto" id="iptTipoPesquisaProduto">
            <option value="1">Nome/Descrição</option>
            <option value="2">Classificação</option>
            <option value="4">Codigo Interno</option>
            <option value="5">Kit / Combo</option>
            <option value="6">Descrição Detalhada</option>
        </select>
    </div>
    <input id="tab-busca-produto" type="text" placeholder="" class="input-search">
    <button id="selecionar-produto" class="btn-search"><i class="fas fa-search"></i></button>
    </div>

    <div class="lista_users">
    <div class="header-lista vendedor flex">
        <span class="w-15 cod-barras">Cód. Barras</span>
        <span class="w-15 cpf">Cód. Interno</span>
        <span class="w-30 descricao-prod">Nome/Descrição do Produto</span>
        <span class="w-15 v-unitario text-center">V. Unitário</span>
        <span class="w-10 qtde text-center">Qtde</span>
        <span class="w-15 text-right">Classificação</span>
    </div>
    <div class="scroll-lista">
        <?php for($v=0;$v<=6;$v++){ ?>
            <div class="item flex">
            <span class="w-15 cod-barras">968421</span>
            <span class="w-15 cpf">8214329</span>
            <span class="w-30 descricao-prod">Um produto legal</span>
            <span class="w-15 v-unitario text-center">1.115,00</span>
            <span class="w-10 qtde text-center">1</span>
            <span class="w-15 text-right">XML</span>
            </div>
        <?php } ?>
    </div>
</div>