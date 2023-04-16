<?php

namespace Controleurs;

class Login {

    private $vue;

    public function __construct(private \PDO $pdo, private string $methode, private array $parametres, private string $titre="Login"){

	$this->vue = new \Vues\Login($this->titre);
	//echo $this->methode;
	//var_dump($_SESSION);
	//echo "Réception des parametres";
	//$this->$methode();
    }

    private function affichage(string $titre='Login'){
	
    }
    

    

    public function connexion(array $envoi): void {
	echo "<h1>Connexion</h1>";
	var_dump($_POST);
	
    }

    public function deconnexion(): void {
	if(isset($_SESSION['connexion'])){
	    unset($_SESSION['connexion']);
	    header('Location: index.php');
	}
	header('Location: ' . 'accueil');
    }
    


    public function index(array $envoi): void {
	$this->redirection('accueil');
    }
    
    
}
