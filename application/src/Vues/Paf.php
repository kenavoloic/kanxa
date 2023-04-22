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
	return '<dl><dd class="noms"><div>'.$nom1.'</div><div>'.$nom2.'</div></dd><dd><input type="checkbox"></dd><dd><button id="'.$id.'">Ok</button></dl>';

    }
    

    public function affichageListe(array $envoi): void {
	echo $this->getEntete("Participation aux frais");
	
	if($this->administrateur_p()){
	    echo $this->getComposant('headerAdministrateur');
	}

	if(!$this->administrateur_p()){
	    echo $this->getComposant('headerUtilisateur');
	}


	//créer une fonctin prenant en charge lenom d'un fichier et une variable et retourne une chaîne.
	echo '<article class="liste">'.implode("\n", array_map([$this, 'extractionDonnees'], $envoi)).'</article>';
	echo $this->getComposant('basdepage');
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

