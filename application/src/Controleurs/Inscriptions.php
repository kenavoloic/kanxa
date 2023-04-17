<?php

namespace Controleurs;

class Inscriptions {

    private $vue;
    
    public function __construct(private \PDO $pdo, private string $methode, private array $parametres, private string $titre="Inscriptions"){
	$this->vue = new \Vues\Inscriptions($this->titre);
	$this->$methode();
    }

    public function index(): void {
	$this->vue->affichage($this->titre);
    }

    public function __toString(): string {
	return "Contrôleur. Gestion des inscriptions au tournoi.";
    }
    
}
