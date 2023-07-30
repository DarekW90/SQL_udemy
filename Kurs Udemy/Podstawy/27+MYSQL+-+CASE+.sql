

/*
	CASE sprawdza warunki i zwraca wartość dla pierwszego 
	spelnionego warunku, więc jeśli jest true zwraca rezultat 
	i dalej nie sprawdza. Jeśli żaden warunek nie jest spełniony
	to zwraca wynik z else
*/
SELECT * FROM employees
ORDER BY 
(CASE
	WHEN id <= 8 THEN name
 	WHEN id > 9 THEN surname
 	ELSE city
END);