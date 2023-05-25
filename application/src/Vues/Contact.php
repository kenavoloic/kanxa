<?php
 
namespace Vues;

class Contact {

    use \Generiques\Outils;
    use OutilsVues;

    public function __construct(private string $titre="K@nx@"){
    }

    public function affichage(?array $envoi): void{

	$serie = $_SESSION['contact']['serie'];
	$genre = $_SESSION['contact']['genre'];

	
	$tableau = [ 'series' => $this->getSeriesOptions(intval($serie)), 'genres' => $this->getGenresOptions(intval($genre))];

	
	echo $this->getEntete("Contact");

	echo $this->getComposant('headerUtilisateur');

	echo $this->getComposantTableau('contact', $tableau);

	echo $this->getFooterJavaScript('contact');

	echo $this->getComposant('basdepage');	

    }
    

    public function __toString(): string{
	return "Formulaire d’inscription";
    }
    
    
}
