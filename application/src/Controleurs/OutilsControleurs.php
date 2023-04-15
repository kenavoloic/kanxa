<?php

namespace Controleurs;

trait OutilsControleurs {

    public function redirection(string $lien='index'): void {
	header('location: ' . $lien);
    }
    

    // Fonction qui accepte un objet PDO et retourne une fonction
    // Le seul inconvénient est la manière d'appeler la fonction retournée
    // $f1 = jsonData(PDO $connexion)
    // $f1("select jsonDatesGenerales()");
    
    // Dans un contexte de POO
    //	$this->lecture = $this->jsonData($this->pdo);
    //$this->datesGenerales = ($this->lecture)("select jsonDatesGenerales();");

    public  function jsonData(\PDO $connexion){
	return function(string $requete) use($connexion): array {
            $requete = $connexion->prepare($requete);
            $requete->execute();
            $retour = $requete->fetchAll(\PDO::FETCH_ASSOC);
            $texte = array_values($retour[0])[0];
            $liste = json_decode($texte, true);
            return $liste;
	};
    }

    public function jsonDataDeuxArguments(\PDO $connexion){
	return function(string $requete, int $serie, int $genre) use($connexion): array {
	    $requete = $connexion->prepare($requete);
	    $requete->bindValue(':p1', $serie);
	    $requete->bindValue(':p2', $genre);
	    $requete->execute();
	    $retour = $requete->fetchAll(\PDO::FETCH_ASSOC);
	    $texte = array_values($retour[0])[0];
	    $liste = json_decode($texte, true);
	    return $liste;
	};
    }

}
