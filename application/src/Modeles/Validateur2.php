<?php

namespace Modeles;

class Validateur2 {
    //Validateur pour des équipes de deux.

    use \Generiques\Outils;

    private array $validations;

    public function __construct(private array $data){

	['serie' => $serie, 'genre' => $genre, 'souhait' => $souhait, 'nom1' => $nom1, 'prenom1' => $prenom1, 'courriel1' => $courriel1, 'telephone1' => $telephone1, 'licence1' => $licence1,	 'nom2' => $nom2, 'prenom2' => $prenom2, 'courriel2' => $courriel2, 'telephone2' => $telephone2, 'licence2' => $licence2] = $this->data;

	$this->serie = trim($serie);
	$this->genre = trim($genre);
	$this->nom1 = trim($nom1);
	$this->prenom1 = trim($prenom1);
	$this->courriel1 = trim($courriel1);
	$this->telephone1 = trim($telephone1);
	$this->licence1 = trim($licence1);
	
	$this->validations = [];

	$this->validations['souhait'] = $this->validationSouhait('souhait', $this->souhait);
	$this->validations['serie'] = $this->validationSerie('serie', $this->serie);
    }

    private function validationSouhait(string $clef, string $envoi): array{
	$valeur = preg_replace("/[^\d]/", "", $envoi);
	$booleen = $this->souhait_p($valeur);	
	return [$clef => $booleen, 'validation' => intval($valeur)];
    }

    private function validationSerie(string $clef, string $envoi): array{
	$valeur = preg_replace("/[^\d]/", "", $envoi);
	$booleen = $this->serie_p($valeur);	
	return [$clef => $booleen, 'validation' => intval($valeur)];
    }

    
    

    public function getValidations(): array {
	//faire le bilan des erreurs
	//dans une clef erreurs du tableau
	return $this->validations;
    }
    

    public function __toString(): string {

	return "Validateur pour Paire";
    }
    

}

