<?php

namespace Vues;

class Paf {

    use OutilsVues;

    public function __construct(private string $titre="K@nx@"){
	
    }

    public function affichage(): void {
	echo $this->getEntete("Participation aux frais");
	
	if(isset($_SESSION['connexion']) && $_SESSION['connexion'] === true)  {
	    echo $this->getComposant('headerAdministrateur');
	}
	
	if(!isset($_SESSION['connexion']) || $_SESSION['connexion'] === false){
	    echo $this->getComposant('headerUtilisateur');
	}

	echo $this->getComposant('paf');
	echo $this->getComposant('basdepage');
    }

    public function __toString(): string {
	return "Vues\Paf";
    }
}

