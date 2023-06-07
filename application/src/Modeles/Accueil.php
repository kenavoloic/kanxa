<?php

namespace Modeles;

class Accueil {
    use \Generiques\Outils;

    private $requeteDatesGenerales = "select jsonDatesGenerales();";
    private $requeteDatesEtablies_p = "select datesEtablies_p();";

    public function __construct(private \PDO $pdo){
    }

    public function datesEtablies_p(): bool {
	$reponse = $this->pdo->prepare($this->requeteDatesEtablies_p);
	$reponse->execute();
	$retour = $reponse->fetch();
	return $retour[0];
    }
    

    public function getDatesGenerales(): array {
	$reponse = $this->pdo->prepare($this->requeteDatesGenerales);
        $reponse->execute();
        $retour_ = $reponse->fetchAll(\PDO::FETCH_ASSOC);
        $liste = !is_null(array_values($retour_[0])[0]) ? json_decode(array_values($retour_[0])[0], true) : null;
	$listeJours = array_map(fn($x) => new \Modeles\JourCalendaire($x['chaine']), $liste);
	//$chaines = array_map(fn($x) => $x->getNomDateMoisAnnee() .' ' . $x->getHeure(), $listeJours);
	//$retour = ['ouverture' => $chaines[0], 'cloture' => $chaines[1], 'debut' => $chaines[4], 'finales' => $chaines[7]];
	$retour = ['ouverture' => $listeJours[0], 'cloture' => $listeJours[1], 'debut' => $listeJours[4], 'finales' => $listeJours[7]];

	/* echo "modeles Accueil getdatesgenerales => " . PHP_EOL;
	   echo $retour['ouverture']->getnomDateMoisAnnee() . PHP_EOL;
	   echo $retour['cloture']->getnomDateMoisAnnee() . PHP_EOL;
	   echo $retour['debut']->getnomDateMoisAnnee() . PHP_EOL;
	   echo $retour['finales']->getnomDateMoisAnnee() . PHP_EOL; */
	//print_r($retour);
        return $retour;
    }
    
}
