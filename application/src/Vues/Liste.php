<?php

namespace Vues;

class Liste {

    use \Generiques\Outils;
    use OutilsVues;

    public function __construct(private string $titre){
    }

    private function getLigne(array $envoi): string {
	return '<dl class="ligne" id="'.$envoi['equipeId'].'"><dd class="nom">'.$envoi['nom1'].' '.$envoi['prenom1'].'</dd><dd class="nom">'.$envoi['nom2'].' '.$envoi['prenom2'].'</dd></dl>';
    }
    

    public function affichage(?array $envoi): void{

	$serie = $_SESSION['liste']['serie'];
	$genre = $_SESSION['liste']['genre'];
	echo "serie => $serie genre => $genre" . PHP_EOL;
	
	$tableau = [ 'action' => '/liste/equipes', 'controleur' => 'liste', 'series' => $this->getSeriesOptions(intval($serie)), 'genres' => $this->getGenresOptions(intval($genre))];

	echo $this->getEntete($this->titre);

	if($this->administrateur_p()){
	    echo $this->getComposant('headerAdministrateur');
	}

	if(!$this->administrateur_p()){
	    echo $this->getComposant('headerUtilisateur');
	}

	echo '<main>' . PHP_EOL;
	echo $this->getComposantTableau('selecteursVides', $tableau);

	if(!empty($envoi['liste'])){
	    $donnees = array_map([$this,'getLigne'], $envoi['liste']);
	    echo implode("\n", $donnees);
	}

	echo '</main>' . PHP_EOL;
	
	echo $this->getComposant('basdepage');
    }

}

