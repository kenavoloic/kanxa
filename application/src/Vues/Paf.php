<?php

namespace Vues;

class Paf {

    use \Generiques\Outils;
    use OutilsVues;

    public function __construct(private string $titre="K@nx@"){

    }

    private function getSelectSeries(int $choix=0): array {
	$defaut = ['serieId' => 0, 'intitule' => 'Série'];
	$liste = array_merge($defaut, $_SESSION['series']);
	return array_map(fn($x) => '<option value="'.$x['serieId'].'">'.$x['intitule'].'</option>', $liste);
	//$choix = ($choix % count($liste)) + 1;
    }


    private function getSelectGenres(int $choix=0): array {
	$defaut = ['genreId' => 0, 'intitule' => 'Genre'];
	$liste = array_merge($defaut, $_SESSION['genres']);
	return array_map(fn($x) => '<option value="'.$x['genreId'].'">'.$x['intitule'].'</option>', $liste);
	//$choix = ($choix % count($liste)) + 1;
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
    

    public function affichage(array $envoi): void {
		
	$serie = $_POST['paf']['serie'] ?? 1;
	$genre = $_POST['paf']['genre'] ?? 1;
	
	$tableau = [ 'series' => $this->getSeriesOptions($serie), 'genres' => $this->getGenresOptions($genre)];
	
	echo $this->getEntete("Participation aux frais");

	if($this->administrateur_p()){
	    echo $this->getComposant('headerAdministrateur');
	}

	if(!$this->administrateur_p()){
	    echo $this->getComposant('headerUtilisateur');
	}

	//echo $this->getComposant('pafVide');
	echo $this->getComposantTableau('pafVide', $tableau);


	//echo "<select>".implode("\n", $this->getSelectSeries(1))."</select>";
	
	if(isset($envoi['liste'])){
	    //echo '<form class="liste">'.implode("\n", array_map([$this, 'extractionDonnees'], $envoi['liste'])).'</form>';
	    echo '<article class="liste">'.implode("\n", array_map([$this, 'extractionDonnees'], $envoi['liste'])).'</article>';
	}
	
	//echo $this->getFooterJavaScript('paf');
	echo $this->getComposant('basdepage');
	
    }

    

    public function __toString(): string {
	return "Vues\Paf";
    }
}

