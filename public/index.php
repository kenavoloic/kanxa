<?php

if(session_status() !== PHP_SESSION_ACTIVE){
    session_start();
}

define('ROOT', dirname(__DIR__) . DIRECTORY_SEPARATOR);
define('APPLICATION', ROOT . 'application' . DIRECTORY_SEPARATOR);


require APPLICATION . 'lib/reglages.php';
require APPLICATION . 'lib/autoload.php';

$app = new \Generiques\Application();
