<?php

namespace Modeles;

class JourCalendaire {

    private \DateTime $jour;

    private \IntlDateFormatter $nomJourSemaine;
    private \IntlDateFormatter $nomDateMois;
    private \IntlDateFormatter $nomDateMoisAnnee;
    private \IntlDateFormatter $nomMois;

    public function __construct(private ?string $chaine){

	$this->jour = preg_match('/^[0-9]{4}-[0-9]{1,2}-[0-9]{1,2}$/', $chaine) ? new \DateTime($chaine) : new \DateTime();

	$this->jour->setTime(9,0); // heure par défaut 9:00:00

	$this->nomJourSemaine = new \IntlDateFormatter("fr_FR", \IntlDateFormatter::FULL, \IntlDateFormatter::FULL, 'Europe/Paris', \IntlDateFormatter::GREGORIAN, 'EEEE');
	$this->nomDateMois = new \IntlDateFormatter("fr_FR", \IntlDateFormatter::FULL, \IntlDateFormatter::FULL, 'Europe/Paris', \IntlDateFormatter::GREGORIAN, 'EEEE d MMMM');
	$this->nomDateMoisAnnee = new \IntlDateFormatter("fr_FR", \IntlDateFormatter::FULL, \IntlDateFormatter::FULL, 'Europe/Paris', \IntlDateFormatter::GREGORIAN, 'EEEE d MMMM Y');
	$this->nomMois = new \IntlDateFormatter("fr_FR", \IntlDateFormatter::FULL, \IntlDateFormatter::FULL, 'Europe/Paris', \IntlDateFormatter::GREGORIAN, 'MMMM');
	
    }

    public function getDateTime(): \DateTime {
	// Objet DateTime
	return $this->jour;
    }

    public function getNumeroJour(): int {
	// version numérique du jour: de 0 à 366
	return intval(($this->jour)->format('z'));
    }

    public function getJour(): int {
	// jour : 1 -> 31
	return intval(($this->jour)->format('d'));
    }

    public function getMois(): int {
	// mois : 1 -> 12
	return intval(($this->jour)->format('m'));
    }

    public function getAnnee(): int {
	// Année en quatre chiffres
	//return $this->annee;
	return intval(($this->jour)->format('Y'));
    }

    public function getNumeroJourAnnee(): array {
	// tableau contenant le numéro du jour et l'année
	return [$this->getNumeroJour(), $this->getAnnee()];
    }

    public function getNomJour(): string {
	// Nom du jour en français
	return $this->nomJourSemaine->format($this->jour);	
    }

    public function getNomMois(): string {
	// Nom du mois en français
	return $this->nomMois->format($this->jour);
    }

    public function getNomDateMois(): string{
	// dimanche 26 mars
	
	// Si c'est le 1er du mois
	$remplacement = fn($x) => str_replace("1", " 1<sup>er</sup> ", $x);
	$chaine = $this->nomDateMois->format($this->jour);
	$jj = $this->getJour() === 1 ? $remplacement($this->getJour()) : $this->getJour();
	$mm = $this->getNomMois();
	$aaaa = $this->getAnnee();

	return "$chaine $jj $mm $aaaa";

	//return ($this->getJour() === 1) ? $remplacement($this->nomDateMois->format($this->jour)) : $this->nomDateMois->format($this->jour);
	//return ($this->getJour() === 1) ? $remplacement($chaine) : $chaine;
	
    }

    public function getNomDateMoisAnnee(): string{
	// dimanche 26 mars 2023

	// Si c'est le 1er du mois
	$remplacement = fn($x) => str_replace("1", " 1<sup>er</sup> ", $x);
	//$chaine = $this->nomDateMoisAnnee->format($this->jour);
	$chaine = $this->nomJourSemaine->format($this->jour);

	/* echo "===> " . $chaine . PHP_EOL;
	   echo "===> " . $this->getAnnee() . PHP_EOL;
	   echo "===> " . $this->nomJourSemaine->format($this->jour) . PHP_EOL; */

	// conversion de l'année sans raison, 2022 au lieu de 2023
	// création chaîne à la main
	//$jj = $remplacement($this->getJour());
	$jj = $this->getJour() === 1 ? $remplacement($this->getJour()) : $this->getJour();
	$mm = $this->getNomMois(); //$this->getMois();
	$aaaa = $this->getAnnee();
	/* $retour = $this->nomJourSemaine->format($this->jour);
	   $retour .= " ";
	   $retour .= $this->getJour();
	   $retour .= " ";
	   $retour .= $this->getMois();
	   $retour .= " ";
	   $retour .= $this->getAnnee();
	   $retour = $remplacement($retour); */
	//echo "aaaa $aaaa" . PHP_EOL;
	//echo "???? " . $retour . PHP_EOL;
	//return ($this->getJour() === 1) ? $remplacement($this->nomDateMoisAnnee->format($this->jour)) : $this->nomDateMoisAnnee->format($this->jour);
	//return ($this->getJour() === 1) ? $remplacement($chaine) : $chaine;
	return "$chaine $jj $mm $aaaa";
    }


    public function getChaineJJMMAAAA(): string {
	return implode('-',[$this->getJour(), $this->getMois(), $this->getAnnee()]);	
    }
    
    public function getJJMMAAAA(): array {
	return [$this->getJour(), $this->getMois(), $this->getAnnee()];	
    }

    public function getChaineAAAAMMJJ(): string {
	return implode('-',[$this->getAnnee(), $this->getMois(), $this->getJour()]);	
    }
    
    public function getAAAAMMJJ(): array {
	return [$this->getAnnee(), $this->getMois(), $this->getJour()];	
    }
    
    public function weekend_p(): bool {
	//prédicat : 
	//est-ce un samedi ou un dimanche ?
	return preg_match('/samedi|dimanche/', $this->getNomJour()) ;
    }

    public function getHeure(): string {	
	return ($this->jour)->format('H:i:s');
    }

    
    /* public function setHeures(int $heure): void {
       $this->jour->setTime($heure,0,0);
     * }
     */
    public function setHeures(int $heure): void {
	$this->jour->setTime($heure, $this->jour->getMinutes(),0);
    }
    
    public function getHeures(): int {
	return intval(($this->jour)->format('h'));
    }

    public function setMinutes(int $minutes): void{
	$this->jour->setTime($this->jour->getHeures(), $minutes);
    }
    
    public function getMinutes(): int {
	return intval(($this->jour)->format('i'));
    }
    
    public function getSecondes(): int {
	return intval(($this->jour)->format('s'));
    }

    public function plusUnJour(): void{
	$this->jour->modify('+ 1 day');
    }

    public function __toString(): string{
	//return $this->jour->format('Y-z');
	return $this->jour->format('Y-m-d');
    }

}
