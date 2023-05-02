<?php

namespace Modeles;

class Planning {

    private $requeteJourDebut = "select jsonDateDebut();";
    private $requeteJourFin = " select jsonDateFin();";

    public function __construct(private \PDO $pdo){
    }

    public function getJourDebut(): array {
	$reponse = $this->pdo->prepare($this->requeteJourDebut);
	$reponse->execute();
	$retour_ = $reponse->fetchAll(\PDO::FETCH_ASSOC);
	$liste = !is_null(array_values($retour_[0])[0]) ? json_decode(array_values($retour_[0])[0], true) : null;
	//return ['liste' => $liste];
	return $liste[0];
    }

    public function getJourFin(): array {
	$reponse = $this->pdo->prepare($this->requeteJourFin);
	$reponse->execute();
	$retour_ = $reponse->fetchAll(\PDO::FETCH_ASSOC);
	$liste = !is_null(array_values($retour_[0])[0]) ? json_decode(array_values($retour_[0])[0], true) : null;
	//return ['liste' => $liste];
	return $liste[0];
    }

    public function __toString(): string {

	return "Planning général du tournoi";
    }
    
    
}
