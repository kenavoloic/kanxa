<?php
namespace Vues;

class Accueil {

    use \Generiques\Outils;
    use OutilsVues;

    public function __construct(private string $titre="K@nx@"){
    }

    

    public function affichage(array $envoi): void{

	//$this->vue->affichage(['titre' => $this->titre, 'datesGenerales' => $this->datesGenerales, 'predicat' => $this->datesEtablies_p]);

	//var_dump($envoi['datesGenerales']);
	//var_dump($envoi);
	
	echo $this->getEntete($envoi['titre']);

	if($this->administrateur_p()){
	    echo $this->getComposant('headerAdministrateur');
	    echo $this->getComposant('accueilAdministrateur');
	}

	if(!$this->administrateur_p()){
	    echo $this->getComposant('headerUtilisateur');
	    echo $this->getComposant('accueilUtilisateur');
	}

	echo $this->getComposant('footer');
	echo $this->getFooterJavaScript('accueil');
	echo $this->getComposant('basdepage');
    }

    public function __toString(){
	return "Vue en charge de l’affichage de la page d’accueil, page servant également dans les cas où l’URL renseignée n’est pas prise en charge.";
    }
    
}
