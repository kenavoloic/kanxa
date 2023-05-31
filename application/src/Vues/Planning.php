<?php

namespace Vues;

class Planning {

    use \Generiques\Outils;
    use OutilsVues;

    public function __construct(private string $titre){
    }

    public function affichage(?array $envoi): void {
	echo $this->getEntete($this->titre);

	if($this->administrateur_p()){
	    echo $this->getComposant('headerAdministrateur');
	}

	if(!$this->administrateur_p()){
	    echo $this->getComposant('headerUtilisateur');
	}

	echo $this->getComposant('planning');

	echo $this->getComposant('footer');
	echo $this->getFooterJavaScript('planning');
	echo $this->getComposant('basdepage');
    }

    public function __toString(): string {
	return "Planning des parties";
    }
    
    
}
