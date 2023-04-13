<?php

namespace Vues;

class Generales {

    use OutilsVues;

    private $mois;
    private $jours;
    private $annees;
    
    public function __construct(private string $titre, private string $json){
	$this->affichage($this->json);
    }

    public function affichage(string $envoi){
	echo($envoi);
    }
    

    public function __string(): string {
	return "Gestion des dates générales du tournoi.";
    }
    
}
