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

    public function getEntete(string $titre, string $fichier='entete'): string {
	$chemin =  'patrons' . DIRECTORY_SEPARATOR . 'composants' . DIRECTORY_SEPARATOR . $fichier . '.php';
	$tableau = ['titre' => 'Kanxa'];
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

    // En remplacement des input dates
    public function getJours(int $valeur=1): string {
	$valeur = ($valeur < 1 | $valeur > 31) ? 1 : $valeur;
	$liste = array_map(fn($x) => '<option value="' . $x .'">'.str_pad($x, 2, "0", STR_PAD_LEFT).'</option>', range(1,31));
	$liste[$valeur - 1] = '<option value="'. $valeur .'" selected>'.str_pad($valeur, 2, "0", STR_PAD_LEFT).'</option>';
	//$texte = "léontine";
	//$liste[$valeur - 1] = '<option value="'. $texte .'" selected>'. $texte .'</option>';
	return implode("\n",$liste);
    }

    public function getMois(int $valeur=1): string {
	$valeur = ($valeur < 1 | $valeur > 12) ? 1 : $valeur;
	$mois = [1 => 'janvier', 'février', 'mars', 'avril', 'mai', 'juin', 'juillet', 'août', 'septembre', 'octobre', 'novembre', 'décembre'];
	$liste = array_map(fn($x) => '<option value="' .$x . '">' . $mois[$x] . '</option>', range(1,12));
	$liste[$valeur - 1 ] = '<option value="' .$valeur . '" selected>' . $mois[$valeur] . '</option>';
	//$texte = "albertine";
	//$liste[$valeur - 1 ] = '<option value="' .$texte . '" selected>' . $mois[$valeur] . '</option>';
	return implode("\n", $liste);
    }

    public function creationOptionsAnnee(): array {
	$anneeActuelle = date_create('now')->format('Y');
	$nombreAnnees  = 5;
	$listeAnnees = range($anneeActuelle, $anneeActuelle + $nombreAnnees);
	return $listeAnnees;
    }

    public function getAnnees(int $envoi=2023): string {
	$anneeActuelle = date_create('now')->format('Y');
	$valeur = is_null($envoi) ? $anneeActuelle : $envoi;
	$intervalle = array_map(fn($x) => $x + $valeur, range(-3, 3));
	$liste = array_map(fn($x) => '<option value="' .$x. '">' . $x . '</option>', $intervalle);
	$liste[3] = '<option value="' . $valeur . '" selected>' . $valeur . '</option>';
	return implode("\n", $liste);
    }

    
    
}
