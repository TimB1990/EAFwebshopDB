-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: webshop
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `artikelen`
--

DROP TABLE IF EXISTS `artikelen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `artikelen` (
  `artikelnr` int(6) NOT NULL AUTO_INCREMENT,
  `categorieID` int(2) DEFAULT NULL,
  `productnaam` varchar(40) DEFAULT NULL,
  `productomschrijving` text,
  `prijs` double(9,2) DEFAULT NULL,
  `btw` int(2) DEFAULT NULL,
  `gewicht` int(6) DEFAULT NULL,
  PRIMARY KEY (`artikelnr`),
  KEY `FKArtikelen809682` (`categorieID`),
  CONSTRAINT `FKArtikelen809682` FOREIGN KEY (`categorieID`) REFERENCES `categorie` (`categorieID`)
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artikelen`
--

LOCK TABLES `artikelen` WRITE;
/*!40000 ALTER TABLE `artikelen` DISABLE KEYS */;
INSERT INTO `artikelen` VALUES (201,1,'biologisch droogvoer honden','biologische hondenbrokken gemaakt van...',5.00,9,2000),(202,1,'biologisch natvoer honden','biologisch natvoer ideaal voor actieve...',2.50,9,1500),(203,2,'biologisch kattenvoer, voor de huid','holistische kattenbrokjes voor de huid',3.00,9,300),(204,2,'biologisch kattenvoer, voor de vacht','holistische kattenbrokjes voor de vacht',2.00,9,300),(205,3,'biologisch konijnvoer','speciale groentebrokjes',4.00,9,1500),(206,3,'biologisch konijnvoer','zachte groentebrokjes',1.00,9,400),(207,1,'Dieet pillen -honden','Voor honden met overgewicht min. 1 tablet per dag',15.95,9,30),(209,5,'Hammy de hamsterbal','Deze hamsterbal heeft een groene doorzichtige kleur en een  diameter van 14cm',13.50,21,100);
/*!40000 ALTER TABLE `artikelen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bericht`
--

DROP TABLE IF EXISTS `bericht`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bericht` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `onderwerp` varchar(100) DEFAULT NULL,
  `inhoud` varchar(400) DEFAULT NULL,
  `datum` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bericht`
--

LOCK TABLES `bericht` WRITE;
/*!40000 ALTER TABLE `bericht` DISABLE KEYS */;
INSERT INTO `bericht` VALUES (1,'Nu ook accessoires voor kleine knaagdieren!','Houdt U ook zo van kleine knaagdieren, bekijk ons assortiment','2019-05-25 19:18:14');
/*!40000 ALTER TABLE `bericht` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `besteld`
--

DROP TABLE IF EXISTS `besteld`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `besteld` (
  `artikelnr` int(6) DEFAULT NULL,
  `bestelnr` int(6) DEFAULT NULL,
  `aantal` int(3) DEFAULT NULL,
  `stukgewicht` int(6) DEFAULT NULL,
  `totaalgewicht` int(8) DEFAULT NULL,
  `bedragExBtw` double(9,2) DEFAULT NULL,
  `btw` int(2) DEFAULT NULL,
  `btw9` double(9,2) DEFAULT NULL,
  `btw21` double(9,2) DEFAULT NULL,
  `bedragIncBtw` double(9,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `besteld`
--

LOCK TABLES `besteld` WRITE;
/*!40000 ALTER TABLE `besteld` DISABLE KEYS */;
INSERT INTO `besteld` VALUES (203,1,2,300,600,5.46,9,0.54,0.00,6.00);
/*!40000 ALTER TABLE `besteld` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bestellingen`
--

DROP TABLE IF EXISTS `bestellingen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bestellingen` (
  `bestelnr` int(6) DEFAULT NULL,
  `klantnr` int(6) DEFAULT NULL,
  `besteldatum` date DEFAULT NULL,
  `artikelen` int(3) DEFAULT NULL,
  `totaalbedragExBtw` double(9,2) DEFAULT NULL,
  `btw9` double(9,2) DEFAULT NULL,
  `btw21` double(9,2) DEFAULT NULL,
  `totaalbedragIncBtw` double(9,2) DEFAULT NULL,
  `ordergewicht` double(9,2) DEFAULT NULL,
  `aantalpaketten` int(3) DEFAULT NULL,
  `verzendkosten` double(9,2) DEFAULT NULL,
  `totaaIncVerzendkosten` double(9,2) DEFAULT NULL,
  `orderstatus` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bestellingen`
--

LOCK TABLES `bestellingen` WRITE;
/*!40000 ALTER TABLE `bestellingen` DISABLE KEYS */;
INSERT INTO `bestellingen` VALUES (1,2,'2019-07-24',2,5.46,0.54,0.00,6.00,0.60,1,8.41,14.41,'In behandeling');
/*!40000 ALTER TABLE `bestellingen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `categorie` (
  `categorieID` int(2) NOT NULL AUTO_INCREMENT,
  `omschrijving` text,
  `afbeelding` char(20) DEFAULT NULL,
  `naam` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`categorieID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorie`
--

LOCK TABLES `categorie` WRITE;
/*!40000 ALTER TABLE `categorie` DISABLE KEYS */;
INSERT INTO `categorie` VALUES (1,'Het beste voor uw hond, holistische en biologische dierenvoeding houden uw hond langer gezond en dragen bij aan een gebalanceerde en verantwoorde levensstijl.','hond.jpg','hondenvoer'),(2,'het beste voor uw kat...','kat.jpg','kattenvoer'),(3,'het beste voor uw konijn...','konijn.jpg','konijnenvoer'),(5,'De beste voeding voor kleine knaagdieren...','hamster.jpg','knaagdieren');
/*!40000 ALTER TABLE `categorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contactform`
--

DROP TABLE IF EXISTS `contactform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `contactform` (
  `contactid` int(4) NOT NULL AUTO_INCREMENT,
  `datum` date DEFAULT NULL,
  `naam` varchar(30) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `onderwerp` varchar(60) DEFAULT NULL,
  `bericht` text,
  PRIMARY KEY (`contactid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactform`
--

LOCK TABLES `contactform` WRITE;
/*!40000 ALTER TABLE `contactform` DISABLE KEYS */;
INSERT INTO `contactform` VALUES (1,'2019-07-13','Winny','winny@mail.com','Vraag','Hallo ik heb een vraag '),(2,'2019-07-13','Frans','f.bode@gmail.com','Test','Test test test ');
/*!40000 ALTER TABLE `contactform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `klanten`
--

DROP TABLE IF EXISTS `klanten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `klanten` (
  `klantnr` int(6) NOT NULL AUTO_INCREMENT,
  `gebruikersnaam` varchar(100) DEFAULT NULL,
  `wachtwoord` char(64) DEFAULT NULL,
  `voornaam` varchar(30) DEFAULT NULL,
  `achternaam` varchar(30) DEFAULT NULL,
  `geslacht` char(3) DEFAULT NULL,
  `straatnaam` varchar(30) DEFAULT NULL,
  `huisnummer` char(4) DEFAULT NULL,
  `postcode` char(6) DEFAULT NULL,
  `woonplaats` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`klantnr`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klanten`
--

LOCK TABLES `klanten` WRITE;
/*!40000 ALTER TABLE `klanten` DISABLE KEYS */;
INSERT INTO `klanten` VALUES (2,'p.boven@mail.com','131313','Peter','Boven','M','weg','146A','1100BB','Polder'),(3,'p.bovendonk@gmail.com','141414','Peter','Bovendonk','M','Straatweg','156A','4741AA','Hoeven');
/*!40000 ALTER TABLE `klanten` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-06 15:57:54
