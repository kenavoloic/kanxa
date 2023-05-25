<?php
 
namespace Modeles;

class Calendrier {

    public function __construct(private \PDO $pdo){
    }


    public function __toString(): string {
	return "Calendrier (modèle)";
    }
    
}
