<div class="bx">
    <h4 class="title bg">NF-e / NFC-e</h4>
    <div class="grid grid-1">
        <label>
            <p>CFOP:</p>
            <div class="select">
                <select name="" id="">
                    <option value="">Opção 1</option>
                    <option value="">Opção 2</option>
                    <option value="">Opção 3</option>
                </select>
            </div>
        </label>
    </div>
    <div class="box-info col-sm-12 m-left">
        <div class="sub-tabs">
            <span class="btn_tabs active" data-id="item_01">ICMS</span>
            <span class="btn_tabs" data-id="item_02">IPI</span>
            <span class="btn_tabs" data-id="item_03">PIS</span>
            <span class="btn_tabs" data-id="item_04">COFINS</span>
            <span class="btn_tabs" data-id="item_05">ISSQN</span>
            <span class="btn_tabs" data-id="item_06">OPÇÕES</span>
        </div>
        <form id="" action="" class="form-modal">
            <div id="item_01" class="opc_subtabs active">
                <?php include "./icms.php";?>
            </div>
            <div id="item_02" class="opc_subtabs">
                <?php include "./ipi.php";?>
            </div>
            <div id="item_03" class="opc_subtabs">
                <?php include "./pis.php";?>
            </div>
            <div id="item_04" class="opc_subtabs">
                <?php include "./confins.php";?>
            </div>
            <div id="item_05" class="opc_subtabs">
                <?php include "./issqn.php";?>
            </div>
            <div id="item_06" class="opc_subtabs">
                <label>
                    <p>Tributação sobre margem de lucro?</p>
                    <div class="list-inputs-block">
                        <label>
                            <input type="radio" name="glp" value="sim" class="">Sim
                        </label>
                        <label>
                            <input type="radio" name="glp" value="nao" class="">Não
                        </label>
                    </div>
                </label>
            </div>
        </form>
    </div> 
</div>