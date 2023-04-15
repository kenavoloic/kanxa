<?php

namespace Controleurs;

class Login {

    private $vue;

    public function __construct(private \PDO $pdo, private string $methode, private array $parametres, private string $titre="Login"){

	$this->vue = new \Vues\Login($this->titre);
	//echo $this->methode;
	//var_dump($_SESSION);
	//echo "Réception des parametres";
	$this->$methode();
    }

    private function affichage(string $titre='Login'){
	
    }
    

    

    public function connexion(): void {
	//echo "<h1>Connexion</h1>";
    }

    public function deconnexion(): void {
	echo "<h1>Déconnexion</h1>";
    }
    

    public function logout(): void {
	echo "Gone";
    }

    public function index(array $envoi): void {
	$this->redirection('accueil');
    }
    
    
}
