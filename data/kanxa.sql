-- MariaDB dump 10.19  Distrib 10.6.11-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: tournoi
-- ------------------------------------------------------
-- Server version	10.6.11-MariaDB-2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `administrateurs`
--

DROP TABLE IF EXISTS `administrateurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrateurs` (
  `administrateurId` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `courriel` varchar(255) NOT NULL,
  `mpasse` varchar(255) NOT NULL,
  PRIMARY KEY (`administrateurId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrateurs`
--

LOCK TABLES `administrateurs` WRITE;
/*!40000 ALTER TABLE `administrateurs` DISABLE KEYS */;
INSERT INTO `administrateurs` VALUES (1,'pilota1','pilota@bat.com','$2y$10$w4QkYBbVAmmX4v/cMvlAS.KoeMtd1E/WluT3YsP9qe3Xq2wAyj1NO'),(2,'pilota2','pilota@bi.com','$2y$10$BTDfsW1yxYvE/o93ZeBCOeecsxmGDkzYV7DcTnh6/00lFE1VumkHC'),(3,'pilota3','pilota@hiru.com','$2y$10$o58.b5rictr72fKn41vO9.mxqvVbzbf1eu/YPlZPwYk9hwX7e2oze'),(4,'pilota4','pilota@lau.com','$2y$10$DcL3abz1O..5BmNxK3x6o.iYCqied2WeTDdgfASuNAdBxWousxfT6');
/*!40000 ALTER TABLE `administrateurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datesGenerales`
--

DROP TABLE IF EXISTS `datesGenerales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datesGenerales` (
  `dateId` int(11) NOT NULL AUTO_INCREMENT,
  `evenement` varchar(255) NOT NULL,
  `jour` int(11) DEFAULT NULL,
  `annee` int(11) DEFAULT NULL,
  PRIMARY KEY (`dateId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datesGenerales`
--

LOCK TABLES `datesGenerales` WRITE;
/*!40000 ALTER TABLE `datesGenerales` DISABLE KEYS */;
INSERT INTO `datesGenerales` VALUES (1,'ouvertureInscriptions',32,2023),(2,'clotureInscriptions',62,2023),(3,'constitutionPoules',77,2023),(4,'envoiListesPoules',84,2023),(5,'debutTournoi',99,2023),(6,'quarts',147,2023),(7,'demifinales',154,2023),(8,'finales',161,2023);
/*!40000 ALTER TABLE `datesGenerales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipes`
--

DROP TABLE IF EXISTS `equipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipes` (
  `equipeId` int(11) NOT NULL AUTO_INCREMENT,
  `active_p` tinyint(1) DEFAULT 1,
  `serie` int(11) DEFAULT NULL,
  `genre` int(11) DEFAULT NULL,
  `souhait` int(11) DEFAULT NULL,
  `nom1` varchar(255) NOT NULL,
  `prenom1` varchar(255) NOT NULL,
  `courriel1` varchar(255) NOT NULL,
  `mobile1` varchar(255) DEFAULT NULL,
  `licence1` varchar(255) DEFAULT NULL,
  `nom2` varchar(255) NOT NULL,
  `prenom2` varchar(255) NOT NULL,
  `courriel2` varchar(255) NOT NULL,
  `mobile2` varchar(255) DEFAULT NULL,
  `licence2` varchar(255) DEFAULT NULL,
  `paf_p` tinyint(1) DEFAULT 0,
  `poule` int(10) unsigned NOT NULL DEFAULT 0,
  `pouleId` int(10) unsigned NOT NULL DEFAULT 0,
  `classement` int(10) unsigned NOT NULL DEFAULT 0,
  `j` int(10) unsigned NOT NULL DEFAULT 0,
  `v` int(10) unsigned NOT NULL DEFAULT 0,
  `d` int(10) unsigned NOT NULL DEFAULT 0,
  `p` int(10) unsigned NOT NULL DEFAULT 0,
  `totalPoints` int(10) unsigned NOT NULL DEFAULT 0,
  `pointsGagnes` int(10) unsigned NOT NULL DEFAULT 0,
  `pointsPerdus` int(10) unsigned NOT NULL DEFAULT 0,
  `quartId` int(10) unsigned NOT NULL DEFAULT 0,
  `quartScore` int(10) unsigned NOT NULL DEFAULT 0,
  `demiId` int(10) unsigned NOT NULL DEFAULT 0,
  `demiScore` int(10) unsigned NOT NULL DEFAULT 0,
  `finaleId` int(10) unsigned NOT NULL DEFAULT 0,
  `finaleScore` int(10) unsigned NOT NULL DEFAULT 0,
  `huitiemeId` int(10) unsigned NOT NULL DEFAULT 0,
  `huitiemeScore` int(10) unsigned NOT NULL DEFAULT 0,
  `seiziemeId` int(10) unsigned NOT NULL DEFAULT 0,
  `seiziemeScore` int(10) unsigned NOT NULL DEFAULT 0,
  `tournoiId` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`equipeId`),
  KEY `serie` (`serie`),
  KEY `genre` (`genre`),
  KEY `souhait` (`souhait`),
  CONSTRAINT `equipes_ibfk_1` FOREIGN KEY (`serie`) REFERENCES `series` (`serieId`) ON DELETE SET NULL,
  CONSTRAINT `equipes_ibfk_2` FOREIGN KEY (`genre`) REFERENCES `genres` (`genreId`) ON DELETE SET NULL,
  CONSTRAINT `equipes_ibfk_3` FOREIGN KEY (`souhait`) REFERENCES `souhaits` (`souhaitId`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipes`
--

LOCK TABLES `equipes` WRITE;
/*!40000 ALTER TABLE `equipes` DISABLE KEYS */;
INSERT INTO `equipes` VALUES (1,1,1,1,2,'Dalle','Cindy','Cindy.Dalle@Floirac.33.fr','06.xx.99.xx.xx','140336','Siong','Elisabeth','Elisabeth.Siong@Mios.33.fr','06.xx.99.xx.xx','140337',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(2,1,3,1,1,'Lallemand','Ysaline','Ysaline.Lallemand@Cestas.33.fr','06.xx.xx.xx.99','177127','Venet','Amel','Amel.Venet@Gujan_Mestras.33.fr','06.99.xx.xx.xx','177128',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(3,1,1,2,1,'Panier','Enora','Enora.Panier@Léognan.33.fr','06.xx.99.99.xx','150423','Gohier','Matilde','Matilde.Gohier@Saint_André_de_Cubzac.33.fr','06.xx.xx.99.xx','150424',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(4,1,1,1,1,'Goy','Judith','Judith.Goy@Bègles.33.fr','06.xx.99.99.99','140346','Jouve','Berengere','Berengere.Jouve@Saint_André_de_Cubzac.33.fr','06.99.99.99.xx','140347',0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,111),(5,1,2,1,1,'Savary','Elise','Elise.Savary@Libourne.33.fr','06.99.xx.xx.99','161311','Hecquet','Marie-Amélie','Marie_Amélie.Hecquet@Le_Taillan_Médoc.33.fr','06.xx.99.xx.99','161312',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(6,1,3,1,3,'Declerck','Kénaëlle','Kénaëlle.Declerck@Gujan_Mestras.33.fr','06.xx.xx.xx.xx','177105','Madi','Manaelle','Manaelle.Madi@Le_Bouscat.33.fr','06.xx.99.99.99','177106',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(7,1,3,1,1,'Defosse','Dahlia','Dahlia.Defosse@Biganos.33.fr','06.xx.99.99.xx','177117','Lutz','Pia','Pia.Lutz@Andernos_les_Bains.33.fr','06.99.99.99.99','177118',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(8,1,3,1,3,'Ibanez','Angelique','Angelique.Ibanez@Eysines.33.fr','06.99.xx.99.xx','177131','Blaise','Shirley','Shirley.Blaise@Léognan.33.fr','06.99.xx.xx.99','177132',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(9,1,2,1,1,'Augier','Andressa','Andressa.Augier@Ambarès_et_Lagrave.33.fr','06.xx.99.99.xx','161331','Diaz','Lùna','Lùna.Diaz@Eysines.33.fr','06.xx.xx.xx.99','161332',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(10,1,2,2,3,'Abbas','Ahlem','Ahlem.Abbas@Mios.33.fr','06.99.99.99.99','175464','Donnet','Violette','Violette.Donnet@Saint_Médard_en_Jalles.33.fr','06.xx.99.99.xx','175465',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(11,1,3,1,3,'Gibert','Anne-Laure','Anne_Laure.Gibert@Saint_Loubès.33.fr','06.xx.99.99.xx','177133','Devienne','Shanys','Shanys.Devienne@La_Teste_de_Buch.33.fr','06.99.99.99.xx','177134',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(12,1,3,1,1,'Falck','Maéva','Maéva.Falck@Le_Haillan.33.fr','06.xx.99.99.99','177125','Guillou','Layan','Layan.Guillou@Léognan.33.fr','06.xx.99.99.99','177126',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(13,1,3,1,2,'Fernandes','Ayana','Ayana.Fernandes@Parempuyre.33.fr','06.xx.99.99.xx','177113','Grau','Sawsane','Sawsane.Grau@Bègles.33.fr','06.99.99.99.99','177114',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(14,1,2,1,2,'Ragot','Laïssa','Laïssa.Ragot@Le_Haillan.33.fr','06.99.xx.99.xx','161333','Lafon','Amélie','Amélie.Lafon@Lormont.33.fr','06.99.99.99.99','161334',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(15,1,2,2,2,'Prin','Marya','Marya.Prin@Bruges.33.fr','06.xx.99.99.99','175470','Dahan','Drucilla','Drucilla.Dahan@Gujan_Mestras.33.fr','06.99.xx.99.xx','175471',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(16,1,2,2,2,'Serres','Ilayda','Ilayda.Serres@Blanquefort.33.fr','06.xx.xx.99.xx','175460','Chau','Shanaëlle','Shanaëlle.Chau@Andernos_les_Bains.33.fr','06.xx.99.xx.99','175461',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(17,1,1,1,2,'Mignon','Alia','Alia.Mignon@Libourne.33.fr','06.xx.99.99.xx','140340','Rapin','Maëlia','Maëlia.Rapin@Mérignac.33.fr','06.xx.xx.99.xx','140341',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(18,1,1,1,3,'Michon','Daniella','Daniella.Michon@Eysines.33.fr','06.xx.99.99.99','140332','Ravier','Morganne','Morganne.Ravier@Talence.33.fr','06.99.xx.99.xx','140333',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(19,1,2,1,3,'Retif','Louise','Louise.Retif@Floirac.33.fr','06.xx.99.xx.xx','161315','Cesar','Aicha','Aicha.Cesar@Parempuyre.33.fr','06.99.xx.xx.xx','161316',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(20,1,1,2,3,'Le cam','Sita','Sita.Le_cam@Villenave_d_Ornon.33.fr','06.xx.99.99.99','150429','Kuhn','Charlyne','Charlyne.Kuhn@Biganos.33.fr','06.99.xx.xx.xx','150430',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(21,1,2,1,3,'Sailly','Emma','Emma.Sailly@Bordeaux.33.fr','06.xx.xx.xx.99','161323','Da Fonseca','Cléophée','Cléophée.Da_Fonseca@Bordeaux.33.fr','06.xx.xx.99.xx','161324',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(22,1,2,2,2,'Jourdain','Lindsay','Lindsay.Jourdain@Saint_André_de_Cubzac.33.fr','06.99.99.99.99','175458','Hennequin','Théodora','Théodora.Hennequin@Le_Bouscat.33.fr','06.xx.xx.xx.xx','175459',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(23,1,1,2,3,'Arab','Méline','Méline.Arab@Villenave_d_Ornon.33.fr','06.xx.99.xx.99','150439','Floquet','Ibaia','Ibaia.Floquet@Bordeaux.33.fr','06.xx.xx.99.xx','150440',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(24,1,2,2,1,'Chassagne','Mei','Mei.Chassagne@Le_Bouscat.33.fr','06.xx.xx.xx.xx','175454','Hamm','Fany','Fany.Hamm@Biganos.33.fr','06.99.xx.99.xx','175455',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(25,1,3,1,1,'Lamarque','Aimée','Aimée.Lamarque@Saint_Médard_en_Jalles.33.fr','06.99.xx.xx.xx','177115','Vanhoutte','Tasnîm','Tasnîm.Vanhoutte@Eysines.33.fr','06.99.xx.xx.99','177116',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(26,1,2,2,3,'Rameau','Loann','Loann.Rameau@Floirac.33.fr','06.99.xx.99.xx','175468','Boisset','Ophélie','Ophélie.Boisset@Le_Bouscat.33.fr','06.99.xx.xx.xx','175469',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(27,1,1,2,1,'Valin','Naissa','Naissa.Valin@Gujan_Mestras.33.fr','06.99.99.99.xx','150431','Desbois','Fantine','Fantine.Desbois@Villenave_d_Ornon.33.fr','06.99.xx.99.xx','150432',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(28,1,3,1,2,'Delannay','Annaëlle','Annaëlle.Delannay@Mios.33.fr','06.xx.xx.xx.xx','177129','Lobry','Sheima','Sheima.Lobry@Eysines.33.fr','06.xx.xx.99.xx','177130',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(29,1,3,1,1,'Huc','Solenn','Solenn.Huc@Parempuyre.33.fr','06.xx.99.xx.99','177119','Bonnet','Annaelle','Annaelle.Bonnet@Le_Bouscat.33.fr','06.99.xx.xx.99','177120',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(30,1,1,1,3,'Crespo','Bianca','Bianca.Crespo@Mérignac.33.fr','06.99.xx.99.xx','140344','Taleb','Lexy','Lexy.Taleb@Blanquefort.33.fr','06.xx.99.xx.99','140345',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(31,1,1,1,3,'Loizeau','Ashley','Ashley.Loizeau@Blanquefort.33.fr','06.xx.99.xx.xx','140320','Assouline','Liséa','Liséa.Assouline@Le_Taillan_Médoc.33.fr','06.xx.99.xx.xx','140321',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(32,1,2,2,1,'Hamon','Leyna','Leyna.Hamon@Cenon.33.fr','06.xx.xx.99.xx','175472','Huet','Trycia','Trycia.Huet@Arcachon.33.fr','06.xx.99.99.xx','175473',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(33,1,3,2,3,'Guilbaud','Yacine','Yacine.Guilbaud@Cenon.33.fr','06.99.xx.xx.xx','192204','Sales','Victoria','Victoria.Sales@Cestas.33.fr','06.xx.99.99.xx','192205',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(34,1,3,2,3,'Bienaime','Lyah','Lyah.Bienaime@Lormont.33.fr','06.xx.xx.xx.xx','192178','Pasquet','Nihal','Nihal.Pasquet@Lormont.33.fr','06.xx.99.99.99','192179',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(35,1,2,1,1,'Jouanne','Oceanne','Oceanne.Jouanne@Bordeaux.33.fr','06.xx.99.99.xx','161327','Migeon','Othilie','Othilie.Migeon@Saint_André_de_Cubzac.33.fr','06.xx.xx.99.xx','161328',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(36,1,1,2,2,'Cottin','Malory','Malory.Cottin@Andernos_les_Bains.33.fr','06.99.99.99.xx','150425','Laborie','Maïly','Maïly.Laborie@Ambarès_et_Lagrave.33.fr','06.99.xx.xx.99','150426',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(37,1,2,1,3,'Fargier','Carina','Carina.Fargier@Le_Haillan.33.fr','06.xx.xx.xx.xx','161321','Menard','Leticia','Leticia.Menard@Biganos.33.fr','06.99.xx.99.xx','161322',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(38,1,2,2,1,'Moinet','Maddie','Maddie.Moinet@Andernos_les_Bains.33.fr','06.xx.99.xx.99','175452','Fevre','Noemie','Noemie.Fevre@Saint_Médard_en_Jalles.33.fr','06.xx.xx.xx.xx','175453',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(39,1,1,1,1,'Carrier','Christiana','Christiana.Carrier@Ambarès_et_Lagrave.33.fr','06.99.xx.xx.99','140334','Baude','Kloé','Kloé.Baude@Floirac.33.fr','06.99.99.99.99','140335',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(40,1,3,1,3,'Gontier','Kassidy','Kassidy.Gontier@Cestas.33.fr','06.99.xx.xx.xx','177121','Dedieu','Maud','Maud.Dedieu@Mérignac.33.fr','06.xx.xx.99.xx','177122',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(41,1,1,2,3,'Diagne','Leyna','Leyna.Diagne@Eysines.33.fr','06.xx.xx.xx.99','150419','Larroque','Laurette','Laurette.Larroque@Arcachon.33.fr','06.99.xx.99.xx','150420',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(42,1,1,2,2,'Barret','Céline','Céline.Barret@Talence.33.fr','06.99.99.99.xx','150417','Gaspard','Lizéa','Lizéa.Gaspard@Bègles.33.fr','06.xx.99.99.99','150418',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(43,1,1,2,1,'Teixeira','Yvonne','Yvonne.Teixeira@Eysines.33.fr','06.99.xx.xx.99','150435','De Carvalho','Abiba','Abiba.De_Carvalho@Le_Taillan_Médoc.33.fr','06.99.xx.99.xx','150436',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(44,1,1,1,3,'Guiet','Keïla','Keïla.Guiet@Saint_André_de_Cubzac.33.fr','06.99.xx.99.xx','140338','Hennequin','Flora','Flora.Hennequin@Saint_André_de_Cubzac.33.fr','06.99.xx.xx.xx','140339',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(45,1,3,2,1,'Francisco','Telma','Telma.Francisco@Parempuyre.33.fr','06.99.99.99.xx','192196','Belmonte','Clara','Clara.Belmonte@Pessac.33.fr','06.xx.99.99.xx','192197',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(46,1,3,2,3,'Fievet','Raïssa','Raïssa.Fievet@Saint_Loubès.33.fr','06.xx.99.xx.xx','192190','Borges','Leonie','Leonie.Borges@Ambarès_et_Lagrave.33.fr','06.99.99.99.99','192191',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(47,1,1,1,3,'Chabot','Laetitia','Laetitia.Chabot@Blanquefort.33.fr','06.xx.xx.99.xx','140350','Aveline','Cléo','Cléo.Aveline@Libourne.33.fr','06.xx.99.xx.xx','140351',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(48,1,2,2,1,'Duteil','Lèna','Lèna.Duteil@Saint_Médard_en_Jalles.33.fr','06.99.99.99.xx','175466','Janin','Suzie','Suzie.Janin@Gradignan.33.fr','06.99.xx.xx.99','175467',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(49,1,3,2,1,'Bulteau','Elora','Elora.Bulteau@Parempuyre.33.fr','06.xx.99.xx.99','192184','Lesage','Angelique','Angelique.Lesage@Libourne.33.fr','06.99.xx.99.xx','192185',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(50,1,2,1,3,'Zerrouki','Cataleya','Cataleya.Zerrouki@Cenon.33.fr','06.99.99.99.xx','161337','Gay','Saioa','Saioa.Gay@Mios.33.fr','06.xx.99.xx.99','161338',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(51,1,1,2,1,'Large','Lindsay','Lindsay.Large@Arcachon.33.fr','06.xx.99.99.xx','150433','Lagache','Lally','Lally.Lagache@Bègles.33.fr','06.99.99.99.xx','150434',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(52,1,1,2,1,'Mosnier','Oriana','Oriana.Mosnier@Mios.33.fr','06.xx.xx.xx.xx','150413','Guille','Athéna','Athéna.Guille@Pessac.33.fr','06.99.99.99.99','150414',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(53,1,3,2,1,'Egea','Sabrina','Sabrina.Egea@Talence.33.fr','06.xx.xx.xx.xx','192198','Carel','Léah','Léah.Carel@Bègles.33.fr','06.99.xx.xx.xx','192199',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(54,1,3,1,1,'Jubert','Zaynab','Zaynab.Jubert@Bègles.33.fr','06.99.99.99.99','177111','Bachelet','Aliya','Aliya.Bachelet@Mérignac.33.fr','06.xx.99.99.99','177112',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(55,1,1,1,2,'Mevel','Naïma','Naïma.Mevel@La_Teste_de_Buch.33.fr','06.xx.xx.xx.xx','140348','Rey','Rym','Rym.Rey@Le_Haillan.33.fr','06.99.99.99.99','140349',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(56,1,2,1,3,'Richard','Dahlia','Dahlia.Richard@Arcachon.33.fr','06.xx.99.xx.99','161329','Chaput','Naïa','Naïa.Chaput@Mérignac.33.fr','06.xx.xx.xx.99','161330',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(57,1,3,2,3,'Fonteneau','Suzon','Suzon.Fonteneau@Mios.33.fr','06.xx.99.99.99','192192','Blaise','Emie','Emie.Blaise@Gradignan.33.fr','06.xx.xx.xx.xx','192193',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(58,1,2,2,3,'Naze','Carine','Carine.Naze@Bordeaux.33.fr','06.xx.xx.99.xx','175446','D’angelo','Annabelle','Annabelle.D_angelo@Talence.33.fr','06.99.99.99.xx','175447',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(59,1,2,1,2,'Gouin','Amanda','Amanda.Gouin@Lormont.33.fr','06.xx.xx.xx.xx','161313','Milesi','Mackenzie','Mackenzie.Milesi@Mérignac.33.fr','06.99.xx.xx.xx','161314',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(60,1,2,2,3,'De Azevedo','Sandra','Sandra.De_Azevedo@Lormont.33.fr','06.99.xx.xx.xx','175448','Huart','Yasmina','Yasmina.Huart@Parempuyre.33.fr','06.xx.99.xx.99','175449',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(61,1,1,1,1,'Michelet','Sandra','Sandra.Michelet@Cestas.33.fr','06.xx.99.xx.xx','140324','Redon','Nancy','Nancy.Redon@Gujan_Mestras.33.fr','06.xx.xx.xx.99','140325',0,1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,112),(62,1,3,2,2,'Floquet','Tali','Tali.Floquet@Le_Taillan_Médoc.33.fr','06.xx.99.99.99','192188','Boisseau','Ela','Ela.Boisseau@Lormont.33.fr','06.99.xx.99.xx','192189',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(63,1,3,2,3,'Briet','Sloane','Sloane.Briet@Le_Haillan.33.fr','06.99.99.99.xx','192206','Louvel','Kayla','Kayla.Louvel@Biganos.33.fr','06.99.99.99.99','192207',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(64,1,1,1,1,'Cassard','Cataléya','Cataléya.Cassard@Bègles.33.fr','06.99.99.99.xx','140326','Barry','Sabrina','Sabrina.Barry@Libourne.33.fr','06.99.99.99.xx','140327',0,1,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,113),(65,1,3,2,3,'Court','Kimberly','Kimberly.Court@Léognan.33.fr','06.xx.xx.99.xx','192180','Geffroy','Shauna','Shauna.Geffroy@Parempuyre.33.fr','06.99.99.99.99','192181',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(66,1,2,2,3,'Lebourgeois','Maelia','Maelia.Lebourgeois@Gradignan.33.fr','06.99.99.99.99','175462','Guedes','Alma','Alma.Guedes@Libourne.33.fr','06.xx.xx.xx.xx','175463',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(67,1,2,1,2,'Da Silva','Perle','Perle.Da_Silva@Cenon.33.fr','06.99.xx.xx.99','161335','Mahi','Nyna','Nyna.Mahi@Saint_Médard_en_Jalles.33.fr','06.xx.99.99.xx','161336',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(68,1,3,2,3,'Feret','Patricia','Patricia.Feret@Biganos.33.fr','06.xx.99.xx.xx','192194','Bourdet','Lilou','Lilou.Bourdet@Bordeaux.33.fr','06.xx.xx.xx.xx','192195',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(69,1,3,2,3,'Gueye','Maurane','Maurane.Gueye@Le_Taillan_Médoc.33.fr','06.xx.99.99.xx','192182','Sari','Megane','Megane.Sari@Saint_Médard_en_Jalles.33.fr','06.xx.99.xx.xx','192183',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(70,1,3,2,2,'Fasquel','Sanata','Sanata.Fasquel@Le_Haillan.33.fr','06.99.99.99.xx','192208','Breard','Maureen','Maureen.Breard@Talence.33.fr','06.xx.xx.99.xx','192209',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(71,1,2,2,1,'Moritz','Leanne','Leanne.Moritz@Cenon.33.fr','06.99.xx.xx.99','175476','Fasquel','Rachelle','Rachelle.Fasquel@Bruges.33.fr','06.xx.xx.99.xx','175477',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(72,1,1,1,3,'Hamard','Anissa','Anissa.Hamard@Le_Bouscat.33.fr','06.xx.xx.xx.99','140330','Granjon','Fatma','Fatma.Granjon@Bruges.33.fr','06.99.99.99.99','140331',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(73,1,3,1,3,'Lambert','Clémence','Clémence.Lambert@Saint_Loubès.33.fr','06.99.99.99.xx','177103','Vandaele','Molly','Molly.Vandaele@Bègles.33.fr','06.xx.99.xx.xx','177104',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(74,1,1,2,1,'Thevenet','Christiana','Christiana.Thevenet@Le_Bouscat.33.fr','06.xx.99.xx.xx','150411','Colas','Nassima','Nassima.Colas@Bruges.33.fr','06.xx.99.99.99','150412',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(75,1,2,1,1,'Rossignol','Tayna','Tayna.Rossignol@Le_Haillan.33.fr','06.99.xx.xx.xx','161319','Janot','Elia','Elia.Janot@Le_Haillan.33.fr','06.99.xx.xx.99','161320',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(76,1,2,1,2,'Bara','Sohane','Sohane.Bara@Villenave_d_Ornon.33.fr','06.99.99.99.xx','161317','Delord','Milena','Milena.Delord@Pessac.33.fr','06.xx.xx.xx.99','161318',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(77,1,3,2,1,'Gence','Sofya','Sofya.Gence@Mios.33.fr','06.xx.xx.xx.99','192200','Ahmed','Hira','Hira.Ahmed@Floirac.33.fr','06.99.xx.xx.99','192201',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(78,1,2,1,3,'Schaeffer','Ketia','Ketia.Schaeffer@Ambarès_et_Lagrave.33.fr','06.xx.99.99.xx','161341','Delacour','Assa','Assa.Delacour@Saint_Loubès.33.fr','06.99.xx.xx.99','161342',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(79,1,3,1,2,'Goupil','Maelys','Maelys.Goupil@Lormont.33.fr','06.99.xx.99.xx','177109','Dauvergne','Léana','Léana.Dauvergne@Ambarès_et_Lagrave.33.fr','06.xx.99.99.xx','177110',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(80,1,3,2,2,'Firmin','Prescillia','Prescillia.Firmin@Lormont.33.fr','06.99.xx.xx.99','192186','Bonnel','Leyla','Leyla.Bonnel@Pessac.33.fr','06.xx.99.99.xx','192187',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(81,1,2,2,1,'Rollin','Léontine','Léontine.Rollin@Le_Bouscat.33.fr','06.xx.99.xx.xx','175474','Brisset','Taïs','Taïs.Brisset@Saint_André_de_Cubzac.33.fr','06.99.xx.xx.99','175475',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(82,1,1,2,1,'Salvan','Zita','Zita.Salvan@Libourne.33.fr','06.xx.99.99.99','150421','Cheng','Théa','Théa.Cheng@Léognan.33.fr','06.xx.99.xx.xx','150422',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(83,1,2,1,1,'Ledru','Anne-Marie','Anne_Marie.Ledru@Le_Taillan_Médoc.33.fr','06.xx.xx.xx.xx','161339','Mazoyer','Lorenza','Lorenza.Mazoyer@Bègles.33.fr','06.99.xx.99.xx','161340',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(84,1,3,1,1,'Kaba','Ludvina','Ludvina.Kaba@La_Teste_de_Buch.33.fr','06.xx.99.xx.xx','177123','Audureau','Alissia','Alissia.Audureau@La_Teste_de_Buch.33.fr','06.xx.99.99.xx','177124',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(85,1,1,2,3,'Tran','Maëlys','Maëlys.Tran@Le_Bouscat.33.fr','06.99.xx.99.xx','150427','Delplace','Jana','Jana.Delplace@Arcachon.33.fr','06.99.xx.xx.xx','150428',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(86,1,1,1,1,'Grondin','Laika','Laika.Grondin@Villenave_d_Ornon.33.fr','06.xx.99.99.99','140322','Ibrahim','Antinea','Antinea.Ibrahim@Mios.33.fr','06.99.xx.xx.xx','140323',0,1,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,114),(87,1,3,1,2,'Houze','Lea','Lea.Houze@Cestas.33.fr','06.xx.99.xx.99','177107','Borg','Chiara','Chiara.Borg@Gujan_Mestras.33.fr','06.xx.xx.xx.99','177108',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(88,1,2,2,2,'Teboul','Imane','Imane.Teboul@Le_Taillan_Médoc.33.fr','06.99.99.99.xx','175456','Coquet','Thais','Thais.Coquet@Eysines.33.fr','06.xx.xx.99.xx','175457',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(89,1,2,1,2,'Talbot','Leanna','Leanna.Talbot@La_Teste_de_Buch.33.fr','06.xx.xx.xx.99','161325','Gressier','Assya','Assya.Gressier@Libourne.33.fr','06.xx.xx.xx.xx','161326',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(90,1,1,2,1,'Fraysse','Loïs','Loïs.Fraysse@Biganos.33.fr','06.99.99.99.99','150441','Le Guennec','Khadija','Khadija.Le_Guennec@Gujan_Mestras.33.fr','06.xx.xx.xx.xx','150442',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(91,1,1,1,2,'De Azevedo','Coline','Coline.De_Azevedo@Biganos.33.fr','06.99.99.99.xx','140328','Sayah','Katiana','Katiana.Sayah@Biganos.33.fr','06.99.xx.99.xx','140329',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(92,1,1,2,2,'Cantin','Kyana','Kyana.Cantin@Pessac.33.fr','06.xx.99.99.99','150415','Jacob','Lizy','Lizy.Jacob@Floirac.33.fr','06.xx.xx.xx.99','150416',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(93,1,1,2,3,'Longuet','Doriane','Doriane.Longuet@Andernos_les_Bains.33.fr','06.xx.99.xx.xx','150437','Jobert','Merine','Merine.Jobert@Bègles.33.fr','06.99.xx.99.xx','150438',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(94,1,3,2,2,'Delassus','Noah','Noah.Delassus@Andernos_les_Bains.33.fr','06.99.xx.99.xx','192202','Dumaine','Loujayne','Loujayne.Dumaine@Cenon.33.fr','06.xx.xx.99.xx','192203',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(95,1,1,1,3,'Carlos','Maïra','Maïra.Carlos@Le_Haillan.33.fr','06.xx.99.xx.99','140342','Beaudoin','Ophélie','Ophélie.Beaudoin@Léognan.33.fr','06.xx.99.xx.xx','140343',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(96,1,2,2,2,'Rota','Lee-Lou','Lee_Lou.Rota@Le_Bouscat.33.fr','06.xx.xx.99.xx','175450','Bruyere','Soukayna','Soukayna.Bruyere@Le_Haillan.33.fr','06.xx.99.99.xx','175451',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `equipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formats`
--

DROP TABLE IF EXISTS `formats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formats` (
  `formatId` int(11) NOT NULL AUTO_INCREMENT,
  `valeur` int(11) NOT NULL,
  `intitule` varchar(50) NOT NULL,
  PRIMARY KEY (`formatId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formats`
--

LOCK TABLES `formats` WRITE;
/*!40000 ALTER TABLE `formats` DISABLE KEYS */;
INSERT INTO `formats` VALUES (1,1,'Individuel'),(2,2,'Par équipe de deux'),(3,3,'Par équipe de trois'),(4,5,'Par équipe de cinq');
/*!40000 ALTER TABLE `formats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genres` (
  `genreId` int(11) NOT NULL AUTO_INCREMENT,
  `valeur` int(11) NOT NULL,
  `intitule` varchar(50) NOT NULL,
  PRIMARY KEY (`genreId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,1,'masculin'),(2,2,'féminin'),(3,3,'mixte');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parties`
--

DROP TABLE IF EXISTS `parties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parties` (
  `partieId` int(11) NOT NULL AUTO_INCREMENT,
  `serie` int(11) DEFAULT NULL,
  `genre` int(11) DEFAULT NULL,
  `phase` int(11) DEFAULT NULL,
  `phaseId` int(11) DEFAULT NULL,
  `planning` int(11) DEFAULT NULL,
  `equipe1` int(11) DEFAULT NULL,
  `equipe2` int(11) DEFAULT NULL,
  `score1` int(11) NOT NULL DEFAULT 0,
  `score2` int(11) NOT NULL DEFAULT 0,
  `observations` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`partieId`),
  KEY `serie` (`serie`),
  KEY `genre` (`genre`),
  KEY `phase` (`phase`),
  KEY `planning` (`planning`),
  CONSTRAINT `parties_ibfk_1` FOREIGN KEY (`serie`) REFERENCES `series` (`serieId`) ON DELETE SET NULL,
  CONSTRAINT `parties_ibfk_2` FOREIGN KEY (`genre`) REFERENCES `genres` (`genreId`) ON DELETE SET NULL,
  CONSTRAINT `parties_ibfk_3` FOREIGN KEY (`phase`) REFERENCES `phases` (`phaseId`) ON DELETE SET NULL,
  CONSTRAINT `parties_ibfk_4` FOREIGN KEY (`planning`) REFERENCES `planning` (`planningId`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parties`
--

LOCK TABLES `parties` WRITE;
/*!40000 ALTER TABLE `parties` DISABLE KEYS */;
INSERT INTO `parties` VALUES (1,1,1,1,1,NULL,1,2,0,0,NULL),(2,1,1,1,2,NULL,1,3,0,0,NULL),(3,1,1,1,3,NULL,1,4,0,0,NULL),(4,1,1,1,4,NULL,2,3,0,0,NULL),(5,1,1,1,5,NULL,2,4,0,0,NULL),(6,1,1,1,6,NULL,3,4,0,0,NULL),(7,1,1,1,7,NULL,1,2,0,0,NULL),(8,1,1,1,8,NULL,1,3,0,0,NULL),(9,1,1,1,9,NULL,1,4,0,0,NULL),(10,1,1,1,10,NULL,2,3,0,0,NULL),(11,1,1,1,11,NULL,2,4,0,0,NULL),(12,1,1,1,12,NULL,3,4,0,0,NULL),(13,1,1,1,13,NULL,1,2,0,0,NULL),(14,1,1,1,14,NULL,1,3,0,0,NULL),(15,1,1,1,15,NULL,1,4,0,0,NULL),(16,1,1,1,16,NULL,2,3,0,0,NULL),(17,1,1,1,17,NULL,2,4,0,0,NULL),(18,1,1,1,18,NULL,3,4,0,0,NULL),(19,1,1,1,19,NULL,1,2,0,0,NULL),(20,1,1,1,20,NULL,1,3,0,0,NULL),(21,1,1,1,21,NULL,1,4,0,0,NULL),(22,1,1,1,22,NULL,2,3,0,0,NULL),(23,1,1,1,23,NULL,2,4,0,0,NULL),(24,1,1,1,24,NULL,3,4,0,0,NULL),(25,1,1,2,25,NULL,1,8,0,0,NULL),(26,1,1,2,26,NULL,2,7,0,0,NULL),(27,1,1,2,27,NULL,3,6,0,0,NULL),(28,1,1,2,28,NULL,4,5,0,0,NULL),(29,1,1,3,29,NULL,1,4,0,0,NULL),(30,1,1,3,30,NULL,2,3,0,0,NULL),(31,1,1,4,31,NULL,1,2,0,0,NULL),(32,2,1,1,1,NULL,1,2,0,0,NULL),(33,2,1,1,2,NULL,1,3,0,0,NULL),(34,2,1,1,3,NULL,1,4,0,0,NULL),(35,2,1,1,4,NULL,2,3,0,0,NULL),(36,2,1,1,5,NULL,2,4,0,0,NULL),(37,2,1,1,6,NULL,3,4,0,0,NULL),(38,2,1,1,7,NULL,1,2,0,0,NULL),(39,2,1,1,8,NULL,1,3,0,0,NULL),(40,2,1,1,9,NULL,1,4,0,0,NULL),(41,2,1,1,10,NULL,2,3,0,0,NULL),(42,2,1,1,11,NULL,2,4,0,0,NULL),(43,2,1,1,12,NULL,3,4,0,0,NULL),(44,2,1,1,13,NULL,1,2,0,0,NULL),(45,2,1,1,14,NULL,1,3,0,0,NULL),(46,2,1,1,15,NULL,1,4,0,0,NULL),(47,2,1,1,16,NULL,2,3,0,0,NULL),(48,2,1,1,17,NULL,2,4,0,0,NULL),(49,2,1,1,18,NULL,3,4,0,0,NULL),(50,2,1,1,19,NULL,1,2,0,0,NULL),(51,2,1,1,20,NULL,1,3,0,0,NULL),(52,2,1,1,21,NULL,1,4,0,0,NULL),(53,2,1,1,22,NULL,2,3,0,0,NULL),(54,2,1,1,23,NULL,2,4,0,0,NULL),(55,2,1,1,24,NULL,3,4,0,0,NULL),(56,2,1,2,25,NULL,1,8,0,0,NULL),(57,2,1,2,26,NULL,2,7,0,0,NULL),(58,2,1,2,27,NULL,3,6,0,0,NULL),(59,2,1,2,28,NULL,4,5,0,0,NULL),(60,2,1,3,29,NULL,1,4,0,0,NULL),(61,2,1,3,30,NULL,2,3,0,0,NULL),(62,2,1,4,31,NULL,1,2,0,0,NULL),(63,3,1,1,1,NULL,1,2,0,0,NULL),(64,3,1,1,2,NULL,1,3,0,0,NULL),(65,3,1,1,3,NULL,1,4,0,0,NULL),(66,3,1,1,4,NULL,2,3,0,0,NULL),(67,3,1,1,5,NULL,2,4,0,0,NULL),(68,3,1,1,6,NULL,3,4,0,0,NULL),(69,3,1,1,7,NULL,1,2,0,0,NULL),(70,3,1,1,8,NULL,1,3,0,0,NULL),(71,3,1,1,9,NULL,1,4,0,0,NULL),(72,3,1,1,10,NULL,2,3,0,0,NULL),(73,3,1,1,11,NULL,2,4,0,0,NULL),(74,3,1,1,12,NULL,3,4,0,0,NULL),(75,3,1,1,13,NULL,1,2,0,0,NULL),(76,3,1,1,14,NULL,1,3,0,0,NULL),(77,3,1,1,15,NULL,1,4,0,0,NULL),(78,3,1,1,16,NULL,2,3,0,0,NULL),(79,3,1,1,17,NULL,2,4,0,0,NULL),(80,3,1,1,18,NULL,3,4,0,0,NULL),(81,3,1,1,19,NULL,1,2,0,0,NULL),(82,3,1,1,20,NULL,1,3,0,0,NULL),(83,3,1,1,21,NULL,1,4,0,0,NULL),(84,3,1,1,22,NULL,2,3,0,0,NULL),(85,3,1,1,23,NULL,2,4,0,0,NULL),(86,3,1,1,24,NULL,3,4,0,0,NULL),(87,3,1,2,25,NULL,1,8,0,0,NULL),(88,3,1,2,26,NULL,2,7,0,0,NULL),(89,3,1,2,27,NULL,3,6,0,0,NULL),(90,3,1,2,28,NULL,4,5,0,0,NULL),(91,3,1,3,29,NULL,1,4,0,0,NULL),(92,3,1,3,30,NULL,2,3,0,0,NULL),(93,3,1,4,31,NULL,1,2,0,0,NULL),(94,1,2,1,1,NULL,1,2,0,0,NULL),(95,1,2,1,2,NULL,1,3,0,0,NULL),(96,1,2,1,3,NULL,1,4,0,0,NULL),(97,1,2,1,4,NULL,2,3,0,0,NULL),(98,1,2,1,5,NULL,2,4,0,0,NULL),(99,1,2,1,6,NULL,3,4,0,0,NULL),(100,1,2,1,7,NULL,1,2,0,0,NULL),(101,1,2,1,8,NULL,1,3,0,0,NULL),(102,1,2,1,9,NULL,1,4,0,0,NULL),(103,1,2,1,10,NULL,2,3,0,0,NULL),(104,1,2,1,11,NULL,2,4,0,0,NULL),(105,1,2,1,12,NULL,3,4,0,0,NULL),(106,1,2,1,13,NULL,1,2,0,0,NULL),(107,1,2,1,14,NULL,1,3,0,0,NULL),(108,1,2,1,15,NULL,1,4,0,0,NULL),(109,1,2,1,16,NULL,2,3,0,0,NULL),(110,1,2,1,17,NULL,2,4,0,0,NULL),(111,1,2,1,18,NULL,3,4,0,0,NULL),(112,1,2,1,19,NULL,1,2,0,0,NULL),(113,1,2,1,20,NULL,1,3,0,0,NULL),(114,1,2,1,21,NULL,1,4,0,0,NULL),(115,1,2,1,22,NULL,2,3,0,0,NULL),(116,1,2,1,23,NULL,2,4,0,0,NULL),(117,1,2,1,24,NULL,3,4,0,0,NULL),(118,1,2,2,25,NULL,1,8,0,0,NULL),(119,1,2,2,26,NULL,2,7,0,0,NULL),(120,1,2,2,27,NULL,3,6,0,0,NULL),(121,1,2,2,28,NULL,4,5,0,0,NULL),(122,1,2,3,29,NULL,1,4,0,0,NULL),(123,1,2,3,30,NULL,2,3,0,0,NULL),(124,1,2,4,31,NULL,1,2,0,0,NULL),(125,2,2,1,1,NULL,1,2,0,0,NULL),(126,2,2,1,2,NULL,1,3,0,0,NULL),(127,2,2,1,3,NULL,1,4,0,0,NULL),(128,2,2,1,4,NULL,2,3,0,0,NULL),(129,2,2,1,5,NULL,2,4,0,0,NULL),(130,2,2,1,6,NULL,3,4,0,0,NULL),(131,2,2,1,7,NULL,1,2,0,0,NULL),(132,2,2,1,8,NULL,1,3,0,0,NULL),(133,2,2,1,9,NULL,1,4,0,0,NULL),(134,2,2,1,10,NULL,2,3,0,0,NULL),(135,2,2,1,11,NULL,2,4,0,0,NULL),(136,2,2,1,12,NULL,3,4,0,0,NULL),(137,2,2,1,13,NULL,1,2,0,0,NULL),(138,2,2,1,14,NULL,1,3,0,0,NULL),(139,2,2,1,15,NULL,1,4,0,0,NULL),(140,2,2,1,16,NULL,2,3,0,0,NULL),(141,2,2,1,17,NULL,2,4,0,0,NULL),(142,2,2,1,18,NULL,3,4,0,0,NULL),(143,2,2,1,19,NULL,1,2,0,0,NULL),(144,2,2,1,20,NULL,1,3,0,0,NULL),(145,2,2,1,21,NULL,1,4,0,0,NULL),(146,2,2,1,22,NULL,2,3,0,0,NULL),(147,2,2,1,23,NULL,2,4,0,0,NULL),(148,2,2,1,24,NULL,3,4,0,0,NULL),(149,2,2,2,25,NULL,1,8,0,0,NULL),(150,2,2,2,26,NULL,2,7,0,0,NULL),(151,2,2,2,27,NULL,3,6,0,0,NULL),(152,2,2,2,28,NULL,4,5,0,0,NULL),(153,2,2,3,29,NULL,1,4,0,0,NULL),(154,2,2,3,30,NULL,2,3,0,0,NULL),(155,2,2,4,31,NULL,1,2,0,0,NULL),(156,3,2,1,1,NULL,1,2,0,0,NULL),(157,3,2,1,2,NULL,1,3,0,0,NULL),(158,3,2,1,3,NULL,1,4,0,0,NULL),(159,3,2,1,4,NULL,2,3,0,0,NULL),(160,3,2,1,5,NULL,2,4,0,0,NULL),(161,3,2,1,6,NULL,3,4,0,0,NULL),(162,3,2,1,7,NULL,1,2,0,0,NULL),(163,3,2,1,8,NULL,1,3,0,0,NULL),(164,3,2,1,9,NULL,1,4,0,0,NULL),(165,3,2,1,10,NULL,2,3,0,0,NULL),(166,3,2,1,11,NULL,2,4,0,0,NULL),(167,3,2,1,12,NULL,3,4,0,0,NULL),(168,3,2,1,13,NULL,1,2,0,0,NULL),(169,3,2,1,14,NULL,1,3,0,0,NULL),(170,3,2,1,15,NULL,1,4,0,0,NULL),(171,3,2,1,16,NULL,2,3,0,0,NULL),(172,3,2,1,17,NULL,2,4,0,0,NULL),(173,3,2,1,18,NULL,3,4,0,0,NULL),(174,3,2,1,19,NULL,1,2,0,0,NULL),(175,3,2,1,20,NULL,1,3,0,0,NULL),(176,3,2,1,21,NULL,1,4,0,0,NULL),(177,3,2,1,22,NULL,2,3,0,0,NULL),(178,3,2,1,23,NULL,2,4,0,0,NULL),(179,3,2,1,24,NULL,3,4,0,0,NULL),(180,3,2,2,25,NULL,1,8,0,0,NULL),(181,3,2,2,26,NULL,2,7,0,0,NULL),(182,3,2,2,27,NULL,3,6,0,0,NULL),(183,3,2,2,28,NULL,4,5,0,0,NULL),(184,3,2,3,29,NULL,1,4,0,0,NULL),(185,3,2,3,30,NULL,2,3,0,0,NULL),(186,3,2,4,31,NULL,1,2,0,0,NULL);
/*!40000 ALTER TABLE `parties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phases`
--

DROP TABLE IF EXISTS `phases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phases` (
  `phaseId` int(11) NOT NULL AUTO_INCREMENT,
  `valeur` int(11) NOT NULL,
  `court` varchar(50) NOT NULL,
  `intitule` varchar(50) NOT NULL,
  PRIMARY KEY (`phaseId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phases`
--

LOCK TABLES `phases` WRITE;
/*!40000 ALTER TABLE `phases` DISABLE KEYS */;
INSERT INTO `phases` VALUES (1,1,'poule','Championnat de poules'),(2,2,'quart','Quarts de finale'),(3,3,'demi','Demi-finales'),(4,4,'finales','Finales'),(5,5,'barrages','Barrages'),(6,6,'huitieme','Huitièmes de finale'),(7,7,'seizièmes','Seizièmes de finale');
/*!40000 ALTER TABLE `phases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planning`
--

DROP TABLE IF EXISTS `planning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planning` (
  `planningId` int(11) NOT NULL AUTO_INCREMENT,
  `jour` int(11) NOT NULL,
  `annee` int(11) NOT NULL,
  `libre_p` tinyint(1) DEFAULT 1,
  `heure` int(11) NOT NULL DEFAULT 9,
  `serie` int(11) DEFAULT NULL,
  `genre` int(11) DEFAULT NULL,
  `phase` int(11) DEFAULT NULL,
  `partieId` int(11) DEFAULT NULL,
  PRIMARY KEY (`planningId`),
  KEY `serie` (`serie`),
  KEY `genre` (`genre`),
  KEY `phase` (`phase`),
  CONSTRAINT `planning_ibfk_1` FOREIGN KEY (`serie`) REFERENCES `series` (`serieId`) ON DELETE SET NULL,
  CONSTRAINT `planning_ibfk_2` FOREIGN KEY (`genre`) REFERENCES `genres` (`genreId`) ON DELETE SET NULL,
  CONSTRAINT `planning_ibfk_3` FOREIGN KEY (`phase`) REFERENCES `phases` (`phaseId`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=694 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planning`
--

LOCK TABLES `planning` WRITE;
/*!40000 ALTER TABLE `planning` DISABLE KEYS */;
INSERT INTO `planning` VALUES (1,99,2023,1,9,NULL,NULL,NULL,NULL),(2,99,2023,1,10,NULL,NULL,NULL,NULL),(3,99,2023,1,11,NULL,NULL,NULL,NULL),(4,99,2023,1,12,NULL,NULL,NULL,NULL),(5,99,2023,1,13,NULL,NULL,NULL,NULL),(6,99,2023,1,14,NULL,NULL,NULL,NULL),(7,99,2023,1,15,NULL,NULL,NULL,NULL),(8,99,2023,1,16,NULL,NULL,NULL,NULL),(9,99,2023,1,17,NULL,NULL,NULL,NULL),(10,99,2023,1,18,NULL,NULL,NULL,NULL),(11,99,2023,1,19,NULL,NULL,NULL,NULL),(12,100,2023,1,9,NULL,NULL,NULL,NULL),(13,100,2023,1,10,NULL,NULL,NULL,NULL),(14,100,2023,1,11,NULL,NULL,NULL,NULL),(15,100,2023,1,12,NULL,NULL,NULL,NULL),(16,100,2023,1,13,NULL,NULL,NULL,NULL),(17,100,2023,1,14,NULL,NULL,NULL,NULL),(18,100,2023,1,15,NULL,NULL,NULL,NULL),(19,100,2023,1,16,NULL,NULL,NULL,NULL),(20,100,2023,1,17,NULL,NULL,NULL,NULL),(21,100,2023,1,18,NULL,NULL,NULL,NULL),(22,100,2023,1,19,NULL,NULL,NULL,NULL),(23,101,2023,1,9,NULL,NULL,NULL,NULL),(24,101,2023,1,10,NULL,NULL,NULL,NULL),(25,101,2023,1,11,NULL,NULL,NULL,NULL),(26,101,2023,1,12,NULL,NULL,NULL,NULL),(27,101,2023,1,13,NULL,NULL,NULL,NULL),(28,101,2023,1,14,NULL,NULL,NULL,NULL),(29,101,2023,1,15,NULL,NULL,NULL,NULL),(30,101,2023,1,16,NULL,NULL,NULL,NULL),(31,101,2023,1,17,NULL,NULL,NULL,NULL),(32,101,2023,1,18,NULL,NULL,NULL,NULL),(33,101,2023,1,19,NULL,NULL,NULL,NULL),(34,102,2023,1,9,NULL,NULL,NULL,NULL),(35,102,2023,1,10,NULL,NULL,NULL,NULL),(36,102,2023,1,11,NULL,NULL,NULL,NULL),(37,102,2023,1,12,NULL,NULL,NULL,NULL),(38,102,2023,1,13,NULL,NULL,NULL,NULL),(39,102,2023,1,14,NULL,NULL,NULL,NULL),(40,102,2023,1,15,NULL,NULL,NULL,NULL),(41,102,2023,1,16,NULL,NULL,NULL,NULL),(42,102,2023,1,17,NULL,NULL,NULL,NULL),(43,102,2023,1,18,NULL,NULL,NULL,NULL),(44,102,2023,1,19,NULL,NULL,NULL,NULL),(45,103,2023,1,9,NULL,NULL,NULL,NULL),(46,103,2023,1,10,NULL,NULL,NULL,NULL),(47,103,2023,1,11,NULL,NULL,NULL,NULL),(48,103,2023,1,12,NULL,NULL,NULL,NULL),(49,103,2023,1,13,NULL,NULL,NULL,NULL),(50,103,2023,1,14,NULL,NULL,NULL,NULL),(51,103,2023,1,15,NULL,NULL,NULL,NULL),(52,103,2023,1,16,NULL,NULL,NULL,NULL),(53,103,2023,1,17,NULL,NULL,NULL,NULL),(54,103,2023,1,18,NULL,NULL,NULL,NULL),(55,103,2023,1,19,NULL,NULL,NULL,NULL),(56,104,2023,1,9,NULL,NULL,NULL,NULL),(57,104,2023,1,10,NULL,NULL,NULL,NULL),(58,104,2023,1,11,NULL,NULL,NULL,NULL),(59,104,2023,1,12,NULL,NULL,NULL,NULL),(60,104,2023,1,13,NULL,NULL,NULL,NULL),(61,104,2023,1,14,NULL,NULL,NULL,NULL),(62,104,2023,1,15,NULL,NULL,NULL,NULL),(63,104,2023,1,16,NULL,NULL,NULL,NULL),(64,104,2023,1,17,NULL,NULL,NULL,NULL),(65,104,2023,1,18,NULL,NULL,NULL,NULL),(66,104,2023,1,19,NULL,NULL,NULL,NULL),(67,105,2023,1,9,NULL,NULL,NULL,NULL),(68,105,2023,1,10,NULL,NULL,NULL,NULL),(69,105,2023,1,11,NULL,NULL,NULL,NULL),(70,105,2023,1,12,NULL,NULL,NULL,NULL),(71,105,2023,1,13,NULL,NULL,NULL,NULL),(72,105,2023,1,14,NULL,NULL,NULL,NULL),(73,105,2023,1,15,NULL,NULL,NULL,NULL),(74,105,2023,1,16,NULL,NULL,NULL,NULL),(75,105,2023,1,17,NULL,NULL,NULL,NULL),(76,105,2023,1,18,NULL,NULL,NULL,NULL),(77,105,2023,1,19,NULL,NULL,NULL,NULL),(78,106,2023,1,9,NULL,NULL,NULL,NULL),(79,106,2023,1,10,NULL,NULL,NULL,NULL),(80,106,2023,1,11,NULL,NULL,NULL,NULL),(81,106,2023,1,12,NULL,NULL,NULL,NULL),(82,106,2023,1,13,NULL,NULL,NULL,NULL),(83,106,2023,1,14,NULL,NULL,NULL,NULL),(84,106,2023,1,15,NULL,NULL,NULL,NULL),(85,106,2023,1,16,NULL,NULL,NULL,NULL),(86,106,2023,1,17,NULL,NULL,NULL,NULL),(87,106,2023,1,18,NULL,NULL,NULL,NULL),(88,106,2023,1,19,NULL,NULL,NULL,NULL),(89,107,2023,1,9,NULL,NULL,NULL,NULL),(90,107,2023,1,10,NULL,NULL,NULL,NULL),(91,107,2023,1,11,NULL,NULL,NULL,NULL),(92,107,2023,1,12,NULL,NULL,NULL,NULL),(93,107,2023,1,13,NULL,NULL,NULL,NULL),(94,107,2023,1,14,NULL,NULL,NULL,NULL),(95,107,2023,1,15,NULL,NULL,NULL,NULL),(96,107,2023,1,16,NULL,NULL,NULL,NULL),(97,107,2023,1,17,NULL,NULL,NULL,NULL),(98,107,2023,1,18,NULL,NULL,NULL,NULL),(99,107,2023,1,19,NULL,NULL,NULL,NULL),(100,108,2023,1,9,NULL,NULL,NULL,NULL),(101,108,2023,1,10,NULL,NULL,NULL,NULL),(102,108,2023,1,11,NULL,NULL,NULL,NULL),(103,108,2023,1,12,NULL,NULL,NULL,NULL),(104,108,2023,1,13,NULL,NULL,NULL,NULL),(105,108,2023,1,14,NULL,NULL,NULL,NULL),(106,108,2023,1,15,NULL,NULL,NULL,NULL),(107,108,2023,1,16,NULL,NULL,NULL,NULL),(108,108,2023,1,17,NULL,NULL,NULL,NULL),(109,108,2023,1,18,NULL,NULL,NULL,NULL),(110,108,2023,1,19,NULL,NULL,NULL,NULL),(111,109,2023,1,9,NULL,NULL,NULL,NULL),(112,109,2023,1,10,NULL,NULL,NULL,NULL),(113,109,2023,1,11,NULL,NULL,NULL,NULL),(114,109,2023,1,12,NULL,NULL,NULL,NULL),(115,109,2023,1,13,NULL,NULL,NULL,NULL),(116,109,2023,1,14,NULL,NULL,NULL,NULL),(117,109,2023,1,15,NULL,NULL,NULL,NULL),(118,109,2023,1,16,NULL,NULL,NULL,NULL),(119,109,2023,1,17,NULL,NULL,NULL,NULL),(120,109,2023,1,18,NULL,NULL,NULL,NULL),(121,109,2023,1,19,NULL,NULL,NULL,NULL),(122,110,2023,1,9,NULL,NULL,NULL,NULL),(123,110,2023,1,10,NULL,NULL,NULL,NULL),(124,110,2023,1,11,NULL,NULL,NULL,NULL),(125,110,2023,1,12,NULL,NULL,NULL,NULL),(126,110,2023,1,13,NULL,NULL,NULL,NULL),(127,110,2023,1,14,NULL,NULL,NULL,NULL),(128,110,2023,1,15,NULL,NULL,NULL,NULL),(129,110,2023,1,16,NULL,NULL,NULL,NULL),(130,110,2023,1,17,NULL,NULL,NULL,NULL),(131,110,2023,1,18,NULL,NULL,NULL,NULL),(132,110,2023,1,19,NULL,NULL,NULL,NULL),(133,111,2023,1,9,NULL,NULL,NULL,NULL),(134,111,2023,1,10,NULL,NULL,NULL,NULL),(135,111,2023,1,11,NULL,NULL,NULL,NULL),(136,111,2023,1,12,NULL,NULL,NULL,NULL),(137,111,2023,1,13,NULL,NULL,NULL,NULL),(138,111,2023,1,14,NULL,NULL,NULL,NULL),(139,111,2023,1,15,NULL,NULL,NULL,NULL),(140,111,2023,1,16,NULL,NULL,NULL,NULL),(141,111,2023,1,17,NULL,NULL,NULL,NULL),(142,111,2023,1,18,NULL,NULL,NULL,NULL),(143,111,2023,1,19,NULL,NULL,NULL,NULL),(144,112,2023,1,9,NULL,NULL,NULL,NULL),(145,112,2023,1,10,NULL,NULL,NULL,NULL),(146,112,2023,1,11,NULL,NULL,NULL,NULL),(147,112,2023,1,12,NULL,NULL,NULL,NULL),(148,112,2023,1,13,NULL,NULL,NULL,NULL),(149,112,2023,1,14,NULL,NULL,NULL,NULL),(150,112,2023,1,15,NULL,NULL,NULL,NULL),(151,112,2023,1,16,NULL,NULL,NULL,NULL),(152,112,2023,1,17,NULL,NULL,NULL,NULL),(153,112,2023,1,18,NULL,NULL,NULL,NULL),(154,112,2023,1,19,NULL,NULL,NULL,NULL),(155,113,2023,1,9,NULL,NULL,NULL,NULL),(156,113,2023,1,10,NULL,NULL,NULL,NULL),(157,113,2023,1,11,NULL,NULL,NULL,NULL),(158,113,2023,1,12,NULL,NULL,NULL,NULL),(159,113,2023,1,13,NULL,NULL,NULL,NULL),(160,113,2023,1,14,NULL,NULL,NULL,NULL),(161,113,2023,1,15,NULL,NULL,NULL,NULL),(162,113,2023,1,16,NULL,NULL,NULL,NULL),(163,113,2023,1,17,NULL,NULL,NULL,NULL),(164,113,2023,1,18,NULL,NULL,NULL,NULL),(165,113,2023,1,19,NULL,NULL,NULL,NULL),(166,114,2023,1,9,NULL,NULL,NULL,NULL),(167,114,2023,1,10,NULL,NULL,NULL,NULL),(168,114,2023,1,11,NULL,NULL,NULL,NULL),(169,114,2023,1,12,NULL,NULL,NULL,NULL),(170,114,2023,1,13,NULL,NULL,NULL,NULL),(171,114,2023,1,14,NULL,NULL,NULL,NULL),(172,114,2023,1,15,NULL,NULL,NULL,NULL),(173,114,2023,1,16,NULL,NULL,NULL,NULL),(174,114,2023,1,17,NULL,NULL,NULL,NULL),(175,114,2023,1,18,NULL,NULL,NULL,NULL),(176,114,2023,1,19,NULL,NULL,NULL,NULL),(177,115,2023,1,9,NULL,NULL,NULL,NULL),(178,115,2023,1,10,NULL,NULL,NULL,NULL),(179,115,2023,1,11,NULL,NULL,NULL,NULL),(180,115,2023,1,12,NULL,NULL,NULL,NULL),(181,115,2023,1,13,NULL,NULL,NULL,NULL),(182,115,2023,1,14,NULL,NULL,NULL,NULL),(183,115,2023,1,15,NULL,NULL,NULL,NULL),(184,115,2023,1,16,NULL,NULL,NULL,NULL),(185,115,2023,1,17,NULL,NULL,NULL,NULL),(186,115,2023,1,18,NULL,NULL,NULL,NULL),(187,115,2023,1,19,NULL,NULL,NULL,NULL),(188,116,2023,1,9,NULL,NULL,NULL,NULL),(189,116,2023,1,10,NULL,NULL,NULL,NULL),(190,116,2023,1,11,NULL,NULL,NULL,NULL),(191,116,2023,1,12,NULL,NULL,NULL,NULL),(192,116,2023,1,13,NULL,NULL,NULL,NULL),(193,116,2023,1,14,NULL,NULL,NULL,NULL),(194,116,2023,1,15,NULL,NULL,NULL,NULL),(195,116,2023,1,16,NULL,NULL,NULL,NULL),(196,116,2023,1,17,NULL,NULL,NULL,NULL),(197,116,2023,1,18,NULL,NULL,NULL,NULL),(198,116,2023,1,19,NULL,NULL,NULL,NULL),(199,117,2023,1,9,NULL,NULL,NULL,NULL),(200,117,2023,1,10,NULL,NULL,NULL,NULL),(201,117,2023,1,11,NULL,NULL,NULL,NULL),(202,117,2023,1,12,NULL,NULL,NULL,NULL),(203,117,2023,1,13,NULL,NULL,NULL,NULL),(204,117,2023,1,14,NULL,NULL,NULL,NULL),(205,117,2023,1,15,NULL,NULL,NULL,NULL),(206,117,2023,1,16,NULL,NULL,NULL,NULL),(207,117,2023,1,17,NULL,NULL,NULL,NULL),(208,117,2023,1,18,NULL,NULL,NULL,NULL),(209,117,2023,1,19,NULL,NULL,NULL,NULL),(210,118,2023,1,9,NULL,NULL,NULL,NULL),(211,118,2023,1,10,NULL,NULL,NULL,NULL),(212,118,2023,1,11,NULL,NULL,NULL,NULL),(213,118,2023,1,12,NULL,NULL,NULL,NULL),(214,118,2023,1,13,NULL,NULL,NULL,NULL),(215,118,2023,1,14,NULL,NULL,NULL,NULL),(216,118,2023,1,15,NULL,NULL,NULL,NULL),(217,118,2023,1,16,NULL,NULL,NULL,NULL),(218,118,2023,1,17,NULL,NULL,NULL,NULL),(219,118,2023,1,18,NULL,NULL,NULL,NULL),(220,118,2023,1,19,NULL,NULL,NULL,NULL),(221,119,2023,1,9,NULL,NULL,NULL,NULL),(222,119,2023,1,10,NULL,NULL,NULL,NULL),(223,119,2023,1,11,NULL,NULL,NULL,NULL),(224,119,2023,1,12,NULL,NULL,NULL,NULL),(225,119,2023,1,13,NULL,NULL,NULL,NULL),(226,119,2023,1,14,NULL,NULL,NULL,NULL),(227,119,2023,1,15,NULL,NULL,NULL,NULL),(228,119,2023,1,16,NULL,NULL,NULL,NULL),(229,119,2023,1,17,NULL,NULL,NULL,NULL),(230,119,2023,1,18,NULL,NULL,NULL,NULL),(231,119,2023,1,19,NULL,NULL,NULL,NULL),(232,120,2023,1,9,NULL,NULL,NULL,NULL),(233,120,2023,1,10,NULL,NULL,NULL,NULL),(234,120,2023,1,11,NULL,NULL,NULL,NULL),(235,120,2023,1,12,NULL,NULL,NULL,NULL),(236,120,2023,1,13,NULL,NULL,NULL,NULL),(237,120,2023,1,14,NULL,NULL,NULL,NULL),(238,120,2023,1,15,NULL,NULL,NULL,NULL),(239,120,2023,1,16,NULL,NULL,NULL,NULL),(240,120,2023,1,17,NULL,NULL,NULL,NULL),(241,120,2023,1,18,NULL,NULL,NULL,NULL),(242,120,2023,1,19,NULL,NULL,NULL,NULL),(243,121,2023,1,9,NULL,NULL,NULL,NULL),(244,121,2023,1,10,NULL,NULL,NULL,NULL),(245,121,2023,1,11,NULL,NULL,NULL,NULL),(246,121,2023,1,12,NULL,NULL,NULL,NULL),(247,121,2023,1,13,NULL,NULL,NULL,NULL),(248,121,2023,1,14,NULL,NULL,NULL,NULL),(249,121,2023,1,15,NULL,NULL,NULL,NULL),(250,121,2023,1,16,NULL,NULL,NULL,NULL),(251,121,2023,1,17,NULL,NULL,NULL,NULL),(252,121,2023,1,18,NULL,NULL,NULL,NULL),(253,121,2023,1,19,NULL,NULL,NULL,NULL),(254,122,2023,1,9,NULL,NULL,NULL,NULL),(255,122,2023,1,10,NULL,NULL,NULL,NULL),(256,122,2023,1,11,NULL,NULL,NULL,NULL),(257,122,2023,1,12,NULL,NULL,NULL,NULL),(258,122,2023,1,13,NULL,NULL,NULL,NULL),(259,122,2023,1,14,NULL,NULL,NULL,NULL),(260,122,2023,1,15,NULL,NULL,NULL,NULL),(261,122,2023,1,16,NULL,NULL,NULL,NULL),(262,122,2023,1,17,NULL,NULL,NULL,NULL),(263,122,2023,1,18,NULL,NULL,NULL,NULL),(264,122,2023,1,19,NULL,NULL,NULL,NULL),(265,123,2023,1,9,NULL,NULL,NULL,NULL),(266,123,2023,1,10,NULL,NULL,NULL,NULL),(267,123,2023,1,11,NULL,NULL,NULL,NULL),(268,123,2023,1,12,NULL,NULL,NULL,NULL),(269,123,2023,1,13,NULL,NULL,NULL,NULL),(270,123,2023,1,14,NULL,NULL,NULL,NULL),(271,123,2023,1,15,NULL,NULL,NULL,NULL),(272,123,2023,1,16,NULL,NULL,NULL,NULL),(273,123,2023,1,17,NULL,NULL,NULL,NULL),(274,123,2023,1,18,NULL,NULL,NULL,NULL),(275,123,2023,1,19,NULL,NULL,NULL,NULL),(276,124,2023,1,9,NULL,NULL,NULL,NULL),(277,124,2023,1,10,NULL,NULL,NULL,NULL),(278,124,2023,1,11,NULL,NULL,NULL,NULL),(279,124,2023,1,12,NULL,NULL,NULL,NULL),(280,124,2023,1,13,NULL,NULL,NULL,NULL),(281,124,2023,1,14,NULL,NULL,NULL,NULL),(282,124,2023,1,15,NULL,NULL,NULL,NULL),(283,124,2023,1,16,NULL,NULL,NULL,NULL),(284,124,2023,1,17,NULL,NULL,NULL,NULL),(285,124,2023,1,18,NULL,NULL,NULL,NULL),(286,124,2023,1,19,NULL,NULL,NULL,NULL),(287,125,2023,1,9,NULL,NULL,NULL,NULL),(288,125,2023,1,10,NULL,NULL,NULL,NULL),(289,125,2023,1,11,NULL,NULL,NULL,NULL),(290,125,2023,1,12,NULL,NULL,NULL,NULL),(291,125,2023,1,13,NULL,NULL,NULL,NULL),(292,125,2023,1,14,NULL,NULL,NULL,NULL),(293,125,2023,1,15,NULL,NULL,NULL,NULL),(294,125,2023,1,16,NULL,NULL,NULL,NULL),(295,125,2023,1,17,NULL,NULL,NULL,NULL),(296,125,2023,1,18,NULL,NULL,NULL,NULL),(297,125,2023,1,19,NULL,NULL,NULL,NULL),(298,126,2023,1,9,NULL,NULL,NULL,NULL),(299,126,2023,1,10,NULL,NULL,NULL,NULL),(300,126,2023,1,11,NULL,NULL,NULL,NULL),(301,126,2023,1,12,NULL,NULL,NULL,NULL),(302,126,2023,1,13,NULL,NULL,NULL,NULL),(303,126,2023,1,14,NULL,NULL,NULL,NULL),(304,126,2023,1,15,NULL,NULL,NULL,NULL),(305,126,2023,1,16,NULL,NULL,NULL,NULL),(306,126,2023,1,17,NULL,NULL,NULL,NULL),(307,126,2023,1,18,NULL,NULL,NULL,NULL),(308,126,2023,1,19,NULL,NULL,NULL,NULL),(309,127,2023,1,9,NULL,NULL,NULL,NULL),(310,127,2023,1,10,NULL,NULL,NULL,NULL),(311,127,2023,1,11,NULL,NULL,NULL,NULL),(312,127,2023,1,12,NULL,NULL,NULL,NULL),(313,127,2023,1,13,NULL,NULL,NULL,NULL),(314,127,2023,1,14,NULL,NULL,NULL,NULL),(315,127,2023,1,15,NULL,NULL,NULL,NULL),(316,127,2023,1,16,NULL,NULL,NULL,NULL),(317,127,2023,1,17,NULL,NULL,NULL,NULL),(318,127,2023,1,18,NULL,NULL,NULL,NULL),(319,127,2023,1,19,NULL,NULL,NULL,NULL),(320,128,2023,1,9,NULL,NULL,NULL,NULL),(321,128,2023,1,10,NULL,NULL,NULL,NULL),(322,128,2023,1,11,NULL,NULL,NULL,NULL),(323,128,2023,1,12,NULL,NULL,NULL,NULL),(324,128,2023,1,13,NULL,NULL,NULL,NULL),(325,128,2023,1,14,NULL,NULL,NULL,NULL),(326,128,2023,1,15,NULL,NULL,NULL,NULL),(327,128,2023,1,16,NULL,NULL,NULL,NULL),(328,128,2023,1,17,NULL,NULL,NULL,NULL),(329,128,2023,1,18,NULL,NULL,NULL,NULL),(330,128,2023,1,19,NULL,NULL,NULL,NULL),(331,129,2023,1,9,NULL,NULL,NULL,NULL),(332,129,2023,1,10,NULL,NULL,NULL,NULL),(333,129,2023,1,11,NULL,NULL,NULL,NULL),(334,129,2023,1,12,NULL,NULL,NULL,NULL),(335,129,2023,1,13,NULL,NULL,NULL,NULL),(336,129,2023,1,14,NULL,NULL,NULL,NULL),(337,129,2023,1,15,NULL,NULL,NULL,NULL),(338,129,2023,1,16,NULL,NULL,NULL,NULL),(339,129,2023,1,17,NULL,NULL,NULL,NULL),(340,129,2023,1,18,NULL,NULL,NULL,NULL),(341,129,2023,1,19,NULL,NULL,NULL,NULL),(342,130,2023,1,9,NULL,NULL,NULL,NULL),(343,130,2023,1,10,NULL,NULL,NULL,NULL),(344,130,2023,1,11,NULL,NULL,NULL,NULL),(345,130,2023,1,12,NULL,NULL,NULL,NULL),(346,130,2023,1,13,NULL,NULL,NULL,NULL),(347,130,2023,1,14,NULL,NULL,NULL,NULL),(348,130,2023,1,15,NULL,NULL,NULL,NULL),(349,130,2023,1,16,NULL,NULL,NULL,NULL),(350,130,2023,1,17,NULL,NULL,NULL,NULL),(351,130,2023,1,18,NULL,NULL,NULL,NULL),(352,130,2023,1,19,NULL,NULL,NULL,NULL),(353,131,2023,1,9,NULL,NULL,NULL,NULL),(354,131,2023,1,10,NULL,NULL,NULL,NULL),(355,131,2023,1,11,NULL,NULL,NULL,NULL),(356,131,2023,1,12,NULL,NULL,NULL,NULL),(357,131,2023,1,13,NULL,NULL,NULL,NULL),(358,131,2023,1,14,NULL,NULL,NULL,NULL),(359,131,2023,1,15,NULL,NULL,NULL,NULL),(360,131,2023,1,16,NULL,NULL,NULL,NULL),(361,131,2023,1,17,NULL,NULL,NULL,NULL),(362,131,2023,1,18,NULL,NULL,NULL,NULL),(363,131,2023,1,19,NULL,NULL,NULL,NULL),(364,132,2023,1,9,NULL,NULL,NULL,NULL),(365,132,2023,1,10,NULL,NULL,NULL,NULL),(366,132,2023,1,11,NULL,NULL,NULL,NULL),(367,132,2023,1,12,NULL,NULL,NULL,NULL),(368,132,2023,1,13,NULL,NULL,NULL,NULL),(369,132,2023,1,14,NULL,NULL,NULL,NULL),(370,132,2023,1,15,NULL,NULL,NULL,NULL),(371,132,2023,1,16,NULL,NULL,NULL,NULL),(372,132,2023,1,17,NULL,NULL,NULL,NULL),(373,132,2023,1,18,NULL,NULL,NULL,NULL),(374,132,2023,1,19,NULL,NULL,NULL,NULL),(375,133,2023,1,9,NULL,NULL,NULL,NULL),(376,133,2023,1,10,NULL,NULL,NULL,NULL),(377,133,2023,1,11,NULL,NULL,NULL,NULL),(378,133,2023,1,12,NULL,NULL,NULL,NULL),(379,133,2023,1,13,NULL,NULL,NULL,NULL),(380,133,2023,1,14,NULL,NULL,NULL,NULL),(381,133,2023,1,15,NULL,NULL,NULL,NULL),(382,133,2023,1,16,NULL,NULL,NULL,NULL),(383,133,2023,1,17,NULL,NULL,NULL,NULL),(384,133,2023,1,18,NULL,NULL,NULL,NULL),(385,133,2023,1,19,NULL,NULL,NULL,NULL),(386,134,2023,1,9,NULL,NULL,NULL,NULL),(387,134,2023,1,10,NULL,NULL,NULL,NULL),(388,134,2023,1,11,NULL,NULL,NULL,NULL),(389,134,2023,1,12,NULL,NULL,NULL,NULL),(390,134,2023,1,13,NULL,NULL,NULL,NULL),(391,134,2023,1,14,NULL,NULL,NULL,NULL),(392,134,2023,1,15,NULL,NULL,NULL,NULL),(393,134,2023,1,16,NULL,NULL,NULL,NULL),(394,134,2023,1,17,NULL,NULL,NULL,NULL),(395,134,2023,1,18,NULL,NULL,NULL,NULL),(396,134,2023,1,19,NULL,NULL,NULL,NULL),(397,135,2023,1,9,NULL,NULL,NULL,NULL),(398,135,2023,1,10,NULL,NULL,NULL,NULL),(399,135,2023,1,11,NULL,NULL,NULL,NULL),(400,135,2023,1,12,NULL,NULL,NULL,NULL),(401,135,2023,1,13,NULL,NULL,NULL,NULL),(402,135,2023,1,14,NULL,NULL,NULL,NULL),(403,135,2023,1,15,NULL,NULL,NULL,NULL),(404,135,2023,1,16,NULL,NULL,NULL,NULL),(405,135,2023,1,17,NULL,NULL,NULL,NULL),(406,135,2023,1,18,NULL,NULL,NULL,NULL),(407,135,2023,1,19,NULL,NULL,NULL,NULL),(408,136,2023,1,9,NULL,NULL,NULL,NULL),(409,136,2023,1,10,NULL,NULL,NULL,NULL),(410,136,2023,1,11,NULL,NULL,NULL,NULL),(411,136,2023,1,12,NULL,NULL,NULL,NULL),(412,136,2023,1,13,NULL,NULL,NULL,NULL),(413,136,2023,1,14,NULL,NULL,NULL,NULL),(414,136,2023,1,15,NULL,NULL,NULL,NULL),(415,136,2023,1,16,NULL,NULL,NULL,NULL),(416,136,2023,1,17,NULL,NULL,NULL,NULL),(417,136,2023,1,18,NULL,NULL,NULL,NULL),(418,136,2023,1,19,NULL,NULL,NULL,NULL),(419,137,2023,1,9,NULL,NULL,NULL,NULL),(420,137,2023,1,10,NULL,NULL,NULL,NULL),(421,137,2023,1,11,NULL,NULL,NULL,NULL),(422,137,2023,1,12,NULL,NULL,NULL,NULL),(423,137,2023,1,13,NULL,NULL,NULL,NULL),(424,137,2023,1,14,NULL,NULL,NULL,NULL),(425,137,2023,1,15,NULL,NULL,NULL,NULL),(426,137,2023,1,16,NULL,NULL,NULL,NULL),(427,137,2023,1,17,NULL,NULL,NULL,NULL),(428,137,2023,1,18,NULL,NULL,NULL,NULL),(429,137,2023,1,19,NULL,NULL,NULL,NULL),(430,138,2023,1,9,NULL,NULL,NULL,NULL),(431,138,2023,1,10,NULL,NULL,NULL,NULL),(432,138,2023,1,11,NULL,NULL,NULL,NULL),(433,138,2023,1,12,NULL,NULL,NULL,NULL),(434,138,2023,1,13,NULL,NULL,NULL,NULL),(435,138,2023,1,14,NULL,NULL,NULL,NULL),(436,138,2023,1,15,NULL,NULL,NULL,NULL),(437,138,2023,1,16,NULL,NULL,NULL,NULL),(438,138,2023,1,17,NULL,NULL,NULL,NULL),(439,138,2023,1,18,NULL,NULL,NULL,NULL),(440,138,2023,1,19,NULL,NULL,NULL,NULL),(441,139,2023,1,9,NULL,NULL,NULL,NULL),(442,139,2023,1,10,NULL,NULL,NULL,NULL),(443,139,2023,1,11,NULL,NULL,NULL,NULL),(444,139,2023,1,12,NULL,NULL,NULL,NULL),(445,139,2023,1,13,NULL,NULL,NULL,NULL),(446,139,2023,1,14,NULL,NULL,NULL,NULL),(447,139,2023,1,15,NULL,NULL,NULL,NULL),(448,139,2023,1,16,NULL,NULL,NULL,NULL),(449,139,2023,1,17,NULL,NULL,NULL,NULL),(450,139,2023,1,18,NULL,NULL,NULL,NULL),(451,139,2023,1,19,NULL,NULL,NULL,NULL),(452,140,2023,1,9,NULL,NULL,NULL,NULL),(453,140,2023,1,10,NULL,NULL,NULL,NULL),(454,140,2023,1,11,NULL,NULL,NULL,NULL),(455,140,2023,1,12,NULL,NULL,NULL,NULL),(456,140,2023,1,13,NULL,NULL,NULL,NULL),(457,140,2023,1,14,NULL,NULL,NULL,NULL),(458,140,2023,1,15,NULL,NULL,NULL,NULL),(459,140,2023,1,16,NULL,NULL,NULL,NULL),(460,140,2023,1,17,NULL,NULL,NULL,NULL),(461,140,2023,1,18,NULL,NULL,NULL,NULL),(462,140,2023,1,19,NULL,NULL,NULL,NULL),(463,141,2023,1,9,NULL,NULL,NULL,NULL),(464,141,2023,1,10,NULL,NULL,NULL,NULL),(465,141,2023,1,11,NULL,NULL,NULL,NULL),(466,141,2023,1,12,NULL,NULL,NULL,NULL),(467,141,2023,1,13,NULL,NULL,NULL,NULL),(468,141,2023,1,14,NULL,NULL,NULL,NULL),(469,141,2023,1,15,NULL,NULL,NULL,NULL),(470,141,2023,1,16,NULL,NULL,NULL,NULL),(471,141,2023,1,17,NULL,NULL,NULL,NULL),(472,141,2023,1,18,NULL,NULL,NULL,NULL),(473,141,2023,1,19,NULL,NULL,NULL,NULL),(474,142,2023,1,9,NULL,NULL,NULL,NULL),(475,142,2023,1,10,NULL,NULL,NULL,NULL),(476,142,2023,1,11,NULL,NULL,NULL,NULL),(477,142,2023,1,12,NULL,NULL,NULL,NULL),(478,142,2023,1,13,NULL,NULL,NULL,NULL),(479,142,2023,1,14,NULL,NULL,NULL,NULL),(480,142,2023,1,15,NULL,NULL,NULL,NULL),(481,142,2023,1,16,NULL,NULL,NULL,NULL),(482,142,2023,1,17,NULL,NULL,NULL,NULL),(483,142,2023,1,18,NULL,NULL,NULL,NULL),(484,142,2023,1,19,NULL,NULL,NULL,NULL),(485,143,2023,1,9,NULL,NULL,NULL,NULL),(486,143,2023,1,10,NULL,NULL,NULL,NULL),(487,143,2023,1,11,NULL,NULL,NULL,NULL),(488,143,2023,1,12,NULL,NULL,NULL,NULL),(489,143,2023,1,13,NULL,NULL,NULL,NULL),(490,143,2023,1,14,NULL,NULL,NULL,NULL),(491,143,2023,1,15,NULL,NULL,NULL,NULL),(492,143,2023,1,16,NULL,NULL,NULL,NULL),(493,143,2023,1,17,NULL,NULL,NULL,NULL),(494,143,2023,1,18,NULL,NULL,NULL,NULL),(495,143,2023,1,19,NULL,NULL,NULL,NULL),(496,144,2023,1,9,NULL,NULL,NULL,NULL),(497,144,2023,1,10,NULL,NULL,NULL,NULL),(498,144,2023,1,11,NULL,NULL,NULL,NULL),(499,144,2023,1,12,NULL,NULL,NULL,NULL),(500,144,2023,1,13,NULL,NULL,NULL,NULL),(501,144,2023,1,14,NULL,NULL,NULL,NULL),(502,144,2023,1,15,NULL,NULL,NULL,NULL),(503,144,2023,1,16,NULL,NULL,NULL,NULL),(504,144,2023,1,17,NULL,NULL,NULL,NULL),(505,144,2023,1,18,NULL,NULL,NULL,NULL),(506,144,2023,1,19,NULL,NULL,NULL,NULL),(507,145,2023,1,9,NULL,NULL,NULL,NULL),(508,145,2023,1,10,NULL,NULL,NULL,NULL),(509,145,2023,1,11,NULL,NULL,NULL,NULL),(510,145,2023,1,12,NULL,NULL,NULL,NULL),(511,145,2023,1,13,NULL,NULL,NULL,NULL),(512,145,2023,1,14,NULL,NULL,NULL,NULL),(513,145,2023,1,15,NULL,NULL,NULL,NULL),(514,145,2023,1,16,NULL,NULL,NULL,NULL),(515,145,2023,1,17,NULL,NULL,NULL,NULL),(516,145,2023,1,18,NULL,NULL,NULL,NULL),(517,145,2023,1,19,NULL,NULL,NULL,NULL),(518,146,2023,1,9,NULL,NULL,NULL,NULL),(519,146,2023,1,10,NULL,NULL,NULL,NULL),(520,146,2023,1,11,NULL,NULL,NULL,NULL),(521,146,2023,1,12,NULL,NULL,NULL,NULL),(522,146,2023,1,13,NULL,NULL,NULL,NULL),(523,146,2023,1,14,NULL,NULL,NULL,NULL),(524,146,2023,1,15,NULL,NULL,NULL,NULL),(525,146,2023,1,16,NULL,NULL,NULL,NULL),(526,146,2023,1,17,NULL,NULL,NULL,NULL),(527,146,2023,1,18,NULL,NULL,NULL,NULL),(528,146,2023,1,19,NULL,NULL,NULL,NULL),(529,147,2023,1,9,NULL,NULL,NULL,NULL),(530,147,2023,1,10,NULL,NULL,NULL,NULL),(531,147,2023,1,11,NULL,NULL,NULL,NULL),(532,147,2023,1,12,NULL,NULL,NULL,NULL),(533,147,2023,1,13,NULL,NULL,NULL,NULL),(534,147,2023,1,14,NULL,NULL,NULL,NULL),(535,147,2023,1,15,NULL,NULL,NULL,NULL),(536,147,2023,1,16,NULL,NULL,NULL,NULL),(537,147,2023,1,17,NULL,NULL,NULL,NULL),(538,147,2023,1,18,NULL,NULL,NULL,NULL),(539,147,2023,1,19,NULL,NULL,NULL,NULL),(540,148,2023,1,9,NULL,NULL,NULL,NULL),(541,148,2023,1,10,NULL,NULL,NULL,NULL),(542,148,2023,1,11,NULL,NULL,NULL,NULL),(543,148,2023,1,12,NULL,NULL,NULL,NULL),(544,148,2023,1,13,NULL,NULL,NULL,NULL),(545,148,2023,1,14,NULL,NULL,NULL,NULL),(546,148,2023,1,15,NULL,NULL,NULL,NULL),(547,148,2023,1,16,NULL,NULL,NULL,NULL),(548,148,2023,1,17,NULL,NULL,NULL,NULL),(549,148,2023,1,18,NULL,NULL,NULL,NULL),(550,148,2023,1,19,NULL,NULL,NULL,NULL),(551,149,2023,1,9,NULL,NULL,NULL,NULL),(552,149,2023,1,10,NULL,NULL,NULL,NULL),(553,149,2023,1,11,NULL,NULL,NULL,NULL),(554,149,2023,1,12,NULL,NULL,NULL,NULL),(555,149,2023,1,13,NULL,NULL,NULL,NULL),(556,149,2023,1,14,NULL,NULL,NULL,NULL),(557,149,2023,1,15,NULL,NULL,NULL,NULL),(558,149,2023,1,16,NULL,NULL,NULL,NULL),(559,149,2023,1,17,NULL,NULL,NULL,NULL),(560,149,2023,1,18,NULL,NULL,NULL,NULL),(561,149,2023,1,19,NULL,NULL,NULL,NULL),(562,150,2023,1,9,NULL,NULL,NULL,NULL),(563,150,2023,1,10,NULL,NULL,NULL,NULL),(564,150,2023,1,11,NULL,NULL,NULL,NULL),(565,150,2023,1,12,NULL,NULL,NULL,NULL),(566,150,2023,1,13,NULL,NULL,NULL,NULL),(567,150,2023,1,14,NULL,NULL,NULL,NULL),(568,150,2023,1,15,NULL,NULL,NULL,NULL),(569,150,2023,1,16,NULL,NULL,NULL,NULL),(570,150,2023,1,17,NULL,NULL,NULL,NULL),(571,150,2023,1,18,NULL,NULL,NULL,NULL),(572,150,2023,1,19,NULL,NULL,NULL,NULL),(573,151,2023,1,9,NULL,NULL,NULL,NULL),(574,151,2023,1,10,NULL,NULL,NULL,NULL),(575,151,2023,1,11,NULL,NULL,NULL,NULL),(576,151,2023,1,12,NULL,NULL,NULL,NULL),(577,151,2023,1,13,NULL,NULL,NULL,NULL),(578,151,2023,1,14,NULL,NULL,NULL,NULL),(579,151,2023,1,15,NULL,NULL,NULL,NULL),(580,151,2023,1,16,NULL,NULL,NULL,NULL),(581,151,2023,1,17,NULL,NULL,NULL,NULL),(582,151,2023,1,18,NULL,NULL,NULL,NULL),(583,151,2023,1,19,NULL,NULL,NULL,NULL),(584,152,2023,1,9,NULL,NULL,NULL,NULL),(585,152,2023,1,10,NULL,NULL,NULL,NULL),(586,152,2023,1,11,NULL,NULL,NULL,NULL),(587,152,2023,1,12,NULL,NULL,NULL,NULL),(588,152,2023,1,13,NULL,NULL,NULL,NULL),(589,152,2023,1,14,NULL,NULL,NULL,NULL),(590,152,2023,1,15,NULL,NULL,NULL,NULL),(591,152,2023,1,16,NULL,NULL,NULL,NULL),(592,152,2023,1,17,NULL,NULL,NULL,NULL),(593,152,2023,1,18,NULL,NULL,NULL,NULL),(594,152,2023,1,19,NULL,NULL,NULL,NULL),(595,153,2023,1,9,NULL,NULL,NULL,NULL),(596,153,2023,1,10,NULL,NULL,NULL,NULL),(597,153,2023,1,11,NULL,NULL,NULL,NULL),(598,153,2023,1,12,NULL,NULL,NULL,NULL),(599,153,2023,1,13,NULL,NULL,NULL,NULL),(600,153,2023,1,14,NULL,NULL,NULL,NULL),(601,153,2023,1,15,NULL,NULL,NULL,NULL),(602,153,2023,1,16,NULL,NULL,NULL,NULL),(603,153,2023,1,17,NULL,NULL,NULL,NULL),(604,153,2023,1,18,NULL,NULL,NULL,NULL),(605,153,2023,1,19,NULL,NULL,NULL,NULL),(606,154,2023,1,9,NULL,NULL,NULL,NULL),(607,154,2023,1,10,NULL,NULL,NULL,NULL),(608,154,2023,1,11,NULL,NULL,NULL,NULL),(609,154,2023,1,12,NULL,NULL,NULL,NULL),(610,154,2023,1,13,NULL,NULL,NULL,NULL),(611,154,2023,1,14,NULL,NULL,NULL,NULL),(612,154,2023,1,15,NULL,NULL,NULL,NULL),(613,154,2023,1,16,NULL,NULL,NULL,NULL),(614,154,2023,1,17,NULL,NULL,NULL,NULL),(615,154,2023,1,18,NULL,NULL,NULL,NULL),(616,154,2023,1,19,NULL,NULL,NULL,NULL),(617,155,2023,1,9,NULL,NULL,NULL,NULL),(618,155,2023,1,10,NULL,NULL,NULL,NULL),(619,155,2023,1,11,NULL,NULL,NULL,NULL),(620,155,2023,1,12,NULL,NULL,NULL,NULL),(621,155,2023,1,13,NULL,NULL,NULL,NULL),(622,155,2023,1,14,NULL,NULL,NULL,NULL),(623,155,2023,1,15,NULL,NULL,NULL,NULL),(624,155,2023,1,16,NULL,NULL,NULL,NULL),(625,155,2023,1,17,NULL,NULL,NULL,NULL),(626,155,2023,1,18,NULL,NULL,NULL,NULL),(627,155,2023,1,19,NULL,NULL,NULL,NULL),(628,156,2023,1,9,NULL,NULL,NULL,NULL),(629,156,2023,1,10,NULL,NULL,NULL,NULL),(630,156,2023,1,11,NULL,NULL,NULL,NULL),(631,156,2023,1,12,NULL,NULL,NULL,NULL),(632,156,2023,1,13,NULL,NULL,NULL,NULL),(633,156,2023,1,14,NULL,NULL,NULL,NULL),(634,156,2023,1,15,NULL,NULL,NULL,NULL),(635,156,2023,1,16,NULL,NULL,NULL,NULL),(636,156,2023,1,17,NULL,NULL,NULL,NULL),(637,156,2023,1,18,NULL,NULL,NULL,NULL),(638,156,2023,1,19,NULL,NULL,NULL,NULL),(639,157,2023,1,9,NULL,NULL,NULL,NULL),(640,157,2023,1,10,NULL,NULL,NULL,NULL),(641,157,2023,1,11,NULL,NULL,NULL,NULL),(642,157,2023,1,12,NULL,NULL,NULL,NULL),(643,157,2023,1,13,NULL,NULL,NULL,NULL),(644,157,2023,1,14,NULL,NULL,NULL,NULL),(645,157,2023,1,15,NULL,NULL,NULL,NULL),(646,157,2023,1,16,NULL,NULL,NULL,NULL),(647,157,2023,1,17,NULL,NULL,NULL,NULL),(648,157,2023,1,18,NULL,NULL,NULL,NULL),(649,157,2023,1,19,NULL,NULL,NULL,NULL),(650,158,2023,1,9,NULL,NULL,NULL,NULL),(651,158,2023,1,10,NULL,NULL,NULL,NULL),(652,158,2023,1,11,NULL,NULL,NULL,NULL),(653,158,2023,1,12,NULL,NULL,NULL,NULL),(654,158,2023,1,13,NULL,NULL,NULL,NULL),(655,158,2023,1,14,NULL,NULL,NULL,NULL),(656,158,2023,1,15,NULL,NULL,NULL,NULL),(657,158,2023,1,16,NULL,NULL,NULL,NULL),(658,158,2023,1,17,NULL,NULL,NULL,NULL),(659,158,2023,1,18,NULL,NULL,NULL,NULL),(660,158,2023,1,19,NULL,NULL,NULL,NULL),(661,159,2023,1,9,NULL,NULL,NULL,NULL),(662,159,2023,1,10,NULL,NULL,NULL,NULL),(663,159,2023,1,11,NULL,NULL,NULL,NULL),(664,159,2023,1,12,NULL,NULL,NULL,NULL),(665,159,2023,1,13,NULL,NULL,NULL,NULL),(666,159,2023,1,14,NULL,NULL,NULL,NULL),(667,159,2023,1,15,NULL,NULL,NULL,NULL),(668,159,2023,1,16,NULL,NULL,NULL,NULL),(669,159,2023,1,17,NULL,NULL,NULL,NULL),(670,159,2023,1,18,NULL,NULL,NULL,NULL),(671,159,2023,1,19,NULL,NULL,NULL,NULL),(672,160,2023,1,9,NULL,NULL,NULL,NULL),(673,160,2023,1,10,NULL,NULL,NULL,NULL),(674,160,2023,1,11,NULL,NULL,NULL,NULL),(675,160,2023,1,12,NULL,NULL,NULL,NULL),(676,160,2023,1,13,NULL,NULL,NULL,NULL),(677,160,2023,1,14,NULL,NULL,NULL,NULL),(678,160,2023,1,15,NULL,NULL,NULL,NULL),(679,160,2023,1,16,NULL,NULL,NULL,NULL),(680,160,2023,1,17,NULL,NULL,NULL,NULL),(681,160,2023,1,18,NULL,NULL,NULL,NULL),(682,160,2023,1,19,NULL,NULL,NULL,NULL),(683,161,2023,1,9,NULL,NULL,NULL,NULL),(684,161,2023,1,10,NULL,NULL,NULL,NULL),(685,161,2023,1,11,NULL,NULL,NULL,NULL),(686,161,2023,1,12,NULL,NULL,NULL,NULL),(687,161,2023,1,13,NULL,NULL,NULL,NULL),(688,161,2023,1,14,NULL,NULL,NULL,NULL),(689,161,2023,1,15,NULL,NULL,NULL,NULL),(690,161,2023,1,16,NULL,NULL,NULL,NULL),(691,161,2023,1,17,NULL,NULL,NULL,NULL),(692,161,2023,1,18,NULL,NULL,NULL,NULL),(693,161,2023,1,19,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `planning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `points`
--

DROP TABLE IF EXISTS `points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `points` (
  `pointId` int(11) NOT NULL AUTO_INCREMENT,
  `valeur` int(11) NOT NULL,
  `court` char(1) NOT NULL,
  `intitule` varchar(50) NOT NULL,
  PRIMARY KEY (`pointId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `points`
--

LOCK TABLES `points` WRITE;
/*!40000 ALTER TABLE `points` DISABLE KEYS */;
INSERT INTO `points` VALUES (1,3,'v','Victoire'),(2,1,'d','Défaite'),(3,0,'p','Partie déclarée perdue');
/*!40000 ALTER TABLE `points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `series`
--

DROP TABLE IF EXISTS `series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `series` (
  `serieId` int(11) NOT NULL AUTO_INCREMENT,
  `valeur` int(11) NOT NULL,
  `intitule` varchar(50) NOT NULL,
  PRIMARY KEY (`serieId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series`
--

LOCK TABLES `series` WRITE;
/*!40000 ALTER TABLE `series` DISABLE KEYS */;
INSERT INTO `series` VALUES (1,1,'Première'),(2,2,'Deuxième'),(3,3,'Troisième');
/*!40000 ALTER TABLE `series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `souhaits`
--

DROP TABLE IF EXISTS `souhaits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `souhaits` (
  `souhaitId` int(11) NOT NULL AUTO_INCREMENT,
  `valeur` int(11) NOT NULL,
  `intitule` varchar(50) NOT NULL,
  PRIMARY KEY (`souhaitId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `souhaits`
--

LOCK TABLES `souhaits` WRITE;
/*!40000 ALTER TABLE `souhaits` DISABLE KEYS */;
INSERT INTO `souhaits` VALUES (1,0,'Indifférent'),(2,1,'Semaine uniquement'),(3,2,'Week-end uniquement');
/*!40000 ALTER TABLE `souhaits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'tournoi'
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `authentification` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` FUNCTION `authentification`(utilisateur VARCHAR(255), email VARCHAR(255)) RETURNS varchar(255) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
BEGIN
DECLARE retour VARCHAR(255);
SELECT mpasse INTO retour FROM administrateurs WHERE nom = utilisateur AND  courriel = email limit 1;
RETURN retour;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `calendrier_p` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` FUNCTION `calendrier_p`() RETURNS tinyint(4)
    READS SQL DATA
    DETERMINISTIC
BEGIN
DECLARE retour TINYINT(1) DEFAULT 0;
DECLARE premierId INT DEFAULT 0;

SELECT planningId INTO premierId FROM planning WHERE planningId = 1;
IF (premierId > 0) THEN
SET retour = 1;
END IF;
RETURN retour;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `datesEtablies_p` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` FUNCTION `datesEtablies_p`() RETURNS tinyint(4)
    READS SQL DATA
BEGIN
DECLARE retour TINYINT(1) DEFAULT 0;
DECLARE nombre INT DEFAULT 0;

SET nombre = (SELECT COUNT(*) FROM datesGenerales WHERE jour IS NULL);

IF(nombre = 0) THEN SET retour = 1;
END IF;
RETURN retour;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `intNombreEquipe` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` FUNCTION `intNombreEquipe`() RETURNS int(11)
    READS SQL DATA
BEGIN
DECLARE retour INT DEFAULT 0;
SET retour = (SELECT COUNT(*) FROM equipes);
RETURN retour;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `intNombreEquipeSerieGenre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` FUNCTION `intNombreEquipeSerieGenre`(_serie INT, _genre INT) RETURNS int(11)
    READS SQL DATA
BEGIN
DECLARE retour INT DEFAULT 0;
SET retour = (SELECT COUNT(*) FROM equipes WHERE serie=_serie AND genre=_genre);
RETURN retour;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `intNombreEquipeSerieGenreAvecPoule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` FUNCTION `intNombreEquipeSerieGenreAvecPoule`(_serie INT, _genre INT) RETURNS int(11)
    READS SQL DATA
BEGIN
DECLARE retour INT DEFAULT 0;
SET retour = (SELECT COUNT(*) FROM equipes WHERE serie=_serie AND genre=_genre AND poule !=0 );
RETURN retour;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `intNombreEquipeSerieGenreSansPoule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` FUNCTION `intNombreEquipeSerieGenreSansPoule`(_serie INT, _genre INT) RETURNS int(11)
    READS SQL DATA
BEGIN
DECLARE retour INT DEFAULT 0;
SET retour = (SELECT COUNT(*) FROM equipes WHERE serie=_serie AND genre=_genre AND poule=0);
RETURN retour;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `intTournoiId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` FUNCTION `intTournoiId`(_serie INT, _poule INT, _pouleId INT) RETURNS int(11)
    READS SQL DATA
BEGIN
DECLARE retour INT;
SET retour = (100 * _serie) + (10 * _poule) + _pouleId;
RETURN retour;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `jsonDatesGenerales` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` FUNCTION `jsonDatesGenerales`() RETURNS longtext CHARSET utf8mb4 COLLATE utf8mb4_bin
    READS SQL DATA
BEGIN
DECLARE retour JSON;
SET retour = (SELECT JSON_ARRAYAGG(JSON_OBJECT('dateId',dateId,'evenement',evenement,'jour',jour,'annee',annee)) FROM datesGenerales);
RETURN retour;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `jsonEquipeId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` FUNCTION `jsonEquipeId`(_serie INT, _genre INT) RETURNS longtext CHARSET utf8mb4 COLLATE utf8mb4_bin
    READS SQL DATA
BEGIN
DECLARE retour JSON;
SET retour = (SELECT JSON_ARRAYAGG(JSON_OBJECT('equipeId', equipeId, 'serie', serie, 'genre', genre)) FROM equipes WHERE serie=_serie AND genre=_genre);
RETURN retour;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `jsonEquipeIdNom` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` FUNCTION `jsonEquipeIdNom`(_serie INT, _genre INT) RETURNS longtext CHARSET utf8mb4 COLLATE utf8mb4_bin
    READS SQL DATA
BEGIN
DECLARE retour JSON;
set retour=(SELECT JSON_ARRAYAGG(JSON_OBJECT('equipeId',equipeId,'serie',serie,'genre',genre,'nom1',nom1,'nom2',nom2)) FROM equipes WHERE serie=_serie AND genre=_genre);
RETURN retour;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `jsonEquipeIdSouhait` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` FUNCTION `jsonEquipeIdSouhait`(_serie INT, _genre INT) RETURNS longtext CHARSET utf8mb4 COLLATE utf8mb4_bin
    READS SQL DATA
BEGIN
DECLARE retour JSON;
set retour=(SELECT JSON_ARRAYAGG(JSON_OBJECT('equipeId',equipeId,'serie',serie,'genre',genre,'souhait',s.intitule,'valeur',e.souhait)) FROM equipes e INNER JOIN souhaits s ON e.souhait = s.souhaitId WHERE serie=_serie AND genre=_genre);
RETURN retour;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `jsonEquipeSerieGenreAvecPoule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` FUNCTION `jsonEquipeSerieGenreAvecPoule`(_serie INT, _genre INT) RETURNS longtext CHARSET utf8mb4 COLLATE utf8mb4_bin
    READS SQL DATA
BEGIN
DECLARE retour JSON;
SET retour = (SELECT JSON_ARRAYAGG(JSON_OBJECT('equipeId', equipeId,'tournoiId',tournoiId)) FROM equipes WHERE serie=_serie AND genre=_genre AND poule != 0);
RETURN retour;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `jsonEquipeSerieGenreSansPoule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` FUNCTION `jsonEquipeSerieGenreSansPoule`(_serie INT, _genre INT) RETURNS longtext CHARSET utf8mb4 COLLATE utf8mb4_bin
    READS SQL DATA
BEGIN
DECLARE retour JSON;
SET retour = (SELECT JSON_ARRAYAGG(JSON_OBJECT('equipeId', equipeId)) FROM equipes WHERE serie=_serie AND genre=_genre AND poule=0);
RETURN retour;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `jsonGenreSerie` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` FUNCTION `jsonGenreSerie`(valeurGenre INT, valeurSerie INT) RETURNS longtext CHARSET utf8mb4 COLLATE utf8mb4_bin
    READS SQL DATA
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `jsonPouleListe` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` FUNCTION `jsonPouleListe`(_serie INT, _poule INT) RETURNS longtext CHARSET utf8mb4 COLLATE utf8mb4_bin
    READS SQL DATA
    DETERMINISTIC
BEGIN
DECLARE retour JSON;
SELECT JSON_ARRAYAGG(JSON_OBJECT('intitule', intitule)) INTO retour FROM seriePouleNumeroIntitule WHERE serie=_serie and poule=_poule;
RETURN retour;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `planning_p` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` FUNCTION `planning_p`(_serie INT, _phase INT) RETURNS tinyint(4)
    READS SQL DATA
    DETERMINISTIC
BEGIN
DECLARE retour TINYINT(1) DEFAULT 0;
DECLARE nombre INT DEFAULT 0;
SELECT count(*) FROM planning WHERE serie=_serie AND phase=_phase INTO nombre;

IF (nombre > 0) THEN SET retour = 1;
END IF;

RETURN retour;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `tournoi_p` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` FUNCTION `tournoi_p`(_serie INT, _genre INT) RETURNS tinyint(4)
    READS SQL DATA
    DETERMINISTIC
BEGIN
DECLARE retour TINYINT(1) DEFAULT 0;
DECLARE nombre INT DEFAULT 0;
SET nombre = (SELECT COUNT(*) FROM parties WHERE serie=_serie AND genre=_genre);
IF (nombre > 0) THEN
SET retour = 1;
END IF;
RETURN retour;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `booleenCreationCalendrier` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` PROCEDURE `booleenCreationCalendrier`()
BEGIN
DECLARE retour TINYINT(1) DEFAULT 0;
DECLARE etablies_p TINYINT(1) DEFAULT 0;
DECLARE _debut INT DEFAULT 1; 
DECLARE _fin INT DEFAULT 365; 
DECLARE _annee INT DEFAULT 2023; 
DECLARE premierJour INT DEFAULT -1;
DECLARE planningId_p TINYINT DEFAULT 0;

SET etablies_p = (SELECT datesEtablies_p());


IF (etablies_p = 1) THEN
SELECT jour INTO _debut FROM datesGenerales WHERE dateId=5;
SELECT annee INTO _annee FROM datesGenerales WHERE dateId=5;
SELECT jour INTO _fin FROM datesGenerales WHERE dateId=8;
CALL creationPlanning(_debut, _fin, _annee);
END IF;


SELECT calendrier_p() INTO planningId_p;
IF (planningId_p = 1) THEN
SET retour = 1;
END IF;





SELECT retour;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `booleenCreationPlanning` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` PROCEDURE `booleenCreationPlanning`(premierJour INT, dernierJour INT, annee INT)
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `booleenCreationTableauResultat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` PROCEDURE `booleenCreationTableauResultat`(IN _serie INT, IN _genre INT)
BEGIN
DECLARE test TINYINT(1) DEFAULT 1;
DECLARE retour TINYINT(1) DEFAULT 0;

SET test = (SELECT tournoi_p(_serie, _genre));

IF (test = 0) THEN
CALL creationTournoi(_serie, _genre);
SET retour = 1;
END IF;

SELECT retour;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `booleenDateGenerale` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` PROCEDURE `booleenDateGenerale`(_evenementId INT, _jour INT, _annee INT)
BEGIN

DECLARE retour TINYINT(1) DEFAULT 0;
DECLARE nombre INT;

UPDATE datesGenerales SET jour = _jour, annee = _annee where dateId = _evenementId;

SELECT COUNT(*) INTO nombre FROM datesGenerales WHERE dateId = _evenementId AND jour = _jour AND annee = _annee;

IF (nombre = 1) THEN SET retour = 1;
END IF;

SELECT retour;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `booleenEtablissementPlanning` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` PROCEDURE `booleenEtablissementPlanning`()
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





END IF;

SELECT retour;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `creationPlanning` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` PROCEDURE `creationPlanning`(premierJour INT, dernierJour INT, annee INT)
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `creationTournoi` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` PROCEDURE `creationTournoi`(IN _serie INT, IN _genre INT)
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `jasonX` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` PROCEDURE `jasonX`(IN valeurGenre INT, OUT retour JSON)
BEGIN
SELECT JSON_ARRAYAGG(JSON_OBJECT('serie',serie,'genre',genre,'nom1',nom1,'prenom1',prenom1,'nom2',nom2,'prenom2',prenom2)) FROM listePairesJoueurs2018 where genre = valeurGenre;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `jsonTableauFormatEquipe` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` PROCEDURE `jsonTableauFormatEquipe`(OUT retour JSON)
BEGIN
SELECT JSON_ARRAYAGG(JSON_OBJECT('clef', clef, 'valeur', valeur)) FROM formatEquipe;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `jsonTableauGenre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` PROCEDURE `jsonTableauGenre`(OUT retour JSON)
BEGIN
SELECT JSON_ARRAYAGG(JSON_OBJECT('acronyme', acronyme, 'intitule', intitule)) FROM genre;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `jsonTableauPoints` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` PROCEDURE `jsonTableauPoints`(OUT retour JSON)
BEGIN
SELECT JSON_ARRAYAGG(JSON_OBJECT('acronyme', acronyme, 'intitule', intitule, 'valeur', valeur)) FROM points;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `jsonTableauSerie` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` PROCEDURE `jsonTableauSerie`(OUT retour JSON)
BEGIN
SELECT JSON_ARRAYAGG(JSON_OBJECT('acronyme', acronyme, 'intitule', intitule)) as 'resultats' FROM serie;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-15 22:38:48
