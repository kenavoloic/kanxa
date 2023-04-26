<?php

namespace Modeles;

class Paf {
    use \Generiques\Outils;

    private $requete = "select jsonSerieGenrePaf(:serie,:genre) as resultat;";
    private $requeteListe = "select jsonSerieGenrePaf(:serie, :genre) as resultat";
    private $requeteTraitement = "call boolRegularisationParticipation(:equipeId);";


    public function __construct(private \PDO $pdo){
    }

    public function regularisation(int $id): int {
	$reponse = $this->pdo->prepare($this->requeteTraitement);
	$reponse->bindParam('equipeId', $valeur, \PDO::PARAM_INT);
	$reponse->execute();
	$retour = $reponse->fetch();
	return $retour[0];
    }
    
    
}
