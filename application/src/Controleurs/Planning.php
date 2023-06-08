<?php

namespace Controleurs;

class Planning {

    use \Generiques\Outils;
    use \Controleurs\OutilsControleurs;

    private $vue;
    private $modele;
    //private int $jourDebut;
    //private int $jourFin;
    //private $debut;
    //private $fin;
    //private $periode;

    public function __construct(private \PDO $pdo, private string $methode, private array $parametres, private string $titre="Planning des parties"){

	$this->modele = new \Modeles\Planning($this->pdo);
	$this->vue = new \Vues\Planning($this->titre);
	$this->$methode($parametres);

	//$_SESSION['planning']['debut'] = $this->modele->getJourDebut();
	//$_SESSION['planning']['fin'] = $this->modele->getJourFin();

	//var_dump($this->modele->getNombrePoules(1,1));
	//var_dump($this->modele->getTournoi(1,1));

	
	if(empty($_SESSION['planning']['debut']) || empty($_SESSION['planning']['fin'])){
	    $_SESSION['planning']['debut'] = $this->modele->getJourDebut()['chaine'];
	    $_SESSION['planning']['fin'] = $this->modele->getJourFin()['chaine'];
	}
	$debut_ = $_SESSION['planning']['debut'];
	$fin_ = $_SESSION['planning']['fin'];

	//$this->debut = new \Modeles\JourCalendaire($debut_['annee'], 0, 0, $debut_['jour']);
	//$this->fin = new \Modeles\JourCalendaire($fin_['annee'], 0, 0, $fin_['jour']);
	//$this->periode = new \Modeles\PeriodeCalendaire($this->debut, $this->fin);
    }

    public function index(array $envoi): void {
	$this->vue->affichage(['titre' => $this->titre, 'tableau' => $this->modele->getTournoi(1,1)]);
    }

    public function __toString(): string {
	return "Calendrier des parties du tournoi";
    }
    
    
}

