<?php

namespace Vues;

trait OutilsVues {

    public function getPatron(string $fichier, array $tableau=['titre'=>'Kanxa']): ?string {
	$chemin = 'patrons' . DIRECTORY_SEPARATOR . $fichier . '.php';
	ob_start();
	extract($tableau);
	include $chemin;
	return ob_get_clean();
    }

    public function getComposant(string $fichier): ?string {
	$chemin =  'patrons' . DIRECTORY_SEPARATOR . 'composants' . DIRECTORY_SEPARATOR . $fichier . '.php';
	ob_start();
	include $chemin;
	$retour =  ob_get_clean();
	return $retour;
    }
    
    
}
