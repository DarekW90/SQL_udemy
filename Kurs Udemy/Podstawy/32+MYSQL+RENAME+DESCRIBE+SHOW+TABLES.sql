
/* Zmiana nazwy tabeli */
RENAME TABLE warsawemplloyees TO warsaw_emplloyees


/* Pokazanie tabel w bazie danych */
USE mydb; /* której bazy używamy */
SHOW TABLES;  
/*
drivers
employees
employeesuk
tasks
warsaw_emplloyee
*/

SHOW TABLES FROM mydb;  

/* Dokładne informacje na temat tabeli */
DESCRIBE employees;
