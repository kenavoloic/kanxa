<?php

namespace Vues;

class Poules {

    use \Generiques\Outils;
    use OutilsVues;

    public function __construct(private string $titre){
	//$this->affichage($this->titre);
    }

    private function getLigne(array $envoi): string {
	return '<div class="ligne" id="'.$envoi['equipeId'].'"><span class="souhait">'.$envoi['souhait'].'</span><div class="liste"><button class="rouge"></button><button class="vert"></button><button class="bleu"></button><button class="jaune"></button></div></div>';
    }


    public function affichage(array $envoi): void {
	echo $this->getEntete($this->titre);

	if($this->administrateur_p()){
	    echo $this->getComposant('headerAdministrateur');
	}

	if(!$this->administrateur_p()){
	    echo $this->getComposant('headerUtilisateur');
	}

	echo $this->getComposantTableau('poules', $envoi);
	echo $this->getFooterJavaScript('poules');
	echo $this->getComposant('basdepage');
    }

}
