$(function () {
  var action = $(document)[0].body.getAttribute("data-action");

  if (action == "listar") {
    var url = $("#clientesDataTable").data("url");

    fetch(url)
      .then((response) => {
        return response.json();
      })
      .then((data) => {
        $.each(data.conteudo, function (key, c) {
          let body = $("#bodyClientes");
          let tr = document.createElement("tr");

          let codigoCliente = document.createElement("td");
          codigoCliente.append(c.id);

          let nome = document.createElement("td");
          nome.append(c.nome);

          let razaoSocial = document.createElement("td");
          razaoSocial.append(c.razao_social);

          let cpfCnpj = document.createElement("td");
          cpfCnpj.append(c.cnpj_cpf);

          let telefone = document.createElement("td");
          telefone.append(c.telefone);

          let actions = document.createElement("td");

          body.append(tr);

          tr.append(
            codigoCliente,
            nome,
            razaoSocial,
            cpfCnpj,
            telefone,
            actions
          );
        });

        // Start DataTable
        $("#clientesDataTable").DataTable({
          responsive: true,
          autoWidth: false,
        });

        $(".loading-bg").css("display", "none");
      });
  } else if (action == "cadastrar") {
    

    // Files Inputs
    bsCustomFileInput.init();

    $(".loading-bg").css("display", "none");
  }
});

// Adiciona uma nova div para vincular o cliente a alguma coisa
$(document).on("click", "#adicionaVincular", function () {
  var url = $(this).data("url");
  $.ajax({
    type: "POST",
    url: url,
    dataType: "html",
    success: function (html) {
      $("#vincularCliente").append(html);
    },
  });
});
// Deleta a Div de vinculo com alguma coisa
$(document).on("click", ".deletaVincular", function () {
  $(this).parent().parent().remove();
});

// Adiciona uma nova div para vincular o cliente a um novo veiculo
$(document).on("click", "#adicionaVeiculo", function () {
  var url = $(this).data("url");
  $.ajax({
    type: "POST",
    url: url,
    dataType: "html",
    success: function (html) {
      $("#vincularVeiculos").append(html);
    },
  });
});

// Deleta a div que vincula o cliente ao veiculo
$(document).on("click", ".deletaVeiculo", function () {
  $(this).parent().parent().remove();
});

$(document).on("change", ".tipoPessoa", function () {
  var page = $(this).attr("id");
});

$(document).on("click", "#btnImportReceita", function (e) {
  e.preventDefault();

  var cnpj = $("#cnpj").val();
  var cep = 0;

  if (cnpj != "") {
    $.ajax({
      type: "GET",
      url: "https://www.receitaws.com.br/v1/cnpj/" + cnpj,
      dataType: "json",
      success: function (data) {
        if (data != null) {
          cep = data.cep.replace(".", "");
          $("#razaoSocial").val(data.nome);
          $("#iptSocioUm").val(data.nome);
          $("#iptNomeReferenciaComercialPJ").val(data.nome);
          $("#iptFoneSocioUm").val(data.telefone);
          $("#iptTelefone").val(data.telefone);
          $("#iptNomePJ").val(data.fantasia);
          $("#dt_fundacao").val(data.abertura);
          if (data.qsa.length > 0) {
            $("#iptSocioUm").val(data.qsa[0].nome);
          }
          $("#iptCep").val(cep);
          $("#iptEndereco").val(data.logradouro);
          $("#iptNumero").val(data.numero);
          $("#iptComplemento").val(data.complemento);
          $("#iptBairro").val(data.bairro);
          $("#iptCidade").val(data.municipio);
          $("#iptIdEstado").val(data.uf);
        }
      },
    });
  }
});

$(document).on("change", ".clienteIsento", function (e) {
  e.preventDefault();
  var isento = $(this).val();
  if (isento == 0) {
    $("#inscricaoEstadual").removeAttr("disabled");
    $("#inscricaoEstadual").val("");
  } else {
    $("#inscricaoEstadual").attr("disabled", "disabled");
    $("#inscricaoEstadual").val("ISENTO");
  }
});

$(document).on("click", ".cadastraCliente", function () {
  var formPessoa = $(this).data("tipo");
  var nameForm = "cadastroCliente" + formPessoa;
  var dados = new FormData($("form[name='" + nameForm + "']")[0]);
  var url = $("#cardUrl").data("url");
  var valida = validaForm({
    form: $("form[name='" + nameForm + "']"),
    notValidate: true,
    validate: true,
  });

  if (valida) {
    $.ajax({
      type: "POST",
      url: url,
      data: dados,
      dataType: "json",
      processData: false,
      contentType: false,
      success: function (response) {
        if (response.status) {
          Swal.fire({
            title: "Sucesso!",
            text: response.msg,
            icon: "success",
            timer: 1000,
            buttons: false,
          }).then(function () {
            window.location.reload();
          });
        } else {
          Swal.fire("Erro!", response.msg, "error");
        }
      },
    });
  }
});

// Change Form
$(document).on("change", ".tipoPessoa", function (e) {
  e.preventDefault();
  var url = $(this).data("url");

  fetch(url)
    .then(function (response) {
      return response.text();
    })
    .then(function (formCadastro) {
      $("#formulario-cadastro").html(formCadastro);
      //Initialize Select2 Elements
      $(".select2").select2();
      //Initialize Select2 Elements
      $(".select2bs4").select2({
        theme: "bootstrap4",
      });
      // Files Inputs
      bsCustomFileInput.init();
    });
});
