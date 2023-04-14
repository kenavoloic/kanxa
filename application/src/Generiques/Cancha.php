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
	'login/connexion' => ['connexion', 'deconnexion'],
	'logout' => ['deconnexion'],
	'score' => ['index'],
	'generales' => ['index'],
	'inscriptions' => ['index'],
	'poules' => ['index'],
	'planning' => ['index'],
	'paf' => ['index']
    ];
}
