<?php
 
namespace Modeles;

class Classements {

    public function __construct(private \PDO $pdo){
    }


    public function __toString(): string {
	return "Classements (modèle)";
    }
    
}
