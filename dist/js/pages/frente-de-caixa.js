// coloca o scroll da lsita de produtos da tabela no final da div
$(document).on("change","#scrollEvent", function () {
  var objDiv = objDiv.scrollTop = objDiv.scrollHeight;
});


function tabs () {
  $(document).on("click",".tabs button", function (){
    var active = $(this).hasClass("active");
    var data_id = $(this).data('id');
    if(active == false){
      $(".tabs button").removeClass("active");
      $(this).addClass("active");
    }
    $(".opc_tabs").hide();
    $("#opc-tab_"+data_id).show();
  });
}

$(document).on("click",".tipoPessoa", function () {
  var result = $('input[name="tipo_pessoa"]:checked').val();
  var url = $("#tipoPessoa").data('url');
  switch(result){
    case "Fisica":
      $("#tipoPessoa").load(url+"pessoa-fisica.php");
      console.log(url+"pessoa-fisica.php");
    break;
    case "Juridica":
      $("#tipoPessoa").load(url+"pessoa-juridica.php");
    break;
    case "estrangeiro":
      $("#tipoPessoa").load(url+"estrangeiro.php");
    break;
  }
});

$(document).on("change","#localiza_pedido", function () {
  var result = document.getElementById("localiza_pedido").value;
  switch(result){
    case "data":
      $("input#input-localizar-pedido").removeClass("cpf");
      $("input#input-localizar-pedido").addClass("date");
    break;
    case "cpf":
      $("input#input-localizar-pedido").removeClass("date");
      $("input#input-localizar-pedido").addClass("cpf");
    break;
    default:
      $("input#input-localizar-pedido").removeClass("date");
      $("input#input-localizar-pedido").removeClass("cpf");
  }
});

function editarCliente(e){
 var id_edit = $(e).data('id');
 $(e).toggleClass("fa-times");
 $("#edit_"+id_edit).toggle();
}

//Classe de Tecla de atalho
function shortKey() {
  this.key = [];
}
shortKey.prototype.add = function( aKey , aEvent, aPropagation , aID )
{
  this.key.push( new key( aKey , aEvent, aPropagation , aID ) );
}
shortKey.prototype.run = function(e){
  //Verificando no vetor todos os mapeamentos
  this.key.forEach ( function ( row , i )
  {
    if( e.keyCode === row.keyCode)
    {
      row.event(e);
      if( row.stopPropagation )
      {
        e.stopPropagation();
        e.preventDefault();
      }
      // console.log(row);
    }
  });
  console.log(e);
}

//modais.add(112,82, nomeFuncao, true);
function key( key, event, propagation, idopc) {
  this.keyCode = key;
  this.event = event;
  this.stopPropagation = propagation || false;
  this.id = idopc || null ;
  $(idopc).click( function(e) {
    event(e);
  });
}

function SelecionarVendedor(e){
  console.log('SelecionarVendedor');
  var url = $("#btn-vendedor").data('url');
  modal(url+'selecionar-vendedor.php');
}

function SelecionarCliente(e){
  var url = $("#btn-cliente").data('url');
  modal(url+'selecionar-clientes.php');
}

function buscarProduto(e){
  var url = $("#btn-buscar-produto").data('url');
  modal(url+'buscar-produto.php');
}

function localizarPedido(e){
  var url = $("#btn-localizar_pedido").data('url');
  modal(url+'localizar-pedido.php');
}

function desconto(e){
  var url = $("#btn-desconto").data('url');
  modal(url+'desconto.php');
}

function alterarItem(e){
  var url = $("#btn-alterar-item").data('url');
  modal(url+'alterar-item.php');
}

function cancelarItem(e){
  var url = $("#btn-cancelar-item").data('url');
  modal(url+'cancelar-item.php');
}

function consutarPreco(e){
  var url = $("#btn-consultar-preco").data('url');
  modal(url+'consultar-preco.php');
}

function modal(url){
  $("#body-modal").html(' ');
  $("#body-modal").load(url);
  $("#ModalActions").modal({
    show: true
  });
}

$(document).ready(function () {
  $(".loading-bg").css("display", "none");
  $(".navbar").css("display", "none");
  $("footer").css("display", "none");
  $(".layout-navbar-fixed").addClass("sidebar-collapse");
  $(".content-wrapper").css({ "margin-top": "0", "padding-bottom": "0" });

  //Evento de controle das teclas pressionadas
  //Verifique a funçãoi shortCut para maiores informações
  var modais = new shortKey();
  window.onkeydown = function(e) {
    modais.run(e);
  }
  modais.add( 112 , SelecionarVendedor , true , '#btn-vendedor');      // Tecla F1,
  modais.add( 113 , SelecionarCliente , true , '#btn-cliente');        // Tecla F2,
  modais.add( 115 , buscarProduto ,true, '#btn-buscar-produto');       // Tecla F4,
  modais.add( 116 , localizarPedido ,true, '#btn-localizar_pedido');   // Tecla F5,
  modais.add( 117 , desconto ,true, '#btn-desconto');                  // Tecla F6,
  modais.add( 118 , alterarItem ,true, '#btn-alterar-item');           // Tecla F7,
  modais.add( 119 , cancelarItem ,true, '#btn-cancelar-item');         // Tecla F8,
  modais.add( 120 , consutarPreco ,true, '#btn-consultar-preco');      // Tecla F9,

  // funções
  tabs();
});
