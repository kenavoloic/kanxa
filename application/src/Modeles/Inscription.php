<?php

namespace Modeles;

class Inscription {

    public function __construct(private \PDO $pdo){
    }

    public function ajout(array $equipe){
	var_dump($equipe);
    }
    

    public function __toString(): string {
	return "Inscription (modèle)";
    }
    
}
