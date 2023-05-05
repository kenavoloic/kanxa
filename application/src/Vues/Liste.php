<?php

namespace Vues;

class Liste {

    use \Generiques\Outils;
    use OutilsVues;

    public function __construct(private string $titre){
    }

    private function getLigne(array $envoi): string {
	//return '<dl class="ligne" id="'.$envoi['equipeId'].'"><dd class="nom">'.$envoi['nom1'].' '.$envoi['prenom1'].'</dd><dd class="nom">'.$envoi['nom2'].' '.$envoi['prenom2'].'</dd></dl>';

	//return '<dl><dt>'.$envoi['nom1'].'</dt><dd class="prenom">'.$envoi['prenom1'].'</dd><dd class="courriel">'.$envoi['courriel1'].'</dd><dd class="mobile">'.$envoi['mobile1'].'</dd><dd class="licence">'.$envoi['licence1'].'</dd><dt>'.$envoi['nom2'].'</dt><dd class="prenom">'.$envoi['prenom2'].'</dd><dd class="courriel">'.$envoi['courriel2'].'</dd><dd class="mobile">'.$envoi['mobile2'].'</dd><dd class="licence">'.$envoi['licence2'].'</dd></dl>';

	return '<section><dl><dt>'.$envoi['nom1'].'</dt><dd class="prenom">'.$envoi['prenom1'].'</dd><dd class="courriel">'.$envoi['courriel1'].'</dd><dd class="mobile">'.$envoi['mobile1'].'</dd><dd class="licence">'.$envoi['licence1'].'</dd></dl><dl><dt>'.$envoi['nom2'].'</dt><dd class="prenom">'.$envoi['prenom2'].'</dd><dd class="courriel">'.$envoi['courriel2'].'</dd><dd class="mobile">'.$envoi['mobile2'].'</dd><dd class="licence">'.$envoi['licence2'].'</dd></dl><div>Voir</div><div>Modifier</div></section>';
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

	echo '<main>' . PHP_EOL;
	echo $this->getComposantTableau('selecteursVides', $tableau);

	if(!empty($envoi['liste'])){
	    $donnees = array_map([$this,'getLigne'], $envoi['liste']);
	    echo "<article>" . PHP_EOL;
	    echo implode("\n", $donnees);
	    echo "</article>" . PHP_EOL;
	}

	echo '</main>' . PHP_EOL;

	echo $this->getFooterJavaScript('liste');
	
	echo $this->getComposant('basdepage');
    }

}

