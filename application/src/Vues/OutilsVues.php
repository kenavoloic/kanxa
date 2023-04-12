<?php

namespace Vues;

trait OutilsVues {

    public function getComposant(string $fichier): ?string {
	$retour = null;
	$chemin = 'patrons' . DIRECTORY_SEPARATOR . 'composant' . DIRECTORY_SEPARATOR . $fichier . 'php';
	if(file_exists($chemin)){
	    ob_start();
	    include $chemin;
	    $retour = ob_get_clean();
	}
	return $retour;
    }
    
}
