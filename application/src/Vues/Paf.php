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

	return '<tr><td class="nom">'.$nom1.'</td><td class="nom">'.$nom2.'</td><td class="regularisation"><a href="/paf/regularisation/'.$id.'">Régularisation</a></td></tr>';
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
	//echo '<form class="liste">'.implode("\n", array_map([$this, 'extractionDonnees'], $envoi)).'</form>';
	echo "<table><tr><th>Nom</th><th>Nom</th><th>Régularisation</th></tr>";
	echo implode("\n", array_map([$this, 'extractionDonnees'], $envoi));
	echo "</table>";
	echo $this->getComposant('basdepage');
    }
    

    public function affichage(array $envoi): void {
	
	//$serie = $_POST['paf']['serie'] ?? 1;
	//$genre = $_POST['paf']['genre'] ?? 1;
	//var_dump($_SESSION['paf']);
	//$serie = !empty($_SESSION['paf']['serie']) ?? 0;
	//$genre = !empty($_SESSION['paf']['genre']) ?? 0;

	$serie = $_SESSION['paf']['serie'];
	$genre = $_SESSION['paf']['genre'];

	
	$tableau = [ 'series' => $this->getSeriesOptions(intval($serie)), 'genres' => $this->getGenresOptions(intval($genre))];
	//$tableau = [ 'series' => $this->getSeriesOptions(intval($envoi['serie'])), 'genres' => $this->getGenresOptions(intval($envoi['genre']))];
	
	echo $this->getEntete("Participation aux frais");

	if($this->administrateur_p()){
	    echo $this->getComposant('headerAdministrateur');
	}

	if(!$this->administrateur_p()){
	    echo $this->getComposant('headerUtilisateur');
	}

	//echo $this->getComposant('pafVide');
	//echo $this->getComposantTableau('pafVide', $tableau);
	echo '<main id="frais">' . PHP_EOL;
	echo $this->getComposantTableau('pafSelecteurs', $tableau);


	//echo "<select>".implode("\n", $this->getSelectSeries(1))."</select>";

	if(!empty($envoi['bilan'])){
	    //var_dump($envoi['bilan']);
	    echo $this->getComposantTableau('pafBilan', $envoi['bilan']);
	}
	
	
	if(!empty($envoi['liste'])){
	    //echo '<form class="liste">'.implode("\n", array_map([$this, 'extractionDonnees'], $envoi['liste'])).'</form>';
	    //echo '<section class="liste">'.implode("\n", array_map([$this, 'extractionDonnees'], $envoi['liste'])).'</section>';

	    echo "<table><tr><th>Nom</th><th>Nom</th><th>Régularisation</th></tr>";
	    echo "<tbody>" . PHP_EOL;
	    echo implode("\n", array_map([$this, 'extractionDonnees'], $envoi['liste']));
	    echo "</tbody>" . PHP_EOL;
	    echo "</table>";

	}

	echo '</main>' . PHP_EOL;
	
	echo $this->getComposant('footer');	
	echo $this->getFooterJavaScript('paf');
	echo $this->getComposant('basdepage');
	
    }

    

    public function __toString(): string {
	return "Participation aux frais";
    }
}

