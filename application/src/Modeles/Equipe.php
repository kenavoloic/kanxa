<?php

namespace Modeles;

class Equipe {
    
    // Ce système de décompte ne fonctionne que pendant la phase de poule, par la suite, il s'agit d'élimination directe.
    // $j => nombre de parties jouées
    // $v => nombre de victoires
    // $d => nombre de défaites
    // $p => nombre de parties perdues : forfait, disqualification
    // $totalPoints => (nombre de victoire * valeurVictoire) + (nombre de défaites * valeurDefaite) 
    // $pointsGagnes => nombre total des points gagnés, points marqués contre les équipes adverses
    // $pointsPerdus => nombre total des points marqués par les équipes adverses contre cette équipe

    // En cas d'égalité entre deux équipes, elles seront départagées en prenant en compte la difference de points
    // différence de points = $pointsGagnes - $pointsPerdus
    // $moyennesPointsParties = $differencepoints / nombre de parties
    private int $differencePoints;
    private float $moyennePointsParties;

    // Au sortir des poules, l'équipe est-elle dans les deux premières de la poule ?
    // Si oui, elle demeure active et passe à la suivante, sinon elle sort du tournoi.
    // Au sortir des quarts, l'équipe victorieuse de sa partie accède aux demi-finales. Les équipes défaites sortent du tournoi.
    // Idem pour les demi-finales.
    
    //private bool $active_p;

    // identifiant de l'équipes selon les phases. Identifiant toujours combiné avec le prédicat $active_p
    //private int $quartId;
    //private int $demiFinaleId;
    //private int $finaleId;
    
    public function __construct(private string $inscriptionId, private int $serie, private int $genre, private int $j = 0, private int $v = 0, private int $d = 0, private int $p = 0, private int $totalPoints = 0, private int $pointsGagnes = 0, private int $pointsPerdus = 0, private bool $active_p = true, private int $quartId = null, private int $demiFinaleId = null, private int $finaleId = null){

	// Les valeurs suivantes sont calculées au fur et à mesure
	//$this->differencePoints = $this->pointsGagnes - $this->pointsPerdus;
	//$this->moyennePointsParties = ($this->j === 0) ? 0.0 : $this->differencePoints / $this->j;
    }

    public function getActive_p(): bool {
	return $this->active_p;
    }

    public function setActive_p(bool $envoi): void {
	$this->active_p = $envoi;
    }

    public function getInscriptionId(): string {
	return $this->inscriptionId;
    }
    
    public function setPouleId(int $envoi){
	$this->pouleId = $envoi;
    }

    public function getPouleId(): int{
	return $this->pouleId;
    }

    public function setQuartId(int $envoi): void {
	$this->quartId = $envoi;
    }

    public function getQuartId(): int {
	return $this->quartId;
    }

    public function setDemiFinaleId(int $envoi): void {
	$this->demiFinaleId = $envoi;
    }
    
    public function getDemiFinaleId(): int {
	return $this->demiFinaleId;
    }

    public function getFinaleId(): int {
	return $this->finaleId;
    }

    public function getPartiesJouees() :int {
	return $this->j;
    }

    public function setPartiesJouees(int $envoi): void {
	$this->j = $envoi;
    }

    public function getNombreVictoires(): int {
	return $this->v;
    }

    public function setNombreVictoires(int $envoi): void {
	$this->v = $envoi;
    }

    public function getNombreDefaites(): int {
	return $this->d;
    }

    public function setNombreDefaites(int $envoi): void {
	$this->d = $envoi;
    }

    public function getNombrePartiesPerdues(): int {
	return $this->p;
    }

    public function setNombrePartiesPerdues(int $envoi): void {
	$this->p = $envoi;
    }

    public function getTotalPoints(): int {
	return $this->totalPoints;
    }

    public function setTotalPoints(int $envoi): void {
	$this->totalPoints = $envoi;
    }

    public function getPointsGagnes(): int {
	return $this->pointsGagnes;
    }

    public function setPointsGagnes(int $envoi): void {
	$this->pointsGagnes = $envoi;
    }

    public function getPointsPerdus(): int {
	return $this->pointsPerdus;
    }

    public function setPointsPerdus(int $envoi): void {
	$this->pointsPerdus = $envoi;
    }
    
    public function getDifferencePoints(): int {
	return $this->pointsGagnes - $this->pointsPerdus;
    }

    public function getMoyennePointsParties(): float {
	return ($this->j === 0) ? 0.0 : $this->differencePoints / $this->j;
    }

    public function getStatistiques(): array {
	return (
	    'pouleId' => $this->pouleId,
	    'inscriptionId' => $this->inscriptionId,
	    'j' => $this->j,
	    'v' => $this->v,
	    'd' => $this->d,
	    'p' => $this->p,
	    'points' => $this->totalPoints	    
	    );
    }
    
    
    
}
