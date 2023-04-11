<?php

function chargeurClasses(string $nomClasse) {
    
    $fichier = str_replace('\\', DIRECTORY_SEPARATOR, $nomClasse);
    //$chemin =  dirname(__DIR__) . DIRECTORY_SEPARATOR . 'Application' . DIRECTORY_SEPARATOR . 'src' . $fichier . '.php' . PHP_EOL;
    //$chemin = DIRECTORY_SEPARATOR . 'application' . DIRECTORY_SEPARATOR . 'src' . DIRECTORY_SEPARATOR . $fichier . '.php' . PHP_EOL;
    //$chemin =  '..' . DIRECTORY_SEPARATOR .  'src' . DIRECTORY_SEPARATOR . $fichier . '.php' . PHP_EOL;
    //$chemin = CLASS_DIR . $fichier;
    //$chemin = dirname(__FILE__) . DIRECTORY_SEPARATOR . '..' . DIRECTORY_SEPARATOR . 'src' . DIRECTORY_SEPARATOR . $fichier;
    //$chemin = basename(dirname(__FILE__)) . DIRECTORY_SEPARATOR . '..' . DIRECTORY_SEPARATOR . 'src' . DIRECTORY_SEPARATOR . $fichier;
    //$chemin = basename(dirname(__FILE__)) . DIRECTORY_SEPARATOR . 'src' . DIRECTORY_SEPARATOR . $fichier;
    //$chemin = dirname(__FILE__, 2) . DIRECTORY_SEPARATOR . 'src' . DIRECTORY_SEPARATOR . $fichier . '.php';
    $chemin = APPLICATION .  'src' . DIRECTORY_SEPARATOR . $fichier . '.php';
    //$chemin = DIRECTORY_SEPARATOR . 'src' . DIRECTORY_SEPARATOR . $fichier;
    //echo $chemin . PHP_EOL;
    if(file_exists($chemin)){
	//echo "Le fichier $fichier existe.";
	//echo $chemin . PHP_EOL;
	require $chemin;
    }
}

function chargeurTraits(string $nomTrait){
    //$chemin = Application . DIRECTORY_SEPARATOR . 'src' . DIRECTORY_SEPARATOR;
    //echo 'Chargement d’un trait' . PHP_EOL;
    $fichier = str_replace('\\', DIRECTORY_SEPARATOR, $nomTrait);
    $chemin = APPLICATION . 'src' . DIRECTORY_SEPARATOR . $fichier . '.php';
    //echo $chemin . PHP_EOL;
    if(file_exists($chemin)){
	require $chemin;
    }
}


/* function autoloader(string $nomClasse): void {
 *     $fichier = __DIR__ . DIRECTORY_SEPARATOR . 'controleurs' . DIRECTORY_SEPARATOR . $nomClasse . 'php';
 *     include $fichier;
 * } */

spl_autoload_register('chargeurClasses');
//spl_autoload_register('chargeurTraits');

