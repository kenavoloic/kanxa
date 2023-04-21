<?php

namespace Controleurs;

class Paf {

    use \Generiques\Outils;

    private $vue;
    private $requete = "select jsonSerieGenrePaf(:serie,:genre) as resultat;";
    private $requeteListe = "select jsonSerieGenrePaf(:serie, :genre) as resultat";
    private array $donnees;
    

    public function __construct(private \PDO $pdo, private string $methode, private array $parametres, private string $titre="PAF"){
	$this->vue = new \Vues\Paf($this->titre);
	$this->donnees = [];
	//var_dump($_POST);
	$this->$methode($parametres);
    }

    public function liste(array $envoi): void {
	//$serie = $this->queDesChiffres($_POST['serie']) ?? 1; // par défaut, première série
	//$genre = $this->queDesChiffres($_POST['genre']) ?? 1; // par défaut, masculin
	//var_dump($_SESSION);
	//var_dump($_POST);
	$serie_ = 1;
	$genre_ = 2;
	$valeurs = [':serie' => $serie_, ':genre' => $genre_];
	$reponse = $this->pdo->prepare($this->requeteListe);
	$reponse->execute($valeurs);
	$retour = $reponse->fetch(\PDO::FETCH_NUM);
	//var_dump($retour);
	header('Content-Type: application/json');
	//$nombre = 390;
	//$retour = json_encode($nombre);
	$nom = ['nom'=>'bobet','prenom'=>'louison'];
	//echo json_encode($nom, true);
	echo $retour[0];


    }
    

    public function traitement(array $envoi): void {
	$liste = isset($_POST['paf']) ? $_POST['paf'] :  ['serie' => 0, 'genre' => 0];
    }
    

    public function index(array $envoi): void {
	$this->vue->affichage($this->titre);
    }
    

    public function __toString(): string {
	return "Participation aux frais. Frais d’inscription au tournoi.";
    }
    
}
