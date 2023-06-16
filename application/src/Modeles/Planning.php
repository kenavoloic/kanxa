<?php

namespace Modeles;

class Planning {

    private $requeteJourDebut = "select jsonDateDebut();";
    private $requeteJourQuarts = "select jsonDateQuarts();";
    private $requeteJourFin = " select jsonDateFin();";
    private $requeteTournoi = "select jsonSerieGenreTournoi(:serie,:genre) as resultat;";
    private $requeteNombrePoules = "select intNombrePoule(:serie, :genre) as resultat;";

    private $requetePartiesPoule = "select jsonCorrespondancePouleParties(:equipesParPoule) as resultat;";

    private JourCalendaire $debut;
    private JourCalendaire $fin;
    private PeriodeCalendaire $periode;
    
    public function __construct(private \PDO $pdo){
	$this->debut = new JourCalendaire($this->getJourDebut()['chaine']);
	$this->fin = new JourCalendaire($this->getJourFin()['chaine']);
	$this->periode = new PeriodeCalendaire($this->debut, $this->fin);
    }

    public function _getPartiesPoule(int $nombre): array {
	$valeurs = [':equipesParPoule' => $nombre];
	$reponse = $this->pdo->prepare($this->requetePartiesPoule);
	$reponse->execute($valeurs);
	return $reponse->fetchAll(\PDO::FETCH_ASSOC)[0];
	//$liste = $reponse->fetch(\PDO::FETCH_NUM);
	
	//$retour = json_encode($liste);
	//return $retour;
	//return json_decode($liste[0], true);
	//return $reponse->fetch(\PDO::FETCH_NUM)[0];
    }

    
    public function getNombrePoules(int $serie, int $genre): array {
	$valeurs = [':serie' => $serie, ':genre' => $genre];
	$reponse = $this->pdo->prepare($this->requeteNombrePoules);
	$reponse->execute($valeurs);
	$nombre = $reponse->fetch(\PDO::FETCH_NUM)[0];
	//$retour = json_encode(range(1,$nombre));
	return range(1,$nombre);
    }

    public function getPartiesPoule(int $nombre=4): array {
	$valeurs = [':equipesParPoule' => $nombre];
	$reponse = $this->pdo->prepare($this->requetePartiesPoule);
	$reponse->execute($valeurs);
	$retour =  $reponse->fetchAll(\PDO::FETCH_ASSOC);
	$liste = !is_null(array_values($retour[0])[0]) ? json_decode(array_values($retour[0])[0], true) : null;
	return ['liste' => $liste];
	
    }
    
    
    
    public function getTournoi(int $serie, int $genre): array {
	$valeurs = [':serie' => $serie, ':genre' => $genre];
	$reponse = $this->pdo->prepare($this->requeteTournoi);
	$reponse->execute($valeurs);
	$retour_ = $reponse->fetchAll(\PDO::FETCH_ASSOC);
	$liste = !is_null(array_values($retour_[0])[0]) ? json_decode(array_values($retour_[0])[0], true) : null;
	$retour = ['serie' => $serie, 'genre' => $genre, 'liste' => $liste];
	return $retour;
    }
    

    public function getJourQuarts(): array {
	$reponse = $this->pdo->prepare($this->requeteJourQuarts);
	$reponse->execute();
	$retour_ = $reponse->fetchAll(\PDO::FETCH_ASSOC);
	$liste = !is_null(array_values($retour_[0])[0]) ? json_decode(array_values($retour_[0])[0], true) : null;
	//return ['liste' => $liste];
	return $liste[0];
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
