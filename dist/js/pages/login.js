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
    $('.loading-bg').css('display', 'flex');
    $.ajax({
      url: url,
      type: "post",
      dataType: "json",
      data: $("#login").serialize(),
    }).done(function (e) {
      $('.loading-bg').css('display', 'none');
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
