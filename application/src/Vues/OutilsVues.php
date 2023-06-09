<?php

namespace Vues;

trait OutilsVues {

    // $jour = $jour - 1, car valeur en provenance de mysql pour qui le premier jour de l'année est 1
    // et non 0 pour PHP
    
    /* public function nettoyageJson(array $envoi): array {
       $dateId = filter_var($envoi['dateId'], FILTER_SANITIZE_STRING);
       $evenement = filter_var($envoi['evenement'], FILTER_SANITIZE_STRING);
       $jour = filter_var($envoi['jour'], FILTER_SANITIZE_NUMBER_INT);
       $annee = filter_var($envoi['annee'], FILTER_SANITIZE_NUMBER_INT);
       return ['dateId' => dateId, 'evenement' => $evenement, 'jour' => $jour - 1, 'annee' => $annee];
     * } */

    public function getDivCachee(string $identifiant, array $tableau): string{
	ob_start();
	echo "<div id=\"$identifiant\" hidden>" . PHP_EOL;
	echo json_encode($tableau, JSON_UNESCAPED_UNICODE) . PHP_EOL;
	echo '</div>' . PHP_EOL;
	$retour = ob_get_contents();
	ob_get_clean();
	return $retour;
    }
    
    public function getFooterJavaScript(string $fichier){
	// Contrairement à un fichier php, il ne s'agit pas ici de charger le contenu du fichier
	// mais simplement de créer une chaîne qui sera interprétée par le client, donc dans le dossier 'public'
	$chemin = 'js' . DIRECTORY_SEPARATOR . $fichier . '.js';
	return '<script type="module" src="/' .$chemin . '"></script>';
    }
    

    public function getPatron(string $fichier, array $tableau=['titre'=>'Kanxa']): ?string {
	$chemin = 'patrons' . DIRECTORY_SEPARATOR . $fichier . '.php';
	ob_start();
	extract($tableau);
	include $chemin;
	return ob_get_clean();
    }

    public function getEntete(string $titre, string $fichier='entete'): string {
	$chemin =  'patrons' . DIRECTORY_SEPARATOR . 'composants' . DIRECTORY_SEPARATOR . $fichier . '.php';
	//$tableau = ['titre' => 'Kanxa'];
	$tableau = ['titre' => $titre];	
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

    public function getComposantTableau(string $fichier, array $tableau): ?string {
	$chemin =  'patrons' . DIRECTORY_SEPARATOR . 'composants' . DIRECTORY_SEPARATOR . $fichier . '.php';
	ob_start();
	include $chemin;
	extract($tableau);
	$retour =  ob_get_clean();
	return $retour;
    }

    // isset($_SESSion['series']) isset($_SESSION['genres']) doit être effectué dans le contrôleur

    public function getSeriesOptions(int $index = 0): string {    
	$defaut = [ ['serieId' => 0, 'intitule' => 'Série']];
	//$series = [ ['serieId' => 1, 'intitule' => 'Première'], ['serieId' => 2, 'intitule' => 'Deuxième'], ['serieId' => 3, 'intitule' => 'Troisième']];
	$series = $_SESSION['series'];

	$liste = array_merge($defaut, $series);
	$index = $index % count($liste);
	
	$fx = fn($x) => '<option value="'.$x['serieId'].'">' . $x['intitule'] . '</option>';
	$retour = array_map($fx, $liste);
	$retour[0] = '<option value="' .$liste[0]['serieId'] . '"  hidden="true">' . $liste[0]['intitule'] . '</option>';
	$retour[$index] = '<option value="' .$liste[$index]['serieId'] . '"  selected>' . $liste[$index]['intitule'] . '</option>';

	return implode("\n", $retour);
    }

    public function getGenresOptions(int $index = 0): string {    
	$defaut = [ ['genreId' => 0, 'intitule' => 'Genre']];
	//$series = [ ['genreId' => 1, 'intitule' => 'Masculin'], ['genreId' => 2, 'intitule' => 'Féminin'], ['genreId' => 3, 'intitule' => 'Mixte']];
	$genres = $_SESSION['genres'];

	$liste = array_merge($defaut, $genres);
	$index = $index % count($liste);
	
	$fx = fn($x) => '<option value="'.$x['genreId'].'">' . $x['intitule'] . '</option>';
	$retour = array_map($fx, $liste);
	$retour[0] = '<option value="' .$liste[0]['genreId'] . '"  hidden="true">' . $liste[0]['intitule'] . '</option>';
	$retour[$index] = '<option value="' .$liste[$index]['genreId'] . '"  selected>' . $liste[$index]['intitule'] . '</option>';
	return implode("\n", $retour);
    }

    // Pour l'établissement du planning des parties
    public function getHoraires(int $valeur=9): string {
	$minimum = 9;
	$maximum = 20;
	$valeur = ($valeur < $minimum | $valeur > $maximum) ? $minimum : $valeur;
	$hvaleur =  'h'.str_pad($valeur, 2, "0", STR_PAD_LEFT);
	$clefs = array_map(fn($x) => 'h'.str_pad($x, 2, "0", STR_PAD_LEFT), range($minimum, $maximum));
	$options = array_map(fn($x) => '<option value="'.str_pad($x, 2, "0", STR_PAD_LEFT).'">'.$x.'h00</option>', range($minimum, $maximum));
	$liste0 = array_combine($clefs, $options);
	$liste = array_merge(['h00' => '<option value="0" disabled>Heure</option>'], $liste0);
	$liste[$hvaleur] = '<option value="'.$valeur.'" selected>'.str_pad($valeur, 2, "0", STR_PAD_LEFT).'h00<"/option>';
	return implode("\n", $liste);
    }
    

    // En lieu et place  des input dates
    // création des options pour le select "jour"
    public function getJours(int $valeur=1): string {
	$valeur = ($valeur < 1 | $valeur > 31) ? 1 : $valeur;
	$liste = array_map(fn($x) => '<option value="' . $x .'">'.str_pad($x, 2, "0", STR_PAD_LEFT).'</option>', range(1,31));
	$liste[$valeur - 1] = '<option value="'. $valeur .'" selected>'.str_pad($valeur, 2, "0", STR_PAD_LEFT).'</option>';
	return implode("\n",$liste);
    }

    // création des options pour le select "mois"
    public function getMois(int $valeur=1): string {
	$valeur = ($valeur < 1 | $valeur > 12) ? 1 : $valeur;
	$mois = [1 => 'janvier', 'février', 'mars', 'avril', 'mai', 'juin', 'juillet', 'août', 'septembre', 'octobre', 'novembre', 'décembre'];
	$liste = array_map(fn($x) => '<option value="' .$x . '">' . $mois[$x] . '</option>', range(1,12));
	$liste[$valeur - 1 ] = '<option value="' .$valeur . '" selected>' . $mois[$valeur] . '</option>';
	return implode("\n", $liste);
    }

    // création des options pour le select "année"
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
