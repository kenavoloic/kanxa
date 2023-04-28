<?php

namespace Controleurs;

class Poules {

    use \Controleurs\OutilsControleurs;
    
    private $modele;
    private $vue;

    public function __construct(private \PDO $pdo, private string $methode, private array $parametres, private string $titre="Composition des poules"){

	if(empty($_SESSION['poules']['serie']) || empty($_SESSION['poules']['genre'])){
	    $_SESSION['poules']['serie'] = 0;
	    $_SESSION['poules']['genre'] = 0;
	}
	

	$this->vue = new \Vues\Poules($this->titre);
	$this->modele = new \Modeles\Poules($this->pdo);
	$this->$methode($this->parametres);
    }

    public function traitement(?array $envoi){
	$_SESSION['poules']['serie'] = $_POST['poules']['serie'];
	$_SESSION['poules']['genre'] = $_POST['poules']['genre'];
	
	$serie_ = $_SESSION['poules']['serie'];
	$genre_ = $_SESSION['poules']['genre'];
	
	$liste = $this->modele->getJsonEquipeIdSouhait(intval($serie_), intval($genre_));
	$this->vue->affichage($liste);
    }
    

    public function index(): void{
	$this->vue->affichage(['titre' => $this->titre]);
    }
    

    public function __toString(): string {
	return "Constitution graphique des poules.";
    }
    
}
