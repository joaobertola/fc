// Submit Login

$(document).on("click", "#submitlogin", function (e) {
  e.preventDefault();
  var url = $(this).data("url");
  var valida = validaForm({
    form: $("form[name='login']"),
    notValidate: true,
    validate: true,
  });
  if (valida) {
    $.ajax({
      url: url,
      type: "post",
      dataType: "json",
      data: $("#login").serialize(),
    }).done(function (e) {
      console.log(e);
      if (e.status) {
        swal({
          title: "Sucesso!",
          text: e.msg,
          icon: "success",
          button: true,
        }).then(function () {
          window.location.replace(e.endereco);
        });
      } else {
        swal("Erro!", e.msg, "error");
      }
    });
  }
});
