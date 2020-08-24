<?php
session_start();

// Verificamos se o usuário está logado
if (!isset($_SESSION['user']) || empty($_SESSION['user'])) {

  header("location:" . ENDERECO . "/login");
} else {

  // Defino os dados do usuário pra serem usados ao longo do acesso
  $idUsuario     = $_SESSION['user']['idusuario'];
  $nomeUsuario   = $_SESSION['user']['nome'];
  $emailUsuario  = $_SESSION['user']['email'];
  $imagemUsuario = !empty($_SESSION['user']['imagem']) ? '<img src="' . ENDERECO . '/usuario/files/imagem/' . $_SESSION['user']['imagem'] . '" class="img-profile rounded-circle"/>' : '<i class="text-primary far fa-user-circle fa-2x"></i>';

  // Arquivo que definirá o destino do usuário com base na Url
  require "rotas.php";
}
