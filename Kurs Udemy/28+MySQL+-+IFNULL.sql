-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Cze 30, 2023 at 06:33 AM
-- Wersja serwera: 10.4.28-MariaDB
-- Wersja PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `testdb`
--

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
  `salary` float DEFAULT NULL,
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
(1, 'Kasia', 'Kowalska', 'kasia@example.com', 'programmer', 'IT', 14000, 32, 'Wawa', 'Polska', '2023-06-29 08:58:40', '2023-06-29 08:58:40'),
(2, 'Ania', 'Nowak', 'ania@example.com', 'recruiter', 'HR', 10000, 27, 'Krk', 'Polska', '2023-06-29 08:58:40', '2023-06-29 08:58:40'),
(3, 'Adam', 'Adamski', 'adam@example.com', 'programmer', 'IT', 15000, 36, 'Wawa', 'Polska', '2023-06-29 08:58:40', '2023-06-29 08:58:40'),
(4, 'Karol', 'Karolski', 'karol@example.com', 'tester', 'IT', 11000, 28, 'Wawa', 'Polska', '2023-06-29 08:58:40', '2023-06-29 08:58:40'),
(5, 'Monika', 'Kowalska', 'monika@example.com', 'programmer', 'IT', 12000, 33, 'Wawa', 'Polska', '2023-06-29 08:58:40', '2023-06-29 08:58:40'),
(6, 'Asia', 'Nowak', 'asia@example.com', 'recruiter', 'HR', 15000, 34, 'Krk', 'Polska', '2023-06-29 08:58:40', '2023-06-29 08:58:40'),
(7, 'Daniel', 'Danielski', 'daniel@example.com', 'programmer', 'IT', 17000, 37, 'Wawa', 'Polska', '2023-06-29 08:58:40', '2023-06-29 08:58:40'),
(8, 'Olga', 'Karolska', 'olga@example.com', 'tester', 'IT', 8000, 25, 'Wawa', 'Polska', '2023-06-29 08:58:40', '2023-06-29 08:58:40'),
(9, 'Karol', 'Karolski', 'karol@example.com', 'tester', 'IT', 11000, 28, 'Wawa', 'Polska', '2023-06-30 05:59:02', '2023-06-30 05:59:02'),
(10, 'Konrad', 'Konradzki', 'konrad@example.com', 'programmer', 'IT', NULL, 41, 'Wawa', 'Polska', '2023-06-29 08:58:40', '2023-06-29 08:58:40');

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

--
-- Indeksy dla zrzutów tabel
--

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
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;













/* IFNULL() - jeżeli wartość w kolumnie jest NULL to podstawia inną wartość */
/* jeśli nie ma salary to dodaje do age 1000 a nie salary */
SELECT name, surname,  age + IFNULL(salary, 1000)
FROM employees; 

/* taki sam wynik dla COALESCE */
SELECT name, surname,  age + COALESCE(salary, 1000)
FROM employees;

/* z tym że można podać dodatkowe opcje i wybrana będzie jedna z nich nie będąca null */
SELECT name, surname,  age + COALESCE(salary, salary, 2000)
FROM employees;




