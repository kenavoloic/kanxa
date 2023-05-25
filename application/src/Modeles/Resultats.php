<?php
 
namespace Modeles;

class Resultats {

    public function __construct(private \PDO $pdo){
    }


    public function __toString(): string {
	return "Resultats (modèle)";
    }
    
}
