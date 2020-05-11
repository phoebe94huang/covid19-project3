-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 11, 2020 at 06:26 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bergencountydatabase`
--

-- --------------------------------------------------------

--
-- Table structure for table `centers`
--

CREATE TABLE `centers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `town` varchar(255) NOT NULL,
  `number` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `centers`
--

INSERT INTO `centers` (`id`, `name`, `address`, `town`, `number`, `type`) VALUES
(1, 'Bergen Community College', '400 Paramus Road', 'Paramus', NULL, 'Testing center'),
(2, 'Bergen New Bridge Medical Center', '230 East Ridgewood Avenue', 'Paramus', '201-967-4000', 'Testing center + Hospital'),
(3, 'The Valley Hospital', '223 N. Van Dien Avenue', 'Ridgewood', '201-447-8000', 'Hospital'),
(4, 'Hackensack University Medical Center', '30 Prospect Avenue', 'Hackensack', '551-996-2000', 'Hospital'),
(5, 'Holy Name Medical Center', '718 Teaneck Road', 'Teaneck', '201-833-3000', 'Hospital'),
(6, 'Englewood Hospital & Medical Center', '350 Engle Street', 'Englewood', '201-894-3000', 'Hospital');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `name`, `info`, `type`) VALUES
(1, 'BCDHS Health & Safety Hotline', '201-225-7000', 'Phone'),
(2, 'Emotional & Mental Health Hotline', '866-202-HELP', 'Phone'),
(3, 'General COVID-19 Hotline', '2-1-1', 'Phone'),
(4, 'Medical COVID-19 Hotline', '1-800-962-1253', 'Phone'),
(5, 'COVID-19 Alerts', 'Text NJCOVID to: 898-211', 'Text');

-- --------------------------------------------------------

--
-- Table structure for table `countriesinfo`
--

CREATE TABLE `countriesinfo` (
  `id` int(11) NOT NULL,
  `country` varchar(255) DEFAULT NULL,
  `cases` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `countriesinfo`
--

INSERT INTO `countriesinfo` (`id`, `country`, `cases`) VALUES
(1, 'United States', 1332411),
(2, 'Taiwan', 440),
(3, 'Italy', 219070),
(4, 'Canada', 70091),
(5, 'China', 82918),
(6, 'South Korea', 10909),
(7, 'Japan', 15777),
(8, 'Singapore', 23822),
(9, 'Mexico', 35022),
(10, 'United Kingdom', 223060),
(11, 'Spain', 224350),
(12, 'Germany', 171999),
(13, 'Switzerland', 30344),
(14, 'Hong Kong', 1047),
(15, 'Peru', 67307),
(16, 'France', 175026),
(17, 'Australia', 6948),
(18, 'New Zealand', 1497),
(19, 'Ireland', 22996);

-- --------------------------------------------------------

--
-- Table structure for table `covid19`
--

CREATE TABLE `covid19` (
  `id` int(11) NOT NULL,
  `town` varchar(255) NOT NULL,
  `cases` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `covid19`
--

INSERT INTO `covid19` (`id`, `town`, `cases`) VALUES
(1, 'Allendale', 61),
(2, 'Alpine', 22),
(3, 'Bergenfield', 748),
(4, 'Bogota', 167),
(5, 'Carlstadt', 92),
(6, 'Cliffside Park', 466),
(7, 'Closter', 79),
(8, 'Cresskill', 105),
(9, 'Demarest', 46),
(10, 'Dumont', 288),
(11, 'East Rutherford', 131),
(12, 'Edgewater', 126),
(13, 'Elmwood Park', 509),
(14, 'Emerson', 196),
(15, 'Englewood', 733),
(16, 'Englewood Cliffs', 54),
(17, 'Fair Lawn', 580),
(18, 'Fairview', 343),
(19, 'Fort Lee', 429),
(20, 'Franklin Lakes', 145),
(21, 'Garfield', 732),
(22, 'Glen Rock', 114),
(23, 'Hackensack', 1227),
(24, 'Harrington Park', 28),
(25, 'Hasbrouck Heights', 194),
(26, 'Haworth', 35),
(27, 'Hillsdale', 110),
(28, 'Ho-Ho-Kus', 44),
(29, 'Leonia', 106),
(30, 'Little Ferry', 185),
(31, 'Lodi', 629),
(32, 'Lyndhurst', 362),
(33, 'Mahwah', 253),
(34, 'Maywood', 220),
(35, 'Midland Park', 84),
(36, 'Montvale', 73),
(37, 'Moonachie', 65),
(38, 'New Milford', 424),
(39, 'North Arlington', 252),
(40, 'Northvale', 57),
(41, 'Norwood', 65),
(42, 'Oakland', 214),
(43, 'Old Tappan', 60),
(44, 'Oradell', 175),
(45, 'Palisades Park', 237),
(46, 'Paramus', 931),
(47, 'Park Ridge', 152),
(48, 'Ramsey', 125),
(49, 'Ridgefield', 182),
(50, 'Ridgefield Park', 255),
(51, 'Ridgewood', 284),
(52, 'River Edge', 131),
(53, 'Rivervale', 104),
(54, 'Rochelle Park', 157),
(55, 'Rockleigh', 95),
(56, 'Rutherford', 181),
(57, 'Saddle Brook', 290),
(58, 'Saddle River', 73),
(59, 'South Hackensack', 58),
(60, 'Teaneck', 1020),
(61, 'Tenafly', 153),
(62, 'Teterboro', 5),
(63, 'Upper Saddle River', 51),
(64, 'Waldwick', 130),
(65, 'Wallington', 157),
(66, 'Washington Township', 98),
(67, 'Westwood', 189),
(68, 'Woodcliff Lake', 114),
(69, 'Wood-Ridge', 135),
(70, 'Wyckoff', 277),
(71, 'Town unknown', 347);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `centers`
--
ALTER TABLE `centers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countriesinfo`
--
ALTER TABLE `countriesinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `covid19`
--
ALTER TABLE `covid19`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `centers`
--
ALTER TABLE `centers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `countriesinfo`
--
ALTER TABLE `countriesinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `covid19`
--
ALTER TABLE `covid19`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
