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
	/* 
	   if(is_null($chaine)){
	   $this->jour = new \DateTime();	    
	   }

	   if(!is_null($chaine) && preg_match('^[0-9]{4}-[0-9]{1,2}-[0-9]{1,2}$', $chaine)){
	   //$renverse = implode('-', explode('-', $chaine));
	   //$this->jour = new \DateTime($renverse);
	   $this->jour = new \DateTime($chaine);
	   }
	 */
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
	    return $this->nomDateMois->format($this->jour);	
	}

	public function getNomDateMoisAnnee(): string{
	    // dimanche 26 mars 2023
	    return $this->nomDateMoisAnnee->format($this->jour);	
	}

	public function getJJMMAAAA(): string {
	    return implode('-',[$this->getJour(), $this->getMois(), $this->getAnnee()]);	
	}

	public function getAAAAMMJJ(): string {
	    return implode('-',[$this->getAnnee(), $this->getMois(), $this->getJour()]);	
	}
	
	public function weekend_p(): bool {
	    //prédicat : 
	    //est-ce un samedi ou un dimanche ?
	    return preg_match('/samedi|dimanche/', $this->getNomJour()) ;
	}

	public function getHeure(): string {	
	    return ($this->jour)->format('H:i:s');
	}

	public function getHeures(): int {
	    return intval(($this->jour)->format('h'));
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
	    return $this->jour->format('Y-z');
	}

    }
