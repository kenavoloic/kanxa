<?php

namespace Vues;

class Inscription {

    use \Generiques\Outils;
    use OutilsVues;

    public function __construct(private string $titre="K@nx@"){
    }

    public function affichage(?array $envoi): void{
	echo $this->getEntete("Participation aux frais");

	if($this->administrateur_p()){
	    echo $this->getComposant('headerAdministrateur');
	}

	if(!$this->administrateur_p()){
	    echo $this->getComposant('headerUtilisateur');
	}

	echo $this->getComposant('inscription');

	echo $this->getFooterJavaScript('inscription');

	echo $this->getComposant('basdepage');	

    }
    

    public function __toString(): string{
	return "Formulaire d’inscription";
    }
    
    
}
