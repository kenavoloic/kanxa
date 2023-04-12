<?php
namespace Controleurs;

class Accueil {

    use \Generiques\Outils;

    private $vue;
    
    public function __construct(private \PDO $pdo, private string $methode, private array $parametres, private string $titre="Accueil"){
	$this->vue = new \Vues\Accueil($this->titre);
    }

    public function __toString(){
	return "Contrôleur par défaut. Son unique tâche est d’instancier la vue de l’accueil.";
    }
    
    
}
