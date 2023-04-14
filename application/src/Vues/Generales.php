<?php

namespace Vues;

class Generales {

    use OutilsVues;

    private $mois;
    private $jours;
    private $annees;
    private $donnees;
    
    public function __construct(private string $titre, private array $json){
	$this->donnees = array_map([$this, 'nettoyageJson'],json_decode($json['resultat'], true));
	//var_dump($this->donnees);
	//$this->affichage($this->titre);
    }

    // $jour = $jour - 1, car valeur en provenance de mysql pour qui le premier jour de l'année est 1
    // et non 0 pour PHP

    private function nettoyageJson(array $envoi): array {
	$dateId = htmlspecialchars($envoi['dateId']);
	$evenement = htmlspecialchars($envoi['evenement']);
	$jour = filter_var($envoi['jour'], FILTER_SANITIZE_NUMBER_INT);
	$annee = filter_var($envoi['annee'], FILTER_SANITIZE_NUMBER_INT);
	return ['dateId' => $dateId, 'evenement' => $evenement, 'jour' => $jour - 1, 'annee' => $annee];
    }
    

    public function affichage(string $titre){
	//echo($envoi);
	echo $this->getEntete($titre);
	echo $this->getComposant('headerAdministrateur');
	echo $this->getComposant('generales');
	echo $this->getComposant('basdepage');
    }
    

    public function __string(): string {
	return "Gestion des dates générales du tournoi.";
    }
    
}
