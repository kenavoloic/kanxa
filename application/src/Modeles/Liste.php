<?php

namespace Modeles;

class Liste {

    private $requeteEquipeComplete = "select jsonEquipeComplete(:serie,:genre);";
    private $requeteEquipe = "select jsonEquipeParId(':equipeId');";

    public function __construct(private \PDO $pdo){
    }

    public function getEquipes(int $serie, int $genre): array {
	$valeurs = [':serie' => $serie, ':genre' => $genre];
	$reponse = $this->pdo->prepare($this->requeteEquipeComplete);
	$reponse->execute($valeurs);
	$retour_ = $reponse->fetchAll(\PDO::FETCH_ASSOC);
	$liste = !is_null(array_values($retour_[0])[0]) ? json_decode(array_values($retour_[0])[0], true) : null;
	$retour = ['liste' => $liste, 'serie'=> $serie, 'genre' => $genre];
	return $retour;
    }

    public function getEquipe(int $id): array{
	$nettoyee = preg_replace('/[^0-9,:]/', '', $id);	    
	$reponse = $this->pdo->prepare($this->requeteEquipe);
	$reponse->bindValue(':equipeId', $nettoyee);
	$reponse->execute();
    }

}

