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

	return '<fieldset><input type="checkbox" name="'.$id.'" id="'.$id.'"><label for="'.$id.'"><span>'.$nom1.'</span> <span>'.$nom2.'</span></label></fieldset>';
    }

    private function creationFormulaire(array $envoi): string{
	$haut = '<form action="/paf/reglements" method="post">';
	$bouton = '<fieldset><button'; 
	$bas = '</form>';
	return "";
	
    }
    
    public function affichageListe(?array $envoi): void {
	//header('Location: /paf/traitement');
	echo $this->getEntete("Participation aux frais");
	
	if($this->administrateur_p()){
	    echo $this->getComposant('headerAdministrateur');
	}

	if(!$this->administrateur_p()){
	    echo $this->getComposant('headerUtilisateur');
	}

	echo $this->getComposant('paf');
	
	//créer une fonctin prenant en charge lenom d'un fichier et une variable et retourne une chaîne.
	echo '<form class="liste">'.implode("\n", array_map([$this, 'extractionDonnees'], $envoi)).'</form>';
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

