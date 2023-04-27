<?php

namespace Vues;

class Poules {
    use OutilsVues;

    public function __construct(private string $titre){
	//$this->affichage($this->titre);
    }

    public function affichage(array $envoi): void {
	echo $this->getEntete($this->titre);
	echo $this->getComposant('headerAdministrateur');
	//echo $this->getComposantTableau('poules');
	echo $this->getFooterJavaScript('poules');
	echo $this->getComposant('basdepage');
    }
    
}
