<?php

namespace Vues;

class Inscriptions {

    use OutilsVues;
    
    public function __construct(){
    }

    public function affichage(string $titre, int $nombreInitial = 0): void {
	$_SESSION['nombreInitial'] = $nombreInitial;
	echo $this->getEntete($titre);
	echo $this->getComposant('headerAdministrateur');
	echo $this->getComposant('inscription');
	//echo $this->getComposant('basdepage');
	echo $this->getFooterJavaScript('inscriptions');
    }
    
}
