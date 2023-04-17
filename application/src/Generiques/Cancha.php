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
	'login' => ['index', 'connexion', 'deconnexion'],
	'score' => ['index'],
	'generales' => ['index','affichage'],
	'inscriptions' => ['index', 'liste', 'modification'],
	'poules' => ['index'],
	'planning' => ['index'],
	'paf' => ['index', 'liste', 'regularisation', 'traitement']
    ];
}
