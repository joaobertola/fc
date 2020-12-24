<?php

$postArray = isset($_REQUEST['p']) ? explode("/", $_REQUEST['p']) : array();

$modulo = isset($postArray[0]) ? $postArray[0] : 'home';

// Verifico para gravar a última página acessa pelo cliente
$_SESSION['modulo'] = $modulo;

$action = isset($postArray[1]) ? $postArray[1] : '';

$idRegistro = isset($postArray[3]) ? $postArray[3] : '';

$file = $action . $modulo . '.php';

$caminho = 'view/' . $modulo . '/' . $file;

if (!file_exists($caminho)) {
  $caminho = 'view/404/404.php';
  $modulo  = '404';
}
