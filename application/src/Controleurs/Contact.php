<?php

namespace Controleurs;

class Contact {

    use \Generiques\Outils;

    private $modele;
    private $vue;

    public function __construct(private \PDO $pdo, private string $methode, private array $parametres, private string $titre="Contact"){

	if(empty($_SESSION['contact']['serie']) || empty($_SESSION['contact']['genre'])){
	    $_SESSION['contact']['serie'] = 0;
	    $_SESSION['contact']['genre'] = 0;
	}

	$this->vue = new \Vues\Contact($this->titre);
	$this->modele = new \Modeles\Contact($this->pdo);
	$this->$methode($this->parametres);
    }
    

    public function index(?array $envoi){
	$this->vue->affichage($this->parametres);
    }
}
