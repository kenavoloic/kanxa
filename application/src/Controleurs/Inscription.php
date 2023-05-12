<?php

namespace Controleurs;

class Inscription {

    use \Generiques\Outils;

    private $modele;
    private $vue;

    public function __construct(private \PDO $pdo, private string $methode, private array $parametres, private string $titre="Inscription"){

	if(empty($_SESSION['inscription']['serie']) || empty($_SESSION['inscription']['genre'])){
	    $_SESSION['inscription']['serie'] = 0;
	    $_SESSION['inscription']['genre'] = 0;
	}

	$this->vue = new \Vues\Inscription($this->titre);
	$this->modele = new \Modeles\Inscription($this->pdo);
	$this->$methode($this->parametres);
    }

    public function ajout(?array $envoi){
	//var_dump($_POST['equipe']);
	$equipe = $_POST['equipe'];
	$equipe['nom1'] = $this->nettoyageSimple($equipe['nom1']);
	$equipe['prenom1'] = $this->nettoyageSimple($equipe['prenom1']);
	//var_dump($equipe);
	
    }
    

    public function index(?array $envoi){
	$this->vue->affichage($this->parametres);
    }
}
