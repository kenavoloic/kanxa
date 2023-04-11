<?php

$fichier = APPLICATION . 'configuration/identifiants.ini';
$valeurs = parse_ini_file($fichier);
function getValeurs(): array {
    return $valeurs;
}


