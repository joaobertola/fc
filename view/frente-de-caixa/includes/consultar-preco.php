
<div class="form-modal">
  <h3>Consultar preço</h3>
    <div class="class_busca_produto flex formstyle">
        <div class="select w-30">
            <select name="localiza_pedido" id="localiza_pedido" class="form-control select2">
                <option value="pedido">Cód. Barras</option>
                <option value="classificacao">Classificação</option>
                <option value="nome">Nome / Descrição</option>
                <option value="cd_interno">Cód. interno</option>
                <option value="mesa">Kit/ Combo</option>
            </select>
        </div>
        <input id="input-consultar-preco" type="text" placeholder="" class="input-search">
        <button id="btn-cons-preco" class="btn-search"><i class="fas fa-search"></i></button>
        </div>

        <div class="lista_users">
        <div class="header-lista vendedor flex">
            <span class="w-100 mobi-none no_pedido">Código</span>
            <span class="w-100 mobi-none cod_interno"> Cód. Interno</span>
            <span class="w-100 mobi-none descricao">Nome/Descrição do Produto</span>
            <span class="w-100 classificacao">Classificação</span>
            <span class="w-100 mobi-none qtde text-center">Quantidade</span>
            <span class="w-100 preco_varejo text-right">Preço Varejo	</span>
            <span class="w-100 preco_atacado text-right">Preço Atacado</span>
        </div>
        <div class="scroll-lista" data-clone-name="listaPrecos">
            <?php for($v=0;$v<=6;$v++){ ?>
                <div id="listaPrecos<?=$v;?>" data-id="<?=$v;?>" class="item flex item-clone three">
                  <span class="w-100 clone mobi-none no_pedido">82164</span>
                  <span class="w-100 clone mobi-none cod_interno">73281</span>
                  <span class="w-100 descricao">Nome do produto ou descrição</span>
                  <span class="w-100 clone mobi-none classificacao">importado</span>
                  <span class="w-100 clone mobi-none qtde text-center">21 | Un</span>
                  <span class="w-100 preco_varejo text-right">15,35	</span>
                  <span class="w-100 preco_atacado text-right">14,85</span>
                </div>
            <?php } ?>
        </div>
    </div>

</div>
