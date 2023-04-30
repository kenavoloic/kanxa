<?php

namespace Controleurs;

class Liste {

    use \Controleurs\OutilsControleurs;

    private $modele;
    private $vue;

    public function __construct(private \PDO $pdo, private string $methode, private array $parametres, private string $titre="Liste de équipes"){

	$this->vue = new \Vues\Liste($this->titre);
	$this->modele = new \Modeles\Liste($this->pdo);
	$this->$methode($this->parametres);	
    }
    

    public function index(){
	//$this->vue->affichage(['titre' => $this->titre]);
	var_dump($this->modele->getEquipes(1,1)['liste']);
    }
}
