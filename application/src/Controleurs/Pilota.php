<?php

namespace Controleurs;

class Pilota {

    use \Generiques\Outils;

    public function __construct(\PDO $pdo, private string $methode, private array $parametres, private string $titre="Pilota"){
	$this->$methode($this->parametres);
    }

    public function nombres(array $envoi): string {
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
    
}
