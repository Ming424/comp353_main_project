-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 11, 2020 at 10:29 PM
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
-- Database: `comp353`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `Aid` int(4) NOT NULL,
  `Sin` int(4) NOT NULL,
  `Did` int(4) NOT NULL,
  `Rid` int(4) NOT NULL,
  `Bid` int(4) NOT NULL,
  `miss` tinyint(1) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`Aid`, `Sin`, `Did`, `Rid`, `Bid`, `miss`, `date`) VALUES
(2, 123456789, 1, 1, 1, 1, '2020-01-01'),
(3, 987654321, 2, 2, 2, 1, '2020-01-05'),
(4, 123456789, 2, 1, 3, 0, '2020-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `belongs`
--

CREATE TABLE `belongs` (
  `BelongId` int(11) NOT NULL,
  `Cname` varchar(50) NOT NULL,
  `Did` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `belongs`
--

INSERT INTO `belongs` (`BelongId`, `Cname`, `Did`) VALUES
(6, 'clinic_1', 1),
(7, 'clinic_1', 2),
(8, 'clinic_2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `Bid` int(4) NOT NULL,
  `Paid` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`Bid`, `Paid`) VALUES
(1, 0),
(2, 0),
(3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `clinic`
--

CREATE TABLE `clinic` (
  `Cname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `clinic`
--

INSERT INTO `clinic` (`Cname`) VALUES
('clinic_1'),
('clinic_2');

-- --------------------------------------------------------

--
-- Table structure for table `dental_assistant`
--

CREATE TABLE `dental_assistant` (
  `DAid` int(4) NOT NULL,
  `DAname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dental_assistant`
--

INSERT INTO `dental_assistant` (`DAid`, `DAname`) VALUES
(1, 'DA_1'),
(2, 'DA_2');

-- --------------------------------------------------------

--
-- Table structure for table `dentist`
--

CREATE TABLE `dentist` (
  `Did` int(4) NOT NULL,
  `Dname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dentist`
--

INSERT INTO `dentist` (`Did`, `Dname`) VALUES
(1, 'Tom'),
(2, 'Jack'),
(3, 'Mary'),
(4, 'Sally'),
(7, 'Pony');

-- --------------------------------------------------------

--
-- Table structure for table `include`
--

CREATE TABLE `include` (
  `Tname` varchar(4) NOT NULL,
  `Bid` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `Pname` varchar(50) NOT NULL,
  `Sin` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`Pname`, `Sin`) VALUES
('patient_1', 123456789),
('patient_2', 987654321);

-- --------------------------------------------------------

--
-- Table structure for table `receptionist`
--

CREATE TABLE `receptionist` (
  `Rid` int(4) NOT NULL,
  `Rname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `receptionist`
--

INSERT INTO `receptionist` (`Rid`, `Rname`) VALUES
(1, 'recept_1'),
(2, 'recept_2');

-- --------------------------------------------------------

--
-- Table structure for table `treatment`
--

CREATE TABLE `treatment` (
  `TName` varchar(50) NOT NULL,
  `fee` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `treatment`
--

INSERT INTO `treatment` (`TName`, `fee`) VALUES
('cut_hair', 50),
('drink_hot_water', 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`Aid`),
  ADD KEY `Did` (`Did`),
  ADD KEY `Rid` (`Rid`),
  ADD KEY `Sin` (`Sin`),
  ADD KEY `Bid` (`Bid`);

--
-- Indexes for table `belongs`
--
ALTER TABLE `belongs`
  ADD PRIMARY KEY (`BelongId`),
  ADD KEY `Cname` (`Cname`),
  ADD KEY `Did` (`Did`);

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`Bid`);

--
-- Indexes for table `clinic`
--
ALTER TABLE `clinic`
  ADD PRIMARY KEY (`Cname`);

--
-- Indexes for table `dental_assistant`
--
ALTER TABLE `dental_assistant`
  ADD PRIMARY KEY (`DAid`);

--
-- Indexes for table `dentist`
--
ALTER TABLE `dentist`
  ADD PRIMARY KEY (`Did`);

--
-- Indexes for table `include`
--
ALTER TABLE `include`
  ADD KEY `Tname` (`Tname`),
  ADD KEY `Bid` (`Bid`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`Sin`);

--
-- Indexes for table `receptionist`
--
ALTER TABLE `receptionist`
  ADD PRIMARY KEY (`Rid`);

--
-- Indexes for table `treatment`
--
ALTER TABLE `treatment`
  ADD PRIMARY KEY (`TName`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `Aid` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `belongs`
--
ALTER TABLE `belongs`
  MODIFY `BelongId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `Bid` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `dental_assistant`
--
ALTER TABLE `dental_assistant`
  MODIFY `DAid` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `dentist`
--
ALTER TABLE `dentist`
  MODIFY `Did` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `receptionist`
--
ALTER TABLE `receptionist`
  MODIFY `Rid` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`Did`) REFERENCES `dentist` (`Did`),
  ADD CONSTRAINT `appointment_ibfk_3` FOREIGN KEY (`Rid`) REFERENCES `receptionist` (`Rid`),
  ADD CONSTRAINT `appointment_ibfk_4` FOREIGN KEY (`Sin`) REFERENCES `patient` (`Sin`),
  ADD CONSTRAINT `appointment_ibfk_5` FOREIGN KEY (`Bid`) REFERENCES `bill` (`Bid`);

--
-- Constraints for table `belongs`
--
ALTER TABLE `belongs`
  ADD CONSTRAINT `Cname` FOREIGN KEY (`Cname`) REFERENCES `clinic` (`Cname`),
  ADD CONSTRAINT `Did` FOREIGN KEY (`Did`) REFERENCES `dentist` (`Did`);

--
-- Constraints for table `include`
--
ALTER TABLE `include`
  ADD CONSTRAINT `Tname` FOREIGN KEY (`Tname`) REFERENCES `treatment` (`TName`),
  ADD CONSTRAINT `include_ibfk_1` FOREIGN KEY (`Bid`) REFERENCES `bill` (`Bid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
