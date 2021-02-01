<div class="box-info col-sm-12 m-left">
    <div class="sub-tabs">
        <span class="btn_tabs active" data-id="item_1">Lista de grades</span>
        <span class="btn_tabs" data-id="item_2">Cadastrar Grade</span>
    </div>
    <div class="">
        <div id="item_1" class="active opc_subtabs">
            <div class="tabelaProdutosGrade">
                <div class="header-tabela padding-10 for flex">
                    <span class="w-20">Produto</span>
                    <span class="w-15 mobi-none">Código de barras</span>
                    <span class="w-10">Valor Custo</span>
                    <span class="w-10 mobi-none">Valor Varejo</span>
                    <span class="w-10 mobi-none">Valor Atacado</span>
                    <span class="w-10">Estoque Atual</span>
                    <span class="w-15 mobi-none">Estoque mínimo</span>
                    <span class="w-10">Ações</span>
                </div>
                <div class="body-tabela" data-clone-name="gradeProdutos">
                    <?php for($tab=0;$tab<=5;$tab++){ ?> 
                       <div id="gradeProdutos<?=$tab;?>" data-id="<?=$tab;?>" class="item item-clone padding-10 wrap for">
                            <span class="w-20 descricao">Banana</span>
                            <span class="w-15 clone mobi-none cod_barras">435268</span>
                            <span class="w-10 valor_custo">R$ 8,5</span>
                            <span class="w-10 clone mobi-none valor_varejo">R$ 16,5</span>
                            <span class="w-10 clone mobi-none valor_atacado">R$ 15,5</span>
                            <span class="w-10 estoque">1 | UNID</span>
                            <span class="w-15 clone mobi-none estoque_minimo">1 | UNID</span>
                            <span class="w-10 estoque">
                                <div class="flex items-actions">
                                    <i class="fas fa-pen editarGrade" title="Editar Grade"></i>
                                    <i class="fas fa-times excluirGrade" title="Excluir Grade"></i>
                                </div>
                            </span>
                        </div>
                    <?php } ?>
                </div>      
            </div>
        </div>
        <div id="item_2" class="opc_subtabs">
            <div class="grid grid-2 gap-10">
                <label>
                    <p>Característica</p>
                    <div class="select">
                        <select name="" id="" class="form-control select2">
                            <option disabled selected>Selecione a Característica</option>
                            <option value="American">American flamingo</option>
                            <option value="Andean">Andean flamingo</option>
                            <option value="Chilean">Chilean flamingo</option>
                            <option value="Greater">Greater flamingo</option>
                        </select>
                    </div>
                </label>
                <label>
                    <p>Valor</p>
                    <div class="select">
                        <select name="" id="" class="form-control select2">
                            <option disabled selected>Selecione o valor</option>
                            <option value="American">1</option>
                            <option value="Andean">10</option>
                            <option value="Chilean">100</option>
                            <option value="Greater">1000</option>
                        </select>
                    </div>
                </label>
                <div class="select multiple">
                    <select multiple size="6" class="form-control select2">
                        <option value="American">American flamingo</option>
                        <option value="Andean">Andean flamingo</option>
                        <option value="Chilean">Chilean flamingo</option>
                        <option value="Greater">Greater flamingo</option>
                        <option value="James's">James's flamingo</option>
                        <option value="Lesser">Lesser flamingo</option>
                    </select>
                    <!-- <span class="removerMultiploSelect">Remover da lista</span> -->
                </div>
            </div>
            <div class="grid grid-2 gap-10">
                <label class="focus-none">
                    <p>Margem Lucro:</p>
                    <div class="flex">
                        <div id="opc_lucro" class="opc-inputs">
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
                    <p>Código de barras</p>
                    <input type="text">
                </label>
                <label>
                    <p>Código interno</p>
                    <input type="text">
                </label>
                <label>
                    <p>Preço de Custo</p>
                    <input type="text"value="1,50"  class="money">
                </label>
                <label>
                    <p>Preço de Venda</p>
                    <input type="text" value="51,50" class="money">
                </label>
                <label>
                    <p>Preço de Atacado</p>
                    <input type="text" value="48,50" class="money">
                </label>
                <label>
                    <p>Estoque mínimo</p>
                    <input type="text">
                </label>
                <label>
                    <p>Estoque Atual</p>
                    <input type="text" value="666">
                </label>
                <label class="focus-none">
                    <p>Produto para locação:</p>
                    <div class="flex">
                        <div id="opc_lucro" class="opc-inputs">
                        <label>
                            <input type="radio" name="p_locacao" class="p_locacao" value="sim">Sim
                        </label>
                        <label>
                            <input type="radio" name="p_locacao" class="p_locacao" value="nao">Não
                        </label>
                        </div>
                        <input type="text" class="d-none gtde_locacao" placeholder="Quantidade para locação">
                    </div>
                </label>
            </div>
        </div>
    </div>
</div>
