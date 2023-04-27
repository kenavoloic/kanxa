<?php

namespace Controleurs;

class Score {

    use \Generiques\Outils;
    use \Controleurs\OutilsControleurs;

    private $vue;
    private $modele;

    public function __construct(private \PDO $pdo, private string $methode, private array $parametres, private string $titre="Score"){

	$this->modele = new \Modeles\Score($this->pdo);
	$this->vue = new \Vues\Score($this->titre);

	$this->$methode($parametres);
    }

    public function index(array $envoi): void {
	$this->vue->affichage(['titre' => $this->titre]);
    }
    

    public function __toString(): string {
	return "";
    }
    
    
}

