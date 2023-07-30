
/* IF - zwraca wartość jeśli jest spełniony warunek lub inną wartość */
SELECT * , IF(salary > 14000 , "SENIOR", "Junior or MID") FROM employees; 


/* Operatory arytmetyczne, obliczenie bonusu z pensji */
SELECT *, salary * 0.12 + 100 AS Bonus FROM employees;
SELECT * , IF(salary >= 14000, "SENIOR", "Junior or MID"), salary * 0.12 + 100 AS Bonus FROM employees;

/* Aktualizacja rekordów z obliczoną wartością, dodaje 500 do każdej pensji */
UPDATE employees SET salary = salary + 1000 WHERE id >= 1;




