<?php

namespace Controleurs;

class Login {

    private $vue;

    public function __construct(private \PDO $pdo, private string $methode, private array $parametres, private string $titre="Login"){

	//$this->vue = new \Vues\Login($this->titre);
	$this->$methode();
    }

    public function connexion(): void {
	echo "<h1>Connexion</h1>";
    }

    public function deconnexion(): void {
	echo "Déconnexion";
    }
    

    public function logout(): void {
	echo "Gone";
    }
    
}
