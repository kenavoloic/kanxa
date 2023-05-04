<?php

namespace Controleurs;

class Poules {

    use \Controleurs\OutilsControleurs;
    
    private $modele;
    private $vue;
    private $bilan;

    public function __construct(private \PDO $pdo, private string $methode, private array $parametres, private string $titre="Composition des poules"){

	if(empty($_SESSION['poules']['serie']) || empty($_SESSION['poules']['genre'])){
	    $_SESSION['poules']['serie'] = 0;
	    $_SESSION['poules']['genre'] = 0;
	}

	$this->vue = new \Vues\Poules($this->titre);
	$this->modele = new \Modeles\Poules($this->pdo);
	$this->bilan = $this->modele->getBilan();
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

    // Le rechargement ne fonctionne pas encore.
    public function liste(?array $envoi){
	//var_dump($envoi);
	//var_dump($_POST['liste']);
	$chaine = $_POST['liste'];
	//$poule = $_POST['poule'];
	
	$nettoyee = preg_replace('/[^0-9,:@|]/', '', $chaine);
	//$parties = explode('@', $nettoyee);
	
	$this->modele->constitutionPoules($nettoyee);
	//var_dump($parties);

	$serie_ = $_SESSION['poules']['serie'];
	$genre_ = $_SESSION['poules']['genre'];
	
	$liste = $this->modele->getJsonEquipeIdSouhait(intval($serie_), intval($genre_));
	$this->vue->affichage($liste);
	//var_dump($liste);

	//$decoupee = explode(',', $nettoyee);
	//var_dump($decoupee);
    }
    
    

    public function index(): void{
	var_dump($this->bilan);
	//$this->vue->affichage(['titre' => $this->titre]);
	$this->vue->affichage(['titre' => $this->titre, 'bilan' => $this->bilan]);
    }
    

    public function __toString(): string {
	return "Composition graphique des poules.";
    }
    
}
