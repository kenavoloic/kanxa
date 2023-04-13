<?php

namespace Modeles;

class Generales {

    private \JourCalendaire $ouvertureInscriptions;
    private \JourCalendaire $clotureInscriptions;
    private \JourCalendaire $constitutionPoules;
    private \JourCalendaire $envoiListePoules;
    private \JourCalendaire $debutTournoi;
    private \JourCalendaire $quarts;
    private \JourCalendaire $demi;
    private \JourCalendaire $finales;
    
    
    

    public function __construct( ){
    }

    public function __toString(): string {
	return "Generales";
    }
    
}
