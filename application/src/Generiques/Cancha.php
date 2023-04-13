<?php
namespace Generiques;

interface Cancha {
    const listeBlanche = [
	// routes pour utilisateurs
	'accueil' => ['index'],
	'rencontres' => ['index'],
	'resultats' => ['index'],
	'classements' => ['index'],
	'contact' => ['index'],
	// routes pour administrateurs	
	'login' => ['index'],
	'logout' => ['index'],
	'score' => ['index'],
	'generales' => ['index'],
	'inscriptions' => ['index'],
	'poules' => ['index'],
	'planning' => ['index'],
	'paf' => ['index']
    ];
}
