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
	//'login/connexion' => ['connexion', 'deconnexion'],
	//'logout' => ['deconnexion'],

	'login' => ['connexion'],
	'login' => ['deconnexion'],
	'score' => ['index'],
	'generales' => ['affichage'],
	'inscriptions' => ['index'],
	'poules' => ['index'],
	'planning' => ['index'],
	'paf' => ['accueil']
    ];
}
