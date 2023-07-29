-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Lip 01, 2023 at 11:10 AM
-- Wersja serwera: 10.4.28-MariaDB
-- Wersja PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testdb`
--

DELIMITER $$
--
-- Procedury
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `combineNameSurname` (IN `emp_id` INT)   BEGIN
	SELECT CONCAT(name, ' ', surname) AS 'Full name' FROM employees WHERE id = emp_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `firstThreeLetters` (IN `emp_id` INT)   BEGIN
    SELECT name, SUBSTRING(name, 1, 3) AS 'First Three Letters' FROM employees WHERE id = emp_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_employees_by_department` (IN `department_param` VARCHAR(10))   BEGIN
	SELECT * FROM employees WHERE department = department_param;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_employees_stats` (IN `empl_department` VARCHAR(2), OUT `empl_number` INT, OUT `min_salary` INT, OUT `avg_salary` INT, OUT `max_salary` INT)   BEGIN
	SELECT COUNT(*), MIN(salary), AVG(salary), MAX(salary)
    INTO empl_number, min_salary, avg_salary, max_salary
    FROM employees
    WHERE department = empl_department;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_warsaw_employees` ()   BEGIN
	SELECT * FROM employees where city = "Wawa" ORDER BY id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `lengthOfName` (IN `emp_id` INT)   BEGIN
    SELECT name, LENGTH(name) AS 'Name Length' FROM employees WHERE id = emp_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateEmailDomain` (IN `emp_id` INT, IN `new_domain` VARCHAR(255))   BEGIN
    UPDATE employees 
    SET email = REPLACE(email, SUBSTRING_INDEX(email, '@', -1), new_domain)
    WHERE id = emp_id;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `drivers`
--

CREATE TABLE `drivers` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `surname` varchar(64) DEFAULT NULL,
  `email` varchar(128) NOT NULL,
  `height` decimal(6,2) NOT NULL CHECK (`height` >= 140.5),
  `age` int(11) NOT NULL CHECK (`age` >= 18)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`id`, `name`, `surname`, `email`, `height`, `age`) VALUES
(1, 'Asia', 'dfgdfg', 'dfg', 140.60, 18);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `surname` varchar(32) NOT NULL,
  `email` varchar(128) NOT NULL,
  `profession` varchar(32) NOT NULL COMMENT 'for example: programmer, tester',
  `department` varchar(32) NOT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `city` varchar(32) DEFAULT NULL,
  `country` varchar(12) DEFAULT 'Polska',
  `created` datetime DEFAULT current_timestamp(),
  `updated` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `surname`, `email`, `profession`, `department`, `salary`, `age`, `city`, `country`, `created`, `updated`) VALUES
(1, 'Kasia', 'Kowalska', 'kasia@company.com', 'programmer', 'IT', 18183.68, 32, 'Wawa', 'Polska', '2023-06-29 08:58:40', '2023-07-01 07:25:36'),
(2, 'Ania', 'Nowak', 'ania@example.com', 'recruiter', 'HR', 13334.70, 27, 'Krk', 'Polska', '2023-06-29 08:58:40', '2023-07-01 07:25:36'),
(3, 'Adam', 'Adamski', 'adam@example.com', 'programmer', 'IT', 18183.68, 36, 'Wawa', 'Polska', '2023-06-29 08:58:40', '2023-07-01 07:25:36'),
(4, 'Karol', 'Karolski', 'karol@example.com', 'tester', 'IT', 13334.70, 28, 'Wawa', 'Polska', '2023-06-29 08:58:40', '2023-07-01 07:25:36'),
(6, 'Asia', 'Nowak', 'asia@example.com', 'recruiter', 'HR', 19395.92, 34, 'Krk', 'Polska', '2023-06-29 08:58:40', '2023-07-01 07:25:36'),
(7, 'Daniel', 'Danielski', 'daniel@example.com', 'programmer', 'IT', 21820.41, 37, 'Wawa', 'Polska', '2023-06-29 08:58:40', '2023-07-01 07:25:36'),
(8, 'Olga', 'Karolska', 'olga@example.com', 'tester', 'IT', 9697.96, 25, 'Wawa', 'Polska', '2023-06-29 08:58:40', '2023-07-01 07:25:36'),
(9, 'Karol', 'Karolski', 'karol@example.com', 'tester', 'IT', 14546.94, 28, 'Wawa', 'Polska', '2023-06-30 05:59:02', '2023-07-01 07:25:36'),
(10, 'Konrad', 'Konradzki', 'konrad@example.com', 'programmer', 'IT', NULL, 41, 'Wawa', 'Polska', '2023-06-29 08:58:40', '2023-06-29 08:58:40'),
(12, 'Gargamel', 'Nowak', 'gargamel@example.com', 'programmer', 'IT', 9697.96, 25, NULL, 'Polska', '2023-06-30 07:37:23', '2023-07-01 07:25:36');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `employeesuk`
--

CREATE TABLE `employeesuk` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `surname` varchar(32) NOT NULL,
  `email` varchar(128) NOT NULL,
  `profession` varchar(32) NOT NULL COMMENT 'for example: programmer, tester',
  `department` varchar(32) NOT NULL,
  `salary` float DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `city` varchar(32) DEFAULT NULL,
  `country` varchar(12) DEFAULT 'UK',
  `created` datetime DEFAULT current_timestamp(),
  `updated` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employeesuk`
--

INSERT INTO `employeesuk` (`id`, `name`, `surname`, `email`, `profession`, `department`, `salary`, `age`, `city`, `country`, `created`, `updated`) VALUES
(1, 'John', 'Smith', 'john@example.com', 'programmer', 'IT', 4000, 32, 'London', 'UK', '2023-06-29 08:58:40', '2023-06-29 08:58:40'),
(2, 'Andrew', 'Goodman', 'andrew@example.com', 'programmer', 'IT', 4500, 32, 'London', 'UK', '2023-06-29 08:58:40', '2023-06-29 08:58:40'),
(4, 'Karol', 'Karolski', 'karol@example.com', 'tester', 'IT', 11000, 28, 'Wawa', 'Polska', '2023-06-29 08:58:40', '2023-06-29 08:58:40');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `status` enum('NEW','ON HOLD','RESOLVED','CLOSED') NOT NULL DEFAULT 'NEW',
  `employeeId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `title`, `description`, `status`, `employeeId`) VALUES
(1, 'Task 1', 'Task 1 description', 'NEW', 1),
(2, 'Task 2', 'Task 2 description', 'NEW', 1),
(3, 'Task 3', 'Task 3 description', 'NEW', 1),
(4, 'Task 4', 'Task 4 description', 'NEW', 2),
(5, 'Task 5', 'Task 5 description', 'NEW', 2),
(6, 'Task 6', 'Task 6 description', 'NEW', 3),
(7, 'Task 7', 'Task 7 description', 'NEW', 3);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `warsaw_employees`
-- (See below for the actual view)
--
CREATE TABLE `warsaw_employees` (
`id` int(11)
,`name` varchar(32)
,`surname` varchar(32)
,`email` varchar(128)
,`city` varchar(32)
,`salary` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Struktura widoku `warsaw_employees`
--
DROP TABLE IF EXISTS `warsaw_employees`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `warsaw_employees`  AS SELECT `employees`.`id` AS `id`, `employees`.`name` AS `name`, `employees`.`surname` AS `surname`, `employees`.`email` AS `email`, `employees`.`city` AS `city`, `employees`.`salary` AS `salary` FROM `employees` WHERE `employees`.`city` = 'WAWA' AND `employees`.`id` > 3 ;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_email` (`email`);

--
-- Indeksy dla tabeli `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `employeesuk`
--
ALTER TABLE `employeesuk`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
