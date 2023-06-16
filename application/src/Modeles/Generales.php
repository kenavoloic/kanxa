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
	// vilain hack
	// c'était $jour = filter_var($envoi['jour'], FILTER_SANITIZE_NUMBER_INT);
	$jour = !is_null(filter_var($envoi['jour'], FILTER_SANITIZE_NUMBER_INT)) ? filter_var($envoi['jour'], FILTER_SANITIZE_NUMBER_INT) : 0;
	$annee = filter_var($envoi['annee'], FILTER_SANITIZE_NUMBER_INT);
	$chaine = !is_null($envoi['chaine']) ? htmlspecialchars($envoi['chaine']) : '';

	// 'jour' => $jour - 1
	// parce que pour mysql le 1er janvier est le jour 1
	// parce que pour php le 1er janvier est le jour 0
	//return ['dateId' => $dateId, 'evenement' => $evenement, 'jour' => $jour - 1, 'annee' => $annee, 'chaine' => $chaine];
	// vilain hack intval($jour - 1);
	return ['dateId' => $dateId, 'evenement' => $evenement, 'jour' => intval($jour) - 1, 'annee' => $annee, 'chaine' => $chaine];
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

    private function __getJJMMAAAA(\Modeles\JourCalendaire $j){
	//return $j->getNomDateMoisAnnee();
	//return $j->getNomDateMois();
	//return implode('-',[$j->getJour(), $j->getMois(), $j->getAnnee()]);
	//return $j->getNomJour() . ', ' .implode('-',[$j->getJour(), $j->getMois(), $j->getAnnee()]);
	//return $j->getNomJour() . ', ' .implode(' ',[$j->getJour(), $j->getNomMois(), $j->getAnnee()]);
	return [$j->getJour(), $j->getMois(), $j->getAnnee()];
    }
    
    public function lecture(): array{
	$req = $this->pdo->prepare($this->requeteDatesGenerales);
	$req->execute();
	$retour_ = $req->fetchAll(\PDO::FETCH_ASSOC)[0];
	//$retour = $this->nettoyageJson($retour_[0]);
	$donnees = array_map([$this, 'nettoyageJson'],json_decode($retour_['resultat'], true));
	//var_dump($donnees);
	//$liste = array_map([$this, 'getDateTime'], $donnees);
	//$liste = array_map([$this, 'getJourCalendaire'], $donnees);
	$liste = array_map(fn($x) => new \Modeles\JourCalendaire($x['chaine']), $donnees);
	//$toutes = array_map([$this, 'getJJMMAAAA'], $liste);
	//$toutes = array_map(fn($x) => $x->getJJMMAAAA(), $liste);
	//$toutes = array_map(fn($x) => array_merge($x->getJJMMAAAA(), [$x->getNomDateMois(), $x->getNomDateMoisAnnee()]), $liste);
	$toutes = array_map(fn($x) => ['jour' => $x->getJour(), 'mois' => $x->getMois(), 'annee' => $x->getAnnee(), 'court' => $x->getNomDateMois(), 'long' => $x->getNomDateMoisAnnee() ], $liste);

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
	//echo "écriture Modèle" . PHP_EOL;
	//print_r($huit);
	//echo "---------------------" . PHP_EOL;
	
	$requete = $this->pdo->prepare($this->req8);
	$valeurs = [':c1' => $huit[0], ':c2' => $huit[1], ':c3' => $huit[2], ':c4' => $huit[3], ':c5' => $huit[4], ':c6' => $huit[5], ':c7' => $huit[6], ':c8' => $huit[7]];
	$requete->execute($valeurs);	
    }
    

    public function __toString(): string {
	return "Generales";
    }
    
}
