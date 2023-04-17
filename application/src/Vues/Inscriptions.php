<?php

namespace Vues;

class Inscriptions {

    use OutilsVues;
    
    public function __construct(){
    }

    public function affichage(string $titre): void {
	echo $this->getEntete($titre);
	echo $this->getComposant('headerAdministrateur');
	echo $this->getComposant('inscription');
	//echo $this->getComposant('basdepage');
	echo $this->getFooterJavaScript('inscriptions');
    }
    
}
