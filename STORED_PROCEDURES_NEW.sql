--show procedure--
show create procedure read_bestelling;
--show stored procedures--
show procedure status where db = "webshop";
--rename stored procedure--
update mysql.proc set name = "create_categorie", specific_name="create_categorie" where db="webshop" AND name="toevoegen_categorie";
--show users
select user, host FROM mysql.user;
--delete users--
DROP USER beheer@localhost, bezoeker@localhost;


--berichten--
DELIMITER //
CREATE PROCEDURE create_bericht(IN onderwerp VARCHAR(100), IN inhoud TEXT)
BEGIN
SET @onderwerp = onderwerp;
SET @inhoud = inhoud;
SET @datum = (SELECT TIMESTAMP(curtime()));
SET @bericht_query = CONCAT("INSERT INTO bericht (onderwerp, inhoud ,datum) VALUES(?,?,?)");
PREPARE stmt FROM @bericht_query;
EXECUTE stmt USING @onderwerp, @inhoud, @datum;
DEALLOCATE PREPARE stmt;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE list_bericht()
BEGIN
SELECT * FROM bericht;
END //
DELIMITER ;

--artikelen--
DELIMITER //
CREATE PROCEDURE list_artikelen(IN product_cat_naam VARCHAR(30))
BEGIN
SET @product_cat_naam = product_cat_naam;
SET @laden_assortiment_query = CONCAT("SELECT a.artikelnr, a.productnaam, a.prijs, a.gewicht FROM artikelen a, categorie c WHERE c.categorieID = a.categorieID AND c.naam = ?");
PREPARE stmt FROM @laden_assortiment_query;
EXECUTE stmt USING @product_cat_naam;
DEALLOCATE PREPARE stmt;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE read_artikel(IN artikelnr INT(4))
BEGIN
SET @artikelnr = artikelnr;
SET @artikel_query = CONCAT("SELECT * FROM artikelen WHERE artikelnr = ?");
PREPARE stmt FROM @artikel_query;
EXECUTE stmt USING @artikelnr;
DEALLOCATE PREPARE stmt;
END //
DELIMITER ;

--categorie--
DELIMITER //
CREATE PROCEDURE read_categorie(IN categorieNaam VARCHAR(30))
BEGIN
SET @categorieNaam = categorieNaam;
SET @categorie_query = CONCAT("SELECT * FROM categorie WHERE naam = ?");
PREPARE stmt FROM @categorie_query;
EXECUTE stmt USING @categorieNaam;
DEALLOCATE PREPARE stmt;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE list_categorie()
BEGIN
SELECT categorieID, naam FROM categorie;
END //
DELIMITER ;

--profiel--
DROP PROCEDURE IF EXISTS read_profiel;
DELIMITER //
CREATE PROCEDURE read_profiel (IN gebruikersnaam VARCHAR(30), IN wachtwoord CHAR(64))
BEGIN
SET @gebruikersnaam = gebruikersnaam;
SET @wachtwoord = wachtwoord;
SET @profiel_query = CONCAT("SELECT klantnr, gebruikersnaam, wachtwoord, voornaam, achternaam, straatnaam, huisnummer, postcode, woonplaats FROM klanten WHERE gebruikersnaam = ? AND wachtwoord = ?");
PREPARE stmt FROM @profiel_query;
EXECUTE stmt USING @gebruikersnaam, @wachtwoord;
DEALLOCATE prepare stmt;
END //
DELIMITER ;

--bestellingen--
DELIMITER //
CREATE PROCEDURE list_klant_bestelling (IN klantnr INT(6))
BEGIN
SET @klantnr = klantnr;
SET @query = CONCAT("SELECT bestelnr, besteldatum, totaalbedragIncBtw, orderstatus FROM bestellingen WHERE klantnr = ?");
PREPARE stmt FROM @query;
EXECUTE stmt USING @klantnr;
DEALLOCATE PREPARE stmt;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE read_bestelling (IN bestelnr INT(8))
BEGIN
SET @bestelnr = bestelnr;
SET @query = CONCAT("SELECT a.artikelnr, a.productnaam, a.prijs, b.aantal, a.gewicht, b.aantal*a.gewicht AS totaalgewicht, a.BTW, ROUND(b.aantal*a.prijs*(1-(a.BTW/100)),2) AS bedragExBTW , b.aantal*a.prijs AS bedrag FROM artikelen a, besteld b  WHERE a.artikelnr = b.artikelnr AND b.bestelnr = ?");
PREPARE stmt FROM @query;
EXECUTE stmt USING @bestelnr;
DEALLOCATE PREPARE stmt;
END //
DELIMITER ;

---------------------
--create_bestelling--
---------------------
DELIMITER //
DROP PROCEDURE IF EXISTS create_bestelling_line
CREATE PROCEDURE create_bestelling(artikelnr INT(6), aantal INT(3))
BEGIN
SET @artikelnr = artikelnr;
SET @aantal = aantal;
SET @query = CONCAT("SELECT a.artikelnr, a.productnaam, a.prijs,",@aantal," AS aantal, a.gewicht, ",@aantal," * a.gewicht AS totaalgewicht, a.btw, ROUND(",@aantal,"*a.prijs * (1-(a.btw/100)),2) AS bedragExBTW, ",@aantal," * a.prijs AS bedrag FROM artikelen a WHERE a.artikelnr = ?");
PREPARE stmt FROM @query;
EXECUTE stmt USING @artikelnr;
DEALLOCATE PREPARE stmt;

END //
DELIMITER ;

--create_bestelnr //creates new bestelnr for new order, for use in java
DELIMITER //
CREATE PROCEDURE create_bestelnr()
BEGIN
SELECT MAX(bestelnr) + 1 AS bestelnr FROM besteld;
END //
DELIMITER ;


--create_besteld //puts artikelnr, prijs, aantal, prijsaantal inside besteld
DELIMITER //
CREATE PROCEDURE create_besteld(artikelnr int(6), aantal int(3), bestelnr INT(6))
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

END //
DELIMITER ;

---------------------
--create_bestelling--
---------------------

DELIMITER //
DROP PROCEDURE IF EXISTS create_bestelling;
CREATE PROCEDURE create_bestelling(bestelnr INT(6), klantnr INT(6))
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

END //
DELIMITER ;

--SELECT @bestelnr, @klantnr, @besteldatum, @artikelen, @totaalbedragExBtw, @btw9, @btw21, @totaalbedragIncBtw, @ordergewicht, @aantalpaketten, @verzendkosten, @totaalIncVerzendkosten, @orderstatus;

--create contactformulier--
DELIMITER //
CREATE PROCEDURE create_contactformulier(IN naam VARCHAR(30), IN email VARCHAR(100), IN onderwerp VARCHAR(60), IN bericht TEXT)
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

END //
DELIMITER ;

-----------------------------------------------------------------
---default is CREATE DEFINER 'root'@'localhost' PROCEDURE p1 ...
---dit is omdat met het werken van stored procedures het van belang is dat gebruikers de procedure kunnen uitvoeren---
---voorzolang de procedure geen operaties uitvoert die van de ene gebruiker ten opzichte van de andere moeten afwijken
---hoeft CREATE INVOKER ... niet te worden gedefinieert---------
-----------------------------------------------------------------
---create_klant---
DROP PROCEDURE IF EXISTS create_klant;
DELIMITER //
CREATE PROCEDURE create_klant (IN gebruikersnaam VARCHAR(100), IN wachtwoord CHAR(64), IN voornaam VARCHAR(30), IN achternaam VARCHAR(30), IN geslacht CHAR(3), IN straatnaam VARCHAR(30), IN huisnummer CHAR(4), IN postcode CHAR(6), IN woonplaats VARCHAR(30))
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

END //
DELIMITER ;

----privileges guest-----
GRANT EXECUTE ON PROCEDURE read_artikel TO 'guest'@'localhost';
GRANT EXECUTE ON PROCEDURE read_categorie TO  'guest'@'localhost';
GRANT EXECUTE ON PROCEDURE list_artikelen TO  'guest'@'localhost';
GRANT EXECUTE ON PROCEDURE list_bericht TO  'guest'@'localhost';
GRANT EXECUTE ON PROCEDURE list_categorie TO  'guest'@'localhost';
GRANT EXECUTE ON PROCEDURE create_contactformulier TO  'guest'@'localhost';

--extra privileges generated users--
create_bestelnr, create_besteld, create_bestelling, read_bestelling, list_klant_bestelling;

create user 'guest'@'localhost' IDENTIFIED BY 'guest';

call create_klant("p.boven@mail.com", "131313", "Peter", "Boven", "M", "weg", "146A", "1100BB", "Polder");

--unique emailadress---
DROP PROCEDURE IF EXISTS check_existing_email
DELIMITER //
CREATE PROCEDURE check_existing_email (IN gebruikersnaam VARCHAR(100))
BEGIN

SET @gebruikersnaam = gebruikersnaam;

SET @query = CONCAT("SELECT gebruikersnaam FROM klanten WHERE gebruikersnaam = ?");
PREPARE stmt FROM @query;
EXECUTE stmt USING @gebruikersnaam;
DEALLOCATE PREPARE stmt;

END //
DELIMITER ;





