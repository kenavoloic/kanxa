<?php

namespace Vues;

class Score {

    use \Vues\OutilsVues;

    public function __construct(private string $titre="Kanxa"){
    }

    public function affichage(array $envoi){
    }

    public function __toString(): string {
	return "";
    }
    
    
}
