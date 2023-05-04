-- v13
USE tournoi;

DROP PROCEDURE IF EXISTS creationTournoi;
DROP PROCEDURE IF EXISTS booleenCreationTableauResultat;
DROP PROCEDURE IF EXISTS booleenEtablissementPlanning;
DROP PROCEDURE IF EXISTS booleenCreationPlanning;
DROP PROCEDURE IF EXISTS creationPlanning;
DROP PROCEDURE IF EXISTS booleenDateGenerale;
DROP PROCEDURE IF EXISTS booleenCreationCalendrier;
DROP PROCEDURE IF EXISTS booleenCreationPoule;
DROP PROCEDURE IF EXISTS booleenAnnulationCreationPoule;
DROP PROCEDURE IF EXISTS booleenAjoutTournoiId;

DROP PROCEDURE IF EXISTS boolRegularisationParticipation;
DROP PROCEDURE IF EXISTS constitutionPoules;

DROP PROCEDURE IF EXISTS constitutionPoulesAttributionPouleId;

DELIMITER $$
CREATE PROCEDURE creationTournoi(IN _serie INT, IN _genre INT)
BEGIN
SET @serie = _serie;
SET @genre = _genre;
SET @requete = CONCAT('INSERT INTO parties(serie, genre, phase, phaseId, equipe1, equipe2) VALUES
-- poule 1
(?,?,1,1,1,2),
(?,?,1,2,1,3),
(?,?,1,3,1,4),
(?,?,1,4,2,3),
(?,?,1,5,2,4),
(?,?,1,6,3,4),
-- poule 2
(?,?,1,7,1,2),
(?,?,1,8,1,3),
(?,?,1,9,1,4),
(?,?,1,10,2,3),
(?,?,1,11,2,4),
(?,?,1,12,3,4),
-- poule 3
(?,?,1,13,1,2),
(?,?,1,14,1,3),
(?,?,1,15,1,4),
(?,?,1,16,2,3),
(?,?,1,17,2,4),
(?,?,1,18,3,4),
-- poule 4
(?,?,1,19,1,2),
(?,?,1,20,1,3),
(?,?,1,21,1,4),
(?,?,1,22,2,3),
(?,?,1,23,2,4),
(?,?,1,24,3,4),
-- quarts
(?,?,2,25,1,8),
(?,?,2,26,2,7),
(?,?,2,27,3,6),
(?,?,2,28,4,5),
-- demi
(?,?,3,29,1,4),
(?,?,3,30,2,3),
-- finale
(?,?,4,31,1,2);
');
PREPARE preRequete FROM @requete;
EXECUTE preRequete USING @serie, @genre, @serie, @genre, @serie, @genre, @serie, @genre, @serie, @genre, @serie, @genre, @serie, @genre, @serie, @genre, @serie, @genre, @serie, @genre, @serie, @genre, @serie, @genre, @serie, @genre, @serie, @genre, @serie, @genre, @serie, @genre, @serie, @genre, @serie, @genre, @serie, @genre, @serie, @genre, @serie, @genre, @serie, @genre, @serie, @genre, @serie, @genre, @serie, @genre, @serie, @genre, @serie, @genre, @serie, @genre, @serie, @genre, @serie, @genre, @serie, @genre;
DEALLOCATE PREPARE preRequete;
END;
$$

DELIMITER $$
CREATE PROCEDURE booleenCreationTableauResultat(IN _serie INT, IN _genre INT)
-- création du tournoi pour la série et le genre
-- si tournoi existe déjà, aucune action
BEGIN
DECLARE test TINYINT(1) DEFAULT 1;
DECLARE retour TINYINT(1) DEFAULT 0;

SET test = (SELECT tournoi_p(_serie, _genre));

IF (test = 0) THEN
CALL creationTournoi(_serie, _genre);
SET retour = 1;
END IF;

SELECT retour;
END;
$$

DELIMITER $$
CREATE PROCEDURE booleenCreationCalendrier()
BEGIN
DECLARE retour TINYINT(1) DEFAULT 0;
DECLARE etablies_p TINYINT(1) DEFAULT 0;
DECLARE _debut INT DEFAULT 1; -- 1 janvier
DECLARE _fin INT DEFAULT 365; -- 30 ou 31 décembre
DECLARE _annee INT DEFAULT 2023; -- année en cours
DECLARE premierJour INT DEFAULT -1;
DECLARE planningId_p TINYINT DEFAULT 0;
-- DECLARE reussite_p TINYINT(1) DEFAULT 0;
SET etablies_p = (SELECT datesEtablies_p());
-- SELECT datesEtablies_p() INTO etablies_p;

IF (etablies_p = 1) THEN
SELECT jour INTO _debut FROM datesGenerales WHERE dateId=5;
SELECT annee INTO _annee FROM datesGenerales WHERE dateId=5;
SELECT jour INTO _fin FROM datesGenerales WHERE dateId=8;
CALL creationPlanning(_debut, _fin, _annee);
END IF;

-- SELECT jour from planning WHERE planningId=1 INTO premierJour;
SELECT calendrier_p() INTO planningId_p;
IF (planningId_p = 1) THEN
SET retour = 1;
END IF;

-- IF (premierJour > -1) THEN
-- SET retour = 1;
-- END IF;

SELECT retour;
END;
$$

DELIMITER $$
CREATE PROCEDURE booleenEtablissementPlanning()
BEGIN
DECLARE retour TINYINT(1) DEFAULT 0;
DECLARE debutJour INT DEFAULT 1;
DECLARE debutAnnee INT DEFAULT 2023;
DECLARE finJour INT DEFAULT 365;
DECLARE finAnnee INT DEFAULT 2023;

DECLARE etablies TINYINT(1) DEFAULT 0;
SET etablies = (SELECT datesEtablies_p());

IF (etablies = 1) THEN

SET debutJour = (SELECT jour from datesGenerales where dateId = 5);
SET debutAnnee = (SELECT annee from datesGenerales where dateId = 8);
SET finJour = (SELECT jour from datesGenerales where dateId = 8);
SET finAnnee = (SELECT annee from datesGenerales where dateId = 8);
-- SET retour = CALL booleenCreationPlanning(debutJour, finJour, finAnnee);

-- DECLARE pointeur INT DEFAULT debutJour;


END IF;

SELECT retour;
END;
$$

DELIMITER $$
CREATE PROCEDURE booleenCreationPlanning(premierJour INT, dernierJour INT, annee INT)
BEGIN

DECLARE pointeur INT DEFAULT premierJour;
DECLARE retour TINYINT(1) DEFAULT 0;

SET @requete = CONCAT('INSERT INTO planning(jour, annee, heure) VALUES (?, ?, 9), (?, ?, 10), (?, ?, 11), (?, ?, 12), (?, ?, 13), (?, ?, 14), (?, ?, 15), (?, ?, 16), (?, ?, 17), (?, ?, 18), (?, ?, 19)');
SET @annee = annee;

WHILE pointeur <= dernierJour DO
SET @numeroJour = pointeur;
PREPARE preRequete FROM @requete;
EXECUTE preRequete USING @numeroJour, @annee, @numeroJour, @annee, @numeroJour, @annee, @numeroJour, @annee, @numeroJour, @annee, @numeroJour, @annee, @numeroJour, @annee, @numeroJour, @annee, @numeroJour, @annee, @numeroJour, @annee, @numeroJour, @annee;
DEALLOCATE PREPARE preRequete;
SET pointeur = pointeur + 1;
END WHILE;

IF (pointeur != premierJour) THEN
SET retour = 1;
END IF;
SELECT retour;
END;
$$

DELIMITER $$
CREATE PROCEDURE creationPlanning(premierJour INT, dernierJour INT, annee INT)
BEGIN

DECLARE pointeur INT DEFAULT premierJour;
DECLARE retour TINYINT(1) DEFAULT 0;

SET @requete = CONCAT('INSERT INTO planning(jour, annee, heure) VALUES (?, ?, 9), (?, ?, 10), (?, ?, 11), (?, ?, 12), (?, ?, 13), (?, ?, 14), (?, ?, 15), (?, ?, 16), (?, ?, 17), (?, ?, 18), (?, ?, 19)');
SET @annee = annee;

WHILE pointeur <= dernierJour DO
SET @numeroJour = pointeur;
PREPARE preRequete FROM @requete;
EXECUTE preRequete USING @numeroJour, @annee, @numeroJour, @annee, @numeroJour, @annee, @numeroJour, @annee, @numeroJour, @annee, @numeroJour, @annee, @numeroJour, @annee, @numeroJour, @annee, @numeroJour, @annee, @numeroJour, @annee, @numeroJour, @annee;
DEALLOCATE PREPARE preRequete;
SET pointeur = pointeur + 1;
END WHILE;
END;
$$

DELIMITER $$
CREATE PROCEDURE booleenDateGenerale(_evenementId INT, _jour INT, _annee INT)
BEGIN

DECLARE retour TINYINT(1) DEFAULT 0;
DECLARE nombre INT;

UPDATE datesGenerales SET jour = _jour, annee = _annee where dateId = _evenementId;

SELECT COUNT(*) INTO nombre FROM datesGenerales WHERE dateId = _evenementId AND jour = _jour AND annee = _annee;

IF (nombre = 1) THEN SET retour = 1;
END IF;

SELECT retour;
END;
$$

DELIMITER $$
CREATE PROCEDURE booleenCreationPoule(_serie INT, _genre INT, numeroPoule INT, id1 INT, id2 INT, id3 INT, id4 INT)
BEGIN
DECLARE retour TINYINT(1) DEFAULT 1;
DECLARE tournoiId1 INT DEFAULT 0;
DECLARE tournoiId2 INT DEFAULT 0;
DECLARE tournoiId3 INT DEFAULT 0;
DECLARE tournoiId4 INT DEFAULT 0;

DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
ROLLBACK;
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '0';
END;

START TRANSACTION;

SET tournoiId1 = (select intTournoiId(_serie, numeroPoule, 1));
SET tournoiId2 = (select intTournoiId(_serie, numeroPoule, 2));
SET tournoiId3 = (select intTournoiId(_serie, numeroPoule, 3));
SET tournoiId4 = (select intTournoiId(_serie, numeroPoule, 4));

UPDATE equipes SET poule=numeroPoule, pouleId=1, tournoiId=tournoiId1 WHERE serie=_serie AND genre=_genre AND equipeId=id1;
UPDATE equipes SET poule=numeroPoule, pouleId=2, tournoiId=tournoiId2 WHERE serie=_serie AND genre=_genre AND equipeId=id2;
UPDATE equipes SET poule=numeroPoule, pouleId=3, tournoiId=tournoiId3 WHERE serie=_serie AND genre=_genre AND equipeId=id3;
UPDATE equipes SET poule=numeroPoule, pouleId=4, tournoiId=tournoiId4 WHERE serie=_serie AND genre=_genre AND equipeId=id4;
COMMIT;

-- SIGNAL SQLSTATE '00000' SET MESSAGE_TEXT = '1';
SELECT retour;
END;
$$

DELIMITER $$
CREATE PROCEDURE booleenAnnulationCreationPoule(_serie INT, _genre INT, numeroPoule INT, id1 INT, id2 INT, id3 INT, id4 INT)
-- pas vraiment dry, mais c'est explicite
BEGIN
DECLARE retour TINYINT(1) DEFAULT 1;
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
ROLLBACK;
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '0';
END;

START TRANSACTION;
UPDATE equipes SET poule=0, pouleId=0, tournoiId=0 WHERE serie=_serie AND genre=_genre AND equipeId=id1;
UPDATE equipes SET poule=0, pouleId=0, tournoiId=0 WHERE serie=_serie AND genre=_genre AND equipeId=id2;
UPDATE equipes SET poule=0, pouleId=0, tournoiId=0 WHERE serie=_serie AND genre=_genre AND equipeId=id3;
UPDATE equipes SET poule=0, pouleId=0, tournoiId=0 WHERE serie=_serie AND genre=_genre AND equipeId=id4;
COMMIT;

SELECT retour;

END;
$$

DELIMITER $$
CREATE PROCEDURE booleenAjoutTournoiId(_serie INT, _genre INT)
-- transformation des pouleId en tournoiId pour partieId (1 -> 24) soit les 24 parties de poule
-- poule1 : 1 -> 6
-- poule2 : 7 -> 12
-- poule3 : 13 -> 18
-- poule4 : 19 -> 24
BEGIN
DECLARE retour TINYINT(1) DEFAULT 1;
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION

ROLLBACK;
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '0';
END;

START TRANSACTION;
UPDATE parties SET equipe1 = (SELECT intTournoiId(_serie, 1, 1)), equipe2 = (SELECT intTournoiId(_serie, 1, 2)) WHERE partieId=1 AND serie=_serie AND genre=_genre;
UPDATE parties SET equipe1 = (SELECT intTournoiId(_serie, 1, 1)), equipe2 = (SELECT intTournoiId(_serie, 1, 3)) WHERE partieId=2 AND serie=_serie AND genre=_genre;
UPDATE parties SET equipe1 = (SELECT intTournoiId(_serie, 1, 1)), equipe2 = (SELECT intTournoiId(_serie, 1, 4)) WHERE partieId=3 AND serie=_serie AND genre=_genre;
UPDATE parties SET equipe1 = (SELECT intTournoiId(_serie, 1, 2)), equipe2 = (SELECT intTournoiId(_serie, 1, 3)) WHERE partieId=4 AND serie=_serie AND genre=_genre;
UPDATE parties SET equipe1 = (SELECT intTournoiId(_serie, 1, 2)), equipe2 = (SELECT intTournoiId(_serie, 1, 4)) WHERE partieId=5 AND serie=_serie AND genre=_genre;
UPDATE parties SET equipe1 = (SELECT intTournoiId(_serie, 1, 3)), equipe2 = (SELECT intTournoiId(_serie, 1, 4)) WHERE partieId=6 AND serie=_serie AND genre=_genre;

UPDATE parties SET equipe1 = (SELECT intTournoiId(_serie, 2, 1)), equipe2 = (SELECT intTournoiId(_serie, 2, 2)) WHERE partieId=7 AND serie=_serie AND genre=_genre;
UPDATE parties SET equipe1 = (SELECT intTournoiId(_serie, 2, 1)), equipe2 = (SELECT intTournoiId(_serie, 2, 3)) WHERE partieId=8 AND serie=_serie AND genre=_genre;
UPDATE parties SET equipe1 = (SELECT intTournoiId(_serie, 2, 1)), equipe2 = (SELECT intTournoiId(_serie, 2, 4)) WHERE partieId=9 AND serie=_serie AND genre=_genre;
UPDATE parties SET equipe1 = (SELECT intTournoiId(_serie, 2, 2)), equipe2 = (SELECT intTournoiId(_serie, 2, 3)) WHERE partieId=10 AND serie=_serie AND genre=_genre;
UPDATE parties SET equipe1 = (SELECT intTournoiId(_serie, 2, 2)), equipe2 = (SELECT intTournoiId(_serie, 2, 4)) WHERE partieId=11 AND serie=_serie AND genre=_genre;
UPDATE parties SET equipe1 = (SELECT intTournoiId(_serie, 2, 3)), equipe2 = (SELECT intTournoiId(_serie, 2, 4)) WHERE partieId=12 AND serie=_serie AND genre=_genre;

UPDATE parties SET equipe1 = (SELECT intTournoiId(_serie, 3, 1)), equipe2 = (SELECT intTournoiId(_serie, 3, 2)) WHERE partieId=13 AND serie=_serie AND genre=_genre;
UPDATE parties SET equipe1 = (SELECT intTournoiId(_serie, 3, 1)), equipe2 = (SELECT intTournoiId(_serie, 3, 3)) WHERE partieId=14 AND serie=_serie AND genre=_genre;
UPDATE parties SET equipe1 = (SELECT intTournoiId(_serie, 3, 1)), equipe2 = (SELECT intTournoiId(_serie, 3, 4)) WHERE partieId=15 AND serie=_serie AND genre=_genre;
UPDATE parties SET equipe1 = (SELECT intTournoiId(_serie, 3, 2)), equipe2 = (SELECT intTournoiId(_serie, 3, 3)) WHERE partieId=16 AND serie=_serie AND genre=_genre;
UPDATE parties SET equipe1 = (SELECT intTournoiId(_serie, 3, 2)), equipe2 = (SELECT intTournoiId(_serie, 3, 4)) WHERE partieId=17 AND serie=_serie AND genre=_genre;
UPDATE parties SET equipe1 = (SELECT intTournoiId(_serie, 3, 3)), equipe2 = (SELECT intTournoiId(_serie, 3, 4)) WHERE partieId=18 AND serie=_serie AND genre=_genre;

UPDATE parties SET equipe1 = (SELECT intTournoiId(_serie, 4, 1)), equipe2 = (SELECT intTournoiId(_serie, 4, 2)) WHERE partieId=19 AND serie=_serie AND genre=_genre;
UPDATE parties SET equipe1 = (SELECT intTournoiId(_serie, 4, 1)), equipe2 = (SELECT intTournoiId(_serie, 4, 3)) WHERE partieId=20 AND serie=_serie AND genre=_genre;
UPDATE parties SET equipe1 = (SELECT intTournoiId(_serie, 4, 1)), equipe2 = (SELECT intTournoiId(_serie, 4, 4)) WHERE partieId=21 AND serie=_serie AND genre=_genre;
UPDATE parties SET equipe1 = (SELECT intTournoiId(_serie, 4, 2)), equipe2 = (SELECT intTournoiId(_serie, 4, 3)) WHERE partieId=22 AND serie=_serie AND genre=_genre;
UPDATE parties SET equipe1 = (SELECT intTournoiId(_serie, 4, 2)), equipe2 = (SELECT intTournoiId(_serie, 4, 4)) WHERE partieId=23 AND serie=_serie AND genre=_genre;
UPDATE parties SET equipe1 = (SELECT intTournoiId(_serie, 4, 3)), equipe2 = (SELECT intTournoiId(_serie, 4, 4)) WHERE partieId=24 AND serie=_serie AND genre=_genre;
COMMIT;

SELECT retour;

END;
$$


DELIMITER $$
CREATE PROCEDURE boolRegularisationParticipation(_equipeId INT)
BEGIN
DECLARE retour TINYINT(1) DEFAULT 0;
DECLARE nombre INT;

UPDATE equipes SET paf_p = 1 WHERE equipeId = _equipeId;
SELECT COUNT(*) INTO nombre FROM equipes WHERE equipeId = _equipeId AND paf_p = 1;

IF (nombre = 1) THEN SET retour = 1;
END IF;

SELECT retour;

END;
$$

DELIMITER $$
CREATE PROCEDURE constitutionPoules(IN chaine VARCHAR(255))
-- format chaine poule:id,poule:id,poule:id...
BEGIN

DECLARE pointeur INT DEFAULT 1;
SET @virgule = ",";
SET @deuxPoints = ":";
PREPARE requete FROM 'UPDATE equipes SET poule = ? WHERE equipeId = ?;';

WHILE CHAR_LENGTH(chaine) > 0 DO
SET @morceau = SUBSTRING_INDEX(chaine, @virgule, 1);
SET chaine = SUBSTRING(chaine, CHAR_LENGTH(@morceau) + CHAR_LENGTH(@virgule) + 1);
SET @_poule = SUBSTRING_INDEX(@morceau, @deuxPoints, 1);
SET @_equipeId = SUBSTRING_INDEX(@morceau, @deuxPoints, -1);

-- update uniquement si les deux valeurs sont composées de chiffres
IF @_poule REGEXP '^[\d]+$' AND @_equipeId REGEXP '^[\d]+$' THEN
EXECUTE requete USING @_poule, @_equipeId;
END IF;

END WHILE;

DEALLOCATE PREPARE requete;

END;
$$

DELIMITER $$
CREATE PROCEDURE constitutionPoulesAttributionPouleId(IN chaine LONGTEXT)
-- le format est le suivant 3 parties, délimiteur : '@'
-- partie1 : délimiteur ','
-- partie2 : deux délimiteurs : ',' et ':'
-- partie3 : trois délimiteurs : '|', ':' et ','
-- exemple : 1,1@1:6,1:8,1:11,1:28,2:34,2:42,2:47,2:56,3:57,3:62,3:66,3:68,4:77,4:89,4:90,4:91@1:6,8,11,28|2:34,42,47,56|3:57,62,66,68|4:77,89,90,91
BEGIN
DECLARE filtreChaine VARCHAR(100) DEFAULT '^[0-9,:|@]+$';

SET @virgule = ",";
SET @deuxPoints = ":";
SET @arrowbase = "@";
SET @barre = "|";

PREPARE requete FROM 'UPDATE equipes SET poule = ? WHERE equipeId = ?;';

IF chaine REGEXP filtreChaine THEN
SET @partie1 = (SELECT SUBSTRING_INDEX(chaine, @arrowbase, 1));
SET @partie2 = (SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(chaine, @arrowbase, -2), @arrowbase, 1));
SET @partie3 = (SELECT SUBSTRING_INDEX(chaine, @arrowbase, -1));

SET @serie = (SELECT SUBSTRING_INDEX(@partie1, @virgule, 1));
SET @genre = (SELECT SUBSTRING_INDEX(@partie1, @virgule, -1));

-- constitutions des poules
WHILE CHAR_LENGTH(@partie2) > 0 DO
SET @morceau = SUBSTRING_INDEX(@partie2, @virgule, 1);
SET @partie2 = SUBSTRING(@partie2, CHAR_LENGTH(@morceau) + CHAR_LENGTH(@virgule) + 1);
SET @_poule = SUBSTRING_INDEX(@morceau, @deuxPoints, 1);
SET @_equipeId = SUBSTRING_INDEX(@morceau, @deuxPoints, -1);

EXECUTE requete USING @_poule, @_equipeId;
END WHILE;

-- attibution pouleId
-- @1:6,8,11,28|2:34,42,47,56|3:57,62,66,68|4:77,89,90,91
WHILE CHAR_LENGTH(@partie3) > 0 DO

SET @morceau = SUBSTRING_INDEX(@partie3, @barre, 1);
SET @partie3 = SUBSTRING(@partie3, CHAR_LENGTH(@morceau) + CHAR_LENGTH(@barre) + 1);

SET @poule = SUBSTRING_INDEX(@morceau, @deuxPoints, 1);
SET @liste = SUBSTRING_INDEX(@morceau, @deuxPoints, -1);

SET @id1 = SUBSTRING_INDEX(@liste, @virgule, 1);
SET @id2 = SUBSTRING_INDEX(SUBSTRING_INDEX(@liste, @virgule, 2), @virgule, -1);
SET @id3 = SUBSTRING_INDEX(SUBSTRING_INDEX(@liste, @virgule, -2), @virgule, 1);
SET @id4 = SUBSTRING_INDEX(@liste, @virgule, -1);

CALL booleenCreationPoule(@serie, @genre, @poule, @id1, @id2, @id3, @id4);
END WHILE;

-- SELECT @serie;
END IF;

DEALLOCATE PREPARE requete;
END;
$$
