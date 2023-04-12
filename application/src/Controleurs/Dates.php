<?php

namespace Controleurs;

class Dates {

    public function __construct(private \PDO $pdo){
	echo "Contrôleur Dates";
    }

    public function __toString(): string {
	return "Dates générales du tournoi";
    }
    
}
