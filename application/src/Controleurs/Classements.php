<?php

namespace Controleurs;

class Classements {

    use \Generiques\Outils;

    private $modele;
    private $vue;

    public function __construct(private \PDO $pdo, private string $methode, private array $parametres, private string $titre="Classements"){

	if(empty($_SESSION['classements']['serie']) || empty($_SESSION['classements']['genre'])){
	    $_SESSION['classements']['serie'] = 0;
	    $_SESSION['classements']['genre'] = 0;
	}

	$this->vue = new \Vues\Classements($this->titre);
	$this->modele = new \Modeles\Classements($this->pdo);
	$this->$methode($this->parametres);
    }
    

    public function index(?array $envoi){
	$this->vue->affichage($this->parametres);
    }
}
