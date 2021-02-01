$(function () {
  $(".loading-bg").css("display", "none");
  tabs();
  subTabs();

  var resolucao = screen.width;
  if(resolucao < 1024){cloneEvent();}

  // Start DataTable
  $(".ListaGrade").DataTable({
    responsive: true,
    autoWidth: false,
  });
});

function cloneEvent(){
  $(".item-clone").each(function(){
    var elementClone = $(this).parent().data("clone-name");
    var idIndex = $(this).data("id");
    $("#"+elementClone+idIndex).addClass("wrap");
    var itemclone = $("#"+elementClone+idIndex).find(".clone").clone();
    $("#"+elementClone+idIndex).append("<div class='item-mobi-table mobi-none'></div>");
    $("#"+elementClone+idIndex).append("<i class='fas fa-plus openTable'></i>");
    $("#"+elementClone+idIndex).find(".item-mobi-table").html(itemclone);

    $("#"+elementClone+idIndex+" .openTable").click(function(){
      $("#"+elementClone+idIndex).find(".item-mobi-table").toggleClass("mobi-none"); 
      $("#"+elementClone+idIndex).find(".item-mobi-table").toggleClass("wrap"); 
      $("#"+elementClone+idIndex).toggleClass("active"); 
      $("#"+elementClone+idIndex).find(".item-mobi-table").find("span").toggleClass("mobi-none");
    });
  });
}

$(document).on("click", ".produto_glp", function () {
  var result = $('input[name="glp"]:checked').val();
  if(result == "sim"){
    var url = $(this).data("url");
    $("#ProdutoGlp").load(url+"produtoGlp.php");
    $("#ProdutoGlp").addClass("grid");
  }
  else{
    $("#ProdutoGlp").html("");
    $("#ProdutoGlp").removeClass("grid");
  }
});

$(document).on("click", ".t_especial", function () {
  var result = $('input[name="tributacao_especial"]:checked').val();
  if(result == "sim"){
    var url = $(this).data("url");
    $("#tributacao_especial").load(url+"tributacao-especial.php");
    $("#tributacao_especial").show();
  }
  else{
    $("#tributacao_especial").html("");
    $("#tributacao_especial").hide();
  }
});

$(document).on("click", ".p_locacao", function () {
  var result = $('input[name="p_locacao"]:checked').val();
  if(result == "sim"){
    $("input.gtde_locacao").removeClass("d-none");
  }
  else{
    $("input.gtde_locacao").addClass("d-none");
  }
});

$(document).on("change","select#iptPadraoNFS",function(){
  var opcaoTributaria = $(this).val();
  if(opcaoTributaria == "IPM"){
    $("label.ipm-off").show();
    $("label.ipm").hide();
  }
  else{
    $("label.ipm-off").hide();
    $("label.ipm").show();
  }
});

$(document).on("change","select#iptIdSituacaoTributariaCOFINS",function(){
  var opcaoTributaria = $(this).find(':selected').data('opc');
 console.log(opcaoTributaria);
  if(opcaoTributaria == "cofins"){
    $(".opc-confins .confins").hide();
    $(".opc-confins .confins.conf").show();
  }
  else if(opcaoTributaria == "cofins-st"){
    $(".opc-confins .confins").hide();
    $(".opc-confins .confins.st").show();
  }
  else{
    $(".opc-confins .confins").hide();
  }
});

$(document).on("change","select#iptIdSituacaoTributariaPIS",function(){
  var opcaoTributaria = $(this).find(':selected').data('opc');
  if(opcaoTributaria == "pis"){
    $(".bx.pis label.tipo-calculo-pis").show();
  }
  else{
    $(".bx.pis label.tipo-calculo-pis").hide();
  }
});

$(document).on("change","select#iptIdSituacaoTributariaIPI",function(){
  var opcaoTributaria = $(this).val();
  if(opcaoTributaria == 1 || opcaoTributaria == 50 || opcaoTributaria == 99){
    $(".bx.ipi label.tipo-calculo").show();
  }
  else{
    $(".bx.ipi label.tipo-calculo").hide();
  }
});

$(document).on("change","select#iptIdSituacaoTibutariaProduto",function(){
  var opcaoTributaria = $(this).val();
  console.log(opcaoTributaria);
  switch(opcaoTributaria){
    case "0":
      $(".opcoes-tributarias").hide();
      $(".opcoes-tributarias label").hide();
      // icms
      $(".opcoes-tributarias.icms").show();
      $(".opcoes-tributarias .modalidade_detem").show();
      $(".opcoes-tributarias .aliquota").show();
    break;
    case "10":
      $(".opcoes-tributarias").hide();
      $(".opcoes-tributarias label").hide();
      // icms
      $(".opcoes-tributarias.icms").show();
      $(".opcoes-tributarias .modalidade_detem").show();
      $(".opcoes-tributarias .aliquota").show();
      // icms st
      $(".opcoes-tributarias.icms-st").show();
      $(".opcoes-tributarias .modalidade_detem-st").show();
      $(".opcoes-tributarias .reducao-st").show();
      $(".opcoes-tributarias .margemValor-st").show();
      $(".opcoes-tributarias .aliquota-st").show();
    break;
    case "11":
      $(".opcoes-tributarias").hide();
      $(".opcoes-tributarias label").hide();
      // icms
      $(".opcoes-tributarias.icms").show();
      $(".opcoes-tributarias .modalidade_detem").show();
      $(".opcoes-tributarias .reducao").show();
      $(".opcoes-tributarias .aliquota").show();
      $(".opcoes-tributarias .operacaoPropria").show();
      // icms st
      $(".opcoes-tributarias.icms-st").show();
      $(".opcoes-tributarias .modalidade_detem-st").show();
      $(".opcoes-tributarias .reducao-st").show();
      $(".opcoes-tributarias .margemValor-st").show();
      $(".opcoes-tributarias .aliquota-st").show();
      $(".opcoes-tributarias .uf_operacao-st").show();
    break;
    case "20":
      $(".opcoes-tributarias").hide();
      $(".opcoes-tributarias label").hide();
      // icms
      $(".opcoes-tributarias.icms").show();
      $(".opcoes-tributarias .modalidade_detem").show();
      $(".opcoes-tributarias .reducao").show();
      $(".opcoes-tributarias .aliquota").show();
    break;
    case "30":
      $(".opcoes-tributarias").hide();
      $(".opcoes-tributarias label").hide();
      // icms st
      $(".opcoes-tributarias.icms-st").show();
      $(".opcoes-tributarias .modalidade_detem-st").show();
      $(".opcoes-tributarias .reducao-st").show();
      $(".opcoes-tributarias .margemValor-st").show();
      $(".opcoes-tributarias .aliquota-st").show();
    break;
    case "40":
      $(".opcoes-tributarias").hide();
      $(".opcoes-tributarias label").hide();
      // icms
      $(".opcoes-tributarias.icms").show();
      $(".opcoes-tributarias .desoneracao").show();
      $(".opcoes-tributarias .motivo-desoneracao").show();
    break;
    case "41":
      $(".opcoes-tributarias").hide();
      $(".opcoes-tributarias label").hide();
      // icms
      $(".opcoes-tributarias.icms").show();
      $(".opcoes-tributarias .desoneracao").show();
      $(".opcoes-tributarias .motivo-desoneracao").show();
    break;
    case "42":
      $(".opcoes-tributarias").hide();
      $(".opcoes-tributarias label").hide();
      // icms st
      $(".opcoes-tributarias.icms-st").show();
      $(".opcoes-tributarias .icmst_retido_uf-st").show();
      $(".opcoes-tributarias .retidoAnteriormente-st").show();
    break;
    case "51":
      $(".opcoes-tributarias").hide();
      $(".opcoes-tributarias label").hide();
      // icms
      $(".opcoes-tributarias.icms").show();
      $(".opcoes-tributarias .modalidade_detem").show();
      $(".opcoes-tributarias .reducao").show();
      $(".opcoes-tributarias .aliquota").show();
      $(".opcoes-tributarias .diferimento").show();
    break;
    case "60":
      $(".opcoes-tributarias").hide();
      $(".opcoes-tributarias label").hide();
      // icms st
      $(".opcoes-tributarias.icms-st").show();
      $(".opcoes-tributarias .retidoAnteriormente-st").show();
    break;
    case "70":
      $(".opcoes-tributarias").hide();
      $(".opcoes-tributarias label").hide();
      // icms
      $(".opcoes-tributarias.icms").show();
      $(".opcoes-tributarias .modalidade_detem").show();
      $(".opcoes-tributarias .reducao").show();
      $(".opcoes-tributarias .aliquota").show();
      // icms st
      $(".opcoes-tributarias.icms-st").show();
      $(".opcoes-tributarias .modalidade_detem-st").show();
      $(".opcoes-tributarias .reducao-st").show();
      $(".opcoes-tributarias .margemValor-st").show();
      $(".opcoes-tributarias .aliquota-st").show();
    break;
    case "90":
      $(".opcoes-tributarias").hide();
      $(".opcoes-tributarias label").hide();
      // icms
      $(".opcoes-tributarias.icms").show();
      $(".opcoes-tributarias .modalidade_detem").show();
      $(".opcoes-tributarias .reducao").show();
      $(".opcoes-tributarias .aliquota").show();
      $(".opcoes-tributarias .operacaoPropria").show();
      // icms st
      $(".opcoes-tributarias.icms-st").show();
      $(".opcoes-tributarias .modalidade_detem-st").show();
      $(".opcoes-tributarias .reducao-st").show();
      $(".opcoes-tributarias .margemValor-st").show();
      $(".opcoes-tributarias .aliquota-st").show();
      $(".opcoes-tributarias .uf_operacao-st").show();
    break;
    case "91":
      $(".opcoes-tributarias").hide();
      $(".opcoes-tributarias label").hide();
      // icms
      $(".opcoes-tributarias.icms").show();
      $(".opcoes-tributarias .modalidade_detem").show();
      $(".opcoes-tributarias .reducao").show();
      $(".opcoes-tributarias .aliquota").show();
      // icms st
      $(".opcoes-tributarias.icms-st").show();
      $(".opcoes-tributarias .modalidade_detem-st").show();
      $(".opcoes-tributarias .reducao-st").show();
      $(".opcoes-tributarias .margemValor-st").show();
      $(".opcoes-tributarias .aliquota-st").show();
    break;
    default:
      $(".opcoes-tributarias").hide();
      $(".opcoes-tributarias label").hide();
  }
});

function tabs() {
  $(document).on("click", ".tabs button", function () {
    var active = $(this).hasClass("active");
    var data_id = $(this).data("id");
    if (active == false) {
      $(".tabs button").removeClass("active");
      $(this).addClass("active");
    }
    $(".opc_tabs").hide();
    $("#"+data_id).show();
  });
}
function subTabs() {
  $(document).on("click", ".sub-tabs span", function () {
    var active = $(this).hasClass("active");
    var data_id = $(this).data("id");
    if (active == false) {
      $(".sub-tabs span").removeClass("active");
      $(this).addClass("active");
    }
    $(".opc_subtabs").hide();
    $("#"+data_id).show();
  });
}

$(function () {
  $("#fileupload").change(function () {
      if (typeof (FileReader) != "undefined") {
          var dvPreview = $("#dvPreview");
          dvPreview.html("");
          var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.jpg|.jpeg|.gif|.png|.bmp)$/;
          $($(this)[0].files).each(function () {
              var file = $(this);
              if (regex.test(file[0].name.toLowerCase())) {
                  var reader = new FileReader();
                  reader.onload = function (e) {
                      var img = $("<img />");
                      img.attr("style", "height:100px;width: 100px");
                      img.attr("src", e.target.result);
                      dvPreview.append(img);
                  }
                  reader.readAsDataURL(file[0]);
              } else {
                  alert(file[0].name + " is not a valid image file.");
                  dvPreview.html("");
                  return false;
              }
          });
      } else {
          alert("O seu navegador não suporta esse recurso.");
      }
  });
});
