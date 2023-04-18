<?php

namespace Controleurs;

class Inscriptions {

    use \Generiques\Outils;

    private $vue;
    // Valeurs initiales
    private int $serie = 1;
    private int $genre = 1;
    private int $nombreInitial;

    private $nombreEquipes = "select intNombreEquipeSerieGenre(:serie,:genre);";
    
    public function __construct(private \PDO $pdo, private string $methode, private array $parametres, private string $titre="Inscriptions"){
	$this->vue = new \Vues\Inscriptions($this->titre);
	var_dump($_POST);
	/* $this->serie = $_SESSION['parametres']['serie'];
	   $this->serie = $_SESSION['parametres']['genre']; */
	$this->nombreInitial = $this->getNombreEquipes($this->serie, $this->genre);
	$this->$methode();
    }

    public function ajout(): void {
    }

    private function getNombreEquipes(int $serie_, int $genre_): int{
	
	/* $serie = $_POST['serie'] ? intval($_POST['serie']) : $serie_;
	   $genre = $_POST['genre'] ? intval($_POST['genre']) : $genre_; */
	$valeurs = [':serie' => $serie_, ':genre' => $genre_];
	$reponse = $this->pdo->prepare($this->nombreEquipes);
	$reponse->execute($valeurs);
	$retour = $reponse->fetch(\PDO::FETCH_NUM)[0];
	return is_null($retour) ? 0 : $retour;
    }

    public function index(): void {
	$this->vue->affichage($this->titre, $this->nombreInitial);
    }

    public function __toString(): string {
	return "Contrôleur. Gestion des inscriptions au tournoi.";
    }

}
