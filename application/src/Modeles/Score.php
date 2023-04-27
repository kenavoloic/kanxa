<?php

namespace Modeles;

class Score {

    use \Vues\OutilsVues;

    public function __construct(private \PDO $pdo){
    }

    public function affichage(array $envoi){
    }

    public function __toString(): string {
	return "";
    }
    
    
}
