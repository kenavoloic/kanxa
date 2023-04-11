<?php

namespace Models;

class Poule {

    // $composition: contient la liste des équipes constituant la poule. Idéalement quatre équipes par poule.
    // tableau d'objets de type Equipe
    // $composition: liste des 'inscriptionId' 

    public function __construct(private int $serie, private int $genre, private int $pouleId, private array $equipes){
    }

    public function getSerie(): int {
	return $this->serie;
    }

    public function setSerie(int $envoi): void {
	$this->serie = $envoi;
    }

    public function getGenre(): int {
	return $this->genre;
    }

    public function setGenre(int $envoi): void {
	$this->genre = $envoi;
    }

    public function __toString(): string {
	return "Poule";
    }
