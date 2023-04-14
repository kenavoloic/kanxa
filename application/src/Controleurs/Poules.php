<?php

namespace Controleurs;

class Poules {

    private $vue;

    public function __construct(private \PDO $pdo, private string $methode, private array $parametres){
	$this->vue = new \Vues\Poules("Constitution des poules");
    }

    public function __toString(): string {
	return "Constitution graphique des poules.";
    }
    
}
