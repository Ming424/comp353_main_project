-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 13, 2020 at 05:53 AM
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
  `Sin` int(9) NOT NULL,
  `Did` int(4) DEFAULT NULL,
  `Rid` int(4) DEFAULT NULL,
  `Bid` int(4) DEFAULT NULL,
  `miss` tinyint(1) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`Aid`, `Sin`, `Did`, `Rid`, `Bid`, `miss`, `date`) VALUES
(10, 123456789, 1, 1, 1, 0, '2020-01-01'),
(11, 987654321, 2, 2, 2, 0, '2020-01-02'),
(12, 333333333, 3, 3, 3, 1, '2020-01-03'),
(13, 444444444, 4, 4, 4, 1, '2020-01-04'),
(14, 555555555, 7, 5, 5, 1, '2020-01-05'),
(16, 123456789, 1, 1, 1, 1, '2020-04-02'),
(17, 123456789, 1, 1, 1, 1, '2020-04-02'),
(18, 123456789, 1, 1, 1, 1, '2020-04-09'),
(34, 123456789, 1, 1, 1, 1, '2020-04-06'),
(36, 123456789, 1, 1, 1, 1, '2020-04-30'),
(41, 123456789, 1, 1, 1, 1, '0000-00-00'),
(49, 123456789, 1, 1, 1, 1, '2020-04-12');

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
(9, 'clinic_1', 1),
(10, 'clinic_2', 2),
(11, 'clinic_3', 3),
(12, 'clinic_4', 4),
(13, 'clinic_5', 7),
(14, 'clinic_1', 2);

-- --------------------------------------------------------

--
-- Table structure for table `belongs_da`
--

CREATE TABLE `belongs_da` (
  `BelongId` int(11) NOT NULL,
  `Cname` varchar(50) NOT NULL,
  `DAid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `belongs_da`
--

INSERT INTO `belongs_da` (`BelongId`, `Cname`, `DAid`) VALUES
(1, 'clinic_1', 1),
(2, 'clinic_2', 2),
(3, 'clinic_3', 3),
(4, 'clinic_4', 4),
(5, 'clinic_5', 5);

-- --------------------------------------------------------

--
-- Table structure for table `belongs_recep`
--

CREATE TABLE `belongs_recep` (
  `BelongId` int(11) NOT NULL,
  `Cname` varchar(50) NOT NULL,
  `Rid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `belongs_recep`
--

INSERT INTO `belongs_recep` (`BelongId`, `Cname`, `Rid`) VALUES
(1, 'clinic_1', 1),
(2, 'clinic_2', 2),
(3, 'clinic_3', 3),
(4, 'clinic_4', 4),
(5, 'clinic_5', 5);

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
(3, 1),
(4, 0),
(5, 0);

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
('clinic_2'),
('clinic_3'),
('clinic_4'),
('clinic_5');

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
(2, 'DA_2'),
(3, 'DA_3'),
(4, 'DA_4'),
(5, 'DA_5');

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
  `IncludeId` int(11) NOT NULL,
  `Tname` varchar(50) NOT NULL,
  `Bid` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `include`
--

INSERT INTO `include` (`IncludeId`, `Tname`, `Bid`) VALUES
(1, 'braces', 1),
(2, 'examination', 1),
(3, 'extractions', 1),
(4, 'fillings_and_repairs', 1),
(5, 'root_canals', 1),
(6, 'teeth_cleaning', 1),
(7, 'teeth_whitening', 1),
(8, 'examination', 2),
(9, 'extractions', 3),
(10, 'fillings_and_repairs', 1);

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
('patient_3', 333333333),
('patient_4', 444444444),
('patient_5', 555555555),
('patient_6', 666666666),
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
(1, 'recep_1'),
(2, 'recep_2'),
(3, 'recep_3'),
(4, 'recep_4'),
(5, 'recep_5');

-- --------------------------------------------------------

--
-- Table structure for table `treatment`
--

CREATE TABLE `treatment` (
  `Tname` varchar(50) NOT NULL,
  `fee` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `treatment`
--

INSERT INTO `treatment` (`Tname`, `fee`) VALUES
('braces', 7000),
('examination', 30),
('extractions', 80),
('fillings_and_repairs', 30),
('root_canals', 120),
('teeth_cleaning', 65),
('teeth_whitening', 75);

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
-- Indexes for table `belongs_da`
--
ALTER TABLE `belongs_da`
  ADD PRIMARY KEY (`BelongId`),
  ADD KEY `Cname` (`Cname`),
  ADD KEY `DAid` (`DAid`);

--
-- Indexes for table `belongs_recep`
--
ALTER TABLE `belongs_recep`
  ADD PRIMARY KEY (`BelongId`),
  ADD KEY `Cname` (`Cname`),
  ADD KEY `Rid` (`Rid`);

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
  ADD PRIMARY KEY (`IncludeId`),
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
  ADD PRIMARY KEY (`Tname`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `Aid` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `belongs`
--
ALTER TABLE `belongs`
  MODIFY `BelongId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `belongs_da`
--
ALTER TABLE `belongs_da`
  MODIFY `BelongId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `belongs_recep`
--
ALTER TABLE `belongs_recep`
  MODIFY `BelongId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `Bid` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `dental_assistant`
--
ALTER TABLE `dental_assistant`
  MODIFY `DAid` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `dentist`
--
ALTER TABLE `dentist`
  MODIFY `Did` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `include`
--
ALTER TABLE `include`
  MODIFY `IncludeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `receptionist`
--
ALTER TABLE `receptionist`
  MODIFY `Rid` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`Bid`) REFERENCES `bill` (`Bid`),
  ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`Did`) REFERENCES `dentist` (`Did`),
  ADD CONSTRAINT `appointment_ibfk_3` FOREIGN KEY (`Rid`) REFERENCES `receptionist` (`Rid`),
  ADD CONSTRAINT `appointment_ibfk_4` FOREIGN KEY (`Sin`) REFERENCES `patient` (`Sin`);

--
-- Constraints for table `belongs`
--
ALTER TABLE `belongs`
  ADD CONSTRAINT `belongs_ibfk_1` FOREIGN KEY (`Cname`) REFERENCES `clinic` (`Cname`),
  ADD CONSTRAINT `belongs_ibfk_2` FOREIGN KEY (`Did`) REFERENCES `dentist` (`Did`);

--
-- Constraints for table `belongs_da`
--
ALTER TABLE `belongs_da`
  ADD CONSTRAINT `belongs_da_ibfk_1` FOREIGN KEY (`Cname`) REFERENCES `clinic` (`Cname`),
  ADD CONSTRAINT `belongs_da_ibfk_2` FOREIGN KEY (`DAid`) REFERENCES `dental_assistant` (`DAid`);

--
-- Constraints for table `belongs_recep`
--
ALTER TABLE `belongs_recep`
  ADD CONSTRAINT `belongs_recep_ibfk_1` FOREIGN KEY (`Cname`) REFERENCES `clinic` (`Cname`),
  ADD CONSTRAINT `belongs_recep_ibfk_2` FOREIGN KEY (`Rid`) REFERENCES `receptionist` (`Rid`);

--
-- Constraints for table `include`
--
ALTER TABLE `include`
  ADD CONSTRAINT `include_ibfk_1` FOREIGN KEY (`Bid`) REFERENCES `bill` (`Bid`),
  ADD CONSTRAINT `include_ibfk_2` FOREIGN KEY (`Tname`) REFERENCES `treatment` (`Tname`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
