<?php

namespace Controleurs;

class Poules {

    private $modele;
    private $vue;

    public function __construct(private \PDO $pdo, private string $methode, private array $parametres, private string $titre="Composition des poules"){
	$this->vue = new \Vues\Poules($this->titre);
	$this->modele = new \Modeles\Poules($this->pdo);
	echo "constructeur => ";
	echo $this->methode;
	$this->$methode($this->parametres);
    }

    public function traitement(?array $envoi){

	//echo "Louison Bobet";
	$serie_ = $_SESSION['poules']['serie']; //= intval($_POST['poules']['serie']);
	$genre_ = $_SESSION['poules']['genre']; //= intval($_POST['poules']['genre']);
	$liste = $this->modele->getJsonEquipeIdSouhait(intval($serie_), intval($genre_));
	//$tri = array_map(['$this','

	$retour = array_merge(['titre' => $this->titre], $liste);
	//var_dump($retour);
	$this->vue->affichage($retour);
	//var_dump($liste_);
	//$liste = !is_null(array_values($retour_[0])[0]) ? json_decode(array_values($retour_[0])[0], true) : null;
	//$retour = ['liste' => $liste];
    }
    

    public function index(): void{
	$this->vue->affichage(['titre' => $this->titre]);
	/*
	   echo "nombre => ";
	   echo $this->modele->getNombreEquipe(1,1) . PHP_EOL;
	   echo "sans => ";
	   echo $this->modele->getNombreEquipeSansPoule(1,1) . PHP_EOL;
	   echo "avec => ";
	   echo $this->modele->getNombreEquipeAvecPoule(1,1) . PHP_EOL;
	   echo "liste sans => ";
	   print_r($this->modele->getJsonSansPoule(1,1));
	   echo "liste avec => ";
	   print_r($this->modele->getJsonSansPoule(1,1));
	   echo "liste avec => ";
	 */
	//print_r($this->modele->getJsonEquipeIdSouhait(1,2));

    }
    

    public function __toString(): string {
	return "Constitution graphique des poules.";
    }
    
}
