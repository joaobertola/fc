<?php

session_start();

// Arquivo com Funcoes de Banco de Dados
require "../config/database.php";
// Controller Login
require "../config/api.php";
// Arquivo com funcoes gerais do sistema
// include "../includes/functions.php";

if (!isset($_REQUEST["op"]) || empty($_REQUEST["op"])) exit;

$Op = $_REQUEST["op"];

defined("LOGIN")  || define("LOGIN",  md5("login"));
defined("LOGOUT") || define("LOGOUT", md5("logout"));

$dados = [];

// Modulo da API
$modulo = 'login';

$urlApi = API . $modulo;

$header = array();

$enderecoRetorno = ENDERECO;

// Muda de acordo com a chamada mas a maioria é post
$tpRequisicao = 'POST';

switch ($Op) {

  case LOGIN:

    $status = false;

    $msg = "Erro na tentativa de login, tente novamente mais tarde.";

    $dados = $_REQUEST;

    unset($dados['op']);

    $api = new apiConnect;

    $conteudo = $api->envia($header, $urlApi, $tpRequisicao, $dados);

    // Conexão de login é baseada no status http da requisição, então faço a tratativa de retorno
    // de acordo com isso

    if ($conteudo['status_http']  == 0) {
      // Servidor Desligado, Indisponível no momento ou, cliente sem internet
      $msg = "Não foi possível estabelecer conexão com o servidor.";
      // Será desenvolvida uma tratativa melhor pra isso na API futuramente
    } else if ($conteudo['status_http'] == 401) {
      // Erro na trativa dos dados enviados, seja por login inválido ou senha
      $msg = $conteudo['error'];
    } else if ($conteudo['status_http'] == 200) {
      // Se tudo ocorrer bem, da a mensagem de boas vindas e grava a sessão do usuário
      $_SESSION['user'] = $conteudo;
      $_SESSION['user']['start'] = time();
      // Soma o tempo de expiração do token com a hora de inicio da sessao
      $_SESSION['user']['expires_in'] += $_SESSION['user']['start'];
      // Faço uma nova chamada na API para recuperar os dados do usuário
      $urlApi = API . 'me';
      $header['Authorization'] =  "Bearer " . $_SESSION['user']['access_token'];
      $usuario = $api->envia($header, $urlApi, 'GET');
      if ($usuario['status_http'] == 200) {
        $_SESSION['user'] = array_merge($_SESSION['user'], $usuario['conteudo']);
      }
      $msg    = "Bem Vindo!";
      $status = true;
      $enderecoRetorno = $enderecoRetorno . '/home';
    }

    $retorno             = [];
    $retorno['endereco'] = $enderecoRetorno;
    $retorno['status']   = $status;
    $retorno['msg']      = $msg;

    echo json_encode($retorno);

    break;

  case LOGOUT:
    $status = false;

    $urlApi = API . 'logout';

    $UserToken = $_SESSION['user']['access_token'];

    $header['Authorization'] =  "Bearer " . $UserToken;

    $api = new apiConnect;

    $conteudo = $api->envia($header, $urlApi, $tpRequisicao, $dados);

    // Conexão de login é baseada no status http da requisição, então faço a tratativa de retorno
    // de acordo com isso

    if ($conteudo['status_http'] == 200) {
      // Destruindo a Sessao do usuário pra ele ralar peito
      $status = true;

      session_destroy();
    }

    header('Location:' . ENDERECO);

    break;

  default:
    $retorno             = [];
    $retorno['endereco'] = ENDERECO;
    $retorno['status']   = false;
    $retorno['msg']      = "Nenhuma ação definida.";

    echo json_encode($retorno);
}
