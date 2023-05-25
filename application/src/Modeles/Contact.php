<?php
 
namespace Modeles;

class Contact {

    public function __construct(private \PDO $pdo){
    }


    public function __toString(): string {
	return "Contact (modèle)";
    }
    
}
