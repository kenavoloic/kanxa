<?php
namespace Controleurs;

class Accueil {

    use \Generiques\Outils;

    private $vue;
    private $modele;
    private $datesGenerales;
    private $datesEtablies_p;
    
    public function __construct(private \PDO $pdo, private string $methode, private array $parametres, private string $titre="Accueil"){

	$this->vue = new \Vues\Accueil($this->titre);
	$this->modele = new \Modeles\Accueil($this->pdo);
	$this->datesGenerales = $this->modele->getDatesGenerales();
	$this->datesEtablies_p = $this->modele->datesetablies_p();
	$this->$methode();
    }

    public function index(): void{
	//$datesGenerales = $this->modele->getDatesGenerales();
	//$this->vue->affichage($this->titre);
	//echo 'établies ? ' . $this->datesEtablies_p;
	$this->vue->affichage(['titre' => $this->titre, 'datesGenerales' => $this->datesGenerales, 'predicat' => $this->datesEtablies_p]);
    }
    

    public function __toString(): string{
	return "Contrôleur par défaut. Son unique tâche est d’instancier la vue de l’accueil.";
    }
    
    
}
