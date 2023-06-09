<?php

namespace Controleurs;

class Pilota {

    //Classe tranversale pour les requêtes ajax.
    // Plus simple d'utiliser une classe dédiée.

    use \Generiques\Outils;

    private $requeteNombreEquipes = "select intNombreEquipeSerieGenre(:serie,:genre);";
    private $requeteNombrePoules = "select intNombrePoule(:serie, :genre);";
    private $requeteListePoule = "select jsonListepoule(:serie, :genre, :poule);";
    private $requeteClassement = "select jsonSerieGenrePouleClassement(:serie, :genre, :poule);";

    private $requeteTournoi = "select jsonSerieGenreTournoi(:serie,:genre);";


    public function __construct(private \PDO $pdo, private string $methode, private array $parametres, private string $titre="Pilota"){
	$this->$methode($this->parametres);
    }

    public function tournoi(array $envoi){
	
	$serie = $this->queDesChiffres($_POST['planningSerie']); 
	$genre = $this->queDesChiffres($_POST['planningGenre']);

	$valeurs = [':serie' => $serie, ':genre' => $genre];
	$reponse = $this->pdo->prepare($this->requeteTournoi);
	$reponse->execute($valeurs);
	$nombre = $reponse->fetch(\PDO::FETCH_NUM)[0];
	
	header('Content-Type: application/json');
	//$nombre = 390;
	$retour = json_encode($nombre);
	echo $retour;

    }
    

    public function inscription(array $envoi) {
	$serie = $this->queDesChiffres($_POST['inscriptionSerie']); 
	$genre = $this->queDesChiffres($_POST['inscriptionGenre']);

	$valeurs = [':serie' => $serie, ':genre' => $genre];
	$reponse = $this->pdo->prepare($this->requeteNombreEquipes);
	$reponse->execute($valeurs);
	$nombre = $reponse->fetch(\PDO::FETCH_NUM)[0];
	
	header('Content-Type: application/json');
	//$nombre = 390;
	$retour = json_encode($nombre);
	echo $retour;
    }


    public function inscriptions(array $envoi) {
	$serie = $this->queDesChiffres($_POST['serie']) ?? 1; // par défaut, première série
	$genre = $this->queDesChiffres($_POST['genre']) ?? 1; // par défaut, masculin

	$valeurs = [':serie' => $serie, ':genre' => $genre];
	$reponse = $this->pdo->prepare($this->requeteNombreEquipes);
	$reponse->execute($valeurs);
	$nombre = $reponse->fetch(\PDO::FETCH_NUM)[0];
	
	header('Content-Type: application/json');
	//$nombre = 390;
	$retour = json_encode($nombre);
	echo $retour;
    }

    public function liste(array $envoi){
	$serie_ = $this->queDesChiffres($_POST['listeSerie']);
	$genre_ = $this->queDesChiffres($_POST['listeGenre']);
	$serie = intval($serie_);
	$genre = intval($genre_);
	$valeurs = [':serie' => $serie, ':genre' => $genre];
	$reponse = $this->pdo->prepare($this->requeteNombrePoules);
	$reponse->execute($valeurs);
	$nombre = $reponse->fetch(\PDO::FETCH_NUM)[0];
	header('Content-Type: application/json');
	$retour = json_encode(range(1,$nombre));
	echo $retour;
    }

    public function equipes(array $envoi){
	$serie_ = $this->queDesChiffres($_POST['listeSerie']);
	$genre_ = $this->queDesChiffres($_POST['listeGenre']);
	$poule_ = $this->queDesChiffres($_POST['listePoule']);
	$serie = intval($serie_);
	$genre = intval($genre_);
	$poule = intval($poule_);
	$valeurs = [':serie' => $serie, ':genre' => $genre, ':poule' => $poule];
	$reponse = $this->pdo->prepare($this->requeteListePoule);
	$reponse->execute($valeurs);
	$liste = $reponse->fetch(\PDO::FETCH_NUM)[0];
	header('Content-Type: application/json');
	$retour = json_encode($liste);
	echo $retour;
    }

    public function classements(array $envoi){
	$serie_ = $this->queDesChiffres($_POST['classementsSerie']);
	$genre_ = $this->queDesChiffres($_POST['classementsGenre']);
	$poule_ = $this->queDesChiffres($_POST['classementsPoule']);

	$serie = intval($serie_);
	$genre = intval($genre_);
	$poule = intval($poule_);
	$valeurs = [':serie' => $serie, ':genre' => $genre, ':poule' => $poule];
	$reponse = $this->pdo->prepare($this->requeteListePoule);
	$reponse->execute($valeurs);
	$liste = $reponse->fetch(\PDO::FETCH_NUM)[0];
	header('Content-Type: application/json');
	$retour = json_encode($liste);
	echo $retour;

    }
    

    public function modifier(array $envoi){
    }
    
    
    

    public function paf(array $envoi) {
	//var_dump($envoi);
	//$message = json_decode(file_get_contents('php://input'), true);
	//$message = file_get_contents('php://input', true);
	$message = file_get_contents('php://input');
	echo $message;
	//var_dump($message);
	/* 
	 * 	$serie = $this->queDesChiffres($_POST['serie']) ?? 1; // par défaut, première série
	 * 	$genre = $this->queDesChiffres($_POST['genre']) ?? 1; // par défaut, masculin
	 * 
	 * 	$valeurs = [':serie' => $serie, ':genre' => $genre];
	 * 	$reponse = $this->pdo->prepare("select jsonSerieGenrePaf(:serie, :genre); as resultat");
	 * 	$reponse->execute($valeurs);
	 * 	$liste = $reponse->fetch(\PDO::FETCH_ASSOC); */
	
	header('Content-Type: application/json');
	//echo json_encode($liste);
	//echo json_encode($message);
	//echo json_encode(['nom' => "Louison Bobet"]);
	echo json_encode(['nom' => $message]);
    }


    public function index(array $envoi): void {
	$this->redirection('');
    }



}
