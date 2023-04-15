# Kanxa

## Description

Ce logiciel a pour objet d’aider à la gestion d’un tournoi de pelote basque tels qu'ils sont organisés dans le sud-ouest de la France. Ces tournois s'étalent généralement sur plusieurs mois selon une formule combinant championnat de poules et éliminations directes. Ce format est similaire à celui d'une coupe du monde de football.

Un tournoi de pelote basque est généralement une juxtaposition de plusieurs tournois concomitants. Ainsi, ce qui est appelé tournoi est en réalité un tournoi féminin et un tournoi masculin. En outre, les équipes s'engagent dans une série correspondant à leurs niveaux.

Toutes ces combinaisons n'existent pas dans tous les tournois mais elles sont fréquentes. L'unité d'un tournoi se matérialise dans une unité de dates. Ainsi, le tournoi débutera en même temps, féminin ou masculin, première, deuxième ou troisième série. Les dates des phases de poules seront les mêmes. La même chose vaudra pour les quarts-de-finales, les demi-finales, les finales.

Les finales auront toutes lieu le même jour, au même endroit. Il est habituel de proposer pour les parties de finales, une alternance de parties féminines et masculines. 

## Problématique

Compte tenu de variétés des disciplines regroupées sous l'appelation de pelote basque, il a été nécessaire de prendre de rationnaliser les paramètres.

Une partie de pelote basque opposera toujours deux équipes. Les compositions des équipes sont variées : 1 personne, 2 personnes, 3 personnes, 5 personnes.

Un tournoi organisé par un club doit respecter la réglementation en vigueur et notamment les obligations liées à la RGPD. Les données recueillies pour l'organisation d'un tournoi doivent être nécessaires à l'organisation de celui-ci et n'ont pas vocation à être pérennisées.

Cela signifie qu'en terme de bases de données, le choix a été fait de regrouper les informations liées aux équipes inscrites en une seule table. Une autre table rassemblera les résultats des parties. Une dernière contiendra un calendrier de toutes les parties sur la période allant du premier jour de tournoi au jour des finales. Ces tables sont amenées à être reconstituées à chaque nouveau tournoi.

Parrallèlement, les tables ne contenant que des informations génériques seront conservées.

## Choix

Les 




### Contexte

### Problématique


### Choix 

## Technologies utilisées

1. PHP 8.2.2
2. MariaDB : 10.6.11-MariaDB-2 Debian
3. HTML5
4. SASS
5. JavaScript

## Data

1. Dump de la base de données
2. tables.sql : définition des tables
3. procedures.sql : codes sources des stored procedures.
4. fonctions.ssql : codes sources des functions.


