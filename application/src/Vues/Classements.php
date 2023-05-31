<?php

namespace Vues;

class Classements {

    use \Generiques\Outils;
    use OutilsVues;

    public function __construct(private string $titre="K@nx@"){
    }

    public function affichage(?array $envoi): void{

	$serie = $_SESSION['classements']['serie'];
	$genre = $_SESSION['classements']['genre'];

	
	$tableau = [ 'series' => $this->getSeriesOptions(intval($serie)), 'genres' => $this->getGenresOptions(intval($genre))];

	
	echo $this->getEntete("Classements");

	echo $this->getComposant('headerUtilisateur');

	echo $this->getComposantTableau('classements', $tableau);

	echo $this->getComposant('footer');

	echo $this->getFooterJavaScript('classements');

	echo $this->getComposant('basdepage');

    }
    

    public function __toString(): string{
	return "Classement dans les poules";
    }
    
    
}
