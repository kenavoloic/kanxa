<?php

namespace Controleurs;

class Generales {

    use \Generiques\Outils;
    use OutilsControleurs;
    
    private $modele;
    private $vue;

    public function __construct(private \PDO $pdo, private string $methode, private array $parametres, private string $titre="Dates Générales"){
	$this->vue = new \Vues\Generales($this->titre);
	$this->modele = new \Modeles\Generales($this->pdo);
	$this->$methode($this->parametres);
    }

    private function jjmmaaaa(array $envoi): string{
	//return new \Modeles\JourCalendaire($envoi['annee'] .'-'. $envoi['mois'] .'-'. $envoi['annee']);
	//return $envoi['annee'] .'-'. $envoi['mois'] .'-'. $envoi['jour'];
	$annee = $this->chiffre_p($envoi['annee']) ? $envoi['annee'] : (new \Modeles\JourCalendaire())->getAnnee();
	$mois = $this->chiffre_p($envoi['mois']) ? $envoi['mois'] : (new \Modeles\JourCalendaire())->getMois();
	$jour = $this->chiffre_p($envoi['jour']) ? $envoi['jour'] : (new \Modeles\JourCalendaire())->getJour();
	$chaine = implode('-', [$annee, $mois, $jour]);
	$j = new \Modeles\JourCalendaire($chaine); //->getAAAAMMJJ();
	return $j->getAAAAMMJJ();
	//return $j->getJJMMAAAA();
    }
    

    public function ecriture(?array $envoi){
	$dates = $_POST['dates'];
	$retour = [];
	$retour[] = $this->jjmmaaaa($dates['ouvertureInscriptions']);
	$retour[] = $this->jjmmaaaa($dates['clotureInscriptions']);
	$retour[] = $this->jjmmaaaa($dates['constitutionPoules']);
	$retour[] = $this->jjmmaaaa($dates['envoiListePoules']);
	$retour[] = $this->jjmmaaaa($dates['debutTournoi']);
	$retour[] = $this->jjmmaaaa($dates['quarts']);
	$retour[] = $this->jjmmaaaa($dates['demi']);
	$retour[] = $this->jjmmaaaa($dates['finales']);

	$this->modele->ecriture($retour);

	$this->redirection('generales');
    }
    


    private function index(): void {
	$lecture = $this->modele->lecture();
	$this->vue->affichage(['titre' => $this->titre, 'tableau' => $lecture]);
    }

    public function __string(): string {
	return "Détermination  des dates générales du tournoi.";
    }

}

