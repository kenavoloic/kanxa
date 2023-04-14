<?php

namespace Vues;

class Poules {
    use OutilsVues;

    public function __construct(private string $titre){
	$this->affichage($this->titre);
    }

    private function affichage(string $titre): void {
	echo $this->getEntete($titre);
	echo $this->getComposant('headerAdministrateur');
	echo $this->getComposant('poules');
	echo $this->getFooterJavaScript('poules');
	echo $this->getComposant('basdepage');
    }
    
}
