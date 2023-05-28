<?php
namespace Vues;

class Accueil {

    use \Generiques\Outils;
    use OutilsVues;

    public function __construct(private string $titre="K@nx@"){
    }

    

    public function affichage(array $envoi): void{

	var_dump($envoi['datesGenerales']);
	
	echo $this->getEntete($envoi['titre']);

	if($this->administrateur_p()){
	    echo $this->getComposant('headerAdministrateur');
	    echo $this->getComposant('accueilAdministrateur');
	}

	if(!$this->administrateur_p()){
	    echo $this->getComposant('headerUtilisateur');
	    echo $this->getComposant('accueilUtilisateur');
	}

	echo $this->getFooterJavaScript('accueil');
	echo $this->getComposant('basdepage');
    }

    public function __toString(){
	return "Vue en charge de l’affichage de la page d’accueil, page servant également dans les cas où l’URL renseignée n’est pas prise en charge.";
    }
    
}
