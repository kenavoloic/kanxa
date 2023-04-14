<?php

namespace Vues;

class Login {

    use OutilsVues;
    
    public function __construct(private string $titre){
	$this->affichage($this->titre);
    }

    private function affichage(string $titre): void {
	echo $this->getEntete($titre);
	echo $this->getComposant('headerUtilisateur');
	echo $this->getComposant('login');
    }
    
    
}
