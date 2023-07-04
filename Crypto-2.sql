-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 06, 2022 at 08:04 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Crypto`
--

-- --------------------------------------------------------

--
-- Table structure for table `Block`
--

CREATE TABLE `Block` (
  `BlockID` int(7) UNSIGNED ZEROFILL NOT NULL,
  `Hash` int(7) UNSIGNED ZEROFILL NOT NULL,
  `TimeStamp` int(7) UNSIGNED ZEROFILL NOT NULL,
  `Size` int(7) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Block`
--

INSERT INTO `Block` (`BlockID`, `Hash`, `TimeStamp`, `Size`) VALUES
(0022533, 0055787, 0063378, 0088427),
(0063857, 0066545, 0044242, 0089872),
(0066576, 0099622, 0044587, 0057553),
(0068889, 0028232, 0088269, 0073427),
(0077588, 0098667, 0042624, 0053555),
(0099637, 0093355, 0034959, 0082338),
(1506287, 8572439, 2081364, 5210796);

-- --------------------------------------------------------

--
-- Table structure for table `BuySell`
--

CREATE TABLE `BuySell` (
  `Code` int(7) UNSIGNED ZEROFILL NOT NULL,
  `UserID` int(7) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `BuySell`
--

INSERT INTO `BuySell` (`Code`, `UserID`) VALUES
(0029874, 0032258),
(0048864, 0038437),
(0052538, 0039839),
(0078935, 0053239),
(0292746, 0059869),
(0936444, 0078474),
(3448997, 0098433);

-- --------------------------------------------------------

--
-- Table structure for table `Cryptocurrency`
--

CREATE TABLE `Cryptocurrency` (
  `Code` int(7) UNSIGNED ZEROFILL NOT NULL,
  `Name` varchar(50) NOT NULL,
  `BlockID` int(7) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Cryptocurrency`
--

INSERT INTO `Cryptocurrency` (`Code`, `Name`, `BlockID`) VALUES
(0029874, 'Monero', 0022533),
(0048864, 'Stellar', 0063857),
(0052538, 'Dogecoin', 0066576),
(0078935, 'Cardano', 0068889),
(0292746, 'Polkadot', 0077588),
(0936444, 'Litecoin', 0099637),
(3448997, 'Bitcoin', 1506287);

-- --------------------------------------------------------

--
-- Table structure for table `CryptoExchange`
--

CREATE TABLE `CryptoExchange` (
  `ExchangeID` int(7) UNSIGNED ZEROFILL NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Website` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `CryptoExchange`
--

INSERT INTO `CryptoExchange` (`ExchangeID`, `Name`, `Website`) VALUES
(0003799, 'Bitcoin', 'https://bitcoinira.com'),
(0006885, 'Dogecoin', 'https://blockfi.com'),
(0292746, 'Cardano', 'https://www.kraken.com'),
(0524228, 'Monero', 'https://crypto.com/eea/'),
(0579329, 'Stellar', 'https://www.coinbase.com'),
(0936444, 'Litecoin', 'https://www.binance.com/en'),
(0977294, 'Polkadot', 'https://www.etoro.com');

-- --------------------------------------------------------

--
-- Table structure for table `Influenced`
--

CREATE TABLE `Influenced` (
  `UserID` int(7) UNSIGNED ZEROFILL NOT NULL,
  `PostID` int(7) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='-';

--
-- Dumping data for table `Influenced`
--

INSERT INTO `Influenced` (`UserID`, `PostID`) VALUES
(0032258, 0396954),
(0038437, 0554939),
(0039839, 0577838),
(0053239, 0588438),
(0059869, 0727237),
(0078474, 0967857),
(0098433, 8366986);

-- --------------------------------------------------------

--
-- Table structure for table `NewTable`
--

CREATE TABLE `NewTable` (
  `ID` varchar(50) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Popularize`
--

CREATE TABLE `Popularize` (
  `PostID` int(7) UNSIGNED ZEROFILL NOT NULL,
  `Code` int(7) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Popularize`
--

INSERT INTO `Popularize` (`PostID`, `Code`) VALUES
(0396954, 0052538),
(0554939, 0078935),
(0577838, 0292746),
(0588438, 0936444),
(0727237, 3448997),
(0967857, 0029874),
(8366986, 0048864);

-- --------------------------------------------------------

--
-- Table structure for table `Post`
--

CREATE TABLE `Post` (
  `PostID` int(7) UNSIGNED ZEROFILL NOT NULL,
  `Author` varchar(50) NOT NULL,
  `Content` varchar(50) NOT NULL,
  `Metadata` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Post`
--

INSERT INTO `Post` (`PostID`, `Author`, `Content`, `Metadata`) VALUES
(0396954, 'Nouha Lamrani', 'Post Facebook', 'Posts effectiveness '),
(0554939, 'Kas Khok', 'Post Twitter', 'Analysing social media performance'),
(0577838, 'Ion Pruteanu', 'Newspapers', 'Creation date and time'),
(0588438, 'Krystian Mowinski', 'Post Telegram', 'Social media engagement'),
(0727237, 'Abbos Abdullaev', 'Advertisment ', 'Digital management'),
(0967857, 'Bayram Tosun', 'Magazines', 'Competitor data'),
(8366986, 'Jad Korayani ', 'Instagram Post', 'custom taxonomies');

-- --------------------------------------------------------

--
-- Table structure for table `Price`
--

CREATE TABLE `Price` (
  `PriceID` int(7) UNSIGNED ZEROFILL NOT NULL,
  `Value` double(7,2) UNSIGNED ZEROFILL NOT NULL,
  `Day` date NOT NULL,
  `Time` timestamp NOT NULL DEFAULT current_timestamp(),
  `Fiatcurrencycode` varchar(35) NOT NULL,
  `Code` int(7) UNSIGNED ZEROFILL NOT NULL,
  `ExchangeID` int(7) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Price`
--

INSERT INTO `Price` (`PriceID`, `Value`, `Day`, `Time`, `Fiatcurrencycode`, `Code`, `ExchangeID`) VALUES
(0008922, 0565.67, '2022-04-14', '2022-04-08 14:57:02', 'CNY', 0052538, 0006885),
(0274347, 0456.45, '2022-04-24', '2022-04-08 16:25:36', 'BZR', 0048864, 0524228),
(0489388, 2345.43, '2022-04-29', '2022-04-08 16:25:36', 'HKD', 0936444, 0936444),
(0595834, 4566.45, '2022-04-28', '2022-04-08 16:25:36', 'EUR', 0078935, 0977294),
(0682453, 0987.45, '2022-04-11', '2022-04-08 16:25:36', 'GBP', 0292746, 0292746),
(0822433, 0554.59, '2022-04-26', '2022-04-08 16:25:36', 'ZAR', 3448997, 0579329),
(0838486, 8675.56, '2022-04-13', '2022-04-08 16:25:36', 'AUD', 0029874, 0003799);

-- --------------------------------------------------------

--
-- Table structure for table `Transaction`
--

CREATE TABLE `Transaction` (
  `TransactionHash` int(7) UNSIGNED ZEROFILL NOT NULL,
  `Fee` double(7,2) UNSIGNED ZEROFILL NOT NULL,
  `Amount` double(7,2) UNSIGNED ZEROFILL NOT NULL,
  `InAddress` varchar(35) NOT NULL,
  `OutAddress` varchar(35) NOT NULL,
  `BlockID` int(7) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Transaction`
--

INSERT INTO `Transaction` (`TransactionHash`, `Fee`, `Amount`, `InAddress`, `OutAddress`, `BlockID`) VALUES
(0022567, 0346.56, 5667.50, '3YuqNMd5gMP8sZbEjBfoubVAci', '3YuqNMd5gMP8sZbEjBfoubVAci', 0022533),
(0026846, 2345.21, 0355.22, '35NFYSXJRVGcxEZ24RkX2RmHRD', '35NFYSXJRVGcxEZ24RkX2RmHRD', 0063857),
(0027883, 0678.50, 4677.78, '3FWQ9etc4QT9R4SdfFxBFFF5NM', '3FWQ9etc4QT9R4SdfFxBFFF5NM', 0066576),
(0058787, 45346.50, 0665.70, '3qRNRfnwszAEEptEKDBGJYUhjB', '3qRNRfnwszAEEptEKDBGJYUhjB', 0068889),
(0074868, 8475.40, 0567.50, '3ywuBAUyHwChRe4Q4Ubc8d94jX', '3ywuBAUyHwChRe4Q4Ubc8d94jX', 0077588),
(0087755, 0123.12, 1234.34, '3X6TE7duLJfVLsFMrooYY2sMuQ', '3X6TE7duLJfVLsFMrooYY2sMuQ', 0099637),
(0099524, 3578.43, 6678.90, '3B9DHFafjt9BTG7BXUneBsuePb', '3B9DHFafjt9BTG7BXUneBsuePb', 1506287);

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `UserID` int(7) UNSIGNED ZEROFILL NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`UserID`, `Username`, `Password`) VALUES
(0032258, 'Nouha_45', 'ZMwLprtdAH'),
(0038437, 'Bayram_321', 'rTuMEuKjCU'),
(0039839, 'kas_78', 'nunGeEDc5u'),
(0053239, 'Krystian98', '2r6YXdSMFu'),
(0059869, 'Jad123', 'Y8gfJDwXnR'),
(0078474, 'abbos167', 'Fps8v3mica'),
(0098433, 'Ion569', 'tYzh8CcjSd');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Block`
--
ALTER TABLE `Block`
  ADD PRIMARY KEY (`BlockID`);

--
-- Indexes for table `BuySell`
--
ALTER TABLE `BuySell`
  ADD KEY `Code` (`Code`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `Cryptocurrency`
--
ALTER TABLE `Cryptocurrency`
  ADD PRIMARY KEY (`Code`),
  ADD UNIQUE KEY `Name` (`Name`),
  ADD UNIQUE KEY `Name_3` (`Name`),
  ADD KEY `Name_2` (`Name`),
  ADD KEY `BlockID` (`BlockID`);

--
-- Indexes for table `CryptoExchange`
--
ALTER TABLE `CryptoExchange`
  ADD PRIMARY KEY (`ExchangeID`),
  ADD UNIQUE KEY `Name` (`Name`);

--
-- Indexes for table `Influenced`
--
ALTER TABLE `Influenced`
  ADD KEY `UserID` (`UserID`,`PostID`),
  ADD KEY `PostID` (`PostID`);

--
-- Indexes for table `Popularize`
--
ALTER TABLE `Popularize`
  ADD KEY `PostID` (`PostID`),
  ADD KEY `Code` (`Code`);

--
-- Indexes for table `Post`
--
ALTER TABLE `Post`
  ADD PRIMARY KEY (`PostID`);

--
-- Indexes for table `Price`
--
ALTER TABLE `Price`
  ADD PRIMARY KEY (`PriceID`),
  ADD KEY `Code` (`Code`),
  ADD KEY `ExchangeID` (`ExchangeID`);

--
-- Indexes for table `Transaction`
--
ALTER TABLE `Transaction`
  ADD PRIMARY KEY (`TransactionHash`),
  ADD KEY `BlockID` (`BlockID`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `Username` (`Username`),
  ADD UNIQUE KEY `Password` (`Password`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `BuySell`
--
ALTER TABLE `BuySell`
  ADD CONSTRAINT `UserID` FOREIGN KEY (`UserID`) REFERENCES `database coursework 2`.`User` (`UserID`),
  ADD CONSTRAINT `fk1_Code` FOREIGN KEY (`Code`) REFERENCES `database coursework 2`.`Cryptocurrency` (`Code`);

--
-- Constraints for table `Cryptocurrency`
--
ALTER TABLE `Cryptocurrency`
  ADD CONSTRAINT `BlockID` FOREIGN KEY (`BlockID`) REFERENCES `database coursework 2`.`Block` (`BlockID`);

--
-- Constraints for table `Influenced`
--
ALTER TABLE `Influenced`
  ADD CONSTRAINT `PostID` FOREIGN KEY (`PostID`) REFERENCES `database coursework 2`.`Post` (`PostID`),
  ADD CONSTRAINT `fk1_UserID` FOREIGN KEY (`UserID`) REFERENCES `database coursework 2`.`User` (`UserID`);

--
-- Constraints for table `Popularize`
--
ALTER TABLE `Popularize`
  ADD CONSTRAINT `fk1Code` FOREIGN KEY (`Code`) REFERENCES `database coursework 2`.`Cryptocurrency` (`Code`),
  ADD CONSTRAINT `fk_Code` FOREIGN KEY (`Code`) REFERENCES `database coursework 2`.`Cryptocurrency` (`Code`),
  ADD CONSTRAINT `fk_PostID` FOREIGN KEY (`PostID`) REFERENCES `database coursework 2`.`Post` (`PostID`);

--
-- Constraints for table `Price`
--
ALTER TABLE `Price`
  ADD CONSTRAINT `Code` FOREIGN KEY (`Code`) REFERENCES `database coursework 2`.`Cryptocurrency` (`Code`),
  ADD CONSTRAINT `ExchangeID` FOREIGN KEY (`ExchangeID`) REFERENCES `database coursework 2`.`CryptoExchange` (`ExchangeID`);

--
-- Constraints for table `Transaction`
--
ALTER TABLE `Transaction`
  ADD CONSTRAINT `fk_BlockID` FOREIGN KEY (`BlockID`) REFERENCES `database coursework 2`.`Block` (`BlockID`),
  ADD CONSTRAINT `x` FOREIGN KEY (`BlockID`) REFERENCES `database coursework 2`.`Block` (`BlockID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
