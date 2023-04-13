<?php

namespace Controleurs;

trait OutilsControleurs {
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

}
