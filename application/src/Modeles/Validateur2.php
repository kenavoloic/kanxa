<?php

namespace Modeles;

class Validateur2 {
    //Validateur pour des équipes de deux.

    use \Generiques\Outils;



    private $messages = [
	0 =>  "Ces données ne sont pas conformes au format.",
	1 =>  "Une valeur est nécessaire.",
	2 =>  "Ce champs ne peut être vide.",
	3 =>  "Dans quelle série ?",
	4 =>  "Quel tournoi ? Masculin, féminin ou mixte ?",
	5 =>  "Par de nom ?",
	6 =>  "Pas de prénom ?",
	7 =>  "Sans courriel, pas de calendrier des parties !",
	8 =>  "Sans numéro de mobile, comment le joindre rapidement ?",
	9 =>  "Parties en semaine, le week-end, indifférent ?",
	10 => "Il faut un numéro de licence issue par la FFPB."
    ];

    private array $validations;
    
    private int $serie;
    private int $serie;
    private int $genre;
    
    private string $nom1;
    private string $prenom1;
    private string $courriel1;
    private string $telephone1;
    private string $licence1;
    
    private string $nom2;
    private string $prenom2;
    private string $courriel2;
    private string $telephone2;
    private string $licence2;


    public function __construct(private array $data){

	['serie' => $serie, 'genre' => $genre, 'souhait' => $souhait, 'nom1' => $nom1, 'prenom1' => $prenom1, 'courriel1' => $courriel1, 'telephone1' => $telephone1, 'licence1' => $licence1,	 'nom2' => $nom2, 'prenom2' => $prenom2, 'courriel2' => $courriel2, 'telephone2' => $telephone2, 'licence2' => $licence2] = $this->data;

	$this->souhait = trim($souhait);
	$this->serie = trim($serie);
	$this->genre = trim($genre);
	
	$this->nom1 = trim($nom1);
	$this->prenom1 = trim($prenom1);
	$this->courriel1 = trim($courriel1);
	$this->telephone1 = trim($telephone1);
	$this->licence1 = trim($licence1);

	$this->nom2 = trim($nom2);
	$this->prenom2 = trim($prenom2);
	$this->courriel2 = trim($courriel2);
	$this->telephone2 = trim($telephone2);
	$this->licence2 = trim($licence2);
	
	$this->validations = [];

	$this->validations['souhait'] = $this->validationSouhait('souhait', $this->souhait);
	$this->validations['serie'] = $this->validationSerie('serie', $this->serie);
	$this->validations['genre'] = $this->validationGenre('genre', $this->genre);
	
	$this->validations['nom1'] = $this->validationNom('nom1', $this->nom1);
	$this->validations['prenom1'] = $this->validationPrenom('prenom1', $this->prenom1);
	$this->validations['courriel1'] = $this->validationCourriel('courriel1', $this->courriel1);
	$this->validations['telephone1'] = $this->validationTelephone('telephone1', $this->telephone1);
	$this->validations['licence1'] = $this->validationLicence('licence1', $this->licence1);

	$this->validations['nom2'] = $this->validationNom('nom2', $this->nom2);
	$this->validations['prenom2'] = $this->validationPrenom('prenom2', $this->prenom2);
	$this->validations['courriel2'] = $this->validationCourriel('courriel2', $this->courriel2);
	$this->validations['telephone2'] = $this->validationTelephone('telephone2', $this->telephone2);
	$this->validations['licence2'] = $this->validationLicence('licence2', $this->licence2);
	
    }

    private function validationSouhait(string $clef, string $envoi): array{
	$valeur = $this->queDesChiffres($envoi);
	$booleen = $this->souhait_p($valeur, "", $envoi));
	$message = $booleen ? '' : $this->messages[9];
	return ['booleen' => $booleen, $clef => $booleen, 'validation' => intval($valeur), 'message' => $message, 'type' => 'Souhait'];
    }

    private function validationSerie(string $clef, string $envoi): array{
	$booleen = $this->serie_p($valeur);
	$message = $booleen ? '' : $this->messages[3];
	return ['booleen' => $booleen, $clef => $booleen, 'validation' => $this->nettoyageSimple($valeur), 'message' => $message, 'type' => 'Série'];
    }

    private function validationGenre(string $clef, string $envoi): array{
	$valeur = preg_replace("/[^\d]/", "", $envoi);
	$booleen = $this->genre_p($envoi);
	$message = $booleen ? '' : $this->messages[4];
	return ['booleen' => $booleen, $clef => $booleen, 'validation' => intval($valeur), 'message' => $message, 'type' => 'Genre'];
    }

    private function validationNom(string $clef, string $envoi): array{
	$booleen = $this->nom_p($envoi);
	$message = $booleen ? '' : $this->messages[5];
	return ['booleen' => $booleen, $clef => $booleen, 'validation' => $this->nettoyageSimple($envoi), 'message' => $message, 'type' => 'Nom'];
    }

    private function validationPrenom(string $clef, string $envoi): array{
	$booleen = $this->prenom_p($envoi);
	$message = $booleen ? '' : $this->messages[6];
	return ['booleen' => $booleen, $clef => $booleen, 'validation' => $this->nettoyageSimple($envoi), 'message' => $message, 'type' => 'Prénom'];
    }

    private function validationCourriel(string $clef, string $envoi): array {
	$booleen = $this->courriel_p($envoi);
	$message = $booleen ? '' : $this->messages[7];
	return ['booleen' => $booleen, $clef => $booleen, 'validation' => $this->nettoyageSimple($envoi), 'message' => $message, 'type' => 'Courriel'];
    }

    //Ces deux champs sont optionnels, sont donc acceptés les champs vides.
    // Si le champs n'est pas vide, alors validation.
    private function validationTelephone(string $clef, string $envoi): array {
	$booleen = empty($envoi) ? true : $this->telephone_p($envoi);
	$message = $booleen ? '' : $this->messages[8];
	return ['booleen' => $booleen, $clef => $booleen, 'validation' => empty($envoi) ? '' : $this->nettoyageSimple($envoi), 'message' => $message, 'type' => 'Téléphone'];
    }

    private function validationLicence(string $clef, string $envoi): array {
	$booleen = empty($envoi) ? true : $this->licence_p($envoi);
	$message = $booleen ? '' : $this->messages[10];
	return ['booleen' => $booleen, $clef => $booleen, 'validation' => empty($envoi) ? '' : $this->nettoyageSimple($envoi), 'message' => $message, 'type' => 'Licence'];
    }

    public function getMessage(int $numero): string {
	return array_key_exists($numero, $this->messages) ? $this->messages[$numero] : $this->messages[0];
    }

    public function getValidations(): array {
	//faire le bilan des erreurs
	//dans une clef erreurs du tableau
	$listeErreurs = array_filter($this->validations, fn($x) => $x['booleen'] !== true);
	$nombreErreurs = count($listeErreurs);
	$nombreItems = count($this->validations);
	$messagesErreurs = array_map(fn($x) => $x['type'] . ' : ' . $x['message'], $this->validations);
	
	return $this->validations;
    }
    

    public function __toString(): string {

	return "Validateur pour Paire";
    }
    

}

