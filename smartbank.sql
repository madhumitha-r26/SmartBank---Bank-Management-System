-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 29, 2025 at 01:18 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smartbank`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `account_number` int(10) NOT NULL,
  `balance` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`account_number`, `balance`) VALUES
(10001, 10010),
(10002, 25500),
(10000, 80400),
(10004, 50000),
(10003, 20000);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `account_number` bigint(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `aadhar_number` char(12) NOT NULL,
  `pan_number` varchar(12) NOT NULL,
  `phone_number` char(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`account_number`, `username`, `dob`, `gender`, `aadhar_number`, `pan_number`, `phone_number`, `email`, `password`, `address`) VALUES
(10003, 'fiji', '2000-12-11', 'Female', '333333333333', '89dhfj', '4569123780', 'fiji@gmail.com', 'fiji789', '8,mount road,chennai'),
(10000, 'kaaka', '1999-05-08', 'Male', '555555555555', 'xyz669', '0987654321', 'kaaka@gmail.com', 'Kaakz12', '7,p&t nagar,madurai'),
(10001, 'madhumitha', '2002-03-26', 'Female', '1111111111', 'abc123x', '1234576890', 'madhu@gmail.com', 'mad26!xyb', '84,egmore,chennai'),
(10004, 'mini', '1999-11-30', 'Female', '22222222222', 'mno9012', '9807654321', 'mini@gmail.com', 'mini007', '5,whitefield,banglore'),
(10002, 'yamini', '1995-02-23', 'Female', '999999999999', 'ncj78zz', '567878924', 'yamini@gmail.com', 'yaminiabc123', '4,techno park,trivandrum');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `from_account` varchar(64) NOT NULL,
  `to_account` varchar(64) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `timestamp` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `from_account`, `to_account`, `amount`, `timestamp`) VALUES
(1, '10003', '10001', 10.00, '2025-11-29 16:33:50'),
(2, '10000', '10003', 20000.00, '2025-11-29 16:55:51'),
(3, '10000', '10000', 100.00, '2025-11-29 17:16:09'),
(4, '10000', '10000', 10.00, '2025-11-29 17:17:19'),
(5, '10000', '10000', 400.00, '2025-11-29 17:20:55'),
(6, '10000', '10000', 400.00, '2025-11-29 17:24:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`email`),
  ADD UNIQUE KEY `account_number` (`account_number`),
  ADD UNIQUE KEY `aadhar_number` (`aadhar_number`),
  ADD UNIQUE KEY `pan_number` (`pan_number`),
  ADD UNIQUE KEY `phone_number` (`phone_number`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
