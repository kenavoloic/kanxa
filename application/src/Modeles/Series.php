<?php

namespace Modeles;

class Series {

    $s_ = 'select jsonSeries() as resultat;';
    $g_ = 'select jsonGenres() as resultat;';
    

    public function __construct(private \PDO $pdo){
	$this
    }
    

}
