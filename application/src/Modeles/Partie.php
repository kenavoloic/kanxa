<?php

namespace Modeles;

class Partie {

    public function __construct(private int $serie, private int $genre, private int $phase, private int $partieId, private int $equipe1Id, private int $equipe2Id, private int $score1=0, private int $score2=0, private string $observation=''){
    }

    public function setResultat(int $score1, int $score2): void{
	$this->score1 = $score1;
	$this->score2 = $score2;
    }

    public function getResultat(): array{
	return ['score1' => $this->score1, 'score2' => $this->score2, 'observation' => $this->observation];
    }

    public function getSerie(): int {
	return $this->serie;
    }

    public function getGenre(): int {
	return $this->genre;
    }

    public function getPhase(): int {
	return $this->phase;
    }

    public function getPartieId(): int {
	return $this->partieId;
    }

    public function getEquipe1Id(): int {
	return $this->equipe1Id;
    }

    public function getEquipe2Id(): int {
	return $this->equipe2Id;
    }
    
    public function setObservation(string $envoi): void {
	$this->observation = $envoi;
    }

    public function getObservation(): string {
	return $this->observation;
    }

    public function __toString(): string {
	return ($this->score1 != 0 && $this->score2 !=0) ?
	       "$this->serie,  $this->genre, $this->phase, Partie $this->partieId opposant $this->equipe1Id à $this->equipe2Id, score $this->score1 - $this->score2"
	     : "$this->serie,  $this->genre, $this->phase, Partie $this->partieId opposera $this->equipe1Id à $this->equipe2Id";
	
    }
    
    

}
