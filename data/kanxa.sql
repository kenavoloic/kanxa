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
INSERT INTO `equipes` VALUES (1,1,3,2,1,'Egea','Sabrina','Sabrina.Egea@Talence.33.fr',NULL,'192198','Carel','Léah','Léah.Carel@Bègles.33.fr',NULL,'192199',0,4,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,341),(2,1,1,2,1,'Salvan','Zita','Zita.Salvan@Libourne.33.fr',NULL,'150421','Cheng','Théa','Théa.Cheng@Léognan.33.fr',NULL,'150422',1,4,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,141),(3,1,2,2,3,'Abbas','Ahlem','Ahlem.Abbas@Mios.33.fr',NULL,'175464','Donnet','Violette','Violette.Donnet@Saint_Médard_en_Jalles.33.fr',NULL,'175465',0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,211),(4,1,3,2,3,'Fonteneau','Suzon','Suzon.Fonteneau@Mios.33.fr',NULL,'192192','Blaise','Emie','Emie.Blaise@Gradignan.33.fr',NULL,'192193',0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,311),(5,1,2,1,1,'Savary','Marc-Antoine','Marc_Antoine.Savary@Libourne.33.fr',NULL,'161311','Hecquet','Billy','Billy.Hecquet@Le_Taillan_Médoc.33.fr',NULL,'161312',1,3,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,232),(6,1,1,1,3,'Michon','Kalvin','Kalvin.Michon@Eysines.33.fr',NULL,'140332','Ravier','Therry','Therry.Ravier@Talence.33.fr',NULL,'140333',1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,111),(7,1,2,2,3,'De Azevedo','Sandra','Sandra.De_Azevedo@Lormont.33.fr',NULL,'175448','Huart','Yasmina','Yasmina.Huart@Parempuyre.33.fr',NULL,'175449',0,1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,212),(8,1,1,1,3,'Carlos','Elidjah','Elidjah.Carlos@Le_Haillan.33.fr',NULL,'140342','Beaudoin','Sébastien','Sébastien.Beaudoin@Léognan.33.fr',NULL,'140343',1,1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,112),(9,1,1,2,3,'Le cam','Sita','Sita.Le_cam@Villenave_d_Ornon.33.fr',NULL,'150429','Kuhn','Charlyne','Charlyne.Kuhn@Biganos.33.fr',NULL,'150430',1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,111),(10,1,2,2,3,'Rameau','Loann','Loann.Rameau@Floirac.33.fr',NULL,'175468','Boisset','Ophélie','Ophélie.Boisset@Le_Bouscat.33.fr',NULL,'175469',0,1,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,213),(11,1,1,1,3,'Guiet','Dylan','Dylan.Guiet@Saint_André_de_Cubzac.33.fr',NULL,'140338','Hennequin','Brice','Brice.Hennequin@Saint_André_de_Cubzac.33.fr',NULL,'140339',1,1,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,113),(12,1,2,2,1,'Hamon','Leyna','Leyna.Hamon@Cenon.33.fr',NULL,'175472','Huet','Trycia','Trycia.Huet@Arcachon.33.fr',NULL,'175473',0,3,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,232),(13,1,2,2,2,'Teboul','Imane','Imane.Teboul@Le_Taillan_Médoc.33.fr',NULL,'175456','Coquet','Thais','Thais.Coquet@Eysines.33.fr',NULL,'175457',0,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,221),(14,1,3,1,1,'Kaba','Kensley','Kensley.Kaba@La_Teste_de_Buch.33.fr',NULL,'177123','Audureau','Lenny','Lenny.Audureau@La_Teste_de_Buch.33.fr',NULL,'177124',1,4,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,341),(15,1,3,1,2,'Fernandes','Devone','Devone.Fernandes@Parempuyre.33.fr',NULL,'177113','Grau','Andréas','Andréas.Grau@Bègles.33.fr',NULL,'177114',1,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,321),(16,1,2,1,3,'Zerrouki','Timéo','Timéo.Zerrouki@Cenon.33.fr',NULL,'161337','Gay','Massi','Massi.Gay@Mios.33.fr',NULL,'161338',0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,211),(17,1,2,2,1,'Chassagne','Mei','Mei.Chassagne@Le_Bouscat.33.fr',NULL,'175454','Hamm','Fany','Fany.Hamm@Biganos.33.fr',NULL,'175455',0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,233),(18,1,2,2,2,'Rota','Lee-Lou','Lee_Lou.Rota@Le_Bouscat.33.fr',NULL,'175450','Bruyere','Soukayna','Soukayna.Bruyere@Le_Haillan.33.fr',NULL,'175451',0,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,222),(19,1,3,2,2,'Delassus','Noah','Noah.Delassus@Andernos_les_Bains.33.fr',NULL,'192202','Dumaine','Loujayne','Loujayne.Dumaine@Cenon.33.fr',NULL,'192203',0,3,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,331),(20,1,2,2,1,'Moritz','Leanne','Leanne.Moritz@Cenon.33.fr',NULL,'175476','Fasquel','Rachelle','Rachelle.Fasquel@Bruges.33.fr',NULL,'175477',0,3,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,234),(21,1,2,1,1,'Augier','Johnson','Johnson.Augier@Ambarès_et_Lagrave.33.fr',NULL,'161331','Diaz','Vivien','Vivien.Diaz@Eysines.33.fr',NULL,'161332',0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,233),(22,1,1,2,3,'Longuet','Doriane','Doriane.Longuet@Andernos_les_Bains.33.fr',NULL,'150437','Jobert','Merine','Merine.Jobert@Bègles.33.fr',NULL,'150438',1,1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,112),(23,1,1,2,1,'Teixeira','Yvonne','Yvonne.Teixeira@Eysines.33.fr',NULL,'150435','De Carvalho','Abiba','Abiba.De_Carvalho@Le_Taillan_Médoc.33.fr',NULL,'150436',0,4,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,142),(24,1,1,2,2,'Cottin','Malory','Malory.Cottin@Andernos_les_Bains.33.fr',NULL,'150425','Laborie','Maïly','Maïly.Laborie@Ambarès_et_Lagrave.33.fr',NULL,'150426',0,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,121),(25,1,3,2,1,'Gence','Sofya','Sofya.Gence@Mios.33.fr',NULL,'192200','Ahmed','Hira','Hira.Ahmed@Floirac.33.fr',NULL,'192201',0,4,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,342),(26,1,2,1,3,'Schaeffer','Joaquim','Joaquim.Schaeffer@Ambarès_et_Lagrave.33.fr',NULL,'161341','Delacour','Willyam','Willyam.Delacour@Saint_Loubès.33.fr',NULL,'161342',0,1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,212),(27,1,3,1,1,'Lamarque','Eyden','Eyden.Lamarque@Saint_Médard_en_Jalles.33.fr',NULL,'177115','Vanhoutte','Medine','Medine.Vanhoutte@Eysines.33.fr',NULL,'177116',1,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,333),(28,1,1,1,2,'Mignon','Wilhem','Wilhem.Mignon@Libourne.33.fr',NULL,'140340','Rapin','Mathéis','Mathéis.Rapin@Mérignac.33.fr',NULL,'140341',0,1,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,114),(29,1,3,2,3,'Court','Kimberly','Kimberly.Court@Léognan.33.fr',NULL,'192180','Geffroy','Shauna','Shauna.Geffroy@Parempuyre.33.fr',NULL,'192181',0,1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,312),(30,1,3,1,3,'Ibanez','Soann','Soann.Ibanez@Eysines.33.fr',NULL,'177131','Blaise','Loan','Loan.Blaise@Léognan.33.fr',NULL,'177132',0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,311),(31,1,2,1,2,'Ragot','Nayan','Nayan.Ragot@Le_Haillan.33.fr',NULL,'161333','Lafon','Antonin','Antonin.Lafon@Lormont.33.fr',NULL,'161334',0,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,221),(32,1,1,2,1,'Valin','Naissa','Naissa.Valin@Gujan_Mestras.33.fr',NULL,'150431','Desbois','Fantine','Fantine.Desbois@Villenave_d_Ornon.33.fr',NULL,'150432',0,4,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,143),(33,1,3,2,3,'Bienaime','Lyah','Lyah.Bienaime@Lormont.33.fr',NULL,'192178','Pasquet','Nihal','Nihal.Pasquet@Lormont.33.fr',NULL,'192179',0,1,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,313),(34,1,1,1,3,'Crespo','Jérémy','Jérémy.Crespo@Mérignac.33.fr',NULL,'140344','Taleb','Yanisse','Yanisse.Taleb@Blanquefort.33.fr',NULL,'140345',0,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,121),(35,1,2,1,1,'Rossignol','Hendrick','Hendrick.Rossignol@Le_Haillan.33.fr',NULL,'161319','Janot','Evann','Evann.Janot@Le_Haillan.33.fr',NULL,'161320',0,3,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,234),(36,1,3,1,3,'Gibert','Yael','Yael.Gibert@Saint_Loubès.33.fr',NULL,'177133','Devienne','Elyo','Elyo.Devienne@La_Teste_de_Buch.33.fr',NULL,'177134',1,1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,312),(37,1,3,2,2,'Firmin','Prescillia','Prescillia.Firmin@Lormont.33.fr',NULL,'192186','Bonnel','Leyla','Leyla.Bonnel@Pessac.33.fr',NULL,'192187',0,3,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,332),(38,1,2,1,1,'Ledru','Cameron','Cameron.Ledru@Le_Taillan_Médoc.33.fr',NULL,'161339','Mazoyer','Devran','Devran.Mazoyer@Bègles.33.fr',NULL,'161340',0,4,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,241),(39,1,3,2,3,'Feret','Patricia','Patricia.Feret@Biganos.33.fr',NULL,'192194','Bourdet','Lilou','Lilou.Bourdet@Bordeaux.33.fr',NULL,'192195',0,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,321),(40,1,1,2,3,'Tran','Maëlys','Maëlys.Tran@Le_Bouscat.33.fr',NULL,'150427','Delplace','Jana','Jana.Delplace@Arcachon.33.fr',NULL,'150428',0,1,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,113),(41,1,3,1,1,'Jubert','Danny','Danny.Jubert@Bègles.33.fr',NULL,'177111','Bachelet','Soane','Soane.Bachelet@Mérignac.33.fr',NULL,'177112',1,3,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,332),(42,1,1,1,2,'De Azevedo','Hendrick','Hendrick.De_Azevedo@Biganos.33.fr',NULL,'140328','Sayah','Fabio','Fabio.Sayah@Biganos.33.fr',NULL,'140329',0,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,122),(43,1,2,2,1,'Duteil','Lèna','Lèna.Duteil@Saint_Médard_en_Jalles.33.fr',NULL,'175466','Janin','Suzie','Suzie.Janin@Gradignan.33.fr',NULL,'175467',0,4,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,242),(44,1,3,1,3,'Lambert','Enrick','Enrick.Lambert@Saint_Loubès.33.fr',NULL,'177103','Vandaele','Aime','Aime.Vandaele@Bègles.33.fr',NULL,'177104',0,1,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,313),(45,1,1,2,3,'Diagne','Leyna','Leyna.Diagne@Eysines.33.fr',NULL,'150419','Larroque','Laurette','Laurette.Larroque@Arcachon.33.fr',NULL,'150420',0,1,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,114),(46,1,2,1,1,'Jouanne','Keryan','Keryan.Jouanne@Bordeaux.33.fr',NULL,'161327','Migeon','Samaël','Samaël.Migeon@Saint_André_de_Cubzac.33.fr',NULL,'161328',0,4,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,242),(47,1,1,1,3,'Loizeau','Helios','Helios.Loizeau@Blanquefort.33.fr',NULL,'140320','Assouline','Kérane','Kérane.Assouline@Le_Taillan_Médoc.33.fr',NULL,'140321',0,2,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,123),(48,1,3,1,3,'Declerck','Fabrice','Fabrice.Declerck@Gujan_Mestras.33.fr',NULL,'177105','Madi','Matthieu','Matthieu.Madi@Le_Bouscat.33.fr',NULL,'177106',0,1,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,314),(49,1,3,2,3,'Guilbaud','Yacine','Yacine.Guilbaud@Cenon.33.fr',NULL,'192204','Sales','Victoria','Victoria.Sales@Cestas.33.fr',NULL,'192205',0,1,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,314),(50,1,1,2,1,'Thevenet','Christiana','Christiana.Thevenet@Le_Bouscat.33.fr',NULL,'150411','Colas','Nassima','Nassima.Colas@Bruges.33.fr',NULL,'150412',0,4,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,144),(51,1,1,2,3,'Arab','Méline','Méline.Arab@Villenave_d_Ornon.33.fr',NULL,'150439','Floquet','Ibaia','Ibaia.Floquet@Bordeaux.33.fr',NULL,'150440',0,3,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,131),(52,1,1,2,2,'Cantin','Kyana','Kyana.Cantin@Pessac.33.fr',NULL,'150415','Jacob','Lizy','Lizy.Jacob@Floirac.33.fr',NULL,'150416',0,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,122),(53,1,2,1,2,'Gouin','Lenny','Lenny.Gouin@Lormont.33.fr',NULL,'161313','Milesi','Nolane','Nolane.Milesi@Mérignac.33.fr',NULL,'161314',0,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,222),(54,1,3,1,1,'Huc','Ricardo','Ricardo.Huc@Parempuyre.33.fr',NULL,'177119','Bonnet','Paulin','Paulin.Bonnet@Le_Bouscat.33.fr',NULL,'177120',0,3,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,334),(55,1,3,2,1,'Bulteau','Elora','Elora.Bulteau@Parempuyre.33.fr',NULL,'192184','Lesage','Angelique','Angelique.Lesage@Libourne.33.fr',NULL,'192185',0,4,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,343),(56,1,1,1,1,'Goy','Tyler','Tyler.Goy@Bègles.33.fr',NULL,'140346','Jouve','Pierrick','Pierrick.Jouve@Saint_André_de_Cubzac.33.fr',NULL,'140347',0,2,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,124),(57,1,1,1,1,'Grondin','Ely','Ely.Grondin@Villenave_d_Ornon.33.fr',NULL,'140322','Ibrahim','Arnaud','Arnaud.Ibrahim@Mios.33.fr',NULL,'140323',0,3,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,131),(58,1,1,2,2,'Barret','Céline','Céline.Barret@Talence.33.fr',NULL,'150417','Gaspard','Lizéa','Lizéa.Gaspard@Bègles.33.fr',NULL,'150418',0,2,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,123),(59,1,3,1,1,'Defosse','Keran','Keran.Defosse@Biganos.33.fr',NULL,'177117','Lutz','Kelvin','Kelvin.Lutz@Andernos_les_Bains.33.fr',NULL,'177118',0,4,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,342),(60,1,1,2,1,'Fraysse','Loïs','Loïs.Fraysse@Biganos.33.fr',NULL,'150441','Le Guennec','Khadija','Khadija.Le_Guennec@Gujan_Mestras.33.fr',NULL,'150442',0,2,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,124),(61,1,2,1,3,'Retif','Abel','Abel.Retif@Floirac.33.fr',NULL,'161315','Cesar','Luqman','Luqman.Cesar@Parempuyre.33.fr',NULL,'161316',0,1,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,213),(62,1,1,1,3,'Chabot','Jerome','Jerome.Chabot@Blanquefort.33.fr',NULL,'140350','Aveline','Vadim','Vadim.Aveline@Libourne.33.fr',NULL,'140351',1,3,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,132),(63,1,2,2,2,'Serres','Ilayda','Ilayda.Serres@Blanquefort.33.fr',NULL,'175460','Chau','Shanaëlle','Shanaëlle.Chau@Andernos_les_Bains.33.fr',NULL,'175461',0,2,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,223),(64,1,2,1,2,'Bara','Djayden','Djayden.Bara@Villenave_d_Ornon.33.fr',NULL,'161317','Delord','Virgile','Virgile.Delord@Pessac.33.fr',NULL,'161318',0,2,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,223),(65,1,3,1,3,'Gontier','Arno','Arno.Gontier@Cestas.33.fr',NULL,'177121','Dedieu','Yacine','Yacine.Dedieu@Mérignac.33.fr',NULL,'177122',0,3,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,331),(66,1,1,1,2,'Mevel','Marwane','Marwane.Mevel@La_Teste_de_Buch.33.fr',NULL,'140348','Rey','Lorick','Lorick.Rey@Le_Haillan.33.fr',NULL,'140349',0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,133),(67,1,3,2,2,'Floquet','Tali','Tali.Floquet@Le_Taillan_Médoc.33.fr',NULL,'192188','Boisseau','Ela','Ela.Boisseau@Lormont.33.fr',NULL,'192189',0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,333),(68,1,1,1,1,'Michelet','Adams','Adams.Michelet@Cestas.33.fr',NULL,'140324','Redon','Malonn','Malonn.Redon@Gujan_Mestras.33.fr',NULL,'140325',0,3,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,134),(69,1,2,2,1,'Rollin','Léontine','Léontine.Rollin@Le_Bouscat.33.fr',NULL,'175474','Brisset','Taïs','Taïs.Brisset@Saint_André_de_Cubzac.33.fr',NULL,'175475',0,4,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,243),(70,1,2,1,2,'Talbot','Jonathan','Jonathan.Talbot@La_Teste_de_Buch.33.fr',NULL,'161325','Gressier','Emre','Emre.Gressier@Libourne.33.fr',NULL,'161326',0,2,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,224),(71,1,2,1,3,'Sailly','Kélian','Kélian.Sailly@Bordeaux.33.fr',NULL,'161323','Da Fonseca','Sovann','Sovann.Da_Fonseca@Bordeaux.33.fr',NULL,'161324',0,1,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,214),(72,1,2,2,3,'Lebourgeois','Maelia','Maelia.Lebourgeois@Gradignan.33.fr',NULL,'175462','Guedes','Alma','Alma.Guedes@Libourne.33.fr',NULL,'175463',0,1,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,214),(73,1,2,2,1,'Moinet','Maddie','Maddie.Moinet@Andernos_les_Bains.33.fr',NULL,'175452','Fevre','Noemie','Noemie.Fevre@Saint_Médard_en_Jalles.33.fr',NULL,'175453',0,4,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,244),(74,1,3,2,2,'Fasquel','Sanata','Sanata.Fasquel@Le_Haillan.33.fr',NULL,'192208','Breard','Maureen','Maureen.Breard@Talence.33.fr',NULL,'192209',0,3,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,334),(75,1,2,2,2,'Prin','Marya','Marya.Prin@Bruges.33.fr',NULL,'175470','Dahan','Drucilla','Drucilla.Dahan@Gujan_Mestras.33.fr',NULL,'175471',0,2,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,224),(76,1,2,1,2,'Da Silva','Lïam','Lïam.Da_Silva@Cenon.33.fr',NULL,'161335','Mahi','Natty','Natty.Mahi@Saint_Médard_en_Jalles.33.fr',NULL,'161336',0,3,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,231),(77,1,1,1,1,'Cassard','Evan','Evan.Cassard@Bègles.33.fr',NULL,'140326','Barry','Mario','Mario.Barry@Libourne.33.fr',NULL,'140327',0,4,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,141),(78,1,1,2,1,'Panier','Enora','Enora.Panier@Léognan.33.fr',NULL,'150423','Gohier','Matilde','Matilde.Gohier@Saint_André_de_Cubzac.33.fr',NULL,'150424',0,3,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,132),(79,1,1,2,1,'Large','Lindsay','Lindsay.Large@Arcachon.33.fr',NULL,'150433','Lagache','Lally','Lally.Lagache@Bègles.33.fr',NULL,'150434',0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,133),(80,1,3,1,2,'Goupil','Myron','Myron.Goupil@Lormont.33.fr',NULL,'177109','Dauvergne','Alvin','Alvin.Dauvergne@Ambarès_et_Lagrave.33.fr',NULL,'177110',1,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,322),(81,1,3,1,2,'Delannay','Timeo','Timeo.Delannay@Mios.33.fr',NULL,'177129','Lobry','Ibai','Ibai.Lobry@Eysines.33.fr',NULL,'177130',0,2,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,323),(82,1,1,2,1,'Mosnier','Oriana','Oriana.Mosnier@Mios.33.fr',NULL,'150413','Guille','Athéna','Athéna.Guille@Pessac.33.fr',NULL,'150414',0,3,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,134),(83,1,3,2,3,'Fievet','Raïssa','Raïssa.Fievet@Saint_Loubès.33.fr',NULL,'192190','Borges','Leonie','Leonie.Borges@Ambarès_et_Lagrave.33.fr',NULL,'192191',0,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,322),(84,1,2,1,3,'Richard','Frederic','Frederic.Richard@Arcachon.33.fr',NULL,'161329','Chaput','Hermès','Hermès.Chaput@Mérignac.33.fr',NULL,'161330',0,4,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,243),(85,1,3,1,1,'Lallemand','Lohan','Lohan.Lallemand@Cestas.33.fr',NULL,'177127','Venet','Jamil','Jamil.Venet@Gujan_Mestras.33.fr',NULL,'177128',0,4,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,343),(86,1,3,1,1,'Falck','Esaïe','Esaïe.Falck@Le_Haillan.33.fr',NULL,'177125','Guillou','Mouhammad','Mouhammad.Guillou@Léognan.33.fr',NULL,'177126',0,4,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,344),(87,1,2,2,3,'Naze','Carine','Carine.Naze@Bordeaux.33.fr',NULL,'175446','D’angelo','Annabelle','Annabelle.D_angelo@Talence.33.fr',NULL,'175447',0,3,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,231),(88,1,2,2,2,'Jourdain','Lindsay','Lindsay.Jourdain@Saint_André_de_Cubzac.33.fr',NULL,'175458','Hennequin','Théodora','Théodora.Hennequin@Le_Bouscat.33.fr',NULL,'175459',0,4,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,241),(89,1,1,1,1,'Carrier','Nolann','Nolann.Carrier@Ambarès_et_Lagrave.33.fr',NULL,'140334','Baude','Angus','Angus.Baude@Floirac.33.fr',NULL,'140335',0,4,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,142),(90,1,1,1,2,'Dalle','Maxens','Maxens.Dalle@Floirac.33.fr',NULL,'140336','Siong','Lamine','Lamine.Siong@Mios.33.fr',NULL,'140337',0,4,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,143),(91,1,1,1,3,'Hamard','Djany','Djany.Hamard@Le_Bouscat.33.fr',NULL,'140330','Granjon','Yoan','Yoan.Granjon@Bruges.33.fr',NULL,'140331',0,4,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,144),(92,1,2,1,3,'Fargier','Anthony','Anthony.Fargier@Le_Haillan.33.fr',NULL,'161321','Menard','Jack','Jack.Menard@Biganos.33.fr',NULL,'161322',0,4,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,244),(93,1,3,2,3,'Briet','Sloane','Sloane.Briet@Le_Haillan.33.fr',NULL,'192206','Louvel','Kayla','Kayla.Louvel@Biganos.33.fr',NULL,'192207',0,2,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,323),(94,1,3,2,3,'Gueye','Maurane','Maurane.Gueye@Le_Taillan_Médoc.33.fr',NULL,'192182','Sari','Megane','Megane.Sari@Saint_Médard_en_Jalles.33.fr',NULL,'192183',0,2,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,324),(95,1,3,2,1,'Francisco','Telma','Telma.Francisco@Parempuyre.33.fr',NULL,'192196','Belmonte','Clara','Clara.Belmonte@Pessac.33.fr',NULL,'192197',0,4,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,344),(96,1,3,1,2,'Houze','Joackim','Joackim.Houze@Cestas.33.fr',NULL,'177107','Borg','Lélio','Lélio.Borg@Gujan_Mestras.33.fr',NULL,'177108',0,2,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,324);
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
INSERT INTO `souhaits` VALUES (1,0,'Indifférent'),(2,1,'Semaine'),(3,2,'Week-end');
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
SELECT mpasse INTO retour FROM administrateurs WHERE nom = utilisateur AND courriel = email limit 1;
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
/*!50003 DROP FUNCTION IF EXISTS `intNombreEquipePaf` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` FUNCTION `intNombreEquipePaf`() RETURNS int(11)
    READS SQL DATA
BEGIN
DECLARE retour INT DEFAULT 0;
SET retour = (SELECT COUNT(*) FROM equipes WHERE paf_p = 1);
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
/*!50003 DROP FUNCTION IF EXISTS `intNombrePoule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` FUNCTION `intNombrePoule`(_serie INT, _genre INT) RETURNS int(11)
    READS SQL DATA
BEGIN
DECLARE retour INT DEFAULT 0;
SET retour = (SELECT COUNT(DISTINCT poule) FROM equipes WHERE serie=_serie AND genre=_genre);
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
/*!50003 DROP FUNCTION IF EXISTS `jsonBilanPaf` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` FUNCTION `jsonBilanPaf`() RETURNS longtext CHARSET utf8mb4 COLLATE utf8mb4_bin
    READS SQL DATA
BEGIN
DECLARE retour JSON;
SET @nombre = (SELECT COUNT(*) FROM equipes);
SET @aJour = (SELECT COUNT(*) FROM equipes WHERE paf_p = 1);
SET @enRetard = (SELECT COUNT(*) FROM equipes WHERE paf_p = 0);

SET @aj11 = (SELECT COUNT(*) FROM equipes WHERE serie=1 AND genre=1 AND paf_p = 1);
SET @aj12 = (SELECT COUNT(*) FROM equipes WHERE serie=1 AND genre=2 AND paf_p = 1);
SET @aj21 = (SELECT COUNT(*) FROM equipes WHERE serie=2 AND genre=1 AND paf_p = 1);
SET @aj22 = (SELECT COUNT(*) FROM equipes WHERE serie=2 AND genre=2 AND paf_p = 1);
SET @aj31 = (SELECT COUNT(*) FROM equipes WHERE serie=3 AND genre=1 AND paf_p = 1);
SET @aj32 = (SELECT COUNT(*) FROM equipes WHERE serie=3 AND genre=2 AND paf_p = 1);

SET @r11 = (SELECT COUNT(*) FROM equipes WHERE serie=1 AND genre=1 AND paf_p = 0);
SET @r12 = (SELECT COUNT(*) FROM equipes WHERE serie=1 AND genre=2 AND paf_p = 0);
SET @r21 = (SELECT COUNT(*) FROM equipes WHERE serie=2 AND genre=1 AND paf_p = 0);
SET @r22 = (SELECT COUNT(*) FROM equipes WHERE serie=2 AND genre=2 AND paf_p = 0);
SET @r31 = (SELECT COUNT(*) FROM equipes WHERE serie=3 AND genre=1 AND paf_p = 0);
SET @r32 = (SELECT COUNT(*) FROM equipes WHERE serie=3 AND genre=2 AND paf_p = 0);

SET retour = (SELECT JSON_ARRAYAGG(JSON_OBJECT('nombre',@nombre,'ajour', @aJour, 'retard', @enRetard,'aj11', @aj11, 'r11', @r11,'aj12', @aj12, 'r12', @r12,'aj21', @aj21, 'r21', @r21,'aj22', @aj22, 'r22', @r22,'aj31', @aj31, 'r31', @r31,'aj32', @aj32, 'r32', @r32)));
RETURN retour;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `jsonBilanPoules` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` FUNCTION `jsonBilanPoules`() RETURNS longtext CHARSET utf8mb4 COLLATE utf8mb4_bin
    READS SQL DATA
BEGIN
DECLARE retour JSON;
SET @nombreEquipes = (SELECT COUNT(*) FROM equipes);
SET @sansPoule = (SELECT COUNT(*) FROM equipes WHERE poule = 0);
SET @avecPoule = (SELECT COUNT(*) FROM equipes WHERE poule <> 0);

SET @sansPoule11 = (SELECT COUNT(*) FROM equipes WHERE serie=1 AND genre=1 AND poule = 0);
SET @avecPoule11 = (SELECT COUNT(*) FROM equipes WHERE serie=1 AND genre=1 AND poule <> 0);
SET @sansPoule12 = (SELECT COUNT(*) FROM equipes WHERE serie=1 AND genre=2 AND poule = 0);
SET @avecPoule12 = (SELECT COUNT(*) FROM equipes WHERE serie=1 AND genre=2 AND poule <> 0);

SET @sansPoule21 = (SELECT COUNT(*) FROM equipes WHERE serie=2 AND genre=1 AND poule = 0);
SET @avecPoule21 = (SELECT COUNT(*) FROM equipes WHERE serie=2 AND genre=1 AND poule <> 0);
SET @sansPoule22 = (SELECT COUNT(*) FROM equipes WHERE serie=2 AND genre=2 AND poule = 0);
SET @avecPoule22 = (SELECT COUNT(*) FROM equipes WHERE serie=2 AND genre=2 AND poule <> 0);

SET @sansPoule31 = (SELECT COUNT(*) FROM equipes WHERE serie=3 AND genre=1 AND poule = 0);
SET @avecPoule31 = (SELECT COUNT(*) FROM equipes WHERE serie=3 AND genre=1 AND poule <> 0);
SET @sansPoule32 = (SELECT COUNT(*) FROM equipes WHERE serie=3 AND genre=2 AND poule = 0);
SET @avecPoule32 = (SELECT COUNT(*) FROM equipes WHERE serie=3 AND genre=2 AND poule <> 0);

SET retour = (SELECT JSON_ARRAYAGG(JSON_OBJECT('nombre', @nombreEquipes,'sans',@sansPoule,'avec',@avecPoule,'sans11',@sansPoule11,'avec11',@avecPoule11,'sans12',@sansPoule12,'avec12',@avecPoule12,'sans21',@sansPoule21,'avec21',@avecPoule21,'sans22',@sansPoule22,'avec22',@avecPoule22,'sans31',@sansPoule31,'avec31',@avecPoule31,'sans32',@sansPoule32,'avec32',@avecPoule32)));
RETURN retour;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `jsonDateDebut` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` FUNCTION `jsonDateDebut`() RETURNS longtext CHARSET utf8mb4 COLLATE utf8mb4_bin
    READS SQL DATA
BEGIN
DECLARE retour JSON;
SET retour = (SELECT JSON_ARRAYAGG(JSON_OBJECT('jour',(jour - 1),'annee',annee)) FROM datesGenerales WHERE dateId = 5);
RETURN retour;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `jsonDateFin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` FUNCTION `jsonDateFin`() RETURNS longtext CHARSET utf8mb4 COLLATE utf8mb4_bin
    READS SQL DATA
BEGIN
DECLARE retour JSON;
SET retour = (SELECT JSON_ARRAYAGG(JSON_OBJECT('jour',jour,'annee',annee)) FROM datesGenerales WHERE dateId = 8);
RETURN retour;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `jsonDateQuarts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` FUNCTION `jsonDateQuarts`() RETURNS longtext CHARSET utf8mb4 COLLATE utf8mb4_bin
    READS SQL DATA
BEGIN
DECLARE retour JSON;
SET retour = (SELECT JSON_ARRAYAGG(JSON_OBJECT('jour',jour,'annee',annee)) FROM datesGenerales WHERE dateId = 6);
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
/*!50003 DROP FUNCTION IF EXISTS `jsonEquipeComplete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` FUNCTION `jsonEquipeComplete`(_serie INT, _genre INT) RETURNS longtext CHARSET utf8mb4 COLLATE utf8mb4_bin
    READS SQL DATA
BEGIN
DECLARE retour JSON;
set retour=(SELECT JSON_ARRAYAGG(JSON_OBJECT('equipeId',equipeId,'serie',serie,'genre',genre,'nom1',nom1,'prenom1',prenom1,'courriel1',lower(courriel1),'mobile1',mobile1,'licence1',licence1,'nom2',nom2,'prenom2',prenom2,'courriel2',lower(courriel2),'mobile2',mobile2,'licence2',licence2)) FROM equipes WHERE serie=_serie AND genre=_genre);
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
/*!50003 DROP FUNCTION IF EXISTS `jsonEquipeParId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` FUNCTION `jsonEquipeParId`(_equipeId INT) RETURNS longtext CHARSET utf8mb4 COLLATE utf8mb4_bin
    READS SQL DATA
BEGIN
DECLARE retour JSON;
set retour=(SELECT JSON_ARRAYAGG(JSON_OBJECT('equipeId',equipeId,'serie',serie,'genre',genre,'nom1',nom1,'prenom1',prenom1,'courriel1',courriel1,'mobile1',mobile1,'licence1',licence1,'nom2',nom2,'prenom2',prenom2,'courriel2',courriel2,'mobile2',mobile2,'licence2',licence2)) FROM equipes WHERE equipeId = _equipeId);
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
/*!50003 DROP FUNCTION IF EXISTS `jsonGenres` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` FUNCTION `jsonGenres`() RETURNS longtext CHARSET utf8mb4 COLLATE utf8mb4_bin
    READS SQL DATA
BEGIN
DECLARE retour JSON;
SET retour = (SELECT JSON_ARRAYAGG(JSON_OBJECT('genreId',genreId,'intitule', CONCAT(UCASE(LEFT(intitule,1)), SUBSTRING(intitule,2)))) FROM genres WHERE genreId < 3);
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
/*!50003 DROP FUNCTION IF EXISTS `jsonListePoule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` FUNCTION `jsonListePoule`(_serie INT, _genre INT, _poule INT) RETURNS longtext CHARSET utf8mb4 COLLATE utf8mb4_bin
    READS SQL DATA
BEGIN
DECLARE retour JSON;
SET retour = (SELECT JSON_ARRAYAGG(JSON_OBJECT('serie',serie,'genre',genre,'tournoiId',tournoiId,'equipeId',equipeId,'poule',poule,'pouleId',pouleId,'nom1',nom1,'prenom1',prenom1,'courriel1',lower(courriel1),'licence1',licence1,'mobile1',mobile1,'nom2',nom2,'prenom2',prenom2,'courriel2',lower(courriel2),'licence2',licence2,'mobile2',mobile2)) FROM equipes WHERE serie=_serie AND genre=_genre AND poule=_poule);
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
/*!50003 DROP FUNCTION IF EXISTS `jsonSerieGenrePaf` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` FUNCTION `jsonSerieGenrePaf`(_serie INT, _genre INT) RETURNS longtext CHARSET utf8mb4 COLLATE utf8mb4_bin
    READS SQL DATA
BEGIN
DECLARE retour JSON;
SET retour = (SELECT JSON_ARRAYAGG(JSON_OBJECT('equipeId',equipeId,'serie',serie,'genre',genre,'nom1',nom1,'nom2',nom2,'paf_p',paf_p)) FROM equipes WHERE serie = _serie AND genre = _genre AND paf_p = 0);
RETURN retour;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `jsonSerieGenrePouleClassement` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` FUNCTION `jsonSerieGenrePouleClassement`(_serie INT, _genre INT, _poule INT) RETURNS longtext CHARSET utf8mb4 COLLATE utf8mb4_bin
    READS SQL DATA
BEGIN
DECLARE retour JSON;
SET retour = (SELECT JSON_ARRAYAGG(JSON_OBJECT('equipeId',equipeId,'serie',serie,'genre',genre,'tournoiId',tournoiId,'nom1',nom1,'prenom1',prenom1,'nom2',nom2,'prenom2',prenom2,'j',j,'v',v,'d',d,'p',p,'totalPoints',totalPoints)) FROM equipes WHERE serie = _serie and genre = _genre and poule = _poule);
RETURN retour;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `jsonSerieGenrePoules` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` FUNCTION `jsonSerieGenrePoules`(_serie INT, _genre INT) RETURNS longtext CHARSET utf8mb4 COLLATE utf8mb4_bin
    READS SQL DATA
BEGIN
DECLARE retour JSON;

















RETURN retour;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `jsonSeries` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` FUNCTION `jsonSeries`() RETURNS longtext CHARSET utf8mb4 COLLATE utf8mb4_bin
    READS SQL DATA
BEGIN
DECLARE retour JSON;
SET retour = (SELECT JSON_ARRAYAGG(JSON_OBJECT('serieId',serieId,'intitule', CONCAT(UCASE(LEFT(intitule,1)), SUBSTRING(intitule,2)))) FROM series);
RETURN retour;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `planningVide_p` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` FUNCTION `planningVide_p`() RETURNS tinyint(4)
    READS SQL DATA
    DETERMINISTIC
BEGIN
DECLARE retour TINYINT(1) DEFAULT 1;
DECLARE nombre INT DEFAULT 0;
SET nombre = (SELECT count(*) FROM planning WHERE libre_p = 0);
IF nombre > 0 THEN
SET retour = 0;
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
/*!50003 DROP PROCEDURE IF EXISTS `booleenAjoutTournoiId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` PROCEDURE `booleenAjoutTournoiId`(_serie INT, _genre INT)
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

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `booleenAnnulationCreationPoule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` PROCEDURE `booleenAnnulationCreationPoule`(_serie INT, _genre INT, numeroPoule INT, id1 INT, id2 INT, id3 INT, id4 INT)
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
/*!50003 DROP PROCEDURE IF EXISTS `booleenCreationPoule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` PROCEDURE `booleenCreationPoule`(_serie INT, _genre INT, numeroPoule INT, id1 INT, id2 INT, id3 INT, id4 INT)
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
/*!50003 DROP PROCEDURE IF EXISTS `boolRegularisationParticipation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` PROCEDURE `boolRegularisationParticipation`(_equipeId INT)
BEGIN
DECLARE retour TINYINT(1) DEFAULT 0;
DECLARE nombre INT;

UPDATE equipes SET paf_p = 1 WHERE equipeId = _equipeId;
SELECT COUNT(*) INTO nombre FROM equipes WHERE equipeId = _equipeId AND paf_p = 1;

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
/*!50003 DROP PROCEDURE IF EXISTS `constitutionPoules` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` PROCEDURE `constitutionPoules`(IN chaine VARCHAR(255))
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


IF @_poule REGEXP '^[\d]+$' AND @_equipeId REGEXP '^[\d]+$' THEN
EXECUTE requete USING @_poule, @_equipeId;
END IF;

END WHILE;

DEALLOCATE PREPARE requete;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `constitutionPoulesAttributionPouleId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`claude`@`localhost` PROCEDURE `constitutionPoulesAttributionPouleId`(IN chaine LONGTEXT)
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


WHILE CHAR_LENGTH(@partie2) > 0 DO
SET @morceau = SUBSTRING_INDEX(@partie2, @virgule, 1);
SET @partie2 = SUBSTRING(@partie2, CHAR_LENGTH(@morceau) + CHAR_LENGTH(@virgule) + 1);
SET @_poule = SUBSTRING_INDEX(@morceau, @deuxPoints, 1);
SET @_equipeId = SUBSTRING_INDEX(@morceau, @deuxPoints, -1);

EXECUTE requete USING @_poule, @_equipeId;
END WHILE;



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


END IF;

DEALLOCATE PREPARE requete;
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

-- Dump completed on 2023-05-30  0:43:36
