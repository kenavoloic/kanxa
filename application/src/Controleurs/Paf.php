<?php

namespace Controleurs;

class Paf {

    use \Generiques\Outils;
    use \Controleurs\OutilsControleurs;

    private $vue;
    private $requete = "select jsonSerieGenrePaf(:serie,:genre) as resultat;";
    private $requeteListe = "select jsonSerieGenrePaf(:serie, :genre) as resultat";
    private array $donnees;
    //private $jsonSerieGenrePaf;
    
    

    public function __construct(private \PDO $pdo, private string $methode, private array $parametres, private string $titre="PAF"){
	$this->vue = new \Vues\Paf($this->titre);
	$this->donnees = [];
	//$this->jsonSerieGenrePaf = $this->jsonDataDeuxArguments($this->pdo);
	//var_dump($_POST);
	$this->$methode($parametres);
    }


    public function reglements(?array $envoi){
    }
    

    public function traitement(?array $envoi){
	$serie_ = $_POST['paf']['serie'];
	$genre_ = $_POST['paf']['genre'];
	$valeurs = [':serie' => $serie_, ':genre' => $genre_];
	$reponse = $this->pdo->prepare($this->requeteListe);
	$reponse->execute($valeurs);
	$retour_ = $reponse->fetchAll(\PDO::FETCH_ASSOC);
	$liste = json_decode(array_values($retour_[0])[0], true);
	//echo $texte;
	//var_dump(json_decode($texte));
	//var_dump($liste[0]['equipeId']);
	$this->vue->affichageListe($liste);
    }
    

    public function _traitement2(array $envoi){
	//var_dump($envoi);
	//var_dump($_POST);
	$serie_ = $_POST['paf']['serie'];
	$genre_ = $_POST['paf']['genre'];
	$serie = $this->queDesChiffres($serie_) ?? 1;
	$genre = $this->queDesChiffres($genre_) ?? 1;
	$valeurs = [':serie' => $serie_, ':genre' => $genre_];
	$reponse = $this->pdo->prepare($this->requeteListe);
	$reponse->execute($valeurs);

	$v1 = $this->jsonSerieGenrePaf($serie, $genre);
	var_dump($v1);
	//$retour_ = $reponse->fetchAll(\PDO::FETCH_ASSOC)[0]['resultat'];
	//var_dump(json_decode($retour_));

	//$retour_ = $reponse->fetchAll();
	//var_dump($retour_);

	//var_dump($retour_[0]);
	//echo "Série $serie Genre $genre";
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
    

    public function _traitement(array $envoi): void {
	$liste = isset($_POST['paf']) ? $_POST['paf'] :  ['serie' => 0, 'genre' => 0];
    }
    

    public function index(array $envoi): void {
	$this->vue->affichage($this->titre);
    }
    

    public function __toString(): string {
	return "Participation aux frais. Frais d’inscription au tournoi.";
    }
    
}
