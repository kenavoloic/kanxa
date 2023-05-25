<?php

namespace Controleurs;

class Resultats {

    use \Generiques\Outils;

    private $modele;
    private $vue;

    public function __construct(private \PDO $pdo, private string $methode, private array $parametres, private string $titre="Calendrier"){

	if(empty($_SESSION['resultats']['serie']) || empty($_SESSION['resultats']['genre'])){
	    $_SESSION['resultats']['serie'] = 0;
	    $_SESSION['resultats']['genre'] = 0;
	}

	$this->vue = new \Vues\Resultats($this->titre);
	$this->modele = new \Modeles\Resultats($this->pdo);
	$this->$methode($this->parametres);
    }
    

    public function index(?array $envoi){
	$this->vue->affichage($this->parametres);
    }
}
