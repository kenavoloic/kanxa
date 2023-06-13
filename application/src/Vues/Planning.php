<?php

namespace Vues;

class Planning {

    use \Generiques\Outils;
    use OutilsVues;

    public function __construct(private string $titre){
    }

    public function affichage(?array $envoi): void {
	//$tableau = $envoi['tableau']['liste'];
	$tableau = $envoi['tournoi'];
	$titre = $envoi['titre'];
	$parties = $envoi['parties'];
	$listeSerie = $tableau['serie'];
	$listeGenre = $tableau['genre'];
	//$tableau = $envoi['tableau'];
	//$parties = $envoi['tableau']['partiesParPoule'];
	//echo "Planning Vues affichage => " . PHP_EOL;
	//var_dump(json_decode($parties, true));
	//var_dump($parties);
	//var_dump($tableau);
	//print_r($parties);
	//print_r($tableau);
	
	//echo $this->getEntete($this->titre);
	echo $this->getEntete($titre);

	//if($this->administrateur_p()){
	echo $this->getComposant('headerAdministrateur');
	//}

	/* if(!$this->administrateur_p()){
	   echo $this->getComposant('headerUtilisateur');
	   } */

	echo $this->getDivCachee('listeSerie', $listeSerie);
	echo $this->getDivCachee('listeGenre', $listeGenre);
	echo $this->getDivCacheeTableau('liste', $tableau);
	//echo $this->getDivCachee('partiesParPoule', json_decode($parties));
	echo $this->getDivCacheeTableau('partiesParPoule', $parties);
	echo $this->getComposant('planning');
	//echo $this->getComposantTableau('planning', $tableau);

	echo $this->getComposant('footer');
	echo $this->getFooterJavaScript('planning');
	echo $this->getComposant('basdepage');
    }

    public function __toString(): string {
	return "Planning des parties";
    }
    
    
}
