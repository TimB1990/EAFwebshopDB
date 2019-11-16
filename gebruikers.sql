-- create guest user, met gebruikersnaam guest en password guest
create user 'guest'@'localhost' IDENTIFIED BY 'guest';
-- priveleges guest
GRANT EXECUTE ON PROCEDURE read_artikel TO 'guest'@'localhost';
GRANT EXECUTE ON PROCEDURE read_categorie TO  'guest'@'localhost';
GRANT EXECUTE ON PROCEDURE list_artikelen TO  'guest'@'localhost';
GRANT EXECUTE ON PROCEDURE list_bericht TO  'guest'@'localhost';
GRANT EXECUTE ON PROCEDURE list_categorie TO  'guest'@'localhost';
GRANT EXECUTE ON PROCEDURE create_contactformulier TO  'guest'@'localhost';
GRANT EXECUTE ON PROCEDURE check_existing_email TO 'guest'@'localhost';
GRANT EXECUTE ON PROCEDURE read_profiel TO 'guest'@'localhost';

-- priveleges voor testgebruiker die al in database is vastgelegd (p.boven@mail.com)
GRANT USAGE ON *.* TO `p.boven@mail.com`@`localhost`                                                
GRANT EXECUTE ON PROCEDURE `eafwebshop`.`create_besteld` TO `p.boven@mail.com`@`localhost`;          
GRANT EXECUTE ON PROCEDURE `eafwebshop`.`create_bestelling` TO `p.boven@mail.com`@`localhost`;       
GRANT EXECUTE ON PROCEDURE `eafwebshop`.`create_bestelnr` TO `p.boven@mail.com`@`localhost`;         
GRANT EXECUTE ON PROCEDURE `eafwebshop`.`create_contactformulier` TO `p.boven@mail.com`@`localhost`; 
GRANT EXECUTE ON PROCEDURE `eafwebshop`.`list_artikelen` TO `p.boven@mail.com`@`localhost`;          
GRANT EXECUTE ON PROCEDURE `eafwebshop`.`list_bericht` TO `p.boven@mail.com`@`localhost`;            
GRANT EXECUTE ON PROCEDURE `eafwebshop`.`list_categorie` TO `p.boven@mail.com`@`localhost`;          
GRANT EXECUTE ON PROCEDURE `eafwebshop`.`list_klant_bestelling` TO `p.boven@mail.com`@`localhost`;   
GRANT EXECUTE ON PROCEDURE `eafwebshop`.`read_artikel` TO `p.boven@mail.com`@`localhost`;            
GRANT EXECUTE ON PROCEDURE `eafwebshop`.`read_bestelling` TO `p.boven@mail.com`@`localhost`;         
GRANT EXECUTE ON PROCEDURE `eafwebshop`.`read_categorie` TO `p.boven@mail.com`@`localhost`;          
GRANT EXECUTE ON PROCEDURE `eafwebshop`.`read_profiel` TO `p.boven@mail.com`@`localhost`;