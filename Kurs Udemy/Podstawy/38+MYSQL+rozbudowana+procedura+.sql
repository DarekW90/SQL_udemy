

/* Bardziej zaawansowana procedura z wieloma zwracanymi wartościami */

DELIMITER //
CREATE PROCEDURE get_employees_stats(
    IN empl_department VARCHAR(2),
    OUT empl_number int,
    OUT min_salary int,
    OUT avg_salary int,
    OUT max_salary int
)
BEGIN
    SELECT COUNT(*), MIN(salary), AVG(salary), MAX(salary)
    INTO empl_number, min_salary, avg_salary, max_salary
    FROM employees
    WHERE department = empl_department ORDER BY salary DESC;
END //
DELIMITER ;

CALL get_employees_stats("IT", @empl_number, @min_salary, @avg_salary, @max_salary);
SELECT @empl_number, @min_salary, @avg_salary, @max_salary;

/* przykładowy wynik:
@empl_number @min_salary @avg_salary @max_salary
   7              7555        12111       15500
*/
