<?php

namespace Controleurs;

class Calendrier {

    use \Generiques\Outils;

    private $modele;
    private $vue;

    public function __construct(private \PDO $pdo, private string $methode, private array $parametres, private string $titre="Calendrier"){

	if(empty($_SESSION['calendrier']['serie']) || empty($_SESSION['calendrier']['genre'])){
	    $_SESSION['calendrier']['serie'] = 0;
	    $_SESSION['calendrier']['genre'] = 0;
	}

	$this->vue = new \Vues\Calendrier($this->titre);
	$this->modele = new \Modeles\Calendrier($this->pdo);
	$this->$methode($this->parametres);
    }
    

    public function index(?array $envoi){
	$this->vue->affichage($this->parametres);
    }
}
