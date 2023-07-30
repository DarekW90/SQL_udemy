

/* Funkcje matematyczne */

/* AVG(): Funkcja, która oblicza średnią wartoś */
SELECT AVG(salary) AS 'Average Salary' FROM employees;

/* SUM(): Funkcja, która oblicza sumę dla określonego pola numerycznego. */
SELECT SUM(salary) AS 'Total Salary' FROM employees;

/* MIN(): Funkcja, która zwraca minimalną wartość */
SELECT MIN(salary) AS 'Lowest Salary' FROM employees;

/* SELECT MAX(salary) AS 'Highest Salary' FROM employees; */
SELECT MAX(salary) AS 'Highest Salary' FROM employees;

/* COUNT(): Funkcja, która zlicza liczbę rekordów spełniających określone kryteria. */
SELECT COUNT(*) AS 'Number of Employees' FROM employees WHERE salary > 15000;

/* ROUND(): Funkcja, która zaokrągla wartość do najbliższej liczby całkowitej. */
ALTER TABLE employees MODIFY `salary` DECIMAL(10,2);
UPDATE employees SET salary = salary + salary * 0.15;
SELECT name, salary, ROUND(salary) AS 'Rounded Salary' FROM employees;

/* FLOOR(): Funkcja, która zaokrągla wartość w dół do najbliższej liczby całkowitej.*/
SELECT name, FLOOR(salary) AS 'Floor Salary' FROM employees;


/* CEIL(): Funkcja, która zaokrągla wartość w górę do najbliższej liczby całkowitej. */
SELECT name, CEIL(salary) AS 'Ceil Salary' FROM employees;

/* MOD(): Funkcja, która zwraca resztę z dzielenia dwóch liczb. */
SELECT name, salary, MOD(salary, 1000) AS 'Salary Modulo 1000' FROM employees;

/* SQRT(): Funkcja, która oblicza pierwiastek kwadratowy liczby. */
SELECT name, salary, SQRT(salary) AS 'Square Root of Salary' FROM employees;

/* POW(): Funkcja, która podnosi liczbę do określonej potęgi. */
SELECT name, age, POW(age, 2) AS 'Age Squared' FROM employees;

/* RAND(): Funkcja, która zwraca losową wartość pomiędzy 0 (włącznie) i 1 (wyłącznie). */
SELECT name, RAND() AS 'Random Value' FROM employees;

/* TRUNCATE(): Funkcja, która obcina wartość do określonej liczby miejsc dziesiętnych. */
SELECT name, salary, TRUNCATE(salary, 0) AS 'Truncated Salary' FROM employees;

/* ABS(): Funkcja, która zwraca wartość absolutną liczby. */
SELECT name, ABS(-salary) AS 'Absolute Salary' FROM employees WHERE salary < 0;


/* SIN(), COS(), TAN(): Funkcje trygonometryczne. */
SELECT name, SIN(age) AS 'Sine of Age', COS(age) AS 'Cosine of Age', TAN(age) AS 'Tangent of Age' FROM employees;

/* SIGN(): Funkcja, która zwraca znak liczby. */
SELECT name, SIGN(salary) AS 'Sign of Salary' FROM employees;

/* FORMAT(): Funkcja, która formatuje liczbę do określonego formatu. Przyjmuje dwa argumenty: liczbę do sformatowania i liczbę miejsc po przecinku. */
SELECT name, salary, FORMAT(salary, 1) AS 'Formatted Salary' FROM employees;

/* GREATEST(): Funkcja, która zwraca największą wartość z listy lub zestawu. */
SELECT name, GREATEST(salary, age) AS 'Greater of Salary and Age' FROM employees;

/* LEAST(): Funkcja, która zwraca najmniejszą wartość z listy lub zestawu. */
SELECT name, LEAST(salary, age) AS 'Lesser of Salary and Age' FROM employees;

/* DIV: Operator, który wykonuje dzielenie całkowite (zwraca tylko część całkowitą wyniku). */
SELECT name, salary DIV 1000 AS 'Salary Divided by 1000' FROM employees;
