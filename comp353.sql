-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2020-04-08 20:20:39
-- 服务器版本： 10.4.11-MariaDB
-- PHP 版本： 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `comp353`
--

-- --------------------------------------------------------

--
-- 表的结构 `appointment`
--

CREATE TABLE `appointment` (
  `Aid` int(4) NOT NULL,
  `Sin` int(4) NOT NULL,
  `Did` int(4) NOT NULL,
  `Rid` int(4) NOT NULL,
  `Bid` int(4) NOT NULL,
  `miss` tinyint(1) NOT NULL,
  `data` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `belongs`
--

CREATE TABLE `belongs` (
  `Cname` varchar(4) NOT NULL,
  `Did` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `bill`
--

CREATE TABLE `bill` (
  `Bid` int(4) NOT NULL,
  `Paid` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `clinic`
--

CREATE TABLE `clinic` (
  `Cname` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `dental_assistant`
--

CREATE TABLE `dental_assistant` (
  `DAid` int(4) NOT NULL,
  `DAname` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `dentist`
--

CREATE TABLE `dentist` (
  `Did` int(4) NOT NULL,
  `Dname` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `include`
--

CREATE TABLE `include` (
  `Tname` varchar(4) NOT NULL,
  `Bid` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `patient`
--

CREATE TABLE `patient` (
  `Pname` varchar(4) NOT NULL,
  `Sin` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `receptionist`
--

CREATE TABLE `receptionist` (
  `Rid` int(4) NOT NULL,
  `Rname` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `treatment`
--

CREATE TABLE `treatment` (
  `TName` varchar(4) NOT NULL,
  `fee` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转储表的索引
--

--
-- 表的索引 `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`Aid`);

--
-- 表的索引 `belongs`
--
ALTER TABLE `belongs`
  ADD KEY `Cname` (`Cname`),
  ADD KEY `Did` (`Did`);

--
-- 表的索引 `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`Bid`);

--
-- 表的索引 `clinic`
--
ALTER TABLE `clinic`
  ADD PRIMARY KEY (`Cname`);

--
-- 表的索引 `dental_assistant`
--
ALTER TABLE `dental_assistant`
  ADD PRIMARY KEY (`DAid`);

--
-- 表的索引 `dentist`
--
ALTER TABLE `dentist`
  ADD PRIMARY KEY (`Did`);

--
-- 表的索引 `include`
--
ALTER TABLE `include`
  ADD KEY `Tname` (`Tname`),
  ADD KEY `Bid` (`Bid`);

--
-- 表的索引 `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`Sin`);

--
-- 表的索引 `receptionist`
--
ALTER TABLE `receptionist`
  ADD PRIMARY KEY (`Rid`);

--
-- 表的索引 `treatment`
--
ALTER TABLE `treatment`
  ADD PRIMARY KEY (`TName`);

--
-- 限制导出的表
--

--
-- 限制表 `belongs`
--
ALTER TABLE `belongs`
  ADD CONSTRAINT `Cname` FOREIGN KEY (`Cname`) REFERENCES `clinic` (`Cname`),
  ADD CONSTRAINT `Did` FOREIGN KEY (`Did`) REFERENCES `dentist` (`Did`);

--
-- 限制表 `include`
--
ALTER TABLE `include`
  ADD CONSTRAINT `Bid` FOREIGN KEY (`Bid`) REFERENCES `bill` (`Bid`),
  ADD CONSTRAINT `Tname` FOREIGN KEY (`Tname`) REFERENCES `treatment` (`TName`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
