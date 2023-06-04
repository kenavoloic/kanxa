<?php

namespace Modeles;

use \Modeles\JourCalendaire;

class Generales {

    /* private \JourCalendaire $ouvertureInscriptions;
     * private \JourCalendaire $clotureInscriptions;
     * private \JourCalendaire $constitutionPoules;
     * private \JourCalendaire $envoiListePoules;
     * private \JourCalendaire $debutTournoi;
     * private \JourCalendaire $quarts;
     * private \JourCalendaire $demi;
     * private \JourCalendaire $finales; */


    
    private $requeteDatesGenerales = "select jsonDatesGenerales() as resultat;";
    private $requeteOI = "call changerDateOuvertureInscriptions(:chaine);";
    private $requeteCI = "call changerDateClotureInscriptions(:chaine);";
    private $requeteCP = "call changerDateConstitutionPoules(:chaine);";
    private $requeteELP = "call changerDateEnvoiListesPoules(:chaine);";
    private $requeteDT = "call changerDateDebutTournoi(:chaine);";
    private $requeteQ = "call changerDateQuarts(:chaine);";
    private $requeteD = "call changerDateDemi(:chaine);";
    private $requeteFin = "call changerDateFin(:chaine);";
    private $req8 = "call changerHuitDates(:c1, :c2, :c3, :c4, :c5, :c6, :c7, :c8);";
    

    public function __construct(private \PDO $pdo){
    }

    private function nettoyageJson(array $envoi): array {
	$dateId = htmlspecialchars($envoi['dateId']);
	$evenement = htmlspecialchars($envoi['evenement']);
	$jour = filter_var($envoi['jour'], FILTER_SANITIZE_NUMBER_INT);
	$annee = filter_var($envoi['annee'], FILTER_SANITIZE_NUMBER_INT);
	$chaine = htmlspecialchars($envoi['chaine']);

	return ['dateId' => $dateId, 'evenement' => $evenement, 'jour' => $jour - 1, 'annee' => $annee, 'chaine' => $chaine];
    }

    private function _getJJMMAAAA(\DateTime $envoi): array {
	$jj = intval($envoi->format('d'));
	$mm = intval($envoi->format('m'));
	$aaaa = intval($envoi->format('Y'));
	//echo $jj . ' ' . $mm . ' ' . $aaaa;
	return [$jj, $mm, $aaaa];
    }


    private function getJourCalendaire(array $envoi): \Modeles\JourCalendaire{
	return new \Modeles\JourCalendaire($envoi['chaine']);
    }

    private function getJJMMAAAA(\Modeles\JourCalendaire $j){
	//return $j->getNomDateMoisAnnee();
	//return $j->getNomDateMois();
	//return implode('-',[$j->getJour(), $j->getMois(), $j->getAnnee()]);
	//return $j->getNomJour() . ', ' .implode('-',[$j->getJour(), $j->getMois(), $j->getAnnee()]);
	//return $j->getNomJour() . ', ' .implode(' ',[$j->getJour(), $j->getNomMois(), $j->getAnnee()]);
	return [$j->getJour(), $j->getMois(), $j->getAnnee()];
    }
    
    
    
    /* 
     *     private function getDateTime0(array $envoi): \DateTime {
     * 	$retour = null;
     * 	try {
     * 	    $retour =  \DateTime::createFromFormat('Y z', $envoi['annee'] . ' ' . $envoi['jour']);
     * 	    $retour->setTimeZone(new \DateTimeZone('Europe/Paris'));
     * 	}
     * 	catch(\Exception $exception){
     * 	    $retour = new \DateTime('now', new \DateTimeZone('Europe/Paris'));	    
     * 	}
     * 	return $retour;	
     *     }
     *  */


    public function lecture(): array{
	$req = $this->pdo->prepare($this->requeteDatesGenerales);
	$req->execute();
	$retour_ = $req->fetchAll(\PDO::FETCH_ASSOC)[0];
	//$retour = $this->nettoyageJson($retour_[0]);
	$donnees = array_map([$this, 'nettoyageJson'],json_decode($retour_['resultat'], true));
	//$liste = array_map([$this, 'getDateTime'], $donnees);
	$liste = array_map([$this, 'getJourCalendaire'], $donnees);
	$toutes = array_map([$this, 'getJJMMAAAA'], $liste);

	//echo "modèle lecture => " . PHP_EOL;

	//var_dump($toutes);
	return $toutes;
	//var_dump($retour);

	//return $donnees;

	/* $dateId = htmlspecialchars($retour['dateId']);
	   $evenement = htmlspecialchars($retour['evenement']);
	   $jour = filter_var($retour['jour'], FILTER_SANITIZE_NUMBER_INT);
	   $annee = filter_var($retour['annee'], FILTER_SANITIZE_NUMBER_INT);
	   return ['dateId' => $dateId, 'evenement' => $evenement, 'jour' => $jour, 'annee' => $annee]; */

    }


    public function ecriture(array $huit){
	$requete = $this->pdo->prepare($this->req8);
	$valeurs = [':c1' => $huit[0], ':c2' => $huit[1], ':c3' => $huit[2], ':c4' => $huit[3], ':c5' => $huit[4], ':c6' => $huit[5], ':c7' => $huit[6], ':c8' => $huit[7]];
	$requete->execute($valeurs);	
    }
    

    public function __toString(): string {
	return "Generales";
    }
    
}
