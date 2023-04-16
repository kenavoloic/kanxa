<?php

namespace Controleurs;

class Paf {

    use \Generiques\Outils;

    private $vue;
    private $requete = "select jsonSerieGenrePaf(:serie,:genre) as resultat;";
    private array $donnees;
    

    public function __construct(private \PDO $pdo, private string $methode, private array $parametres, private string $titre="PAF"){
	$this->vue = new \Vues\Paf($this->titre);
	$this->donnees = [];
	$this->$methode($parametres);
    }

    public function traitement(array $envoi): void {
	$liste = isset($_POST['paf']) ? $_POST['paf'] :  ['serie' => 0, 'genre' => 0];
	var_dump($liste);
	var_dump($_POST['paf']);
    }
    

    public function index(): void {
	//var_dump($_POST);
	$this->vue->affichage();
    }
    

    public function __toString(): string {
	return "Participation aux frais. Frais d’inscription au tournoi.";
    }
    
}
