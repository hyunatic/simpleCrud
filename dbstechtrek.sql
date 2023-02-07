-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 07, 2023 at 09:56 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbstechtrek`
--

-- --------------------------------------------------------

--
-- Table structure for table `bank account`
--

CREATE TABLE `bank account` (
  `AccountID` int(10) NOT NULL,
  `UserID` int(10) NOT NULL,
  `AccountType` varchar(255) NOT NULL,
  `AccountBalance` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bank account`
--

INSERT INTO `bank account` (`AccountID`, `UserID`, `AccountType`, `AccountBalance`) VALUES
(621156213, 1, 'Saving', '70200.71');

-- --------------------------------------------------------

--
-- Table structure for table `scheduled transactions`
--

CREATE TABLE `scheduled transactions` (
  `TransactionID` int(10) NOT NULL,
  `AccountID` int(10) NOT NULL,
  `ReceivingAccountID` int(10) NOT NULL,
  `Date` varchar(255) NOT NULL,
  `TransactionAmount` decimal(10,2) NOT NULL,
  `Comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `scheduled transactions`
--

INSERT INTO `scheduled transactions` (`TransactionID`, `AccountID`, `ReceivingAccountID`, `Date`, `TransactionAmount`, `Comment`) VALUES
(1, 621156213, 339657462, '2022-11-\r\n08T04:00:00.000Z', '500.00', 'Monthly Pocket Money');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserID` int(10) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `OptintoPhyStatements` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserID`, `Password`, `Username`, `FirstName`, `LastName`, `Email`, `Address`, `OptintoPhyStatements`) VALUES
(1, 'ExecutiveDBS', 'DBSBestBank2022', 'Tom', 'Lim', 'tomlim@easymail.com', 'Block 123 Serangoon Garden #10-129', b'0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank account`
--
ALTER TABLE `bank account`
  ADD PRIMARY KEY (`AccountID`) USING BTREE,
  ADD KEY `AccountID` (`UserID`);

--
-- Indexes for table `scheduled transactions`
--
ALTER TABLE `scheduled transactions`
  ADD PRIMARY KEY (`TransactionID`),
  ADD KEY `AccountID1` (`AccountID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bank account`
--
ALTER TABLE `bank account`
  MODIFY `AccountID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=621156214;

--
-- AUTO_INCREMENT for table `scheduled transactions`
--
ALTER TABLE `scheduled transactions`
  MODIFY `TransactionID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bank account`
--
ALTER TABLE `bank account`
  ADD CONSTRAINT `AccountID` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);

--
-- Constraints for table `scheduled transactions`
--
ALTER TABLE `scheduled transactions`
  ADD CONSTRAINT `AccountID1` FOREIGN KEY (`AccountID`) REFERENCES `bank account` (`AccountID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
