<?php
namespace Controleurs;

class Accueil {

    use \Generiques\Outils;

    private $vue;
    
    public function __construct(private \PDO $pdo, private string $methode, private array $parametres, private string $titre="Accueil"){

	$this->vue = new \Vues\Accueil($this->titre);
	$this->$methode();
    }

    public function index(): void{
	$this->vue->affichage($this->titre);
    }
    

    public function __toString(): string{
	return "Contrôleur par défaut. Son unique tâche est d’instancier la vue de l’accueil.";
    }
    
    
}
