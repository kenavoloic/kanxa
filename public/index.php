<?php

if(session_status() !== PHP_SESSION_ACTIVE){
    session_start();
}

define('ROOT', dirname(__DIR__) . DIRECTORY_SEPARATOR);
define('APPLICATION', ROOT . 'application' . DIRECTORY_SEPARATOR);
define('URL', 'http://kanxa/');

require APPLICATION . 'lib/reglages.php';
require APPLICATION . 'lib/autoload.php';

//echo dirname(dirname(__FILE__));
//require APPLICATION . 'lib/boot.php';

//$identifiants = new \Connexion\Identifiants(APPLICATION . 'configuration/identifiants.ini');
//$pdo = $dd->getPDO();

//$identifiants = new \Connexion\Identifiant();
//$app = new \Generiques\Application($identifiants);
$app = new \Generiques\Application();
//echo $app . PHP_EOL;

//$b = new \Blip();
//echo $b . PHP_EOL;

//$t = file_exists(
//echo dirname(__file__);
//echo file_exists(APPLICATION . 'configuration/identifiants.ini') ? 'Oui' : 'Non';
