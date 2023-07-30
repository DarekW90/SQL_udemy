CREATE TABLE IF NOT EXISTS employees (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(32) NOT NULL,
    surname VARCHAR(32) NOT NULL,
    email VARCHAR(128) NOT NULL,
    profession VARCHAR(32) NOT NULL COMMENT "for example: programmer, tester",
    department VARCHAR(32) NOT NULL,
    salary FLOAT,
    age INT,
    city VARCHAR(32)
);

INSERT INTO employees (name, surname, email, profession, department, salary, age, city)
VALUES ("Kasia", "Kowalska", "kasia@example.com", "programmer", "IT", 14000, 32, "Wawa");

INSERT INTO employees (name, surname, email, profession, department, salary, age, city)
VALUES ("Ania", "Nowak", "ania@example.com", "recruiter", "HR", 10000, 27, "Krk");

INSERT INTO employees (name, surname, email, profession, department, salary, age, city)
VALUES ("Adam", "Adamski", "adam@example.com", "programmer", "IT", 15000, 36, "Wawa");

INSERT INTO employees (name, surname, email, profession, department, salary, age, city)
VALUES ("Karol", "Karolski", "karol@example.com", "tester", "IT", 11000, 28, "Wawa");

INSERT INTO employees (name, surname, email, profession, department, salary, age, city)
VALUES ("Monika", "Kowalska", "monika@example.com", "programmer", "IT", 12000, 33, "Wawa");

INSERT INTO employees (name, surname, email, profession, department, salary, age, city)
VALUES ("Asia", "Nowak", "asia@example.com", "recruiter", "HR", 15000, 34, "Krk");

INSERT INTO employees (name, surname, email, profession, department, salary, age, city)
VALUES ("Daniel", "Danielski", "daniel@example.com", "programmer", "IT", 17000, 37, "Wawa");

INSERT INTO employees (name, surname, email, profession, department, salary, age, city)
VALUES ("Olga", "Karolska", "olga@example.com", "tester", "IT", 8000, 25, "Wawa");



ALTER TABLE employees ADD COLUMN (
	country VARCHAR(12) DEFAULT "Polska",
    created DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);