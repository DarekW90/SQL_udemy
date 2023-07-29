


/* Funkcje operujące na łańcuchach znaków */
SELECT CONCAT(name, ' ', surname) AS 'Full Name' FROM employees;
/*
Full Name 
Kasia Kowalska
*/

/* LENGTH(): Funkcja, która zwraca liczbę znaków w podanym ciągu znaków. */
SELECT name, LENGTH(name) AS 'Name Length' FROM employees;
/* Name   Length	 
   Kasia  5  */
   
/* SUBSTRING(): Funkcja, która zwraca podciąg znaków z określonego ciągu znaków. */
SELECT name, SUBSTRING(name, 1, 2) AS 'First Two Letters' FROM employees;
/* name   First Two Letters	 
   Kasia   Ka  */


/* LOWER() i UPPER(): Funkcje, które zamieniają wszystkie litery w ciągu znaków na małe lub duże litery. */ 
SELECT name, LOWER(name) AS 'Lowercase Name', UPPER(name) AS 'Uppercase Name' FROM employees;
/*name   Lowercase Name Uppercase Name	 
  Kasia  kasia          KASIA  */
  

/* TRIM(): Funkcja, która usuwa białe spacje z początku i końca ciągu znaków. */
SELECT TRIM(name) AS 'Trimmed Name' FROM employees;
/* Trimmed Name	
   Kasia */
   
/* REPLACE(): Funkcja, która zastępuje wszystkie wystąpienia podciągu w ciągu znaków. */
SELECT email, REPLACE(email, '@example.com', '@company.com') AS 'Updated Email' FROM employees;
/* kasia@example.com   kasia@company.com */

/* LEFT() i RIGHT(): Funkcje, które zwracają określoną liczbę znaków z lewej lub prawej strony ciągu znaków. sql */
SELECT name, LEFT(name, 3) AS 'First Three Letters', RIGHT(name, 3) AS 'Last Three Letters' FROM employees;
/* Kas    sia */


/* REVERSE(): Funkcja, która odwraca ciąg znaków. */
SELECT name, REVERSE(name) AS 'Reversed Name' FROM employees;
/* Kasia  aisaK */


/* CHAR_LENGTH(): Funkcja, która zwraca długość ciągu znaków. Jest to podobne do LENGTH(), ale CHAR_LENGTH() jest używane, gdy ciąg może zawierać znaki wielobajtowe. */
SELECT name, CHAR_LENGTH(name) AS 'Name Char Length' FROM employees;
/*  Kasia  5 */


/* LOCATE(): Funkcja, która zwraca pozycję pierwszego wystąpienia podciągu w ciągu znaków. */
SELECT email, LOCATE('@', email) AS '@ Position' FROM employees;
/*  kasia@example.com    6 */


/* INSTR(): Funkcja, która zwraca pozycję pierwszego wystąpienia podciągu w ciągu znaków. Jest podobna do LOCATE(), ale kolejność argumentów jest odmienna. */
SELECT email, INSTR(email, '@') AS '@ Position' FROM employees;
/*  kasia@example.com    6 */


/* LPAD() i RPAD(): Funkcje, które dodają określony ciąg znaków do lewej lub prawej strony ciągu, do momentu uzyskania określonej długości. */
SELECT name, LPAD(name, 10, '*') AS 'Padded Name' FROM employees;
/*  Kasia  *****Kasia  */


/* ASCII(): Funkcja, która zwraca wartość ASCII pierwszego znaku w ciągu. Tutaj na podstawie id */
SELECT name, ASCII(name) AS 'ASCII Value' FROM employees;
/* Kasia  75  */


/* CHAR(): Funkcja, która zwraca znak na podstawie wartości ASCII. */
SELECT id, CHAR(id) AS 'Char Value' FROM employees;
/* 1  0x01 */

/* FIELD(): Funkcja, która zwraca indeks (pozycję) ciągu w liście ciągów. */
SELECT name, FIELD(profession, 'programmer', 'tester', 'recruiter') AS 'Position in List' FROM employees;
/* Ten przykład zwraca pozycję zawodu pracownika na liście 'programmer', 'tester', 'recruiter'. */


/* FIND_IN_SET(): Funkcja, która zwraca pozycję ciągu w liście ciągów rozdzielonych przecinkami. */
SELECT name, FIND_IN_SET(profession, 'programmer,tester,recruiter') AS 'Position in List' FROM employees;
/* Kasia 1    Ania 3 */
/* Podobnie jak przykład z FIELD(), ten przykład zwraca pozycję zawodu pracownika na liście 'programmer', 'tester', 'recruiter'. */


/* SUBSTRING_INDEX(): Funkcja, która zwraca podciąg z ciągu przed określoną liczbą wystąpień separatora. */
SELECT email, SUBSTRING_INDEX(email, '@', 1) AS 'Username' FROM employees;
/*  kasia@example.com    kasia  */


/* Połączenie name i surname */
DELIMITER //
CREATE PROCEDURE combineNameSurname(IN emp_id INT)
BEGIN
    SELECT CONCAT(name, ' ', surname) AS 'Full Name' FROM employees WHERE id = emp_id;
END//
DELIMITER ;

CALL combineNameSurname(1);



/* ilość znaków imienia */
DELIMITER //
CREATE PROCEDURE lengthOfName(IN emp_id INT)
BEGIN
    SELECT name, LENGTH(name) AS 'Name Length' FROM employees WHERE id = emp_id;
END//
DELIMITER ;

CALL lengthOfName(1);



/* 3 litery */
DELIMITER //
CREATE PROCEDURE firstThreeLetters(IN emp_id INT)
BEGIN
    SELECT name, SUBSTRING(name, 1, 3) AS 'First Three Letters' FROM employees WHERE id = emp_id;
END//
DELIMITER ;

CALL firstThreeLetters(2);



/* Zamiana maila w domenie */
DELIMITER //
CREATE PROCEDURE updateEmailDomain(IN emp_id INT, IN new_domain VARCHAR(255))
BEGIN
    UPDATE employees 
    SET email = REPLACE(email, SUBSTRING_INDEX(email, '@', -1), new_domain)
    WHERE id = emp_id;
END//
DELIMITER ;

CALL updateEmailDomain(1, "company.com")

