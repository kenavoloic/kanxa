<?php

namespace Controleurs;

class Generales {

    use OutilsControleurs;
    
    private $tableau;
    private $requete = "select jsonDatesGenerales() as resultat;";
    /* private $r2 = "select jsonEquipeSerieGenreAvecPoule(:p1,:p2);";
     * private $r3 = "select jsonEquipeSerieGenreSansPoule(:p1,:p2);"; */
    private $lecture;
    private $toutes;
    private $json;

    private $vue;
    
    public function __construct(private \PDO $pdo, private string $methode, private array $parametres){

	$this->lecture = $this->jsonData($this->pdo);

	$this->toutes = ($this->lecture)($this->requete);

	/* $this->lecture = $this->jsonDataDeuxArguments($this->pdo);
	   $avecPoule = ($this->lecture)($this->r2, 1, 1);

	   $this->lecture = $this->jsonDataDeuxArguments($this->pdo);
	   $sansPoule = ($this->lecture)($this->r3, 1, 1); */
	

	$t1 = $this->pdo->prepare($this->requete);
	$t2 = $t1->execute();
	$this->tableau = $t1->fetchAll(\PDO::FETCH_ASSOC);
	$u1 = $t1->fetchAll(\PDO::FETCH_ASSOC);
	//var_dump(json_decode($this->tableau[0]['resultat']), true);
	//$liste = json_decode($this->tableau[0]);
	//$t3 = array_values($this->tableau[0]);//[0];
	//$t3 = array_values($this->tableau[0])[0];
	//print_r($t3);]
	//$t4 = json_decode($t3[0]);//print_r(json_decode($t3[0]));
	//$this->vue = new \Vues\Generales("Dates Générales", $t3[0]);
	$this->vue = new \Vues\Generales("Dates Générales", $this->tableau[0]);
	//var_dump($this->toutes);
    }
    

    public function __string(): string {
	return "Détermination  des dates générales du tournoi.";
    }

}

