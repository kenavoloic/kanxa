# Kanxa

## Description

Ce logiciel a pour objet d’aider à la gestion d’un tournoi de pelote basque tels qu’ils sont organisés dans le sud-ouest de la France. Ces tournois s’étalent généralement sur plusieurs mois selon une formule combinant championnat de poules et éliminations directes. Ce format est similaire à celui d’une coupe du monde de football.

Un tournoi de pelote basque est généralement une juxtaposition de plusieurs tournois concomitants. Ainsi, ce qui est appelé tournoi est en réalité un tournoi féminin et un tournoi masculin. En outre, les équipes s’engagent dans une série correspondant à leurs niveaux.

Toutes ces combinaisons n’existent pas dans tous les tournois mais elles sont fréquentes. L’unité d’un tournoi se matérialise dans une unité de dates. Ainsi, le tournoi débutera en même temps, féminin ou masculin, première, deuxième ou troisième série. Les dates des phases de poules seront les mêmes. La même chose vaudra pour les quarts-de-finales, les demi-finales, les finales.

Les finales auront toutes lieu le même jour, au même endroit. Il est habituel de proposer pour les parties de finales, une alternance de parties féminines et masculines. 

## Problématique

Compte tenu de la variété des disciplines regroupées sous l’appellation de pelote basque, il a été nécessaire de rationaliser certains des paramètres du projet. En effet, il existe au moins 21 spécialités en pelote basque.

Les différences sont nombreuses :

- Différence de lieux : place libre (en extérieur), trinquet (en intérieur),  jaï-alaï (en intérieur). Les dimensions des surfaces de jeu vont de quelques mètres à 75 m de long.

- Différence d’instruments :  main-nue, cesta-punta, pala, paleton en carbone.

- Différences de décomptes : parties en 40 points, 35 points, 30 points, en deux manches de 15 points.

Dans le cadre de cette application, les points communs retenus sont relativement simples. Une partie de pelote basque opposera toujours deux équipes. Les compositions des équipes varient malgré tout :

- 1 personne.
- 2 personnes.
- 3 personnes.
- 5 personnes.

La pelote basque s’est modernisée. Une équipe peut être féminine, masculine ou mixte.

## RGPD

Pour tout club sportif, l’essentiel des ses activités tourne autour de la pratique sportive. L’organisation de compétitions s’inscrit dans ce cadre.  Les données recueillies pour l’organisation d’un tournoi doivent être nécessaires à l’organisation de celui-ci et n’ont pas vocation à être pérennisées. Il en va autrement quand une compétition est organisée par une fédération.

Cela signifie qu’en terme de bases de données, le choix a été fait de regrouper les informations liées aux équipes inscrites en une seule table. Une autre table rassemblera les résultats des parties. Une dernière contiendra un calendrier de toutes les parties sur la période allant du premier jour de tournoi au jour des finales. Ces tables sont amenées à être reconstituées à chaque nouveau tournoi.

Parallèlement, les tables ne contenant que des informations génériques seront conservées.

## Stored procedure et stored function

Inévitablement, les questions relatives à la gestion des données auront été les premiers obstacles. C’est au moyen de procédure et de fonctions SQL qu’ils ont été franchis. Fonctions pour obtenir des données. Procédure pour modifier les données.

Ce choix permet également d’apporter un premier niveau de sécurité dans la mesure où le client n’accède pas directement à la base de données.

Dès lors, PHP servira à nettoyer et valider les données puis servir le client. 

## Mobile-first

Ce projet est pensé *mobile-first*. Il privilégie les smart-phones et les tablettes. L’utilisateur doit être soit un officiel du club organisant le tournoi, soit une équipe engagée sur le tournoi.

C’est pour cela qu’il existe deux menus distincts.

Celui des *administrateurs* contient les onglets suivants :
1. *Score*  => afin de consigner le résultat d’une partie.
2. *Planning*  => l’établissement du calendrier des parties.
3. *Dates*  => détermination des dates générales du tournoi.
4. *Inscriptions* => les équipes participant au tournoi.
5. *Poules*  => constitution des poules selon les séries et les genres.
6. *P.A.F* => suivi du règlement des frais d’inscription.

Celui des *utilisateurs* est ainsi constitué :

1. *Rencontres* => visualisation des parties à venir.
2. *Résultats* => pour chaque série et genre les résultats des parties.
3. *Classement* => les classements de chacune des équipes au sein de leurs poules respectives.
4. *Contact*

## Technologies utilisées

1. PHP 8.2.2
2. MariaDB : 10.6.11-MariaDB-2 Debian
3. HTML5
4. SASS
5. JavaScript

## Structure du projet
```
├── application
│   ├── configuration
│   ├── lib
│   └── src
│       ├── Connexion
│       ├── Controleurs
│       ├── Generiques
│       ├── Modeles
│       └── Vues
│           └── patrons
│               └── composants
├── data
├── public
    ├── css
    ├── fontes
    ├── images
    ├── js
    └── scss
```
## Index.php

Il est situé dans le dossier public.

## Identifiants

Le fichier identifiants.ini contenant les identifiants de la base de données est structuré ainsi :

`utilisateur = ""`   
`mpasse = ""`   
`hote = ""`   
`dbase = ""`   
`port = 3306`   
`charset = "utf8"`   

Il est situé dans **application/configuration/**.

## Data

Ce dossier ne fait pas partie du projet.

1. *kanxa.sql* => mysqldump de la base de données
2. *tables.sql* => définition des tables
3. *procedures.sql* => code source des stored procedures.
4. *fonctions.sql* => code source des functions.
5. *kanxa.conf* => configuration du serveur Apache.
6. *kanxa_mcd.pdf* => mcd/uml de la base de données.
