<?php

namespace Controleurs;

class Planning {

    use \Generiques\Outils;
    use \Controleurs\OutilsControleurs;

    private $vue;
    private $modele;

    public function __construct(private \PDO $pdo, private string $methode, private array $parametres, private string $titre="Planning des parties"){

	$this->modele = new \Modeles\Planning($this->pdo);
	$this->vue = new \Vues\Planning($this->titre);
	$this->$methode($parametres);
    }

    public function index(array $envoi): void {
	$this->vue->affichage(['titre' => $this->titre]);
    }
    

    public function __toString(): string {
	return "Calendrier des parties du tournoi";
    }
    
    
}

