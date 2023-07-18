

/* INSERT INTO SELECT Pobranie danych z jednej tabeli i wstawienie do drugiej */
INSERT INTO employees (name, surname, email, profession, department, salary, age, city, country)
SELECT name, surname, email, profession, department, salary, age, city, country FROM employeesuk
WHERE Country='Polska';
