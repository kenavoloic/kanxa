-- v10
USE tournoi;
DROP FUNCTION IF EXISTS authentification;
DROP FUNCTION IF EXISTS datesEtablies_p;
DROP FUNCTION IF EXISTS planning_p;
DROP FUNCTION IF EXISTS calendrier_p;
DROP FUNCTION IF EXISTS tournoi_p;

DROP FUNCTION IF EXISTS jsonEquipeId;
DROP FUNCTION IF EXISTS jsonEquipeIdNom;
DROP FUNCTION IF EXISTS jsonEquipeIdSouhait;
DROP FUNCTION IF EXISTS jsonGenreSerie;

DROP FUNCTION IF EXISTS jsonDatesGenerales;

DROP FUNCTION IF EXISTS intNombreEquipe;
DROP FUNCTION IF EXISTS intNombreEquipeSerieGenre;
DROP FUNCTION IF EXISTS intNombreEquipeSerieGenreSansPoule;
DROP FUNCTION IF EXISTS intNombreEquipeSerieGenreAvecPoule;

DROP FUNCTION IF EXISTS jsonEquipeSerieGenreSansPoule;
DROP FUNCTION IF EXISTS jsonEquipeSerieGenreAvecPoule;
DROP FUNCTION IF EXISTS jsonSerieGenrePaf;

DROP FUNCTION IF EXISTS intTournoiId;

DELIMITER $$
CREATE FUNCTION jsonGenreSerie(valeurGenre INT, valeurSerie INT) RETURNS JSON NOT DETERMINISTIC READS SQL DATA
BEGIN
DECLARE retour JSON;
DECLARE genreParDefaut INT DEFAULT 1;
DECLARE serieParDefaut INT DEFAULT 3;

IF valeurGenre <= 0 THEN SET valeurGenre = genreParDefaut;
END IF;

IF valeurGenre > 2 THEN SET valeurGenre = genreParDefaut;
END IF;

IF valeurSerie <= 0 THEN SET valeurSerie = serieParDefaut;
END IF;

IF valeurSerie > 3 THEN SET valeurSerie = serieParDefaut;
END IF;

SELECT JSON_ARRAYAGG(JSON_OBJECT('serie',serie,'genre',genre,'nom1',nom1,'prenom1',prenom1,'nom2',nom2,'prenom2',prenom2)) into retour FROM listePairesJoueurs  where genre = valeurGenre and serie = valeurSerie;

RETURN retour;
END;
$$

DELIMITER $$
CREATE FUNCTION authentification(utilisateur VARCHAR(255), email VARCHAR(255)) RETURNS VARCHAR(255)
-- si le nom de l'utilisateur et le courriel correspondent à ceux de la table, retour du mpasse
BEGIN
DECLARE retour VARCHAR(255);
SELECT mpasse INTO retour FROM administrateurs WHERE nom = utilisateur AND courriel = email limit 1;
RETURN retour;
END;
$$

DELIMITER $$
CREATE FUNCTION calendrier_p() RETURNS TINYINT DETERMINISTIC READS SQL DATA
BEGIN
DECLARE retour TINYINT(1) DEFAULT 0;
DECLARE premierId INT DEFAULT 0;
-- Si le calendrier existe, alors planningId = 1 est vrai
SELECT planningId INTO premierId FROM planning WHERE planningId = 1;
IF (premierId > 0) THEN
SET retour = 1;
END IF;
RETURN retour;
END;
$$

DELIMITER $$
CREATE FUNCTION planning_p(_serie INT, _phase INT) RETURNS TINYINT DETERMINISTIC READS SQL DATA
-- retourne 0 si le planning de ce tournoi n'a pas été réalisé.
BEGIN
DECLARE retour TINYINT(1) DEFAULT 0;
DECLARE nombre INT DEFAULT 0;
SELECT count(*) FROM planning WHERE serie=_serie AND phase=_phase INTO nombre;

IF (nombre > 0) THEN SET retour = 1;
END IF;

RETURN retour;
END;
$$

DELIMITER $$
CREATE FUNCTION tournoi_p(_serie INT, _genre INT) RETURNS TINYINT DETERMINISTIC READS SQL DATA
-- si le tournoi existe => 1 , sinon 0
BEGIN
DECLARE retour TINYINT(1) DEFAULT 0;
DECLARE nombre INT DEFAULT 0;
SET nombre = (SELECT COUNT(*) FROM parties WHERE serie=_serie AND genre=_genre);
IF (nombre > 0) THEN
SET retour = 1;
END IF;
RETURN retour;
END;
$$

DELIMITER $$
CREATE FUNCTION jsonEquipeId(_serie INT, _genre INT) RETURNS JSON NOT DETERMINISTIC READS SQL DATA
-- retourne un json des equipeId, nom1, nom2 pour un tournoi donné
BEGIN
DECLARE retour JSON;
SET retour = (SELECT JSON_ARRAYAGG(JSON_OBJECT('equipeId', equipeId, 'serie', serie, 'genre', genre)) FROM equipes WHERE serie=_serie AND genre=_genre);
RETURN retour;
END;
$$


DELIMITER $$
CREATE FUNCTION jsonEquipeIdNom(_serie INT, _genre INT) RETURNS JSON NOT DETERMINISTIC READS SQL DATA
-- retoure l'equipeId et les noms des deux co-équipiers
BEGIN
DECLARE retour JSON;
set retour=(SELECT JSON_ARRAYAGG(JSON_OBJECT('equipeId',equipeId,'serie',serie,'genre',genre,'nom1',nom1,'nom2',nom2)) FROM equipes WHERE serie=_serie AND genre=_genre);
RETURN retour;
END;
$$


DELIMITER $$
CREATE FUNCTION jsonEquipeIdSouhait(_serie INT, _genre INT) RETURNS JSON NOT DETERMINISTIC READS SQL DATA
-- equipeId plus souhait (intitulé et valeur)
BEGIN
DECLARE retour JSON;
set retour=(SELECT JSON_ARRAYAGG(JSON_OBJECT('equipeId',equipeId,'serie',serie,'genre',genre,'souhait',s.intitule,'valeur',e.souhait)) FROM equipes e INNER JOIN souhaits s ON e.souhait = s.souhaitId WHERE serie=_serie AND genre=_genre);
RETURN retour;
END;
$$

DELIMITER $$
CREATE FUNCTION datesEtablies_p() RETURNS TINYINT READS SQL DATA
-- les dates du tournoi sont-elles établies ?
BEGIN
DECLARE retour TINYINT(1) DEFAULT 0;
DECLARE nombre INT DEFAULT 0;

SET nombre = (SELECT COUNT(*) FROM datesGenerales WHERE jour IS NULL);

IF(nombre = 0) THEN SET retour = 1;
END IF;
RETURN retour;
END;
$$

DELIMITER $$
CREATE FUNCTION intNombreEquipe() RETURNS INT NOT DETERMINISTIC READS SQL DATA
-- nombre d'équipes enregistrées dans ce tournoi
BEGIN
DECLARE retour INT DEFAULT 0;
SET retour = (SELECT COUNT(*) FROM equipes);
RETURN retour;
END;
$$

DELIMITER $$
CREATE FUNCTION intNombreEquipeSerieGenre(_serie INT, _genre INT) RETURNS INT READS SQL DATA
-- nombre d'équipes dans un tournoi
BEGIN
DECLARE retour INT DEFAULT 0;
SET retour = (SELECT COUNT(*) FROM equipes WHERE serie=_serie AND genre=_genre);
RETURN retour;
END;
$$

DELIMITER $$
CREATE FUNCTION intNombreEquipeSerieGenreSansPoule(_serie INT, _genre INT) RETURNS INT READS SQL DATA
-- nombre d'équipes dont la poule n'est pas déterminée
BEGIN
DECLARE retour INT DEFAULT 0;
SET retour = (SELECT COUNT(*) FROM equipes WHERE serie=_serie AND genre=_genre AND poule=0);
RETURN retour;
END;
$$

DELIMITER $$
CREATE FUNCTION intNombreEquipeSerieGenreAvecPoule(_serie INT, _genre INT) RETURNS INT READS SQL DATA
-- nombre d'équipes dont la poule est déterminée
BEGIN
DECLARE retour INT DEFAULT 0;
SET retour = (SELECT COUNT(*) FROM equipes WHERE serie=_serie AND genre=_genre AND poule !=0 );
RETURN retour;
END;
$$


DELIMITER $$
CREATE FUNCTION jsonEquipeSerieGenreSansPoule(_serie INT, _genre INT) RETURNS JSON READS SQL DATA
-- IDs des equipes dont la poule n'est pas déterminée
BEGIN
DECLARE retour JSON;
SET retour = (SELECT JSON_ARRAYAGG(JSON_OBJECT('equipeId', equipeId)) FROM equipes WHERE serie=_serie AND genre=_genre AND poule=0);
RETURN retour;
END;
$$

DELIMITER $$
CREATE FUNCTION jsonEquipeSerieGenreAvecPoule(_serie INT, _genre INT) RETURNS JSON READS SQL DATA
-- IDs des equipes dont la poule est déterminée
BEGIN
DECLARE retour JSON;
SET retour = (SELECT JSON_ARRAYAGG(JSON_OBJECT('equipeId', equipeId,'tournoiId',tournoiId)) FROM equipes WHERE serie=_serie AND genre=_genre AND poule != 0);
RETURN retour;
END;
$$


DELIMITER $$
CREATE FUNCTION intTournoiId(_serie INT, _poule INT, _pouleId INT) RETURNS INT READS SQL DATA
-- retourne le pouleId utilisé pour singulariser une équipe.
-- Attention un même pouleId désigne une équipe féminine et une équipe masculine
-- mécanismes ! serie*100 + poule*10 + pouleId
BEGIN
DECLARE retour INT;
SET retour = (100 * _serie) + (10 * _poule) + _pouleId;
RETURN retour;
END;
$$

DELIMITER $$
CREATE FUNCTION jsonDatesGenerales() RETURNS JSON READS SQL DATA
-- retourne la liste des dates
BEGIN
DECLARE retour JSON;
SET retour = (SELECT JSON_ARRAYAGG(JSON_OBJECT('dateId',dateId,'evenement',evenement,'jour',jour,'annee',annee)) FROM datesGenerales);
RETURN retour;
END;
$$

DELIMITER $$
CREATE FUNCTION jsonSerieGenrePaf(_serie INT, _genre INT) RETURNS JSON READS SQL DATA
-- retourne la liste des équipes devant toujours régler leurs frais d'inscription
BEGIN
DECLARE retour JSON;
SET retour = (SELECT JSON_ARRAYAGG(JSON_OBJECT('equipeId',equipeId,'serie',serie,'genre',genre,'nom1',nom1,'nom2',nom2,'paf_p',paf_p)) FROM equipes WHERE serie = _serie AND genre = _genre AND paf_p = 0);
RETURN retour;
END;
$$
