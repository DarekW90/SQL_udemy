
/* Funkcje związane z czasem */
/* NOW(): Funkcja zwraca aktualną datę i czas. */
SELECT name, NOW() AS 'Current Date and Time' FROM employees;
/* Kasia 2023-06-30 16:16:09 */

/* CURDATE(): Funkcja zwraca aktualną datę. */
SELECT name, CURDATE() AS 'Current Date' FROM employees;
/* Kasia  2023-06-30 */

/* CURTIME(): Funkcja zwraca aktualny czas. */
SELECT name, CURTIME() AS 'Current Time' FROM employees;
/* Kasia  16:17:39 */


/* DATE(): Funkcja zwraca datę dla podanego datatime. */
SELECT name, DATE(created) AS 'Created Date' FROM employees;
/* Kasia 2023-06-29 */

/* TIME(): Funkcja zwraca czas dla podanego datatime. */
SELECT name, TIME(created) AS 'Created Date' FROM employees; 


/* DATE_ADD(): Funkcja dodaje określoną ilość czasu do daty. */
SELECT name, created,  DATE_ADD(created, INTERVAL 1 MONTH) AS 'Date After One Month' FROM employees;


/* DATEDIFF(): Funkcja zwraca różnicę pomiędzy dwiema datami. */
SELECT name, DATEDIFF(NOW(), created) AS 'Days Since Creation' FROM employees;

/* YEAR(), MONTH(), DAY(): Funkcje zwracają rok, miesiąc i dzień z podanej daty. */
SELECT name, YEAR(created) AS 'Creation Year', MONTH(created) AS 'Creation Month', DAY(created) AS 'Creation Day' FROM employees;

/* DATE_SUB(): Funkcja, która odejmuje określoną ilość czasu od daty. */
SELECT name, DATE_SUB(NOW(), INTERVAL 7 DAY) AS 'Date 7 Days Ago' FROM employees;

/* EXTRACT(): Funkcja do wyodrębniania części daty (na przykład roku, miesiąca, dnia itp.). */
SELECT name, EXTRACT(YEAR FROM created) AS 'Creation Year' FROM employees;

/* DAYNAME(): Funkcja, która zwraca nazwę dnia tygodnia dla podanej daty. */
SELECT name, DAYNAME(created) AS 'Creation Day Name' FROM employees;
/* Kasia Thursday */

/* DAYOFYEAR(): Funkcja, która zwraca dzień roku dla podanej daty (liczba od 1 do 366). */
SELECT name, DAYOFYEAR(created) AS 'Creation Day of Year' FROM employees;


/* WEEK(): Funkcja, która zwraca numer tygodnia roku dla podanej daty (liczba od 0 do 53). */
SELECT name, WEEK(created) AS 'Creation Week of Year' FROM employees;

/* DATE_FORMAT(): Funkcja, która formatuje datę zgodnie z określonym formatem. */
SELECT name, DATE_FORMAT(created, '%M %d, %Y') AS 'Formatted Creation Date' FROM employees;

/* ADDDATE(): Funkcja, która dodaje określoną ilość dni do daty. */
SELECT name, created, ADDDATE(created, INTERVAL 30 DAY) AS 'Date After 30 Days' FROM employees;

/* LAST_DAY(): Funkcja, która zwraca ostatni dzień miesiąca dla podanej daty. */
SELECT name, created, LAST_DAY(created) AS 'Last Day of Creation Month' FROM employees;

/* PERIOD_DIFF(): Funkcja, która zwraca różnicę między dwoma okresami. */
SELECT name, PERIOD_DIFF(DATE_FORMAT(NOW(), '%Y%m'), DATE_FORMAT(created, '%Y%m')) AS 'Months Since Creation' FROM employees;

/* WEEKDAY(): Funkcja, która zwraca numer dnia tygodnia dla podanej daty. */
SELECT name, created, WEEKDAY(created) AS 'Creation Week Day' FROM employees;

/* QUARTER(): Funkcja, która zwraca kwartał roku dla podanej daty. */
SELECT name, QUARTER(created) AS 'Creation Quarter' FROM employees;

/* HOUR(), MINUTE(), SECOND(): Funkcje zwracają godzinę, minutę i sekundę z podanej daty i czasu. */
SELECT name, created, HOUR(created) AS 'Creation Hour', MINUTE(created) AS 'Creation Minute', SECOND(created) AS 'Creation Second' FROM employees;

/* TO_DAYS(): Funkcja, która zwraca liczbę dni od '0000-00-00' do podanej daty. */
SELECT name, created, TO_DAYS(created) AS 'Days Since Zero' FROM employees;

/* DATE_ADD() i INTERVAL: Funkcje, które dodają określoną ilość czasu do daty. */
SELECT name, created, DATE_ADD(created, INTERVAL 1 WEEK) AS 'Date After One Week' FROM employees;

/* TIME_TO_SEC(): Funkcja, która konwertuje czas do sekund. */
SELECT name, created, TIME_TO_SEC(TIMEDIFF(NOW(), created)) AS 'Seconds Since Creation' FROM employees;


/* DATE(): Funkcja, która zwraca datę bez czasu z daty i czasu. */
SELECT name, DATE(created) AS 'Creation Date' FROM employees;

/* MONTHNAME(): Funkcja, która zwraca nazwę miesiąca dla podanej daty. */
SELECT name, created, MONTHNAME(created) AS 'Creation Month Name' FROM employees;

/* DAYOFMONTH(): Funkcja, która zwraca dzień miesiąca dla podanej daty. */
SELECT name, created, DAYOFMONTH(created) AS 'Creation Day of Month' FROM employees;

/* CURDATE(): Funkcja, która zwraca bieżącą datę. */
SELECT name, CURDATE() AS 'Current Date' FROM employees;
