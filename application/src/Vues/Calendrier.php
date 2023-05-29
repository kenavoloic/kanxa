<?php
 
namespace Vues;

class Calendrier {

    use \Generiques\Outils;
    use OutilsVues;

    public function __construct(private string $titre="K@nx@"){
    }

    public function affichage(?array $envoi): void{

	$serie = $_SESSION['calendrier']['serie'];
	$genre = $_SESSION['calendrier']['genre'];

	
	$tableau = [ 'series' => $this->getSeriesOptions(intval($serie)), 'genres' => $this->getGenresOptions(intval($genre))];

	
	echo $this->getEntete("Calendrier");

	echo $this->getComposant('headerUtilisateur');

	echo $this->getComposantTableau('calendrier', $tableau);

	echo '</main>' . PHP_EOL;

	echo $this->getFooterJavaScript('calendrier');

	echo $this->getComposant('basdepage');	

    }
    

    public function __toString(): string{
	return "Formulaire d’inscription";
    }
    
    
}
