<?php

namespace Controleurs;

class Login {

    use \Generiques\Outils;

    private $vue;
    private $requete = "select authentification(:utilisateur,:courriel);";

    public function __construct(private \PDO $pdo, private string $methode, private array $parametres, private string $titre="Login"){
	
	$this->vue = new \Vues\Login($this->titre);

	$this->$methode();
    }

    public function index(): void {
	$this->vue->affichage();
    }

    public function connexion(): void {

	$officiel = $_POST['administrateur'];
	$utilisateur = $this->nettoyageSimple($officiel['utilisateur']);
	$courriel = $this->nettoyageSimple($officiel['courriel']);
	$mpasse = $this->nettoyageSimple($officiel['mpasse']);

	$valeurs = [':utilisateur' => $utilisateur, ':courriel' => $courriel];
	$reponse = $this->pdo->prepare($this->requete);
	$reponse->execute($valeurs);
	$retour = $reponse->fetch(\PDO::FETCH_NUM);

	// retour nul si les identifiants sont erronnés
	if(is_null($retour)){
	    $this->redirection('login');
	}

	// les identifiants sont corrects. Quid du mot de passe ?
	$test = password_verify($mpasse, $retour[0]);

	if($test){
	    $_SESSION['officiel'] = true;
	    $this->redirection('');
	}

	// Si test = faux, redirection vers l'onglet login
	$this->redirection('login');
	
    }

    public function deconnexion(): void {
	unset($_SESSION['officiel']);
	$this->redirection('');
    }
    
}
