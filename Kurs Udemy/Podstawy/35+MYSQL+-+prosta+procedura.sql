

/* Tworzenie własnych procedur */
DELIMITER //  /* zmienia znak kończący instrukcję z ; na // na czas pricedury */
CREATE PROCEDURE get_warsaw_employees()
BEGIN
    SELECT * FROM employees where city = "Wawa" ORDER BY id;
END // 
DELIMITER ; /* zmiana z powrotem na ; */


/* wywołanie procedury */
CALL get_warsaw_employees;

