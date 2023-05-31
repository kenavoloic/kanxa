<?php

namespace Vues;

class Score {

    use \Generiques\Outils;
    use \Vues\OutilsVues;

    public function __construct(private string $titre="Kanxa"){
    }

    public function affichage(?array $envoi){
	echo $this->getEntete($this->titre);

	if($this->administrateur_p()){
	    echo $this->getComposant('headerAdministrateur');
	}

	if(!$this->administrateur_p()){
	    echo $this->getComposant('headerUtilisateur');
	}

	echo $this->getComposant('footer');
	
	echo $this->getFooterJavaScript('score');
	
	echo $this->getComposant('basdepage');

    }

    public function __toString(): string {
	return "Enregistrement du score d'une partie";
    }
    
    
}
