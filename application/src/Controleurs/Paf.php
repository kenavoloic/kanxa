<?php

namespace Controleurs;

class Paf {

    use \Generiques\Outils;
    use \Controleurs\OutilsControleurs;

    private $vue;
    //private $requete = "select jsonSerieGenrePaf(:serie,:genre) as resultat;";
    //private $requeteListe = "select jsonSerieGenrePaf(:serie, :genre) as resultat";
    //private $requeteTraitement = "call boolRegularisationParticipation(:equipeId);";
    //private array $donnees;

    private $modele;
    private $bilan;
    

    public function __construct(private \PDO $pdo, private string $methode, private array $parametres, private string $titre="PAF"){

	/* if(!isset($_SESSION['series'])){
	   $_SESSION['series'] = $this->getJson($this->pdo, 'select jsonSeries();');
	   }

	   if(!isset($_SESSION['genres'])){
	   $_SESSION['genres'] = $this->getJson($this->pdo, 'select jsonGenres();');
	   } */

	if(empty($_SESSION['paf']['serie']) || empty($_SESSION['paf']['genre'])){
	    $_SESSION['paf']['serie'] = 0;
	    $_SESSION['paf']['genre'] = 0;
	}
	
	$this->modele = new \Modeles\Paf($this->pdo);
	$this->bilan = $this->modele->getBilan();
	$this->vue = new \Vues\Paf($this->titre);
	//$this->donnees = [];

	//echo "-1 => " . $this->modele->regularisation(-1);

	$this->$methode($this->parametres);
    }


    public function regularisation(array $envoi){
	//echo "regularisation " . PHP_EOL;
	//var_dump($envoi);
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
	/*
	   echo 'regularisation => ' . $_SESSION['uri'];
	   $valeur = $this->queDesChiffres($_SESSION['parametres'][0]);
	   $reponse = $this->pdo->prepare($this->requeteTraitement);
	   $reponse->bindParam('equipeId', $valeur, \PDO::PARAM_INT);
	   $reponse->execute();
	   $retour_ = $reponse->fetch();
	 */
	//$serie_ = isset($_POST['paf']['serie']) ? intval($_POST['paf']['serie']) :  0;
	//$genre_ = isset($_POST['paf']['genre']) ? intval($_POST['paf']['genre']) : 0;

	//print_r($_POST['paf']);

	//$serie_ = !empty($_POST['paf']['serie']) ? intval($_POST['paf']['serie']) :  2;
	//$genre_ = !empty($_POST['paf']['genre']) ? intval($_POST['paf']['genre']) : 2;


	//$serie_ = !empty($_POST['paf']['serie']) ? intval($_POST['paf']['serie']) :  2;
	//$genre_ = !empty($_POST['paf']['genre']) ? intval($_POST['paf']['genre']) : 2;

	
	//$serie_ = $_SESSION['paf']['serie'];
	//$genre_ = $_SESSION['paf']['genre'];

	//$_SESSION['paf']['serie'] = $_POST['paf']['serie'];
	//$_SESSION['paf']['genre'] = $_POST['paf']['genre'];
	
	$serie_ = $_SESSION['paf']['serie'];
	$genre_ = $_SESSION['paf']['genre'];


	
	$valeur = $this->queDesChiffres($_SESSION['parametres'][0]);
	$this->modele->regularisation($valeur);

	//echo "régularisation =>  ";
	//echo "id=> $valeur regularisation => $serie_ $genre_";
	
	$aAfficher = $this->modele->traitement($serie_, $genre_);
	$this->vue->affichage($aAfficher);

	//var_dump($retour);
	//$this->redirection('Location: /paf/traitement/1/1');
	/* $reponse->closeCursor();
	   $this->traitement(null); */

    }
    

    public function traitement(?array $envoi){
	//echo 'traitement => ' . $_SESSION['uri'] . PHP_EOL;
	//echo 'Post => ';
	//var_dump($_POST);
	
	//$serie_ = isset($_POST['paf']['serie']) ? intval($_POST['paf']['serie']) :  0;
	//$genre_ = isset($_POST['paf']['genre']) ? intval($_POST['paf']['genre']) : 0;


	
	$serie_ = $_SESSION['paf']['serie'] = $_POST['paf']['serie'];
	$genre_ = $_SESSION['paf']['genre'] = $_POST['paf']['genre'];
	/*
	   echo "traitement =>  ";
	   echo "$serie_ $genre_";

	   
	   $valeurs = [':serie' => $serie_, ':genre' => $genre_];
	   $reponse = $this->pdo->prepare($this->requeteListe);
	   $reponse->execute($valeurs);
	   $retour_ = $reponse->fetchAll(\PDO::FETCH_ASSOC);
	   $liste = !is_null(array_values($retour_[0])[0]) ? json_decode(array_values($retour_[0])[0], true) : null;
	   $retour = ['liste' => $liste];

	 */
	$aAfficher = $this->modele->traitement(intval($serie_), intval($genre_));
	$this->vue->affichage($aAfficher);
	
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

    public function index(array $envoi): void {
	//var_dump($this->bilan);
	$this->vue->affichage(['titre' => $this->titre, 'bilan' => $this->bilan]);
    }
    

    public function __toString(): string {
	return "Participation aux frais. Frais d’inscription au tournoi.";
    }
    
}
