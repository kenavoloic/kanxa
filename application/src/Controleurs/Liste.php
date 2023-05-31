<?php

namespace Controleurs;

class Liste {

    use \Generiques\Outils;
    use \Controleurs\OutilsControleurs;

    private $modele;
    private $vue;

    public function __construct(private \PDO $pdo, private string $methode, private array $parametres, private string $titre="Liste des équipes"){

	if(empty($_SESSION['liste']['serie']) || empty($_SESSION['liste']['genre'])){
	    $_SESSION['liste']['serie'] = 0;
	    $_SESSION['liste']['genre'] = 0;
	}

	$this->vue = new \Vues\Liste($this->titre);
	$this->modele = new \Modeles\Liste($this->pdo);
	$this->$methode($this->parametres);	
    }

    public function equipes(?array $envoi): void {

	//$_SESSION['liste']['serie'] = $_POST['liste']['serie'];
	//$_SESSION['liste']['genre'] = $_POST['liste']['genre'];
	
	$serie_ = $_SESSION['liste']['serie'];
	$genre_ = $_SESSION['liste']['genre'];
	$serie_ = $_POST['serie'];
	$genre_ = $_POST['genre'];
	
	$liste = $this->modele->getEquipes(intval($serie_), intval($genre_));
	var_dump($liste);
	$this->vue->affichage($liste);
    }

    public function equipe(int $envoi): void {
	$equipeId = $this->queDesChiffres($envoi);
    }
    

    public function index(){
	$this->vue->affichage(['titre' => $this->titre]);
    }
}
