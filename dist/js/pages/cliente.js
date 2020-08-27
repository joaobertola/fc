$(document).ready(function () {
  // Chamo a Api pra inserir os dados
  var url = $("#clientesDataTable").data("url");

  fetch(url)
    .then((response) => {
      return response.json();
    })
    .then((data) => {
      console.log(data);
      $.each(data.conteudo, function (key, c) {
        console.log(key)

        let body = $("#bodyClientes");

        let tr = document.createElement("tr");

        body.append(tr);
      });

      $(function () {
        $("#clientesDataTable").DataTable({
          responsive: true,
          autoWidth: false,
        });
      });
    });

  // Start DataTable
});
