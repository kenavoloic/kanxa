<?php

namespace Vues;

class Liste {

    use \Generiques\Outils;
    use OutilsVues;

    public function __construct(private string $titre){
    }

    public function affichage(?array $envoi): void{
	echo $this->getEntete($this->titre);

	if($this->administrateur_p()){
	    echo $this->getComposant('headerAdministrateur');
	}

	if(!$this->administrateur_p()){
	    echo $this->getComposant('headerUtilisateur');
	}

	echo '<main>' . PHP_EOL;
	echo $this->getComposant('poulesSelecteurs');
	echo '</main>' . PHP_EOL;
	
	echo $this->getComposant('basdepage');
    }

}

