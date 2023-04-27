<?php

namespace Controleurs;

class Poules {

    private $modele;
    private $vue;

    public function __construct(private \PDO $pdo, private string $methode, private array $parametres, private string $titre="Brassage des poules"){
	$this->vue = new \Vues\Poules($this->titre);
	$this->modele = new \Modeles\Poules($this->pdo);
	$this->$methode($this->parametres);
    }

    public function index(): void{
	//$this->vue->affichage(['titre' => $this->titre]);
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
	print_r($this->modele->getJsonEquipeIdSouhait(1,2));

    }
    

    public function __toString(): string {
	return "Constitution graphique des poules.";
    }
    
}
