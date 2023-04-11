<?php

define('ENVIRONNEMENT','DEVELOPPEMENT');

if(ENVIRONNEMENT == 'DEVELOPPEMENT'){
error_reporting(E_ALL);
ini_set('display_errors', 1);
}

setlocale(LC_CTYPE, 'fr_FR.UTF8');
// important pour l'heure : cf JourCalendaire et autres.
setlocale(LC_TIME, 'fr_FR', 'fra');
date_default_timezone_set('Europe/Paris');
mb_internal_encoding('UTF-8');
