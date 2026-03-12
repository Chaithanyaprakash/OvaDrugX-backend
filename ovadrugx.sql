-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 12, 2026 at 12:49 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ovadrugx`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `license_number` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `full_name`, `email`, `gender`, `department`, `license_number`, `created_at`) VALUES
(3, 'Dr. prakash', 'prakashkonisetty04@gmail.com', 'Male', 'Oncology', 'LIC123456', '2026-03-11 08:15:05');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `otp` varchar(6) DEFAULT NULL,
  `otp_expiry` datetime DEFAULT NULL,
  `is_verified` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reset_otp` varchar(6) DEFAULT NULL,
  `reset_otp_expiry` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `mobile`, `password_hash`, `otp`, `otp_expiry`, `is_verified`, `created_at`, `updated_at`, `reset_otp`, `reset_otp_expiry`) VALUES
(1, 'Test User', 'test@example.com', '1234567890', '$2y$10$7trJ9zjlzP6JqqXrzCLJaeZsfqDzhs1Zr1/voqn7D8sQBz66SYVzi', '844520', '2026-02-09 14:20:44', 1, '2026-02-09 13:10:44', '2026-02-10 05:12:15', NULL, NULL),
(2, 'test', 'test@gmail.com', '7897654321', '$2y$10$6nPH02fJe0j/S3.MdTn75uLCp3LP1rr1LYhwgvAKJy2.vxO672oBO', '661525', '2026-02-10 05:29:25', 1, '2026-02-10 04:19:25', '2026-02-10 05:12:31', NULL, NULL),
(3, 'kiran', 'kiran@gmail.com', '7897645321', '$2y$10$CAqrLxqPtMALATYEe45JVewB15AzlMLSffPGzsOXzQOYY58t7iDHK', NULL, NULL, 1, '2026-02-10 05:10:29', '2026-03-02 06:55:34', NULL, NULL),
(4, 'prakash', 'prakashkonisetty04@gmail.com', '9849184778', '$2b$12$MCKEkngj1fTRbQK1AFQaBuh68VRFQN9BsMAO60ekwspP.G7umEiGe', '905444', '2026-03-02 14:43:36', 1, '2026-03-02 09:08:18', '2026-03-02 11:51:09', NULL, NULL),
(5, 'charitha', 'sscharithareddy@gmail.com', '9177548517', '$2b$12$FWgUqZQxz4ooJG6OFLbyqOmdYLuQHdwxG4zyk4GDfA3nzLrVa5W1e', NULL, NULL, 1, '2026-03-02 09:10:08', '2026-03-02 09:10:42', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`email`) REFERENCES `users` (`email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
