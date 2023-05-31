<?php

namespace Vues;

class Resultats {

    use \Generiques\Outils;
    use OutilsVues;

    public function __construct(private string $titre="K@nx@"){
    }

    public function affichage(?array $envoi): void{

	$serie = $_SESSION['resultats']['serie'];
	$genre = $_SESSION['resultats']['genre'];

	
	$tableau = [ 'series' => $this->getSeriesOptions(intval($serie)), 'genres' => $this->getGenresOptions(intval($genre))];

	
	echo $this->getEntete("Resultats");

	echo $this->getComposant('headerUtilisateur');

	echo $this->getComposantTableau('resultats', $tableau);

	echo $this->getComposant('footer');
	echo $this->getFooterJavaScript('resultats');
	echo $this->getComposant('basdepage');

    }
    

    public function __toString(): string{
	return "Résultats des parties";
    }
    
    
}
