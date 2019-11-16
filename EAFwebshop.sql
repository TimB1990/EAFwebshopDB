-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: eafwebshop
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bericht` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `onderwerp` varchar(100) DEFAULT NULL,
  `inhoud` varchar(400) DEFAULT NULL,
  `datum` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bericht`
--

LOCK TABLES `bericht` WRITE;
/*!40000 ALTER TABLE `bericht` DISABLE KEYS */;
INSERT INTO `bericht` VALUES (1,'Nu ook accessoires voor kleine knaagdieren!','Houdt U ook zo van kleine knaagdieren, bekijk ons assortiment','2019-05-25 19:18:14'),(3,'Nu sinterklaas korting','houdt jou diertje ook zo van sinterklaas, profiteer dan nu van wel 10% korting!!','2019-11-16 20:46:55');
/*!40000 ALTER TABLE `bericht` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `besteld`
--

DROP TABLE IF EXISTS `besteld`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
INSERT INTO `besteld` VALUES (203,1,2,300,600,5.46,9,0.54,0.00,6.00),(209,2,1,100,100,10.66,21,0.00,2.84,13.50),(201,2,3,2000,6000,13.65,9,1.35,0.00,15.00);
/*!40000 ALTER TABLE `besteld` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bestellingen`
--

DROP TABLE IF EXISTS `bestellingen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
INSERT INTO `bestellingen` VALUES (1,2,'2019-07-24',2,5.46,0.54,0.00,6.00,0.60,1,8.41,14.41,'In behandeling'),(2,2,'2019-11-16',4,24.31,1.35,2.84,28.50,6.10,1,8.41,36.91,'In behandeling');
/*!40000 ALTER TABLE `bestellingen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klanten`
--

LOCK TABLES `klanten` WRITE;
/*!40000 ALTER TABLE `klanten` DISABLE KEYS */;
INSERT INTO `klanten` VALUES (2,'p.boven@mail.com','131313','Peter','Boven','M','weg','146A','1100BB','Polder');
/*!40000 ALTER TABLE `klanten` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'eafwebshop'
--
/*!50003 DROP PROCEDURE IF EXISTS `check_existing_email` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_existing_email`(IN gebruikersnaam VARCHAR(100))
BEGIN

SET @gebruikersnaam = gebruikersnaam;

SET @query = CONCAT("SELECT gebruikersnaam FROM klanten WHERE gebruikersnaam = ?");
PREPARE stmt FROM @query;
EXECUTE stmt USING @gebruikersnaam;
DEALLOCATE PREPARE stmt;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_bericht` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_bericht`(IN onderwerp VARCHAR(100), IN inhoud TEXT)
BEGIN
SET @onderwerp = onderwerp;
SET @inhoud = inhoud;
SET @datum = (SELECT TIMESTAMP(curtime()));
SET @bericht_query = CONCAT("INSERT INTO bericht (onderwerp, inhoud ,datum) VALUES(?,?,?)");
PREPARE stmt FROM @bericht_query;
EXECUTE stmt USING @onderwerp, @inhoud, @datum;
DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_besteld` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_besteld`(artikelnr int(6), aantal int(3), bestelnr INT(6))
BEGIN
SET @artikelnr = artikelnr;
SET @aantal = aantal;
SET @bestelnr = bestelnr;

SET @prijsquery = CONCAT("SELECT prijs INTO @prijs FROM artikelen WHERE artikelnr = ?");
PREPARE stmt FROM @prijsquery;
EXECUTE stmt USING @artikelnr;
DEALLOCATE PREPARE stmt;

SET @stukgewichtquery = CONCAT("SELECT gewicht INTO @stukgewicht FROM artikelen WHERE artikelnr = ?");
PREPARE stmt1 FROM @stukgewichtquery;
EXECUTE stmt1 USING @artikelnr;
DEALLOCATE PREPARE stmt1;

SET @btwquery = CONCAT("SELECT btw INTO @btw FROM artikelen WHERE artikelnr = ?");
PREPARE stmt2 FROM @btwquery;
EXECUTE stmt2 USING @artikelnr;
DEALLOCATE PREPARE stmt2;

IF @btw = 9 THEN 
    SET @btw9 = (@prijs * 0.09) * @aantal;
    SET @btw21 = 0;
ELSEIF @btw = 21 THEN
    SET @btw9 = 0;
    SET @btw21 = (@prijs * 0.21) * @aantal;
END IF;

SET @totaalgewicht = @stukgewicht * @aantal;
SET @bedragIncBtw = @prijs * @aantal;
SET @bedragExBtw = @bedragIncBtw - @btw9 - @btw21;

SET @insertquery = CONCAT("INSERT INTO besteld VALUES(?,?,?,?,?,?,?,?,?,?)");
PREPARE stmt3 FROM @insertquery;
EXECUTE stmt3 USING @artikelnr, @bestelnr, @aantal, @stukgewicht, @totaalgewicht, @bedragExBtw, @btw, @btw9, @btw21, @bedragIncBtw;
DEALLOCATE PREPARE stmt3;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_bestelling` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_bestelling`(bestelnr INT(6), klantnr INT(6))
BEGIN

SET @bestelnr = bestelnr;
SET @klantnr = klantnr;

SET @dateQuery = CONCAT("SELECT CURDATE() INTO @besteldatum");
PREPARE dstmt FROM @dateQuery;
EXECUTE dstmt;
DEALLOCATE PREPARE dstmt;

SET @aantalQuery = CONCAT("SELECT SUM(aantal) INTO @artikelen FROM besteld GROUP BY bestelnr HAVING bestelnr = ?");
PREPARE stmt FROM @aantalQuery;
EXECUTE stmt USING @bestelnr;
DEALLOCATE PREPARE stmt;

SET @prijsaantalQuery = CONCAT("SELECT SUM(bedragIncBtw) INTO @totaalbedragIncBtw FROM besteld GROUP BY bestelnr HAVING bestelnr = ?");
PREPARE stmt1 FROM @prijsaantalQuery;
EXECUTE stmt1 USING @bestelnr;
DEALLOCATE PREPARE stmt1;

SET @bedragExBtwQuery = CONCAT("SELECT SUM(bedragExBtw) INTO @totaalbedragExBtw FROM besteld GROUP BY bestelnr HAVING bestelnr = ?");
PREPARE stmt2 FROM @bedragExBtwQuery;
EXECUTE stmt2 USING @bestelnr;
DEALLOCATE PREPARE stmt2;

SET @btw9Query = CONCAT("SELECT SUM(btw9) INTO @btw9 FROM besteld GROUP BY bestelnr HAVING bestelnr = ?");
PREPARE stmt3 FROM @btw9Query;
EXECUTE stmt3 USING @bestelnr;
DEALLOCATE PREPARE stmt3;

SET @btw21Query = CONCAT("SELECT SUM(btw21) INTO @btw21 FROM besteld GROUP BY bestelnr HAVING bestelnr = ?");
PREPARE stmt4 FROM @btw21Query;
EXECUTE stmt4 USING @bestelnr;
DEALLOCATE PREPARE stmt4;


SET @ordergewichtQuery = CONCAT("SELECT SUM(totaalgewicht) / 1000 INTO @ordergewicht FROM besteld GROUP BY bestelnr HAVING bestelnr = ?");
PREPARE stmt5 FROM @ordergewichtQuery;
EXECUTE stmt5 USING @bestelnr;
DEALLOCATE PREPARE stmt5;

SET @aantalpaketten = 1;
IF @ordergewicht > 20 THEN

    SELECT CEIL(@ordergewicht / 20) INTO @aantalpaketten;

    SET @verzendkosten = @aantalpaketten * (12.20*1.21);
    SET @restpakketgewicht = @ordergewicht % 20;
    IF @restpakketgewicht > 0 AND @restpakketgewicht < 10 THEN
        SET @verzendkosten = @verzendkosten + (6.95 * 1.21);
        ELSE SET @verzendkosten = @verzendkosten + (12.20 * 1.21);
    END IF;
ELSE SET @verzendkosten = 6.95 * 1.21;
END IF;

SET @totaalIncVerzendkosten = @totaalbedragExBtw + @btw9 + @btw21 + @verzendkosten;
SET @orderstatus = CONCAT('In behandeling');

SET @insertBestellingQuery = CONCAT("INSERT INTO bestellingen VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)");
PREPARE stmt6 FROM @insertBestellingQuery;
EXECUTE stmt6 USING @bestelnr, @klantnr, @besteldatum, @artikelen, @totaalbedragExBtw, @btw9, @btw21, @totaalbedragIncBtw, @ordergewicht, @aantalpaketten, @verzendkosten, @totaalIncVerzendkosten, @orderstatus;
DEALLOCATE PREPARE stmt6;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_bestelnr` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_bestelnr`()
BEGIN
SELECT MAX(bestelnr) + 1 AS bestelnr FROM besteld;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_contactformulier` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_contactformulier`(IN naam VARCHAR(30), IN email VARCHAR(100), IN onderwerp VARCHAR(60), IN bericht TEXT)
BEGIN

SET @naam = naam;
SET @email = email;
SET @onderwerp = onderwerp;
SET @bericht = bericht;

SET @dateQuery = CONCAT("SELECT CURDATE() INTO @datum");
PREPARE dstmt FROM @dateQuery;
EXECUTE dstmt;
DEALLOCATE PREPARE dstmt;

SET @query = CONCAT("INSERT INTO contactform (datum, naam, email, onderwerp, bericht) VALUES (?,?,?,?,?)");
PREPARE stmt FROM @query;
EXECUTE stmt USING @datum, @naam, @email, @onderwerp, @bericht;
DEALLOCATE PREPARE stmt;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_klant` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_klant`(IN gebruikersnaam VARCHAR(100), IN wachtwoord CHAR(64), IN voornaam VARCHAR(30), IN achternaam VARCHAR(30), IN geslacht CHAR(3), IN straatnaam VARCHAR(30), IN huisnummer CHAR(4), IN postcode CHAR(6), IN woonplaats VARCHAR(30))
BEGIN

SET @gebruikersnaam = gebruikersnaam;
SET @wachtwoord = wachtwoord;
SET @voornaam = voornaam;
SET @achternaam = achternaam;
SET @geslacht = geslacht;
SET @straatnaam = straatnaam;
SET @huisnummer = huisnummer;
SET @postcode = postcode;
SET @woonplaats = woonplaats;

SET @query = CONCAT("INSERT INTO klanten (gebruikersnaam, wachtwoord, voornaam, achternaam, geslacht, straatnaam, huisnummer, postcode, woonplaats) VALUES(?,?,?,?,?,?,?,?,?)");
PREPARE stmt FROM @query;
EXECUTE stmt USING @gebruikersnaam, @wachtwoord, @voornaam, @achternaam, @geslacht, @straatnaam, @huisnummer, @postcode, @woonplaats;
DEALLOCATE PREPARE stmt;

SET @createuser = CONCAT("CREATE USER '",@gebruikersnaam,"'@'localhost' IDENTIFIED BY '", @wachtwoord,"'");
PREPARE stmt1 FROM @createuser;
EXECUTE stmt1;
DEALLOCATE PREPARE stmt1;

SET @grant1 = CONCAT("GRANT EXECUTE ON PROCEDURE read_artikel TO '",@gebruikersnaam,"'@'localhost'");
PREPARE gstmt1 FROM @grant1;
EXECUTE gstmt1;
DEALLOCATE PREPARE gstmt1;

SET @grant2 = CONCAT("GRANT EXECUTE ON PROCEDURE read_categorie TO '",@gebruikersnaam,"'@'localhost'");
PREPARE gstmt2 FROM @grant2;
EXECUTE gstmt2;
DEALLOCATE PREPARE gstmt2;

SET @grant3 = CONCAT("GRANT EXECUTE ON PROCEDURE read_profiel TO '",@gebruikersnaam,"'@'localhost'");
PREPARE gstmt3 FROM @grant3;
EXECUTE gstmt3;
DEALLOCATE PREPARE gstmt3;

SET @grant4 = CONCAT("GRANT EXECUTE ON PROCEDURE list_artikelen TO '",@gebruikersnaam,"'@'localhost'");
PREPARE gstmt4 FROM @grant4;
EXECUTE gstmt4;
DEALLOCATE PREPARE gstmt4;

SET @grant5 = CONCAT("GRANT EXECUTE ON PROCEDURE list_bericht TO '",@gebruikersnaam,"'@'localhost'");
PREPARE gstmt5 FROM @grant5;
EXECUTE gstmt5;
DEALLOCATE PREPARE gstmt5;

SET @grant6 = CONCAT("GRANT EXECUTE ON PROCEDURE list_categorie TO '",@gebruikersnaam,"'@'localhost'");
PREPARE gstmt6 FROM @grant6;
EXECUTE gstmt6;
DEALLOCATE PREPARE gstmt6;

SET @grant7 = CONCAT("GRANT EXECUTE ON PROCEDURE create_contactformulier TO '",@gebruikersnaam,"'@'localhost'");
PREPARE gstmt7 FROM @grant7;
EXECUTE gstmt7;
DEALLOCATE PREPARE gstmt7;

SET @grant8 = CONCAT("GRANT EXECUTE ON PROCEDURE create_bestelnr TO '",@gebruikersnaam,"'@'localhost'");
PREPARE gstmt8 FROM @grant8;
EXECUTE gstmt8;
DEALLOCATE PREPARE gstmt8;

SET @grant9 = CONCAT("GRANT EXECUTE ON PROCEDURE create_besteld TO '",@gebruikersnaam,"'@'localhost'");
PREPARE gstmt9 FROM @grant9;
EXECUTE gstmt9;
DEALLOCATE PREPARE gstmt9;

SET @grant10 = CONCAT("GRANT EXECUTE ON PROCEDURE create_bestelling TO '",@gebruikersnaam,"'@'localhost'");
PREPARE gstmt10 FROM @grant9;
EXECUTE gstmt10;
DEALLOCATE PREPARE gstmt10;

SET @grant11 = CONCAT("GRANT EXECUTE ON PROCEDURE read_bestelling TO '",@gebruikersnaam,"'@'localhost'");
PREPARE gstmt11 FROM @grant11;
EXECUTE gstmt11;
DEALLOCATE PREPARE gstmt11;

SET @grant12 = CONCAT("GRANT EXECUTE ON PROCEDURE list_klant_bestelling TO '",@gebruikersnaam,"'@'localhost'");
PREPARE gstmt12 FROM @grant12;
EXECUTE gstmt12;
DEALLOCATE PREPARE gstmt12;

SET @grant13 = CONCAT("GRANT EXECUTE ON PROCEDURE check_existing_email TO '",@gebruikersnaam,"'@'localhost'");
PREPARE gstmt13 FROM @grant13;
EXECUTE gstmt13;
DEALLOCATE PREPARE gstmt13;

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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `list_artikelen`(IN product_cat_naam VARCHAR(30))
BEGIN
SET @product_cat_naam = product_cat_naam;
SET @laden_assortiment_query = CONCAT("SELECT a.artikelnr, a.productnaam, a.prijs, a.gewicht FROM artikelen a, categorie c WHERE c.categorieID = a.categorieID AND c.naam = ?");
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 DROP PROCEDURE IF EXISTS `list_klant_bestelling` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `list_klant_bestelling`(IN klantnr INT(6))
BEGIN
SET @klantnr = klantnr;
SET @query = CONCAT("SELECT bestelnr, besteldatum, totaalbedragIncBtw, orderstatus FROM bestellingen WHERE klantnr = ?");
PREPARE stmt FROM @query;
EXECUTE stmt USING @klantnr;
DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `read_artikel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `read_artikel`(IN artikelnr INT(4))
BEGIN
SET @artikelnr = artikelnr;
SET @artikel_query = CONCAT("SELECT * FROM artikelen WHERE artikelnr = ?");
PREPARE stmt FROM @artikel_query;
EXECUTE stmt USING @artikelnr;
DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `read_bestelling` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `read_bestelling`(IN bestelnr INT(8))
BEGIN
SET @bestelnr = bestelnr;
SET @query = CONCAT("SELECT a.artikelnr, a.productnaam, a.prijs, b.aantal, a.gewicht, b.aantal*a.gewicht AS totaalgewicht, a.BTW, ROUND(b.aantal*a.prijs*(1-(a.BTW/100)),2) AS bedragExBTW , b.aantal*a.prijs AS bedrag FROM artikelen a, besteld b  WHERE a.artikelnr = b.artikelnr AND b.bestelnr = ?");
PREPARE stmt FROM @query;
EXECUTE stmt USING @bestelnr;
DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `read_categorie` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `read_categorie`(IN categorieNaam VARCHAR(30))
BEGIN
SET @categorieNaam = categorieNaam;
SET @categorie_query = CONCAT("SELECT * FROM categorie WHERE naam = ?");
PREPARE stmt FROM @categorie_query;
EXECUTE stmt USING @categorieNaam;
DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `read_profiel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `read_profiel`(IN gebruikersnaam VARCHAR(30), IN wachtwoord CHAR(64))
BEGIN
SET @gebruikersnaam = gebruikersnaam;
SET @wachtwoord = wachtwoord;
SET @profiel_query = CONCAT("SELECT klantnr, gebruikersnaam, wachtwoord, voornaam, achternaam, straatnaam, huisnummer, postcode, woonplaats FROM klanten WHERE gebruikersnaam = ? AND wachtwoord = ?");
PREPARE stmt FROM @profiel_query;
EXECUTE stmt USING @gebruikersnaam, @wachtwoord;
DEALLOCATE prepare stmt;
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

-- Dump completed on 2019-11-16 20:56:15
