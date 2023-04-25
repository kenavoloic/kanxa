<?php

namespace Controleurs;

class Paf {

    use \Generiques\Outils;
    use \Controleurs\OutilsControleurs;

    private $vue;
    private $requete = "select jsonSerieGenrePaf(:serie,:genre) as resultat;";
    private $requeteListe = "select jsonSerieGenrePaf(:serie, :genre) as resultat";
    private $requeteTraitement = "call boolRegularisationParticipation(:equipeId);";
    private array $donnees;
    

    public function __construct(private \PDO $pdo, private string $methode, private array $parametres, private string $titre="PAF"){

	if(!isset($_SESSION['series'])){
	    $_SESSION['series'] = $this->getJson($this->pdo, 'select jsonSeries();');
	}

	if(!isset($_SESSION['genres'])){
	    $_SESSION['genres'] = $this->getJson($this->pdo, 'select jsonGenres();');
	}
		
	$this->vue = new \Vues\Paf($this->titre);
	$this->donnees = [];

	$this->$methode($parametres);
    }


    public function regularisation(array $envoi){
	//var_dump($_POST);
	//$parametres = [];
	//parse_str($envoi[0], $parametres);
	//echo "regularisation => ";
	//var_dump($envoi);
	//$id = $this->queDesChiffres($envoi[0]);
	//echo "Identifiant => ";
	//echo $id;
	//echo "Parametres => ";
	//var_dump($parametres);
	//print_r($_SESSION['parametres']);

	$valeur = $this->queDesChiffres($_SESSION['parametres'][0]);
	$reponse = $this->pdo->prepare($this->requeteTraitement);
	$reponse->bindParam('equipeId', $valeur, \PDO::PARAM_INT);
	$reponse->execute();
	$retour_ = $reponse->fetch();
	$this->redirection('Location: /paf/traitement/1/1');
	/* $reponse->closeCursor();
	   $this->traitement(null); */

    }
    

    public function traitement(?array $envoi){
	$serie_ = isset($_POST['paf']['serie']) ?? 1;
	$genre_ = isset($_POST['paf']['genre']) ?? 1;
	$valeurs = [':serie' => $serie_, ':genre' => $genre_];
	$reponse = $this->pdo->prepare($this->requeteListe);
	$reponse->execute($valeurs);
	$retour_ = $reponse->fetchAll(\PDO::FETCH_ASSOC);
	$liste = json_decode(array_values($retour_[0])[0], true);
	$retour = ['liste' => $liste];

	//header('Location: /paf');
	$this->vue->affichage($retour);

	
	//$this->vue->affichageListe($liste);
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
	$this->vue->affichage(['titre' => $this->titre]);
    }
    

    public function __toString(): string {
	return "Participation aux frais. Frais d’inscription au tournoi.";
    }
    
}
