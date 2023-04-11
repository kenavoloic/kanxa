<?php
namespace Generiques;

interface Cancha {
    const listeBlanche = [
	// routes pour utilisateurs
	'accueil' => ['index'],
	'planning' => ['index'],
	'resultats' => ['index'],
	'classement' => ['index'],
	'contact' => ['index'],
	'login' => ['index'],
	'cafe' => ['chocolat', 'croissants'],
	// routes pour administrateurs	
	'logout' => ['index'],
	'dates' => ['index'],
	'inscriptions' => ['index'],
	'poules' => ['index'],
	'calendrier' => ['index'],
	'resulat' => ['index']
    ];
}
