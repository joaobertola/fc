$(document).ready(function () {
  // Verifico a ação do usuário pra definir o que será utilizado deste arquivo
  var action = $(document)[0].body.getAttribute("data-action");
  // Chamo a Api pra inserir os dados

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

        $(function () {
          // Start DataTable
          $("#clientesDataTable").DataTable({
            responsive: true,
            autoWidth: false,
          });
        });

        $(".loading-bg").css("display", "none");
      });
  } else if (action == "cadastrar") {

    $(".loading-bg").css("display", "none");

  }
});
