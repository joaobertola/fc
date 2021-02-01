<?php

// Arquivo com Funcoes de Banco de Dados
require "../config/database.php";
// Controller Login
require "../config/api.php";
// Arquivo Verifica Sessao
include "../includes/verifica.php";
// Instancia a calsse da API
include_once '../config/api.php';

$requestData = json_decode(file_get_contents('php://input'), true);

echo '<pre>';
var_dump($requestData, $_REQUEST);
exit;

if (!isset($requestData["op"]) || empty($requestData["op"])) exit;

$Op = $requestData["op"];

defined("CONFIG_FRENTE_CAIXA") || define("CONFIG_FRENTE_CAIXA",  "configFrenteCaixa");
defined("VERIFICA_CAIXA_ABERTO") || define("VERIFICA_CAIXA_ABERTO",  "verificaCaixaAberto");
defined("LOGIN_FRENTE_CAIXA") || define("LOGIN_FRENTE_CAIXA",  "loginFrenteCaixa");

$header['Authorization'] = $Authorization;

switch ($Op) {

  case CONFIG_FRENTE_CAIXA:

    $status = false;

    $conteudo = [];

    $api = new ApiConnect();

    $urlApi = API . 'cadastro/config-frente-caixas';

    $retorno = $api->envia($header, $urlApi, 'GET');

    if ($retorno["status_http"] == 200) {
      $conteudo = $retorno["conteudo"];
    }

    echo json_encode($conteudo);

    break;

  case VERIFICA_CAIXA_ABERTO:

    $status = false;

    $msg = "Caixa não localizado.";

    $conteudo = [];

    $api = new ApiConnect();

    if (isset($requestData["numeroCaixa"]) && !empty($requestData["numeroCaixa"])) {

      $numeroCaixa = $requestData["numeroCaixa"];

      $urlApi = API . 'frente-caixa/' . $numeroCaixa;

      $retorno = $api->envia($header, $urlApi, 'GET');

      if ($retorno["status_http"] == 200) {
        if ($retorno['conteudo']['id_operador'] == $_SESSION['user']['id'] || $retorno['conteudo']['id_operador'] == 0) {
          $status = true;
          $msg = "Sucesso!";
          $conteudo['caixa_aberto'] = $retorno['conteudo']['valor_inicial_caixa'] > 0 ? true : false;
        } else {
          $msg = "Caixa ainda ABERTO para outro funcionário.";
        }
      }
    }

    $conteudo['status'] = $status;
    $conteudo['msg']    = $msg;

    echo json_encode($conteudo);

    break;

  case LOGIN_FRENTE_CAIXA:

    echo '<pre>';
    var_dump($requestData);
    exit;

    break;

  default:
    $retorno['endereco'] = ENDERECO . '/cliente';
    $retorno['status']   = false;
    $retorno['msg']      = "Nenhuma ação definida.";

    echo json_encode($retorno);
}
