<?php

namespace Modeles;

class PeriodeCalendaire {

    // Classe servant à organiser le planning des parties de poules et certainement des quarts, demi et finales

    private int $nombreJours;
    // nouvel objet avec mêmes arguments que l'objet $debut, afin de ne pas modifier ce dernier.
    // plus simple de créer un nouvel objet que de le cloner.
    private JourCalendaire $copie; 
    private array $listeJours;
    private array $joursSemaine;
    private array $joursWeekend;
    // private array $joursFeries;
    // à implémenter : jourFérié = jourWeekend => à retrancher des joursSemaine
    // et à ajouter aux joursWeekend

    // Periodecalendaire -> CreneauCalendaire -> CreneauHoraire
    public function __construct(private JourCalendaire $debut, private JourCalendaire $fin){
        $this->nombreJours = ($this->fin->getNumeroJour() - $this->debut->getNumeroJour());
        $this->copie = new JourCalendaire($this->debut->getAnnee(), $this->debut->getMois(), $this->debut->getJour());
        $this->listeJours = $this->_getListeNomsJour($this->copie, $this->debut->getNumeroJour(), $this->fin->getNumeroJour());
        $this->joursSemaine = $this->_joursSemaine($this->listeJours);
        $this->joursWeekend = $this->_joursWeekend($this->listeJours);	
    }

    public function getNombreCreneauxDisponibles(): int {
        return 0;
    }

    public function getCreneauxDisponibles(): array {
        return [];
    }
    

    public function getNombreCreneauxReserves(): int {
        return tous;
    }

    public function getCreneauxReserves(): array {
        return [];
    }

    public function getNombreJours(): int {
        return $this->nombreJours;
    }

    public function getNombreJoursSemaine(): int {
        return count($this->joursSemaine());
    }

    public function getNombreJoursWeekend(): int {
        return count($this->joursWeekend);
    }
    
    public function getListeNomsJour(): array {
        return $this->listeJours;
    }

    public function getJoursSemaine(): array{
        return $this->joursSemaine;
    }

    public function getJoursWeekend(): array {
        return $this->joursWeekend;
    }

    private function _joursWeekend(array $envoi): array {
        return array_filter($envoi, function($x) { return preg_match('/samedi|dimanche/', $x['nomJour']);});
    }

    private function _joursSemaine(array $envoi): array {
        return array_filter($envoi, function($x) { return !preg_match('/samedi|dimanche/', $x['nomJour']);});
    }

    public function getNomsJJMMAAAA(): array {
	$lambda = fn($x) => $x['jj'] === 1 ?
			  $x['nomJour'].' '. $x['jj'] .'<sup>er</sup> '. $x['mois'] .' '.$x['aaaa']
			: $x['nomJour'].' '. $x['jj'] .' '. $x['mois'] .' '.$x['aaaa'];
	return array_map($lambda, $this->listeJours);
    }

    public function getNumeroJourAnneeJJMMAAAA(): array {
	$lambda = fn($x) => $x['jj'] === 1 ?
			  ['numero' => $x['numeroJour'], 'annee' => $x['aaaa'], 'jjmmaaaa' => $x['nomJour'].' '. $x['jj'] .'<sup>er</sup> '. $x['mois'] .' '.$x['aaaa']]
			: ['numero' => $x['numeroJour'], 'annee' => $x['aaaa'], 'jjmmaaaa' => $x['nomJour'].' '. $x['jj'] .' '. $x['mois'] .' '.$x['aaaa']];
	return array_map($lambda, $this->listeJours);
    }

    private function _getListeNomsJour(JourCalendaire $envoi, int $debut, int $fin): array{
	// fonction lambda locale à cette méthode
	$lambda = function(JourCalendaire $j){
	    return function() use ($j){
		$j->plusUnJour();
		return ['nomJour' => $j->getNomJour(),
			'numeroJour' => $j->getNumeroJour(),
			'jj' => $j->getJour(),
			'mm' => $j->getMois(),
			'mois' => $j->getNomMois(),
			'aaaa' => $j->getAnnee()];
	    };
	};

	$mu = $lambda($envoi);
	
	$retour = array_map($mu, range($debut, $fin));
	return $retour;
    }
    
    public function getNomPremierJour(): string{
	return $this->debut->getNomJour();
    }

    public function getNumeroPremierJour(): int {
	return $this->debut->getNumeroJour();
    }

    public function getNomDernierJour(): string{
	return $this->fin->getNomJour();
    }

    public function getNumeroDernierJour(): int {
	return $this->fin->getNomJour();
    }

    public function __toString(): string {
	return "$this->nombreJours";
    }
    
}
