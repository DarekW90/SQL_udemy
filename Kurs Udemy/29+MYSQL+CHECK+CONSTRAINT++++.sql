



/* CONSTRAINT CHECK - sprawdza czy dane są zgodne z wymaganiami,
   jeśli będzie błąd ze względu na nieproawdiłwoe dane pojawi się np komunikat:
   CONSTRAINT `drivers.height` failed for `testdb`.`drivers` */
CREATE TABLE drivers (
    id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name varchar(64) NOT NULL,
    surname varchar(64),
	email varchar(128) NOT NULL,
    height DECIMAL(6,2) NOT NULL CHECK (height >= 140.5),  
    age int NOT NULL CHECK (age>=18)
); 
