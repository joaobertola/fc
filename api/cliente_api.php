<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Arquivo com Funcoes de Banco de Dados
require "../config/database.php";
// Controller Login
require "../config/api.php";
// Arquivo Verifica Sessao
include "../includes/verifica.php";

if (!isset($_REQUEST["op"]) || empty($_REQUEST["op"])) exit;

$Op = $_REQUEST["op"];

defined("BUSCA_CLIENTES")  || define("BUSCA_CLIENTES",  md5("buscaClientes"));
defined("CADASTRA_CLIENTE")  || define("CADASTRA_CLIENTE",  md5("cadastraCliente"));

// Modulo da API
$modulo = 'clientes';

$urlApi = API . $modulo;

$header['Authorization'] = $Authorization;

$dados = '';

$enderecoRetorno = ENDERECO;

// Muda de acordo com a chamada mas a maioria é post
$tpRequisicao = 'GET';

// array de retorno com as informações
$retorno = [];

switch ($Op) {

  case BUSCA_CLIENTES:

    $status = false;

    $msg = "";

    $api = new apiConnect;

    $clientes = $api->envia($header, $urlApi, $tpRequisicao, $dados);

    $conteudo = [];

    if (empty($clientes)) {
      // Retorno Vazio seignifica que a API não está ativa ou servidor desligado
      $msg = "Não foi possível conectar com o servidor.";
    } else if (isset($clientes['status']) && $clientes['status'] != 200) {
      // Em caso de erro, retorna ao usuário exemplo: Login Inválido
      $msg = isset($clientes['msg']) ? $clientes['msg'] : $clientes['status'];
    } else {
      // Se tudo ocorrer bem, retorna os dados de clientes
      $conteudo = $clientes['conteudo'];
    }

    $retorno['conteudo'] = $conteudo;
    $retorno['msg']      = $msg;

    echo json_encode($retorno);

    break;

  case CADASTRA_CLIENTE:

    $status = false;

    $msg = "";

    $dados = $_POST;

    $dados = json_encode($dados);

    $api = new apiConnect;

    $urlApi = $urlApi . '/cadastrar';

    $tpRequisicao = 'POST';

    $clientes = $api->envia($header, $urlApi, $tpRequisicao, $dados);

    $conteudo = [];

    if (empty($clientes)) {
      // Retorno Vazio seignifica que a API não está ativa ou servidor desligado
      $msg = "Não foi possível conectar com o servidor.";
    } else if (isset($clientes['status_http']) && ($clientes['status_http'] != 200 && $clientes['status_http'] != 201)) {
      // Em caso de erro, retorna ao usuário exemplo: Login Inválido
      $msg = isset($clientes['msg']) && !empty($clientes['msg']) ? $clientes['msg'] : $clientes['status_http'];
    } else {
      // Se tudo ocorrer bem, retorna os dados de clientes
      $msg = "Cliente cadastrado com sucesso!";
      $conteudo = $clientes['conteudo'];
      $status = true;
    }

    $retorno['conteudo'] = $conteudo;
    $retorno['status'] = $status;
    $retorno['msg']      = $msg;

    echo json_encode($retorno);

    break;


  default:
    $retorno['endereco'] = ENDERECO . '/cliente';
    $retorno['status']   = false;
    $retorno['msg']      = "Nenhuma ação definida.";

    echo json_encode($retorno);
}
