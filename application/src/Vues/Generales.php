<?php

namespace Vues;

class Generales {

    use OutilsVues;

    private $mois;
    private $jours;
    private $annees;
    private $donnees;
    private $liste;
    private $toutes;

    public function __construct(private string $titre="Dates Générales"){
    }
    /*    
       public function aconstruct(private string $titre, private array $json){
       $this->donnees = array_map([$this, 'nettoyageJson'],json_decode($json['resultat'], true));
       $this->liste = array_map([$this, 'getDateTime'], $this->donnees);
       $this->toutes = array_map([$this, 'getJJMMAAAA'], $this->liste);
       $this->affichage($this->titre, $this->toutes);
       }
     */
    private function getJJMMAAAA(\DateTime $envoi): array {
	$jj = intval($envoi->format('d'));
	$mm = intval($envoi->format('m'));
	$aaaa = intval($envoi->format('Y'));
	//echo $jj . ' ' . $mm . ' ' . $aaaa;
	return [$jj, $mm, $aaaa];
    }
    

    private function getDateTime(array $envoi): \DateTime {
	$retour = null;
	try {
	    $retour =  \DateTime::createFromFormat('Y z', $envoi['annee'] . ' ' . $envoi['jour']);
	    $retour->setTimeZone(new \DateTimeZone('Europe/Paris'));
	}
	catch(\Exception $exception){
	    $retour = new \DateTime('now', new \DateTimeZone('Europe/Paris'));	    
	}
	return $retour;	
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

    public function affichage(array $envoi): void {
	$titre = $envoi['titre'];
	$tableau = $envoi['tableau'];
	$listeJours = $envoi['tableau'];

	//var_dump($envoi);
	//print_r($envoi);

	$tableau = [	    
	    'oi' => $listeJours[0],
	    'ci' => $listeJours[1],
	    'cp' => $listeJours[2],
	    'elp' => $listeJours[3],
	    'dt' => $listeJours[4],
	    'quarts' => $listeJours[5],
	    'demi' => $listeJours[6],
	    'finales' => $listeJours[7]
	];
	

	//echo "Vue affichage => " . PHP_EOL;
	//var_dump($tableau);
	echo $this->getEntete($titre);
	echo $this->getComposant('headerAdministrateur');
	echo $this->getComposantTableau('generales', $tableau);
	echo $this->getComposant('footer');
	echo $this->getFooterJavaScript('generales');
	echo $this->getComposant('basdepage');
    }
    

    public function affichage0(string $titre, array $listeJours){
	$tableau = [	    
	    'oi' => $listeJours[0],
	    'ci' => $listeJours[1],
	    'cp' => $listeJours[2],
	    'elp' => $listeJours[3],
	    'dt' => $listeJours[4],
	    'quarts' => $listeJours[5],
	    'demi' => $listeJours[6],
	    'finales' => $listeJours[7]
	];

	echo $this->getEntete($titre);
	echo $this->getComposant('headerAdministrateur');
	echo $this->getComposantTableau('generales', $tableau);
	echo $this->getComposant('footer');
	echo $this->getFooterJavaScript('generales');
	echo $this->getComposant('basdepage');
    }
    

    public function __string(): string {
	return "Gestion des dates générales du tournoi.";
    }
    
}
