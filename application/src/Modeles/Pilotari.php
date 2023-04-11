<?php
namespace Modeles;

class Pilotari {

    public function __construct(private string $nom, private string $prenom, private string $courriel, private string $telephone, private string $licence){
    }

    private function getNom(): string {
	return $this->nom;
    }

    private function setNom(string $envoi): void {
	$this->nom = trim($envoi);
    }

    private function getPrenom(): string {
	return $this->prenom;
    }

    private function setPrenom(string $envoi): void {
	$this->prenom = trim($envoi);
    }

    private function getCourriel(): string {
	return $this->courriel;
    }

    private function setCourriel(string $envoi): void {
	$this->courriel = trim($envoi);
    }

    private function getTelephone(): string {
	return $this->telephone;
    }

    private function setTelephone(string $envoi): void {
	$this->telephone = trim($envoi);
    }

    public function __toString(): string {
	return "$this->nom $this->prenom";
    }
    
    
	
    
    
}
