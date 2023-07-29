/* Procedura z parametrami */ 
/* IN czyli użytkownik poda wartość parametru */
DELIMITER //
CREATE PROCEDURE get_employees_by_department(
    IN department_param VARCHAR(10) 
)
BEGIN
    SELECT * FROM employees WHERE department = department_param;
END //
DELIMITER ;

/* Wywołanie procedury z parametrem */
CALL get_employees_by_department('HR');

