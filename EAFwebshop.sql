-- MySQL dump 10.13  Distrib 5.7.20, for Win64 (x86_64)
--
-- Host: localhost    Database: webshop
-- ------------------------------------------------------
-- Server version	5.7.20-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `webshop`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `webshop` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `webshop`;

--
-- Table structure for table `artikelen`
--

DROP TABLE IF EXISTS `artikelen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artikelen` (
  `artikelnr` int(6) NOT NULL AUTO_INCREMENT,
  `categorieID` int(2) DEFAULT NULL,
  `productnaam` varchar(40) DEFAULT NULL,
  `productomschrijving` text,
  `prijs` double(9,2) DEFAULT NULL,
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
INSERT INTO `artikelen` VALUES (201,1,'biologisch droogvoer honden','biologische hondenbrokken gemaakt van...',5.00),(202,1,'biologisch natvoer honden','biologisch natvoer ideaal voor actieve...',2.50),(203,2,'biologisch kattenvoer, voor de huid','holistische kattenbrokjes voor de huid',3.00),(204,2,'biologisch kattenvoer, voor de vacht','holistische kattenbrokjes voor de vacht',2.00),(205,3,'biologisch konijnvoer','speciale groentebrokjes',4.00),(206,3,'biologisch konijnvoer','zachte groentebrokjes',1.00),(207,1,'Dieet pillen -honden','Voor honden met overgewicht min. 1 tablet per dag',15.95),(208,4,'gedroogd plankton','Deze gedroogde plankton is een natuurlijk vissig product...',1.25),(209,5,'Hammy de hamsterbal','Deze hamsterbal heeft een groene doorzichtige kleur en een  diameter van 14cm',13.50);
/*!40000 ALTER TABLE `artikelen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bericht`
--

DROP TABLE IF EXISTS `bericht`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `bericht` VALUES (1,'Nu ook accessoires voor kleine knaagdieren!','Houdt U ook zo van kleine knaagdieren, bekijk ons assortiment','2019-05-25 19:18:14'),(2,'Wij verkopen nu ook vissenvoer!','Bent U ook zo\'n liefhebber van vissen?, kijk dan nu snel in ons nieuwe vissenvoer assortiment voor de beste deals!','2019-05-25 19:25:59');
/*!40000 ALTER TABLE `bericht` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `besteld`
--

DROP TABLE IF EXISTS `besteld`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `besteld` (
  `artikelnr` int(6) DEFAULT NULL,
  `bestelnr` int(6) DEFAULT NULL,
  `aantal` int(3) DEFAULT NULL,
  `prijsaantal` double(9,2) DEFAULT NULL,
  KEY `artikelnr` (`artikelnr`),
  KEY `bestelnr` (`bestelnr`),
  CONSTRAINT `besteld_ibfk_1` FOREIGN KEY (`artikelnr`) REFERENCES `artikelen` (`artikelnr`),
  CONSTRAINT `besteld_ibfk_2` FOREIGN KEY (`bestelnr`) REFERENCES `bestellingen` (`bestelnr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `besteld`
--

LOCK TABLES `besteld` WRITE;
/*!40000 ALTER TABLE `besteld` DISABLE KEYS */;
INSERT INTO `besteld` VALUES (203,5,4,12.00),(206,5,13,13.00),(202,5,9,22.50),(205,6,3,12.00),(206,6,6,6.00),(207,6,12,191.40),(202,10,20,50.00),(201,11,15,75.00),(207,11,10,159.50),(203,11,25,75.00),(206,11,12,12.00),(208,11,40,50.00);
/*!40000 ALTER TABLE `besteld` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bestellingen`
--

DROP TABLE IF EXISTS `bestellingen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bestellingen` (
  `bestelnr` int(8) NOT NULL AUTO_INCREMENT,
  `klantnr` int(6) NOT NULL,
  `besteldatum` date DEFAULT NULL,
  `totaalbedrag` double(9,2) DEFAULT NULL,
  PRIMARY KEY (`bestelnr`),
  KEY `FKBestelling485904` (`klantnr`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bestellingen`
--

LOCK TABLES `bestellingen` WRITE;
/*!40000 ALTER TABLE `bestellingen` DISABLE KEYS */;
INSERT INTO `bestellingen` VALUES (1,5,'2016-06-17',22.41),(2,1,'2015-09-24',79.83),(3,1,'2017-11-17',21.70),(5,3,'2019-02-02',47.50),(6,4,'2019-02-02',209.40),(9,3,'2019-02-02',0.00),(10,4,'2019-02-04',50.00),(11,3,'2019-02-04',371.50);
/*!40000 ALTER TABLE `bestellingen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `categorie` VALUES (1,'het beste voor uw hond...','hond.jpg','hondenvoer'),(2,'het beste voor uw kat...','kat.jpg','kattenvoer'),(3,'het beste voor uw konijn...','konijn.jpg','konijnenvoer'),(4,'Het beste voor uw vissen...','vissen.jpg','vissenvoer'),(5,'De beste voeding voor kleine knaagdieren...','hamster.jpg','knaagdieren');
/*!40000 ALTER TABLE `categorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnose`
--

DROP TABLE IF EXISTS `diagnose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diagnose` (
  `begin_datum` date DEFAULT NULL,
  `eind_datum` date DEFAULT NULL,
  `totaalbedrag` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnose`
--

LOCK TABLES `diagnose` WRITE;
/*!40000 ALTER TABLE `diagnose` DISABLE KEYS */;
INSERT INTO `diagnose` VALUES ('2017-12-01','2018-01-01',94.26),('2017-11-01','2017-12-01',NULL),('2017-10-01','2017-11-01',75.6),('2017-09-01','2017-10-01',68.55),('2017-08-01','2017-09-01',123.8),('2017-07-01','2017-08-01',59.11),('2017-06-01','2017-07-01',88.45),('2017-05-01','2017-06-01',82.28),('2017-04-01','2017-05-01',126.95),('2017-03-01','2017-04-01',NULL),('2017-02-01','2017-03-01',98.71),('2017-01-01','2017-02-01',131.49);
/*!40000 ALTER TABLE `diagnose` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `klanten`
--

DROP TABLE IF EXISTS `klanten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `klanten` (
  `klantnr` int(6) NOT NULL AUTO_INCREMENT,
  `gebruikersnaam` varchar(30) DEFAULT NULL,
  `wachtwoord` char(64) DEFAULT NULL,
  `voornaam` varchar(30) DEFAULT NULL,
  `achternaam` varchar(30) DEFAULT NULL,
  `geslacht` char(3) DEFAULT NULL,
  `straatnaam` varchar(30) DEFAULT NULL,
  `huisnummer` char(4) DEFAULT NULL,
  `postcode` char(6) DEFAULT NULL,
  `woonplaats` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`klantnr`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klanten`
--

LOCK TABLES `klanten` WRITE;
/*!40000 ALTER TABLE `klanten` DISABLE KEYS */;
INSERT INTO `klanten` VALUES (1,'f.bode@gmail.com','123456','Freek','Bode','m','laan','23','1011AD','Amsterdam'),(2,'jo.broek@gmail.com','654321','Josje','Broek','v','weg','48','8608DE','Sneek'),(3,'f.buiten@gmail.com','121212','Frans','Buiten','m','straat','217','9017EL','Groningen'),(4,'jvt@gmail.com','fiefiehond','Sjannie','van Theike','v','Poppebloemstraat','2A','4711KZ','st. Willebrord'),(5,'bbaap@gmail.com','steen65','Bullek','Badaap','m','viezevlekkensteeg','13E','4701AA','Tullepetoanstad');
/*!40000 ALTER TABLE `klanten` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'webshop'
--
/*!50003 DROP PROCEDURE IF EXISTS `create_bericht` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_bericht`(IN onderwerp VARCHAR(100), IN inhoud TEXT)
BEGIN

SET @onderwerp = onderwerp;
SET @inhoud = inhoud;
SET @datum = (SELECT CURDATE());
SET @time = (SELECT CURTIME());

SET @datumtijd = CONCAT(@datum, " ", @time);

SET @bericht_query = CONCAT("INSERT INTO bericht (onderwerp, inhoud ,datum) VALUES(?,?,?)");
PREPARE stmt FROM @bericht_query;
EXECUTE stmt USING @onderwerp, @inhoud, @datumtijd;
DEALLOCATE PREPARE stmt;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `gen_bestellingen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `gen_bestellingen`(IN aantal_records INT(3))
BEGIN

SET @counter = 0;
SET @max_klantnr = (SELECT MAX(klantnr) FROM klanten);

WHILE(@counter < aantal_records) DO

SET @rand_klantnr = (SELECT(CEIL(RAND()*@max_klantnr-1)+1));
SET @rand_date = (SELECT DATE_FORMAT(FROM_UNIXTIME(UNIX_TIMESTAMP('2015-01-01') + FLOOR(0 + (RAND() * (4*365*24*3600)))), '%Y-%m-%d'));
SET @rand_totaal = (SELECT(FORMAT((SELECT RAND() * (100 - 20) + 20),2)));

SET @counter = @counter + 1;
INSERT INTO bestellingen(klantnr, besteldatum, totaalbedrag) VALUES(@rand_klantnr, @rand_date, @rand_totaal);

END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `list_artikelen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `list_artikelen`(IN product_cat_naam VARCHAR(30))
BEGIN
SET @product_cat_naam = product_cat_naam;
SET @laden_assortiment_query = CONCAT("SELECT a.artikelnr, a.productnaam, a.prijs FROM artikelen a, categorie c WHERE c.categorieID = a.categorieID AND c.naam = ?");
PREPARE stmt FROM @laden_assortiment_query;
EXECUTE stmt USING @product_cat_naam;
DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `list_bericht` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `list_bericht`()
BEGIN
SELECT * FROM bericht;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `list_categorie` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `list_categorie`()
BEGIN
SELECT categorieID, naam FROM categorie;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `maak_diagnose_pm` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `maak_diagnose_pm`(IN datum1 DATE, IN datum2 DATE)
BEGIN
CREATE TABLE diagnose (begin_datum DATE, eind_datum DATE, totaalbedrag FLOAT);
SET @datum = datum2;

WHILE(@datum > datum1) DO

SET @datum_ervoor = (SELECT DATE_SUB((SELECT @datum),INTERVAL 1 MONTH));

SET @interval_totaalbedrag_query = CONCAT("SELECT(FORMAT(SUM(totaalbedrag),2)) INTO @interval_totaalbedrag FROM bestellingen WHERE besteldatum >= ? AND besteldatum <= ?");
PREPARE stmt2 FROM @interval_totaalbedrag_query;
EXECUTE stmt2 USING @datum_ervoor, @datum;
DEALLOCATE PREPARE stmt2;

SET @insert_diagnose = CONCAT("INSERT INTO diagnose (begin_datum, eind_datum, totaalbedrag) VALUES(?,?,?)");
PREPARE stmt3 FROM @insert_diagnose;
EXECUTE stmt3 USING @datum_ervoor, @datum, @interval_totaalbedrag;
DEALLOCATE PREPARE stmt3;

SET @datum = @datum_ervoor;

END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `nieuwe_bestelling` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `nieuwe_bestelling`(IN klantnr INT(6), OUT bestelnr_out INT(6))
BEGIN

SET @klantnr = klantnr;
SET @datum_vandaag = (SELECT CURDATE());

SET @nieuwe_bestelling = CONCAT("INSERT INTO bestellingen (klantnr, besteldatum, totaalbedrag) VALUES (?,?,0)");
PREPARE stmt FROM @nieuwe_bestelling;
EXECUTE stmt USING @klantnr, @datum_vandaag;
DEALLOCATE PREPARE stmt;

SET @bestelnummer_query = CONCAT("SELECT MAX(bestelnr) INTO @bestelnr_out FROM bestellingen");
PREPARE stmt2 FROM @bestelnummer_query;
EXECUTE stmt2;
SET bestelnr_out := @bestelnr_out;
DEALLOCATE PREPARE stmt2;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `opvragen_bestellingen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `opvragen_bestellingen`(IN datum DATE)
BEGIN
SET @datum = datum;
SET @query = CONCAT("SELECT b.besteldatum, b.bestelnr, b.klantnr, b.totaalbedrag, k.straatnaam, k.huisnummer, k.postcode, k.woonplaats FROM bestellingen b, klanten k WHERE b.besteldatum = ? AND b.klantnr = k.klantnr");
PREPARE stmt FROM @query;
execute stmt USING @datum;
deallocate prepare stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `toevoegen_categorie` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `toevoegen_categorie`(IN cat_omschrijving TEXT, IN cat_afbeelding VARCHAR(20))
BEGIN

SET @cat_omschrijving = cat_omschrijving;
SET @cat_afbeelding = cat_afbeelding;

SET @insert_categorie = CONCAT("INSERT INTO categorie (omschrijving, afbeelding) VALUES(?,?)");
PREPARE stmt FROM @insert_categorie;
EXECUTE stmt USING @cat_omschrijving, @cat_afbeelding; 
DEALLOCATE PREPARE stmt;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `toevoegen_producten` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `toevoegen_producten`(IN productnaam VARCHAR(40), IN omschrijving TEXT, IN prijs DOUBLE(9,2), IN categorieID INT(2))
BEGIN

SET @productnaam = productnaam;
SET @omschrijving = omschrijving;
SET @prijs = prijs;
SET @categorieID = categorieID;

SET @insert_query = CONCAT("INSERT INTO artikelen (productnaam, productomschrijving, prijs, categorieID) values(?,?,?,?)");
PREPARE stmt FROM @insert_query;
EXECUTE stmt USING @productnaam, @omschrijving, @prijs, @categorieID;
DEALLOCATE PREPARE stmt;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_bestelling` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_bestelling`(IN artikelnr INT(6), IN aantal INT(3), IN bestelnr INT(6), IN klantnr INT(6))
BEGIN

SET @artikelnr = artikelnr;
SET @aantal = aantal;
SET @bestelnr = bestelnr;
SET @klantnr = klantnr;

SET @prijs_query = CONCAT("SELECT prijs INTO @prijs FROM artikelen WHERE artikelnr = ?");
prepare stmt from @prijs_query;
execute stmt using @artikelnr;
deallocate prepare stmt;

set @prijsaantal = (@prijs * @aantal);

set @insert_besteld_query = CONCAT("INSERT INTO besteld (artikelnr, bestelnr, aantal, prijsaantal) VALUES (?,?,?,?)");
prepare stmt2 from @insert_besteld_query;
execute stmt2 using @artikelnr, @bestelnr, @aantal, @prijsaantal;
deallocate prepare stmt2;

set @totaalbedrag_query = CONCAT("SELECT(FORMAT(SUM(prijsaantal),2)) INTO @totaalbedrag FROM besteld WHERE bestelnr = ?");
prepare stmt3 from @totaalbedrag_query;
execute stmt3 using @bestelnr;
deallocate prepare stmt3;

set @update_bestelling_query = CONCAT("UPDATE bestellingen SET totaalbedrag = ? WHERE bestelnr = ? AND klantnr = ?");
prepare stmt4 from @update_bestelling_query;
execute stmt4 using @totaalbedrag, @bestelnr, @klantnr;
deallocate prepare stmt4;

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

-- Dump completed on 2019-05-28 18:40:14
