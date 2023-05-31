<?php

namespace Vues;

class Liste {

    use \Generiques\Outils;
    use OutilsVues;

    public function __construct(private string $titre){
    }

    private function getLigne(array $envoi): string {

	return '<section><dl><dt>'.$envoi['nom1'].'</dt><dd class="prenom">'.$envoi['prenom1'].'</dd><dd class="courriel">'.$envoi['courriel1'].'</dd><dd class="mobile">'.$envoi['mobile1'].'</dd><dd class="licence">'.$envoi['licence1'].'</dd></dl><dl><dt>'.$envoi['nom2'].'</dt><dd class="prenom">'.$envoi['prenom2'].'</dd><dd class="courriel">'.$envoi['courriel2'].'</dd><dd class="mobile">'.$envoi['mobile2'].'</dd><dd class="licence">'.$envoi['licence2'].'</dd></dl><div>Voir</div><div>Modifier</div></section>';
    }

    private function getDefinitionListe(array $envoi): string {

	return '<dl><dt>'.$envoi['nom1'].'</dt><dd class="prenom">'.$envoi['prenom1'].'</dd><dd class="courriel">'.$envoi['courriel1'].'</dd><dd class="mobile">'.$envoi['mobile1'].'</dd><dd class="licence">'.$envoi['licence1'].'</dd></dl><dl><dt>'.$envoi['nom2'].'</dt><dd class="prenom">'.$envoi['prenom2'].'</dd><dd class="courriel">'.$envoi['courriel2'].'</dd><dd class="mobile">'.$envoi['mobile2'].'</dd><dd class="licence">'.$envoi['licence2'].'</dd><dd><div>Voir</div><div>Modifier</div></dd></dl>';
    }

    
    

    public function affichage(?array $envoi): void{

	$serie = $_SESSION['liste']['serie'];
	$genre = $_SESSION['liste']['genre'];
	
	$tableau = [ 'action' => '/liste/equipes', 'controleur' => 'liste', 'series' => $this->getSeriesOptions(intval($serie)), 'genres' => $this->getGenresOptions(intval($genre))];

	echo $this->getEntete($this->titre);

	if($this->administrateur_p()){
	    echo $this->getComposant('headerAdministrateur');
	}

	if(!$this->administrateur_p()){
	    echo $this->getComposant('headerUtilisateur');
	}

	echo '<main id="plazaGizon">' . PHP_EOL;
	//echo $this->getComposantTableau('selecteursVides', $tableau);
	//echo $this->getComposantTableau('selecteursSerieGenrePouleVides', $tableau);
	echo $this->getComposantTableau('liste', $tableau);	

	if(!empty($envoi['liste'])){
	    //$donnees = array_map([$this,'getLigne'], $envoi['liste']);
	    $donnees = array_map([$this,'getDefinitionListe'], $envoi['liste']);
	    echo "<article>" . PHP_EOL;
	    //echo '<article id="panneau">' . PHP_EOL;
	    echo implode("\n", $donnees);
	    var_dump($donnees);
	    echo '</article>' . PHP_EOL;
	    //echo "</article>" . PHP_EOL;
	    
	}

	echo '<article id="panneau"></article>' . PHP_EOL;

	echo '</main>' . PHP_EOL;

	echo $this->getComposant('footer');
	
	echo $this->getFooterJavaScript('liste');
	
	echo $this->getComposant('basdepage');
    }

}

