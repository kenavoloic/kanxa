<?php

namespace Controleurs;

class Generales {

    use OutilsControleurs;
    
    //private $tableau;
    //private $requete = "select jsonDatesGenerales() as resultat;";
    /* private $r2 = "select jsonEquipeSerieGenreAvecPoule(:p1,:p2);";
     * private $r3 = "select jsonEquipeSerieGenreSansPoule(:p1,:p2);"; */
    //private $lecture;
    //private $toutes;
    //private $json;

    private $modele;
    private $vue;

    public function __construct(private \PDO $pdo, private string $methode, private array $parametres, private string $titre="Dates Générales"){
	$this->vue = new \Vues\Generales($this->titre);
	$this->modele = new \Modeles\Generales($this->pdo);
	$this->$methode($this->parametres);
    }
    


    private function index(): void {
	//$modele = $this->
	$lecture = $this->modele->lecture();
	$this->vue->affichage(['titre' => $this->titre, 'tableau' => $lecture]);
	
    }
    
    
    

    public function __string(): string {
	return "Détermination  des dates générales du tournoi.";
    }

}

