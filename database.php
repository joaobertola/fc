<?php 

include_once "enviroment.php";
 
if(ENV == "production") {
    define("HOSTDB", "10.2.2.3");
    define("HOSTDBFINANCEIRO", "10.2.2.102");
} else {
    define("HOSTDB", "10.2.2.98");
    define("HOSTDBFINANCEIRO", "10.2.2.98");
}
