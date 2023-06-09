<?php
namespace Generiques;

interface Cancha {
    const listeBlanche = [
	// routes pour utilisateurs
	'accueil' => ['index'],
	'rencontres' => ['index'],
	'calendrier' => ['index'],
	'resultats' => ['index'],
	'classements' => ['index'],
	'contact' => ['index'],
	// routes pour administrateurs	
	'login' => ['index', 'connexion', 'deconnexion'],
	'score' => ['index'],
	'generales' => ['index','ecriture'],//'affichage'],
	'inscriptions' => ['index', 'ajout', 'liste', 'modification','nombre'],
	'inscription' => ['index', 'ajout','modification'],
	'poules' => ['index', 'traitement','liste','composition'],
	'liste' => ['index', 'equipes'],
	'planning' => ['index'],
	'paf' => ['index', 'liste', 'regularisation', 'traitement'],
	// ajax
	'pilota' => ['index','nombres','inscription','tournoi','inscriptions','liste','modifier','equipes','paf','classements']
    ];
}
