


/* Procedura z parametrem i zwracaną wartością */
DELIMITER //
CREATE PROCEDURE get_employees_num(
    IN empl_department VARCHAR(12),
    OUT empl_number int 
)
BEGIN
    SELECT COUNT(*) 
    INTO empl_number 
    FROM employees
    WHERE department = empl_department ORDER BY salary DESC;
END //
DELIMITER ;

/* @number to zmienna tymczasowa z której pobierzemy wynik
   Uwaga wywołujemy procedure wraz z SELECT aby ten wynik odczytać! */
CALL get_employees_num("IT", @number);
SELECT @number;


/* Kasowanie procedury */
DROP PROCEDURE get_employees_num;