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

	$serie = !empty($_SESSION['poules']['serie']) ?? 0;
	$genre = !empty($_SESSION['poules']['genre']) ?? 0;
	
	$tableau = [ 'series' => $this->getSeriesOptions(intval($serie)), 'genres' => $this->getGenresOptions(intval($genre))];

	echo $this->getEntete($this->titre);

	if($this->administrateur_p()){
	    echo $this->getComposant('headerAdministrateur');
	}

	if(!$this->administrateur_p()){
	    echo $this->getComposant('headerUtilisateur');
	}
/*
	if(empty($envoi['liste'])){
	    echo $this->getComposantTableau('poulesSelecteurs', $tableau);
	}
*/
	echo $this->getComposantTableau('poulesSelecteurs', $tableau);
	
	if(!empty($envoi['liste'])){
	    echo $this->getComposant('boutonInvisible');
	    $donnees = array_map([$this,'getLigne'], $envoi['liste']);
	    echo implode("\n", $donnees);
	}
	
	//echo $this->getComposantTableau('poules', $envoi);
	echo $this->getFooterJavaScript('poules');
	echo $this->getComposant('basdepage');
    }

}
