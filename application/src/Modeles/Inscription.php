<?php

namespace Modeles;

class Inscription {

    public function __construct(private \PDO $pdo){
    }

    public function ajout(array $equipe){
	echo "Inscription modèles =>ajout " . PHP_EOL;
	var_dump($equipe);
    }
    

    public function __toString(): string {
	return "Inscription (modèle)";
    }
    
}
