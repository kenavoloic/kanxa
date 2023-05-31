<?php

namespace Vues;

class Poules {

    use \Generiques\Outils;
    use OutilsVues;

    public function __construct(private string $titre){
    }

    private function getLigne(array $envoi): string {
	return '<div class="ligne" id="'.$envoi['equipeId'].'"><span class="souhait">'.$envoi['souhait'].'</span><div class="liste"><button class="rouge"></button><button class="vert"></button><button class="bleu"></button><button class="jaune"></button></div></div>';
    }


    public function getEquipe(array $envoi): string {
    	return '<article class="equipe" id="'.$envoi['equipeId'].'"><span class="souhait">'.$envoi['souhait'].'</span><div class="liste"><button class="rouge"></button><button class="vert"></button><button class="bleu"></button><button class="jaune"></button></div></article>';
 }


    public function affichage(array $envoi): void {

	//$serie = !empty($_SESSION['poules']['serie']) ?? 0;
	//$genre = !empty($_SESSION['poules']['genre']) ?? 0;

	$serie = $_SESSION['poules']['serie'];
	$genre = $_SESSION['poules']['genre'];
	
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
	//echo '<main id="brassage">' . PHP_EOL;
	echo '<main id="creationPoules">' . PHP_EOL;
	echo $this->getComposantTableau('poulesSelecteurs', $tableau);

	if(!empty($envoi['bilan'])){
	    echo $this->getComposantTableau('poulesBilan', $envoi['bilan']);
	    //var_dump($envoi);
	}
	
	
	if(!empty($envoi['liste'])){
	    //echo $this->getComposant('boutonInvisible');
	    //$donnees = array_map([$this,'getLigne'], $envoi['liste']);
		$donnees = array_map([$this,'getEquipe'], $envoi['liste']);
    //echo implode("\n", $donnees);
	    echo $this->getComposantTableau('poulesCadre', ['lignes' => implode("\n", $donnees)]);
	}
	
	//echo $this->getComposantTableau('poules', $envoi);
	echo '</main>' . PHP_EOL;

	echo $this->getComposant('footer');
	echo $this->getFooterJavaScript('poules');
	//echo $this->getFooterJavaScript('constitutionPoules');
	echo $this->getComposant('basdepage');
    }

}
