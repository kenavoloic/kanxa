<?php

namespace Controleurs;

class Inscription {

    use \Generiques\Outils;

    private $modele;
    private $vue;

    public function __construct(private \PDO $pdo, private string $methode, private array $parametres, private string $titre="Inscription"){
	$this->vue = new \Vues\Inscription($this->titre);
	$this->modele = new \Modeles\Inscription($this->pdo);
	$this->$methode($this->parametres);
    }

    public function solo(?array $envoi){
    }
    
    public function paire(?array $envoi){
    }

    public function trio(?array $envoi){
    }

    public function index(?array $envoi){
	$this->vue->affichage($this->parametres);
    }
    
    
    
}
