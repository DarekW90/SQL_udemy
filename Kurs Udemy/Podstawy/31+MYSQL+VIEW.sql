


/* Widok to nowa pseudo tabela na bazie innej tabeli */
CREATE VIEW warsawemplloyees AS
SELECT id, name, surname, email, city
FROM employees WHERE city = 'Wawa' AND id > 2; 

/* pobranie danych z widoku */
SELECT * FROM warsawemplloyees 

/* aktualizacja view */
CREATE OR REPLACE VIEW warsawemplloyees AS
SELECT id, name, surname, email, city, salary
FROM employees WHERE city = 'Wawa' AND id > 3; 

/* skasowanie elementu z view ale uwaga skasuje też z employees ! */
DELETE FROM warsawemplloyees WHERE id = 5;  

/* Kasowanie widoków */
DROP VIEW warsawemplloyees; 

