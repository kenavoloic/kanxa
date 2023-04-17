<?php

namespace Controleurs;

class Inscriptions {

    use \Generiques\Outils;

    private $vue;
    // Valeurs initiales
    private $serie = 1;
    private $genre = 1;

    private $nombreEquipes = "select intNombreEquipeSerieGenre(:serie,:genre);";
    
    public function __construct(private \PDO $pdo, private string $methode, private array $parametres, private string $titre="Inscriptions"){
	$this->vue = new \Vues\Inscriptions($this->titre);
	$this->$methode();
    }

    public function ajout(): void {
	$t = $_POST['parametres'];
	var_dump($t);
    }
    

    private function getNombreEquipes(): int {
	$envoi = $_POST['nombreEquipes'] ;
	$serie = $this->queDesChiffres($envoi['serie']);
	$genre = $this->queDesChiffres($envoi['genre']);
	$valeurs = [':serie' => $serie, ':genre' => $genre];
	$reponse = $this->pdo->prepare($this->nombreEquipes);
	$reponse->execute($valeurs);
	$retour = $reponse->fetch(\PDO::FETCH_NUM);
	return is_null($retour) ? 0 : $retour;
    }
    

    public function index(): void {
	$this->vue->affichage($this->titre);
    }

    public function __toString(): string {
	return "Contrôleur. Gestion des inscriptions au tournoi.";
    }

}
