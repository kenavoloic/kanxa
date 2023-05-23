<?php

namespace Vues;

class Login {

    use OutilsVues;
    
    public function __construct(private string $titre){
	//$this->affichage($this->titre);
    }

    public function affichage(): void {
	echo $this->getEntete($this->titre);
	echo $this->getComposant('headerUtilisateur');
	echo $this->getComposant('login');
	echo $this->getFooterJavaScript('login');
	echo $this->getComposant('basdepage');
    }
    
    
}
