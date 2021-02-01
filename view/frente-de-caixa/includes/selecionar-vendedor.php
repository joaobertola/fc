<div class="form-modal">
  <h3>Selecionar vendedor</h3>

  <div class="lista_users">
     <div class="header-lista vendedor flex">
        <span class="w-60 nome">Nome Completo</span>
        <span class="w-20 cpf">CPF</span>
        <span class="w-20 acao">Ação</span>
     </div>
     <div class="scroll-lista">
       <?php for($v=0;$v<=6;$v++){ ?>
          <div class="item flex">
             <span class="w-60 nome">Nome do vendedor</span>
             <span class="w-20 cfp">685.589.885-98</span>
             <span class="w-20 acao">Selecionar</span>
          </div>
       <?php } ?>
    </div>
   </div>
</div>
