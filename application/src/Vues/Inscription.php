<?php

namespace Vues;

class Inscription {

    use \Generiques\Outils;
    use OutilsVues;

    public function __construct(private string $titre="K@nx@"){
    }

    public function affichage(?array $envoi): void{

	$serie = $_SESSION['inscription']['serie'];
	$genre = $_SESSION['inscription']['genre'];

	
	$tableau = [ 'series' => $this->getSeriesOptions(intval($serie)), 'genres' => $this->getGenresOptions(intval($genre))];

	
	echo $this->getEntete("Inscription");

	if($this->administrateur_p()){
	    echo $this->getComposant('headerAdministrateur');
	}

	if(!$this->administrateur_p()){
	    echo $this->getComposant('headerUtilisateur');
	}

	echo $this->getComposantTableau('inscription', $tableau);

	echo $this->getFooterJavaScript('inscription');

	echo $this->getComposant('basdepage');	

    }
    

    public function __toString(): string{
	return "Formulaire d’inscription";
    }
    
    
}
