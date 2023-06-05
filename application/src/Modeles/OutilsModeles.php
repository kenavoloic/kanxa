<?php

namespace Modeles;

trait OutilsModeles {

    public function capitalisation(string $chaine): string {
	return ucfirst($chaine);
    }
    
}

