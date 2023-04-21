<?php

namespace Vues;

class Paf {

    use \Generiques\Outils;
    use OutilsVues;

    public function __construct(private string $titre="K@nx@"){
	
    }

    private function extractionDonnees(array $envoi): string {
	$id = $envoi['equipeId'];
	$nom1 = $envoi['nom1'];
	$nom2 = $envoi['nom2'];
	return "<div id='$id'></div>";
    }
    

    public function affichageListe(array $envoi): void {
    }
    

    public function affichage(): void {
	echo $this->getEntete("Participation aux frais");

	if($this->administrateur_p()){
	    echo $this->getComposant('headerAdministrateur');
	}

	if(!$this->administrateur_p()){
	    echo $this->getComposant('headerUtilisateur');
	}

	echo $this->getComposant('paf');
	//echo $this->getFooterJavaScript('paf');
	echo $this->getComposant('basdepage');
    }

    

    public function __toString(): string {
	return "Vues\Paf";
    }
}

