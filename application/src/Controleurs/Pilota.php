<?php

namespace Controleurs;

class Pilota {

    use \Generiques\Outils;

    private $nombreEquipes = "select intNombreEquipeSerieGenre(:serie,:genre);";

    public function __construct(private \PDO $pdo, private string $methode, private array $parametres, private string $titre="Pilota"){
	$this->$methode($this->parametres);
    }

    public function _nombres(array $envoi): string {
	//var_dump($_POST);
	var_dump($envoi);
	$serie = $this->queDesChiffres($envoi[0]);
	$genre = $this->queDesChiffres($envoi[1]);
	$nombre = ['nombre' => 10];
	//return json_encode(10);
	header('Content-Type: application/json');
	$retour = json_encode($nombre);
	return $retour;
    }

    public function inscriptions(array $envoi) {
	$serie = $this->queDesChiffres($_POST['serie']) ?? 1; // par défaut, première série
	$genre = $this->queDesChiffres($_POST['genre']) ?? 1; // par défaut, masculin

	$valeurs = [':serie' => $serie, ':genre' => $genre];
	$reponse = $this->pdo->prepare($this->nombreEquipes);
	$reponse->execute($valeurs);
	$nombre = $reponse->fetch(\PDO::FETCH_NUM)[0];
	
	header('Content-Type: application/json');
	//$nombre = 390;
	$retour = json_encode($nombre);
	echo $retour;
    }

    public function index(array $envoi): void {
	$this->redirection('');
    }
    
    
    
}
