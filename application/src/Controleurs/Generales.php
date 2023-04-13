<?php

namespace Controleurs;

class Generales {

    use OutilsControleurs;
    
    private $tableau;
    private $requete = "select jsonDatesGenerales();";
    private $lecture;
    private $toutes;
    
    public function __construct(private \PDO $pdo, private string $methode, private array $parametres){

	$this->lecture = $this->jsonData($this->pdo);
	//var_dump($this->lecture);
	$this->toutes = ($this->lecture)($this->requete);
	print_r($this->toutes[0]);

	//var_dump($this->toutes);
	
	
	//var_dump($this->pdo);
	$t1 = $this->pdo->prepare($this->requete);
	$t2 = $t1->execute();
	$this->tableau = $t1->fetchAll(\PDO::FETCH_ASSOC);
	//$liste = json_decode($this->tableau[0]);
	$t3 = array_values($this->tableau[0]);//[0];
	//$t3 = array_values($this->tableau[0])[0];
	//print_r($t3);]
	$t4 = json_decode($t3[0]);//print_r(json_decode($t3[0]));
	//print_r($t4);
	//var_dump($t3[0]);
	//var_dump($t3);
	//$this->tableau = $this->pdo->fetch("select jsonDatesGenerales();");
	//var_dump($this->tableau);
	//var_dump($liste);
	
	
    }

    public function __string(): string {
	return "Détermination  des dates générales du tournoi.";
    }

}

