<?php

namespace Modeles;

class Accueil {
    use \Generiques\Outils;

    private $requeteDatesGenerales = "select jsonDatesGenerales();";
    private $requeteDatesEtablies_p = "select datesEtablies_p();";

    public function __construct(private \PDO $pdo){
    }

    public function datesEtablies_p(): bool {
	$reponse = $this->pdo->prepare($this->requeteDatesEtablies_p);
	$reponse->execute();
	$retour = $reponse->fetch();
	return $retour[0];
    }
    

    public function getDatesGenerales(): array {
	$reponse = $this->pdo->prepare($this->requeteDatesGenerales);
        $reponse->execute();
        $retour_ = $reponse->fetchAll(\PDO::FETCH_ASSOC);
        $liste = !is_null(array_values($retour_[0])[0]) ? json_decode(array_values($retour_[0])[0], true) : null;
        return $liste;
    }
    
}
