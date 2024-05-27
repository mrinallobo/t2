-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2024 at 08:02 PM
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
-- Database: `automatedtrading`
--

-- --------------------------------------------------------

--
-- Table structure for table `asset`
--

CREATE TABLE `asset` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assetstrategy-futureuse`
--

CREATE TABLE `assetstrategy-futureuse` (
  `AssetID` int(11) NOT NULL,
  `Asset` varchar(255) NOT NULL,
  `UserID` int(11) NOT NULL,
  `StopLossPercent` float DEFAULT NULL,
  `TakeProfitPercent` float DEFAULT NULL,
  `PositionSizePercent` float DEFAULT NULL,
  `AdjTriggerPrice` float DEFAULT NULL,
  `AdjStopPrice` float DEFAULT NULL,
  `AdjStopLimitPrice` float DEFAULT NULL,
  `AdjTrailingAmount` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `channel`
--

CREATE TABLE `channel` (
  `id` int(40) NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `futures_view`
-- (See below for the actual view)
--
CREATE TABLE `futures_view` (
`id` int(11) unsigned
,`CopyTrade` bit(1)
,`ProviderName` varchar(255)
,`ChannelName` varchar(255)
,`AssetType` varchar(20)
,`InstrumentType` varchar(10)
,`PositionSizePercent` float
,`EntryOffsetPercent` float
,`StopLossPercent` float
,`TP1Percent` float
,`TrailPercent` float
,`BreakevenPercent` float
,`positionAmount` float
,`EntryOffsetAmount` float
,`StopLossAmount` decimal(10,0)
,`TP1Amount` decimal(10,0)
,`TrailAmount` decimal(10,2)
,`BreakEvenAmountPerContract` decimal(10,0)
,`CreationTime` timestamp
,`EntryStrategy` varchar(40)
,`ExitStrategy` varchar(40)
,`PremiumMin` float
,`PremiumMax` float
,`MktCapMin` float
,`MktCapMax` float
,`Size1` float
,`Provider_id` varchar(40)
,`Channel_id` varchar(40)
,`user_id` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `provider`
--

CREATE TABLE `provider` (
  `id` int(40) UNSIGNED NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `signals`
--

CREATE TABLE `signals` (
  `id` int(11) NOT NULL,
  `CreationTime` varchar(30) NOT NULL,
  `ExecutedTime` varchar(30) DEFAULT NULL,
  `AssetType` varchar(20) NOT NULL,
  `InstrumentType` varchar(10) NOT NULL,
  `Action` int(1) NOT NULL,
  `Side` varchar(20) NOT NULL,
  `Instrument` varchar(30) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `MarketPrice` decimal(10,2) NOT NULL,
  `FillPrice` double NOT NULL,
  `Status` varchar(256) DEFAULT NULL,
  `ProviderName` varchar(255) DEFAULT NULL,
  `ChannelName` varchar(255) DEFAULT NULL,
  `Quantity` int(11) NOT NULL,
  `TimeStamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `Channel_id` varchar(40) NOT NULL,
  `Provider_id` varchar(40) NOT NULL,
  `asset_id` varchar(40) NOT NULL,
  `ExecutedQuantity` double NOT NULL,
  `user_id` int(11) NOT NULL,
  `webhook_URL` varchar(255) NOT NULL,
  `Userkey` varchar(40) DEFAULT NULL,
  `Reason` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `signals`
--

INSERT INTO `signals` (`id`, `CreationTime`, `ExecutedTime`, `AssetType`, `InstrumentType`, `Action`, `Side`, `Instrument`, `Price`, `MarketPrice`, `FillPrice`, `Status`, `ProviderName`, `ChannelName`, `Quantity`, `TimeStamp`, `Channel_id`, `Provider_id`, `asset_id`, `ExecutedQuantity`, `user_id`, `webhook_URL`, `Userkey`, `Reason`) VALUES
(4, '12/22/2023 09:40:44', NULL, 'Futures', 'ES', 1, 'open', 'ES MAR24', 4774.00, 0.00, 0, 'timed out', 'farazmatin', 'signalchannel', 0, '2023-12-22 14:40:44', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(5, '12/22/2023 09:45:43', NULL, 'Futures', 'ES', -1, 'open', 'ES MAR24', 4818.00, 0.00, 0, 'timed out', 'shadowtrader', '💫︱futures-alerts', 0, '2023-12-22 14:45:43', '1102240963109331085', '602859673053429776', '', 0, 0, '', NULL, NULL),
(6, '12/22/2023 09:45:43', NULL, 'Futures', 'ES', -1, 'open', 'ES MAR24', 4818.00, 0.00, 0, 'timed out', 'shadowtrader', '💫︱futures-alerts', 0, '2023-12-22 14:45:43', '1102240963109331085', '602859673053429776', '', 0, 0, '', NULL, NULL),
(7, '12/22/2023 09:45:43', NULL, 'Futures', 'ES', -1, 'open', 'ES MAR24', 4818.00, 0.00, 0, 'timed out', 'shadowtrader', '💫︱futures-alerts', 0, '2023-12-22 14:45:43', '1102240963109331085', '602859673053429776', '', 0, 0, '', NULL, NULL),
(8, '12/22/2023 09:45:43', NULL, 'Futures', 'ES', -1, 'open', 'ES MAR24', 4818.00, 0.00, 0, 'timed out', 'shadowtrader', '💫︱futures-alerts', 0, '2023-12-22 14:45:43', '1102240963109331085', '602859673053429776', '', 0, 0, '', NULL, NULL),
(9, '12/22/2023 09:51:24', NULL, 'Futures', 'ES', 1, 'close', 'ES MAR24', 4821.00, 0.00, 0, 'timed out', 'shadowtrader', '💫︱futures-alerts', 0, '2023-12-22 14:51:24', '1102240963109331085', '602859673053429776', '', 0, 0, '', NULL, NULL),
(10, '12/22/2023 09:45:43', NULL, 'Futures', 'ES', 1, 'open', 'ES MAR24', 4818.00, 0.00, 0, 'Enter Long Filled', 'shadowtrader', '💫︱futures-alerts', 0, '2023-12-22 14:45:43', '1102240963109331085', '602859673053429776', '', 0, 0, '', NULL, NULL),
(11, '12/22/2023 10:39:37', NULL, 'Futures', 'NQ', 1, 'open', 'NQ MAR24', 17015.50, 0.00, 0, 'timed out', 'trav_trades', '💫︱futures-alerts', 3, '2023-12-22 15:39:37', '1102240963109331085', '399929170928467968', '', 0, 0, '', NULL, NULL),
(12, '12/22/2023 10:49:58', NULL, 'Futures', 'NQ', -1, 'close', 'NQ MAR24', 17020.25, 0.00, 0, 'timed out', 'trav_trades', '💫︱futures-alerts', 3, '2023-12-22 15:49:58', '1102240963109331085', '399929170928467968', '', 0, 0, '', NULL, NULL),
(13, '12/22/2023 11:03:57', NULL, 'Futures', 'ES', 1, 'open', 'ES MAR24', 4808.25, 0.00, 0, 'Enter Long Filled', 'cedar_trades', '💫︱futures-alerts', 0, '2023-12-22 16:03:57', '1102240963109331085', '706687912225538109', '', 0, 0, '', NULL, NULL),
(14, '12/22/2023 11:06:37', NULL, 'Futures', 'ES', 1, 'open', 'ES MAR24', 4804.75, 0.00, 0, 'skipped - long position exists', 'cedar_trades', '💫︱futures-alerts', 2, '2023-12-22 16:06:37', '1102240963109331085', '706687912225538109', '', 0, 0, '', NULL, NULL),
(15, '12/22/2023 11:08:00', NULL, 'Futures', 'ES', 1, 'open', 'ES MAR24', 4806.00, 0.00, 0, 'skipped - long position exists', 'shadowtrader', '💫︱futures-alerts', 0, '2023-12-22 16:08:00', '1102240963109331085', '602859673053429776', '', 0, 0, '', NULL, NULL),
(16, '12/22/2023 11:13:35', NULL, 'Futures', 'ES', -1, 'close', 'ES MAR24', 4810.50, 0.00, 0, 'Exit Long', 'cedar_trades', '💫︱futures-alerts', 3, '2023-12-22 16:13:35', '1102240963109331085', '706687912225538109', '', 0, 0, '', NULL, NULL),
(17, '12/22/2023 11:23:14', NULL, 'Futures', 'ES', -1, 'close', 'ES MAR24', 4812.00, 0.00, 0, 'skipped - no long position to close', 'shadowtrader', '💫︱futures-alerts', 0, '2023-12-22 16:23:14', '1102240963109331085', '602859673053429776', '', 0, 0, '', NULL, NULL),
(18, '12/22/2023 15:04:10', NULL, 'Futures', 'ES', 1, 'open', 'ES MAR24', 4814.00, 0.00, 0, 'skipped - price out of range', 'farazmatin', 'signalchannel', 0, '2023-12-22 20:04:10', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(19, '12/22/2023 15:05:27', NULL, 'Futures', 'ES', 1, 'open', 'ES MAR24', 4807.00, 0.00, 0, 'Enter Long Filled', 'farazmatin', 'signalchannel', 0, '2023-12-22 20:05:27', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(20, '04/27/2024 09:51:29', NULL, 'Futures', 'NQ', 1, 'open', 'NQ MAR24', 17689.00, 0.00, 0, 'skipped - Not supported', 'farazmatin', 'signalchannel', 2, '2024-04-27 13:51:29', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(22, '04/27/2024 09:51:29', NULL, 'Futures', 'ES', 1, 'open', 'ES MAR24', 4950.00, 0.00, 0, 'skipped - Not supported', 'farazmatin', 'signalchannel', 3, '2024-04-27 13:51:29', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(23, '04/27/2024 10:02:32', NULL, 'Futures', 'NQ', 1, 'open', 'NQ MAR24', 17689.00, 0.00, 0, 'skipped - Not supported', 'farazmatin', 'signalchannel', 2, '2024-04-27 14:02:32', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(24, '04/27/2024 10:02:32', NULL, 'Futures', 'ES', 1, 'open', 'ES MAR24', 4950.00, 0.00, 0, 'skipped - Not supported', 'farazmatin', 'signalchannel', 3, '2024-04-27 14:02:32', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(25, '04/27/2024 10:55:53', NULL, 'Futures', 'NQ', 1, 'open', 'NQ MAR24', 17689.00, 0.00, 0, 'skipped - Not supported', 'farazmatin', 'signalchannel', 2, '2024-04-27 14:55:53', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(26, '04/27/2024 10:55:53', NULL, 'Futures', 'ES', 1, 'open', 'ES MAR24', 4950.00, 0.00, 0, 'skipped - Not supported', 'farazmatin', 'signalchannel', 3, '2024-04-27 14:55:53', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(27, '05/04/2024 17:20:18', NULL, 'Futures', 'ES', 1, 'open', 'ES MAR24', 4950.00, 0.00, 0, 'skipped - Not supported', 'farazmatin', 'signalchannel', 3, '2024-05-04 21:20:19', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(28, '05/04/2024 17:20:18', NULL, 'Futures', 'ES', 1, 'open', 'ES MAR24', 4950.00, 0.00, 0, 'skipped - Not supported', 'farazmatin', 'signalchannel', 3, '2024-05-04 21:20:19', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(29, '05/04/2024 17:20:18', NULL, 'Futures', 'ES', 1, 'open', 'ES MAR24', 4950.00, 0.00, 0, 'skipped - Not supported', 'farazmatin', 'signalchannel', 3, '2024-05-04 21:20:19', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(30, '05/04/2024 17:20:18', NULL, 'Futures', 'ES', 1, 'open', 'ES MAR24', 4950.00, 0.00, 0, 'skipped - Not supported', 'farazmatin', 'signalchannel', 3, '2024-05-04 21:20:19', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(31, '05/04/2024 17:20:18', NULL, 'Futures', 'ES', 1, 'open', 'ES MAR24', 5021.00, 0.00, 0, 'skipped - Not supported', 'farazmatin', 'signalchannel', 3, '2024-05-04 21:20:19', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(32, '05/04/2024 17:20:18', NULL, 'Futures', 'ES', 1, 'open', 'ES MAR24', 5021.00, 0.00, 0, 'skipped - Not supported', 'farazmatin', 'signalchannel', 3, '2024-05-04 21:20:19', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(33, '05/04/2024 17:24:01', NULL, 'Futures', 'NQ', 1, 'open', 'NQ MAR24', 17689.00, 0.00, 0, 'skipped - Not supported', 'farazmatin', 'signalchannel', 2, '2024-05-04 21:24:01', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(34, '05/04/2024 17:24:01', NULL, 'Futures', 'ES', 1, 'open', 'ES MAR24', 4950.00, 0.00, 0, 'skipped - Not supported', 'farazmatin', 'signalchannel', 3, '2024-05-04 21:24:01', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(35, '05/04/2024 17:24:01', NULL, 'Futures', 'ES', 1, 'open', 'ES MAR24', 4950.00, 0.00, 0, 'skipped - Not supported', 'farazmatin', 'signalchannel', 3, '2024-05-04 21:24:01', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(36, '05/04/2024 17:24:01', NULL, 'Futures', 'ES', 1, 'open', 'ES MAR24', 4950.00, 0.00, 0, 'skipped - Not supported', 'farazmatin', 'signalchannel', 3, '2024-05-04 21:24:01', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(37, '05/04/2024 17:24:01', NULL, 'Futures', 'ES', 1, 'open', 'ES MAR24', 4950.00, 0.00, 0, 'skipped - Not supported', 'farazmatin', 'signalchannel', 3, '2024-05-04 21:24:01', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(38, '05/04/2024 17:24:01', NULL, 'Futures', 'ES', 1, 'open', 'ES MAR24', 4950.00, 0.00, 0, 'skipped - Not supported', 'farazmatin', 'signalchannel', 3, '2024-05-04 21:24:01', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(39, '05/04/2024 17:24:01', NULL, 'Futures', 'ES', 1, 'open', 'ES MAR24', 4950.00, 0.00, 0, 'skipped - Not supported', 'farazmatin', 'signalchannel', 3, '2024-05-04 21:24:01', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(40, '05/04/2024 17:24:01', NULL, 'Futures', 'ES', 1, 'open', 'ES MAR24', 5021.00, 0.00, 0, 'skipped - Not supported', 'farazmatin', 'signalchannel', 3, '2024-05-04 21:24:01', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(41, '05/04/2024 17:24:01', NULL, 'Futures', 'ES', 1, 'open', 'ES MAR24', 5021.00, 0.00, 0, 'skipped - Not supported', 'farazmatin', 'signalchannel', 3, '2024-05-04 21:24:01', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(42, '05/04/2024 17:24:01', NULL, 'Futures', 'ES', 1, 'open', 'ES MAR24', 4950.00, 0.00, 0, 'skipped - Not supported', 'farazmatin', 'signalchannel', 3, '2024-05-04 21:24:01', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(43, '05/04/2024 17:24:01', NULL, 'Futures', 'ES', 1, 'open', 'ES MAR24', 4950.00, 0.00, 0, 'skipped - Not supported', 'farazmatin', 'signalchannel', 3, '2024-05-04 21:24:01', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(44, '05/04/2024 17:24:01', NULL, 'Futures', 'ES', 1, 'open', 'ES MAR24', 4950.00, 0.00, 0, 'skipped - Not supported', 'farazmatin', 'signalchannel', 3, '2024-05-04 21:24:01', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(45, '05/04/2024 17:24:01', NULL, 'Futures', 'ES', 1, 'open', 'ES MAR24', 4950.00, 0.00, 0, 'skipped - Not supported', 'farazmatin', 'signalchannel', 3, '2024-05-04 21:24:01', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(46, '05/04/2024 17:24:01', NULL, 'Futures', 'ES', 1, 'open', 'ES MAR24', 5021.00, 0.00, 0, 'skipped - Not supported', 'farazmatin', 'signalchannel', 3, '2024-05-04 21:24:01', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(47, '05/04/2024 17:24:01', NULL, 'Futures', 'ES', 1, 'open', 'ES MAR24', 5021.00, 0.00, 0, 'skipped - Not supported', 'farazmatin', 'signalchannel', 3, '2024-05-04 21:24:01', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(48, '05/04/2024 17:24:01', NULL, 'Futures', 'ES', 1, 'open', 'ES MAR24', 4950.00, 0.00, 0, 'skipped - Not supported', 'farazmatin', 'signalchannel', 3, '2024-05-04 21:24:01', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(49, '05/04/2024 17:24:01', NULL, 'Futures', 'ES', 1, 'open', 'ES MAR24', 4950.00, 0.00, 0, 'skipped - Not supported', 'farazmatin', 'signalchannel', 3, '2024-05-04 21:24:01', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(50, '05/04/2024 17:24:01', NULL, 'Futures', 'ES', 1, 'open', 'ES MAR24', 4950.00, 0.00, 0, 'skipped - Not supported', 'farazmatin', 'signalchannel', 3, '2024-05-04 21:24:01', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(51, '05/04/2024 17:24:01', NULL, 'Futures', 'ES', 1, 'open', 'ES MAR24', 4950.00, 0.00, 0, 'skipped - Not supported', 'farazmatin', 'signalchannel', 3, '2024-05-04 21:24:01', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(52, '05/04/2024 17:24:01', NULL, 'Futures', 'ES', 1, 'open', 'ES MAR24', 5021.00, 0.00, 0, 'skipped - Not supported', 'farazmatin', 'signalchannel', 3, '2024-05-04 21:24:01', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(53, '05/07/2024 17:17:32', NULL, 'Futures', 'ES', 1, 'open', 'ES MAR24', 4888.00, 0.00, 0, 'skipped - Not supported', 'farazmatin', 'signalchannel', 3, '2024-05-07 21:17:32', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(54, '05/07/2024 17:17:32', NULL, 'Futures', 'ES', 1, 'open', 'ES MAR24', 4888.00, 0.00, 0, 'skipped - Not supported', 'farazmatin', 'signalchannel', 3, '2024-05-07 21:17:32', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(55, '05/07/2024 17:17:32', NULL, 'Futures', 'ES', 1, 'open', 'ES MAR24', 4888.00, 0.00, 0, 'skipped - Not supported', 'farazmatin', 'signalchannel', 3, '2024-05-07 21:17:32', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(56, '05/07/2024 17:17:32', NULL, 'Futures', 'ES', 1, 'open', 'ES MAR24', 4888.00, 0.00, 0, 'skipped - Not supported', 'farazmatin', 'signalchannel', 3, '2024-05-07 21:17:32', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(57, '05/07/2024 17:17:32', NULL, 'Futures', 'ES', 1, 'open', 'ES MAR24', 4888.00, 0.00, 0, 'skipped - Not supported', 'farazmatin', 'signalchannel', 3, '2024-05-07 21:17:32', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(58, '05/07/2024 18:09:02', NULL, 'Futures', 'ES', 1, 'open', 'ES MAR24', 5208.00, 0.00, 0, 'skipped - Not supported', 'farazmatin', 'signalchannel', 3, '2024-05-07 22:09:02', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(59, '05/07/2024 18:13:47', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 5209.00, 5166.00, 0, 'skipped - price out of range', 'farazmatin', 'signalchannel', 3, '2024-05-07 22:13:47', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(60, '05/07/2024 18:15:34', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 5210.00, 5210.00, 0, 'skipped - price out of range', 'farazmatin', 'signalchannel', 3, '2024-05-07 22:15:35', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(61, '05/07/2024 18:20:38', '05/07/2024 18:20:37', 'Futures', 'ES', 1, 'open', 'ES JUN24', 5210.00, 5211.00, 5211.25, 'Enter Long Filled', 'farazmatin', 'signalchannel', 3, '2024-05-07 22:20:38', '1100830612383879188', '403285053259513858', '', 3, 0, '', NULL, NULL),
(62, '05/07/2024 18:23:01', NULL, 'Futures', 'ES', -1, 'close', 'ES JUN24', 5210.00, 5211.00, 0, 'Exit Long', 'farazmatin', 'signalchannel', 3, '2024-05-07 22:23:01', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(63, '05/07/2024 18:25:10', '05/07/2024 18:25:13', 'Futures', 'ES', 1, 'open', 'ES JUN24', 5211.00, 5211.25, 5211.25, 'Enter Long Filled', 'farazmatin', 'signalchannel', 3, '2024-05-07 22:25:10', '1100830612383879188', '403285053259513858', '', 3, 0, '', NULL, NULL),
(64, '05/07/2024 18:29:23', NULL, 'Futures', 'ES', -1, 'close', 'ES JUN24', 5210.00, 5212.00, 0, 'Exit Long', 'farazmatin', 'signalchannel', 3, '2024-05-07 22:29:23', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(65, '05/07/2024 18:29:44', '05/07/2024 18:29:45', 'Futures', 'ES', 1, 'open', 'ES JUN24', 5212.00, 5211.75, 5212, 'Enter Long Filled', 'farazmatin', 'signalchannel', 3, '2024-05-07 22:29:44', '1100830612383879188', '403285053259513858', '', 3, 0, '', NULL, NULL),
(66, '05/07/2024 18:35:52', NULL, 'Futures', 'NQ', 1, 'open', 'NQ JUN24', 5212.00, 18184.25, 0, 'skipped - price out of range', 'farazmatin', 'signalchannel', 3, '2024-05-07 22:35:52', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(67, '05/07/2024 18:37:20', NULL, 'Futures', 'NQ', 1, 'open', 'NQ JUN24', 18200.00, 18184.25, 0, 'skipped - price out of range', 'farazmatin', 'signalchannel', 3, '2024-05-07 22:37:20', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(68, '05/07/2024 18:37:49', '05/07/2024 18:37:49', 'Futures', 'NQ', 1, 'open', 'NQ JUN24', 18200.00, 18199.50, 18200.25, 'Enter Long Filled', 'farazmatin', 'signalchannel', 3, '2024-05-07 22:37:49', '1100830612383879188', '403285053259513858', '', 1, 0, '', NULL, NULL),
(69, '05/07/2024 18:38:21', NULL, 'Futures', 'NQ', -1, 'close', 'NQ JUN24', 18200.00, 0.00, 0, 'expired - time', 'farazmatin', 'signalchannel', 3, '2024-05-07 22:38:21', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(70, '05/07/2024 22:10:15', '05/07/2024 22:10:31', 'Futures', 'NQ', 1, 'open', 'NQ JUN24', 18205.00, 18204.75, 18204.75, 'Enter Long Filled', 'farazmatin', 'signalchannel', 3, '2024-05-08 02:10:15', '1100830612383879188', '403285053259513858', '', 1, 0, '', NULL, NULL),
(71, '05/07/2024 22:13:56', NULL, 'Futures', 'NQ', -1, 'close', 'NQ JUN24', 18200.00, 18206.00, 0, 'Exit Long', 'farazmatin', 'signalchannel', 3, '2024-05-08 02:13:56', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(72, '05/07/2024 22:57:20', '05/07/2024 22:57:23', 'Futures', 'ES', 1, 'open', 'ES JUN24', 5212.50, 5212.50, 5212.5, 'Enter Long Filled', 'farazmatin', 'signalchannel', 3, '2024-05-08 02:57:21', '1100830612383879188', '403285053259513858', '', 3, 0, '', NULL, NULL),
(73, '05/07/2024 22:57:52', NULL, 'Futures', 'ES', -1, 'close', 'ES JUN24', 5212.50, 5212.25, 0, 'Exit Long', 'farazmatin', 'signalchannel', 3, '2024-05-08 02:57:52', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(74, '05/07/2024 22:59:00', '05/07/2024 22:59:16', 'Futures', 'ES', -1, 'open', 'ES JUN24', 5212.50, 5212.25, 5212.25, 'Enter Short Filled', 'farazmatin', 'signalchannel', 3, '2024-05-08 02:59:00', '1100830612383879188', '403285053259513858', '', 3, 0, '', NULL, NULL),
(75, '05/07/2024 23:00:17', NULL, 'Futures', 'ES', 1, 'close', 'ES JUN24', 5212.50, 5212.50, 0, 'Exit Short', 'farazmatin', 'signalchannel', 3, '2024-05-08 03:00:17', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(76, '05/08/2024 01:10:25', '05/08/2024 01:10:26', 'Futures', 'ES', 1, 'open', 'ES JUN24', 5211.00, 5211.25, 5211.5, 'Enter Long Filled', 'farazmatin', 'signalchannel', 3, '2024-05-08 05:10:25', '1100830612383879188', '403285053259513858', '', 3, 0, '', NULL, NULL),
(77, '05/08/2024 01:10:42', NULL, 'Futures', 'ES', -1, 'close', 'ES JUN24', 5212.50, 5211.50, 0, 'Exit Long', 'farazmatin', 'signalchannel', 3, '2024-05-08 05:10:42', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(78, '05/08/2024 01:11:59', '05/08/2024 01:12:05', 'Futures', 'ES', 1, 'open', 'ES JUN24', 5211.00, 5211.25, 5211.5, 'Enter Long Filled', 'farazmatin', 'signalchannel', 3, '2024-05-08 05:11:59', '1100830612383879188', '403285053259513858', '', 3, 0, '', NULL, NULL),
(79, '05/08/2024 01:12:08', NULL, 'Futures', 'ES', -1, 'close', 'ES JUN24', 5212.50, 5211.25, 0, 'Exit Long', 'farazmatin', 'signalchannel', 3, '2024-05-08 05:12:08', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(80, '05/08/2024 01:15:27', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 5211.00, 5164.75, 0, 'skipped - price out of range', 'farazmatin', 'signalchannel', 3, '2024-05-08 05:15:27', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(81, '05/08/2024 01:15:38', NULL, 'Futures', 'ES', -1, 'close', 'ES JUN24', 5212.50, 5166.00, 0, 'skipped - no long position to close', 'farazmatin', 'signalchannel', 3, '2024-05-08 05:15:38', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(82, '05/08/2024 01:17:53', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 5211.00, 0.00, 0, 'expired - time', 'farazmatin', 'signalchannel', 3, '2024-05-08 05:17:53', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(83, '05/08/2024 01:27:55', '05/08/2024 01:27:55', 'Futures', 'ES', 1, 'open', 'ES JUN24', 5210.00, 5210.75, 5211, 'Enter Long Filled', 'farazmatin', 'signalchannel', 3, '2024-05-08 05:27:55', '1100830612383879188', '403285053259513858', '', 3, 0, '', NULL, NULL),
(84, '05/08/2024 01:37:00', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 5171.00, 5108.25, 0, 'skipped - price out of range', 'farazmatin', 'signalchannel', 3, '2024-05-08 05:37:00', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(85, '05/08/2024 01:37:36', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 5171.00, 5108.25, 0, 'skipped - price out of range', 'farazmatin', 'signalchannel', 3, '2024-05-08 05:37:36', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(86, '05/08/2024 01:38:52', NULL, 'Futures', 'ES', -1, 'close', 'ES JUN24', 5212.50, 5172.25, 0, 'skipped - no long position to close', 'farazmatin', 'signalchannel', 3, '2024-05-08 05:38:52', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(87, '05/08/2024 01:41:04', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 5171.00, 5108.25, 0, 'skipped - price out of range', 'farazmatin', 'signalchannel', 3, '2024-05-08 05:41:04', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(88, '05/08/2024 01:42:38', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 5172.00, 0.00, 0, 'expired - time', 'farazmatin', 'signalchannel', 3, '2024-05-08 05:42:38', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(89, '05/08/2024 13:26:10', '05/08/2024 13:26:10', 'Futures', 'ES', 1, 'open', 'ES JUN24', 5203.00, 5203.25, 5203.25, 'Enter Long Filled', 'farazmatin', 'signalchannel', 3, '2024-05-08 17:26:10', '1100830612383879188', '403285053259513858', '', 3, 0, '', NULL, NULL),
(90, '05/08/2024 13:26:25', '05/08/2024 13:26:25', 'Futures', 'NQ', 1, 'open', 'NQ JUN24', 18145.00, 18143.00, 18143, 'Enter Long Filled', 'farazmatin', 'signalchannel', 3, '2024-05-08 17:26:25', '1100830612383879188', '403285053259513858', '', 1, 0, '', NULL, NULL),
(91, '05/08/2024 13:38:37', '05/08/2024 13:38:37', 'Futures', 'ES', 1, 'open', 'ES JUN24', 5204.00, 5203.75, 5204, 'Enter Long Filled', 'farazmatin', 'signalchannel', 3, '2024-05-08 17:38:37', '1100830612383879188', '403285053259513858', '', 3, 0, '', NULL, NULL),
(92, '05/08/2024 13:38:53', '05/08/2024 13:38:53', 'Futures', 'NQ', 1, 'open', 'NQ JUN24', 18150.00, 18149.00, 18149.5, 'Enter Long Filled', 'farazmatin', 'signalchannel', 3, '2024-05-08 17:38:53', '1100830612383879188', '403285053259513858', '', 1, 0, '', NULL, NULL),
(93, '05/08/2024 13:43:51', '05/08/2024 13:43:50', 'Futures', 'NQ', 1, 'open', 'NQ JUN24', 18160.00, 18160.00, 18160, 'Enter Long Filled', 'farazmatin', 'signalchannel', 3, '2024-05-08 17:43:51', '1100830612383879188', '403285053259513858', '', 1, 0, '', NULL, NULL),
(94, '05/08/2024 13:43:57', '05/08/2024 13:43:56', 'Futures', 'ES', 1, 'open', 'ES JUN24', 5206.00, 5205.75, 5206, 'Enter Long Filled', 'farazmatin', 'signalchannel', 3, '2024-05-08 17:43:57', '1100830612383879188', '403285053259513858', '', 3, 0, '', NULL, NULL),
(95, '05/08/2024 13:47:54', '05/08/2024 13:47:55', 'Futures', 'ES', 1, 'open', 'ES JUN24', 5208.00, 5208.00, 5208, 'Enter Long Filled', 'farazmatin', 'signalchannel', 3, '2024-05-08 17:47:54', '1100830612383879188', '403285053259513858', '', 3, 0, '', NULL, NULL),
(96, '05/08/2024 13:48:01', '05/08/2024 13:48:01', 'Futures', 'NQ', 1, 'open', 'NQ JUN24', 18166.00, 18165.50, 18165.5, 'Enter Long Filled', 'farazmatin', 'signalchannel', 3, '2024-05-08 17:48:01', '1100830612383879188', '403285053259513858', '', 1, 0, '', NULL, NULL),
(97, '05/08/2024 13:48:41', '05/08/2024 13:48:40', 'Futures', 'NQ', -1, 'open', 'NQ JUN24', 18163.00, 18165.25, 18164.75, 'Enter Short Filled', 'farazmatin', 'signalchannel', 3, '2024-05-08 17:48:41', '1100830612383879188', '403285053259513858', '', 1, 0, '', NULL, NULL),
(98, '05/08/2024 13:50:57', '05/08/2024 13:50:56', 'Futures', 'NQ', -1, 'open', 'NQ JUN24', 18168.00, 18170.00, 18169.75, 'Enter Short Filled', 'farazmatin', 'signalchannel', 3, '2024-05-08 17:50:57', '1100830612383879188', '403285053259513858', '', 1, 0, '', NULL, NULL),
(99, '05/08/2024 14:08:23', '05/08/2024 14:08:22', 'Futures', 'NQ', -1, 'open', 'NQ JUN24', 18178.00, 18178.50, 18178.25, 'Enter Short Filled', 'farazmatin', 'signalchannel', 3, '2024-05-08 18:08:23', '1100830612383879188', '403285053259513858', '', 1, 0, '', NULL, NULL),
(100, '05/08/2024 14:08:38', '05/08/2024 14:08:40', 'Futures', 'ES', -1, 'open', 'ES JUN24', 5211.00, 5211.00, 5211, 'Enter Short Filled', 'farazmatin', 'signalchannel', 3, '2024-05-08 18:08:38', '1100830612383879188', '403285053259513858', '', 3, 0, '', NULL, NULL),
(101, '05/08/2024 14:11:10', '05/08/2024 14:11:10', 'Futures', 'NQ', -1, 'open', 'NQ JUN24', 18180.00, 18180.00, 18179.5, 'Enter Short Filled', 'farazmatin', 'signalchannel', 3, '2024-05-08 18:11:10', '1100830612383879188', '403285053259513858', '', 1, 0, '', NULL, NULL),
(102, '05/08/2024 14:11:16', '05/08/2024 14:11:15', 'Futures', 'ES', -1, 'open', 'ES JUN24', 5211.00, 5211.25, 5211.25, 'Enter Short Filled', 'farazmatin', 'signalchannel', 3, '2024-05-08 18:11:16', '1100830612383879188', '403285053259513858', '', 3, 0, '', NULL, NULL),
(103, '05/08/2024 14:16:09', '05/08/2024 14:16:09', 'Futures', 'NQ', -1, 'open', 'NQ JUN24', 18189.00, 18189.75, 18189.5, 'Enter Short Filled', 'farazmatin', 'signalchannel', 3, '2024-05-08 18:16:09', '1100830612383879188', '403285053259513858', '', 1, 0, '', NULL, NULL),
(104, '05/08/2024 14:16:16', '05/08/2024 14:16:18', 'Futures', 'ES', -1, 'open', 'ES JUN24', 5213.00, 5213.25, 5213, 'Enter Short Filled', 'farazmatin', 'signalchannel', 3, '2024-05-08 18:16:16', '1100830612383879188', '403285053259513858', '', 3, 0, '', NULL, NULL),
(105, '05/08/2024 15:02:47', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 5209.00, 0.00, 0, 'expired - time', 'cedar_trades', '🟨-futures-alerts', 3, '2024-05-08 19:02:47', '829041100181995571', '706687912225538109', '', 0, 0, '', NULL, NULL),
(106, '05/08/2024 15:48:38', NULL, 'Futures', 'ES', -1, 'close', 'ES JUN24', 5216.00, 0.00, 0, 'expired - time', 'cedar_trades', '🟨-futures-alerts', 3, '2024-05-08 19:48:38', '829041100181995571', '706687912225538109', '', 0, 0, '', NULL, NULL),
(107, '05/09/2024 10:22:25', NULL, 'Futures', 'ES', -1, 'open', 'ES JUN24', 5213.00, 5216.75, 0, 'skipped - price out of range', 'farazmatin', 'signalchannel', 3, '2024-05-09 14:22:25', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(108, '05/09/2024 10:30:14', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 5218.00, 0.00, 0, 'expired - time', 'shadowtrader', '🟨-futures-alerts', 1, '2024-05-09 14:30:14', '829041100181995571', '602859673053429776', '', 0, 0, '', NULL, NULL),
(109, '05/09/2024 10:31:48', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 5221.50, 0.00, 0, 'expired - time', 'ocean212', '💫︱futures-alerts', 1, '2024-05-09 14:31:48', '1232475403407327303', '180421030605488128', '', 0, 0, '', NULL, NULL),
(110, '05/09/2024 10:37:04', NULL, 'Futures', 'ES', -1, 'open', 'ES JUN24', 5223.75, 0.00, 0, 'expired - time', 'dcruz', '💫︱futures-alerts', 0, '2024-05-09 14:37:04', '1232475403407327303', '480583337661038602', '', 0, 0, '', NULL, NULL),
(111, '05/09/2024 10:38:43', NULL, 'Futures', 'ES', -1, 'close', 'ES JUN24', 5226.75, 0.00, 0, 'expired - time', 'ocean212', '💫︱futures-alerts', 1, '2024-05-09 14:38:43', '1232475403407327303', '180421030605488128', '', 0, 0, '', NULL, NULL),
(112, '05/09/2024 10:38:46', NULL, 'Futures', 'ES', 1, 'close', 'ES JUN24', 5226.75, 0.00, 0, 'expired - time', 'dcruz', '💫︱futures-alerts', 0, '2024-05-09 14:38:46', '1232475403407327303', '480583337661038602', '', 0, 0, '', NULL, NULL),
(113, '05/09/2024 10:39:08', NULL, 'Futures', 'ES', -1, 'close', 'ES JUN24', 5226.00, 0.00, 0, 'expired - time', 'shadowtrader', '🟨-futures-alerts', 1, '2024-05-09 14:39:08', '829041100181995571', '602859673053429776', '', 0, 0, '', NULL, NULL),
(114, '05/09/2024 11:03:16', NULL, 'Futures', 'ES', -1, 'open', 'ES JUN24', 5231.50, 0.00, 0, 'expired - time', 'dcruz', '💫︱futures-alerts', 0, '2024-05-09 15:03:16', '1232475403407327303', '480583337661038602', '', 0, 0, '', NULL, NULL),
(115, '05/09/2024 11:13:32', NULL, 'Futures', 'ES', 1, 'close', 'ES JUN24', 5228.50, 5229.50, 0, 'skipped - no short position to close', 'dcruz', '💫︱futures-alerts', 0, '2024-05-09 15:13:32', '1232475403407327303', '480583337661038602', '', 0, 0, '', NULL, NULL),
(116, '05/09/2024 11:03:16', NULL, 'Futures', 'ES', -1, 'open', 'ES JUN24', 5231.50, 0.00, 0, 'expired - time', 'dcruz', '💫︱futures-alerts', 0, '2024-05-09 15:03:16', '1232475403407327303', '480583337661038602', '', 0, 0, '', NULL, NULL),
(117, '05/09/2024 11:15:55', '05/09/2024 11:15:54', 'Futures', 'ES', -1, 'open', 'ES JUN24', 5231.00, 5231.50, 5231.25, 'Enter Short Filled', 'farazmatin', 'signalchannel', 3, '2024-05-09 15:15:55', '1100830612383879188', '403285053259513858', '', 3, 0, '', NULL, NULL),
(118, '05/09/2024 11:16:23', NULL, 'Futures', 'ES', 1, 'close', 'ES JUN24', 5231.00, 5230.50, 0, 'Exit Short Placed', 'farazmatin', 'signalchannel', 3, '2024-05-09 15:16:23', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(119, '05/09/2024 11:03:16', NULL, 'Futures', 'ES', -1, 'open', 'ES JUN24', 5229.00, 0.00, 0, 'expired - time', 'dcruz', '💫︱futures-alerts', 0, '2024-05-09 15:03:16', '1232475403407327303', '480583337661038602', '', 0, 0, '', NULL, NULL),
(121, '05/09/2024 11:20:16', NULL, 'Futures', 'ES', -1, 'open', 'ES JUN24', 5229.00, 5166.00, 0, 'skipped - price out of range', 'dcruz', '💫︱futures-alerts', 0, '2024-05-09 15:03:16', '1232475403407327303', '480583337661038602', '', 0, 0, '', NULL, NULL),
(122, '05/09/2024 11:26:16', NULL, 'Futures', 'ES', -1, 'open', 'ES JUN24', 5229.00, 5229.25, 0, 'skipped - price out of range', 'dcruz', '💫︱futures-alerts', 0, '2024-05-09 15:03:16', '1232475403407327303', '480583337661038602', '', 0, 0, '', NULL, NULL),
(123, '05/09/2024 11:40:45', NULL, 'Futures', 'NQ', -1, 'open', 'NQ JUN24', 18220.50, 0.00, 0, 'expired - time', 'trav_trades', '💫︱futures-alerts', 3, '2024-05-09 15:40:45', '1232475403407327303', '399929170928467968', '', 0, 0, '', NULL, NULL),
(124, '05/09/2024 11:44:16', NULL, 'Futures', 'NQ', 1, 'close', 'NQ JUN24', 18210.50, 0.00, 0, 'expired - time', 'trav_trades', '💫︱futures-alerts', 3, '2024-05-09 15:44:16', '1232475403407327303', '399929170928467968', '', 0, 0, '', NULL, NULL),
(125, '05/09/2024 11:58:51', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 5222.00, 5222.00, 0, 'skipped - price out of range', 'shadowtrader', '🟨-futures-alerts', 1, '2024-05-09 15:58:51', '829041100181995571', '602859673053429776', '', 0, 0, '', NULL, NULL),
(126, '05/09/2024 11:59:16', NULL, 'Futures', 'NQ', 1, 'open', 'NQ JUN24', 18177.00, 0.00, 0, 'expired - time', 'trav_trades', '💫︱futures-alerts', 3, '2024-05-09 15:44:16', '1232475403407327303', '399929170928467968', '', 0, 0, '', NULL, NULL),
(127, '05/09/2024 12:03:30', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 5222.25, 5223.75, 0, 'skipped - price out of range', 'dcruz', '💫︱futures-alerts', 0, '2024-05-09 16:03:30', '1232475403407327303', '480583337661038602', '', 0, 0, '', NULL, NULL),
(128, '05/09/2024 12:08:30', '05/09/2024 12:07:35', 'Futures', 'ES', 1, 'open', 'ES JUN24', 5224.00, 5223.75, 5223.75, 'Enter Long Filled', 'dcruz', '💫︱futures-alerts', 0, '2024-05-09 16:03:30', '1232475403407327303', '480583337661038602', '', 3, 0, '', NULL, NULL),
(129, '05/09/2024 12:15:04', NULL, 'Futures', 'ES', -1, 'close', 'ES JUN24', 5226.25, 5226.50, 0, 'Exit Long Placed', 'dcruz', '💫︱futures-alerts', 0, '2024-05-09 16:15:04', '1232475403407327303', '480583337661038602', '', 0, 0, '', NULL, NULL),
(130, '05/09/2024 12:15:06', NULL, 'Futures', 'ES', -1, 'close', 'ES JUN24', 5226.00, 5226.50, 0, 'skipped - no long position to close', 'shadowtrader', '🟨-futures-alerts', 1, '2024-05-09 16:15:06', '829041100181995571', '602859673053429776', '', 0, 0, '', NULL, NULL),
(131, '05/09/2024 12:39:43', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 5227.75, 5227.00, 0, 'skipped - invalid quantity', 'dcruz', '💫︱futures-alerts', 0, '2024-05-09 16:39:43', '1232475403407327303', '480583337661038602', '', 0, 0, '', NULL, NULL),
(132, '05/09/2024 12:55:56', NULL, 'Futures', 'ES', -1, 'close', 'ES JUN24', 5230.75, 5231.25, 0, 'skipped - no long position to close', 'dcruz', '💫︱futures-alerts', 0, '2024-05-09 16:55:56', '1232475403407327303', '480583337661038602', '', 0, 0, '', NULL, NULL),
(133, '05/09/2024 13:07:57', '05/09/2024 13:07:58', 'Futures', 'ES', 1, 'open', 'ES JUN24', 5233.50, 5233.50, 5233.5, 'Enter Long Filled', 'ocean212', '💫︱futures-alerts', 1, '2024-05-09 17:07:57', '1232475403407327303', '180421030605488128', '', 1, 0, '', NULL, NULL),
(134, '05/09/2024 13:19:20', NULL, 'Futures', 'ES', -1, 'close', 'ES JUN24', 5229.50, 5230.00, 0, 'skipped - no long position to close', 'ocean212', '💫︱futures-alerts', 1, '2024-05-09 17:19:20', '1232475403407327303', '180421030605488128', '', 0, 0, '', NULL, NULL),
(135, '05/09/2024 14:32:32', NULL, 'Futures', 'ES', -1, 'close', 'ES JUN24', 5228.00, 0.00, 0, 'expired - time', 'shadowtrader', '🟨-futures-alerts', 1, '2024-05-09 18:32:32', '829041100181995571', '602859673053429776', '', 0, 0, '', NULL, NULL),
(136, '05/09/2024 14:40:52', NULL, 'Futures', 'ES', -1, 'open', 'ES JUN24', 5233.25, 0.00, 0, 'expired - time', 'dcruz', '💫︱futures-alerts', 0, '2024-05-09 18:40:52', '1232475403407327303', '480583337661038602', '', 0, 0, '', NULL, NULL),
(137, '05/09/2024 14:46:15', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 5234.50, 0.00, 0, 'expired - time', 'ocean212', '💫︱futures-alerts', 1, '2024-05-09 18:46:15', '1232475403407327303', '180421030605488128', '', 0, 0, '', NULL, NULL),
(138, '05/09/2024 14:51:57', NULL, 'Futures', 'ES', 1, 'close', 'ES JUN24', 5237.25, 0.00, 0, 'expired - time', 'dcruz', '💫︱futures-alerts', 0, '2024-05-09 18:51:57', '1232475403407327303', '480583337661038602', '', 0, 0, '', NULL, NULL),
(139, '05/09/2024 14:55:09', NULL, 'Futures', 'NQ', 1, 'open', 'NQ JUN24', 18228.25, 0.00, 0, 'expired - time', 'trav_trades', '💫︱futures-alerts', 3, '2024-05-09 18:55:09', '1232475403407327303', '399929170928467968', '', 0, 0, '', NULL, NULL),
(140, '05/09/2024 14:56:51', NULL, 'Futures', 'ES', -1, 'close', 'ES JUN24', 5237.75, 0.00, 0, 'expired - time', 'ocean212', '💫︱futures-alerts', 1, '2024-05-09 18:56:51', '1232475403407327303', '180421030605488128', '', 0, 0, '', NULL, NULL),
(141, '05/09/2024 15:05:36', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 5236.00, 0.00, 0, 'expired - time', 'dcruz', '💫︱futures-alerts', 0, '2024-05-09 19:05:36', '1232475403407327303', '480583337661038602', '', 0, 0, '', NULL, NULL),
(142, '05/09/2024 15:51:20', NULL, 'Futures', 'ES', -1, 'close', 'ES JUN24', 5239.00, 5238.25, 0, 'skipped - no long position to close', 'dcruz', '💫︱futures-alerts', 0, '2024-05-09 19:51:20', '1232475403407327303', '480583337661038602', '', 0, 0, '', NULL, NULL),
(143, '05/09/2024 16:06:24', NULL, 'Futures', 'NQ', 1, 'open', 'NQ JUN24', 18217.50, 0.00, 0, 'expired - time', 'trav_trades', '💫︱futures-alerts', 3, '2024-05-09 20:06:24', '1232475403407327303', '399929170928467968', '', 0, 0, '', NULL, NULL),
(144, '05/09/2024 16:09:07', NULL, 'Futures', 'NQ', -1, 'close', 'NQ JUN24', 18223.75, 0.00, 0, 'expired - time', 'trav_trades', '💫︱futures-alerts', 3, '2024-05-09 20:09:07', '1232475403407327303', '399929170928467968', '', 0, 0, '', NULL, NULL),
(145, '05/09/2024 17:27:07', NULL, 'Futures', 'NQ', -1, 'close', 'NQ JUN24', 18220.00, 0.00, 0, 'expired - time', 'trav_trades', '💫︱futures-alerts', 3, '2024-05-09 20:09:07', '1232475403407327303', '399929170928467968', '', 0, 0, '', NULL, NULL),
(146, '05/09/2024 17:32:07', NULL, 'Futures', 'NQ', -1, 'close', 'NQ JUN24', 18220.00, 0.00, 0, 'expired - time', 'trav_trades', '💫︱futures-alerts', 3, '2024-05-09 20:09:07', '1232475403407327303', '399929170928467968', '', 0, 0, '', NULL, NULL),
(147, '05/20/2024 10:47:51', '05/20/2024 10:47:51', 'Futures', 'ES', 1, 'open', 'ES JUN24', 5345.00, 5345.50, 5345.75, 'Enter Long Filled', 'farazmatin', 'signalchannel', 3, '2024-05-20 14:47:51', '1100830612383879188', '403285053259513858', '', 3, 0, '', NULL, NULL),
(148, '05/20/2024 10:49:05', NULL, 'Futures', 'ES', -1, 'close', 'ES JUN24', 5345.00, 5346.25, 0, 'Exit Long Placed', 'farazmatin', 'signalchannel', 3, '2024-05-20 14:49:05', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(149, '05/20/2024 12:17:27', '05/20/2024 12:17:28', 'Futures', 'ES', -1, 'open', 'ES JUN24', 5341.25, 5341.00, 5340.75, 'Enter Short Filled', 'dcruz', '💫︱futures-alerts', 0, '2024-05-20 16:17:27', '1232475403407327303', '480583337661038602', '', 1, 0, '', NULL, NULL),
(151, '05/20/2024 13:34:05', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 5344.00, 5335.50, 0, 'skipped - price out of range', 'farazmatin', 'signalchannel', 3, '2024-05-20 17:34:05', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(152, '05/20/2024 13:34:25', '05/20/2024 13:34:27', 'Futures', 'ES', 1, 'open', 'ES JUN24', 5336.00, 5336.00, 5336, 'Enter Long Filled', 'farazmatin', 'signalchannel', 3, '2024-05-20 17:34:25', '1100830612383879188', '403285053259513858', '', 3, 0, '', NULL, NULL),
(153, '05/20/2024 13:34:42', NULL, 'Futures', 'ES', -1, 'close', 'ES JUN24', 5345.00, 5336.75, 0, 'Exit Long Placed', 'farazmatin', 'signalchannel', 3, '2024-05-20 17:34:42', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(154, '05/20/2024 12:17:27', '05/20/2024 13:46:28', 'Futures', 'ES', -1, 'open', 'ES JUN24', 5337.00, 5341.00, 5340.75, 'expired - time', 'dcruz', '💫︱futures-alerts', 0, '2024-05-20 16:17:27', '1232475403407327303', '480583337661038602', '', 1, 0, '', NULL, NULL),
(155, '05/20/2024 13:46:36', '05/20/2024 13:46:39', 'Futures', 'ES', 1, 'open', 'ES JUN24', 5337.25, 5337.25, 5337.25, 'Enter Long Filled', 'ocean212', '💫︱futures-alerts', 1, '2024-05-20 17:46:36', '1232475403407327303', '180421030605488128', '', 1, 0, '', NULL, NULL),
(156, '05/20/2024 13:50:27', '05/20/2024 13:48:35', 'Futures', 'ES', -1, 'open', 'ES JUN24', 5337.00, 5336.25, 5336, 'Enter Short Filled', 'dcruz', '💫︱futures-alerts', 0, '2024-05-20 16:17:27', '1232475403407327303', '480583337661038602', '', 1, 0, '', NULL, NULL),
(157, '05/20/2024 13:52:27', '05/20/2024 13:48:35', 'Futures', 'ES', 1, 'close', 'ES JUN24', 5337.00, 5336.25, 5336, 'Exit Short Placed', 'dcruz', '💫︱futures-alerts', 0, '2024-05-20 16:17:27', '1232475403407327303', '480583337661038602', '', 1, 0, '', NULL, NULL),
(158, '05/20/2024 13:53:48', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 5333.25, 0.00, 0, 'expired - time', 'steveo21', '🚀︱member-alerts', 0, '2024-05-20 17:53:48', '1232475511150743632', '493829082924974103', '', 0, 0, '', NULL, NULL),
(159, '05/20/2024 13:54:01', NULL, 'Futures', 'ES', -1, 'close', 'ES JUN24', 5333.25, 5333.50, 0, 'skipped - no long position to close', 'ocean212', '💫︱futures-alerts', 1, '2024-05-20 17:54:01', '1232475403407327303', '180421030605488128', '', 0, 0, '', NULL, NULL),
(160, '05/20/2024 14:01:52', '05/20/2024 14:01:53', 'Futures', 'ES', 1, 'open', 'ES JUN24', 5334.25, 5335.25, 5335.25, 'Enter Long Filled', 'dcruz', '💫︱futures-alerts', 0, '2024-05-20 18:01:52', '1232475403407327303', '480583337661038602', '', 1, 0, '', NULL, NULL),
(161, '05/20/2024 14:08:42', NULL, 'Futures', 'ES', -1, 'close', 'ES JUN24', 5331.25, 5325.75, 0, 'skipped - no long position to close', 'dcruz', '💫︱futures-alerts', 0, '2024-05-20 18:08:42', '1232475403407327303', '480583337661038602', '', 0, 0, '', NULL, NULL),
(162, '05/20/2024 14:08:44', NULL, 'Futures', 'ES', -1, 'close', 'ES JUN24', 5330.25, 0.00, 0, 'expired - time', 'steveo21', '🚀︱member-alerts', 0, '2024-05-20 18:08:44', '1232475511150743632', '493829082924974103', '', 0, 0, '', NULL, NULL),
(163, '05/21/2024 09:56:56', NULL, 'Futures', 'NQ', -1, 'close', 'NQ JUN24', 18718.00, 0.00, 0, 'expired - time', 'srostrades', '💫︱futures-alerts', 5, '2024-05-21 13:56:56', '1232475403407327303', '500695745339588618', '', 0, 0, '', NULL, NULL),
(164, '05/21/2024 10:25:23', '05/21/2024 10:25:24', 'Futures', 'ES', 1, 'open', 'ES JUN24', 5331.00, 5330.75, 5331, 'Enter Long Filled', 'ocean212', '💫︱futures-alerts', 1, '2024-05-21 14:25:23', '1232475403407327303', '180421030605488128', '', 1, 0, '', NULL, NULL),
(165, '05/21/2024 10:34:20', NULL, 'Futures', 'ES', -1, 'close', 'ES JUN24', 5334.00, 5333.50, 0, 'Exit Long Placed', 'ocean212', '💫︱futures-alerts', 1, '2024-05-21 14:34:20', '1232475403407327303', '180421030605488128', '', 0, 0, '', NULL, NULL),
(166, '05/21/2024 10:37:08', NULL, 'Futures', 'NQ', -1, 'open', 'NQ JUN24', 18755.00, 0.00, 0, 'expired - time', 'srostrades', '💫︱futures-alerts', 5, '2024-05-21 14:37:08', '1232475403407327303', '500695745339588618', '', 0, 0, '', NULL, NULL),
(167, '05/21/2024 10:45:20', NULL, 'Futures', 'NQ', 1, 'close', 'NQ JUN24', 18740.75, 0.00, 0, 'expired - time', 'srostrades', '💫︱futures-alerts', 5, '2024-05-21 14:45:20', '1232475403407327303', '500695745339588618', '', 0, 0, '', NULL, NULL),
(168, '05/21/2024 12:50:52', NULL, 'Futures', 'ES', -1, 'close', 'ES JUN24', 5345.00, 5333.25, 0, 'skipped - no long position to close', 'farazmatin', 'signalchannel', 3, '2024-05-21 16:50:52', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(169, '05/21/2024 14:17:24', '05/21/2024 14:17:25', 'Futures', 'ES', 1, 'open', 'ES JUN24', 5337.00, 5337.50, 5337.75, 'Enter Long Filled', 'dcruz', '💫︱futures-alerts', 0, '2024-05-21 18:17:24', '1232475403407327303', '480583337661038602', '', 1, 0, '', NULL, NULL),
(170, '05/21/2024 14:18:15', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 5337.00, 5337.25, 0, 'skipped - long position exists', 'ocean212', '💫︱futures-alerts', 1, '2024-05-21 18:18:15', '1232475403407327303', '180421030605488128', '', 0, 0, '', NULL, NULL),
(171, '05/21/2024 14:30:15', NULL, 'StockOptions', '', 1, 'open', 'MCD_MCDS 230621 C 275', 1.45, 0.00, 0, 'pending', 'farazmatin', 'signalchannel', 1, '2024-05-21 18:30:15', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(172, '05/21/2024 14:30:15', NULL, 'StockOptions', '', 1, 'open', 'MCD_MCDS 230621 C 275', 1.45, 0.00, 0, 'pending', 'farazmatin', 'signalchannel', 1, '2024-05-21 18:30:15', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(173, '05/21/2024 14:30:15', NULL, 'Futures', 'ES', -1, 'close', 'ES JUN24', 534.00, 5336.00, 0, 'skipped - Mismatched provider', 'farazmatin', 'signalchannel', 3, '2024-05-21 18:30:15', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(174, '05/21/2024 14:31:30', NULL, 'Futures', 'ES', -1, 'close', 'ES JUN24', 5345.00, 5337.25, 0, 'skipped - Mismatched provider', 'farazmatin', 'signalchannel', 3, '2024-05-21 18:31:30', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(175, '05/21/2024 14:31:30', NULL, 'Futures', 'ES', -1, 'close', 'ES JUN24', 534.00, 5337.25, 0, 'skipped - Mismatched provider', 'farazmatin', 'signalchannel', 3, '2024-05-21 18:31:30', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(176, '05/21/2024 14:44:52', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 50000.00, 5334.25, 0, 'skipped - price out of range', 'farazmatin', 'signalchannel', 3, '2024-05-21 18:44:52', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(177, '05/21/2024 14:44:52', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 500000.00, 5334.25, 0, 'skipped - price out of range', 'farazmatin', 'signalchannel', 3, '2024-05-21 18:44:52', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(178, '05/21/2024 14:45:49', NULL, 'Futures', 'ES', -1, 'close', 'ES JUN24', 50000.00, 5334.50, 0, 'skipped - no long position to close', 'farazmatin', 'signalchannel', 3, '2024-05-21 18:45:49', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(179, '05/21/2024 14:45:49', NULL, 'Futures', 'ES', -1, 'close', 'ES JUN24', 5000.00, 5334.50, 0, 'skipped - no long position to close', 'farazmatin', 'signalchannel', 3, '2024-05-21 18:45:49', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(180, '05/21/2024 14:49:38', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 12345.00, 5335.25, 0, 'skipped - price out of range', 'farazmatin', 'signalchannel', 3, '2024-05-21 18:49:38', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(181, '05/21/2024 14:49:38', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 123456.00, 5335.25, 0, 'skipped - price out of range', 'farazmatin', 'signalchannel', 3, '2024-05-21 18:49:38', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(182, '05/21/2024 14:50:24', NULL, 'Futures', 'ES', -1, 'close', 'ES JUN24', 12345678.00, 5335.25, 0, 'skipped - no long position to close', 'farazmatin', 'signalchannel', 3, '2024-05-21 18:50:24', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(183, '05/21/2024 14:50:24', NULL, 'Futures', 'ES', -1, 'close', 'ES JUN24', 99999999.99, 5335.25, 0, 'skipped - no long position to close', 'farazmatin', 'signalchannel', 3, '2024-05-21 18:50:24', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(184, '05/21/2024 14:51:14', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 12345678.00, 5335.00, 0, 'skipped - price out of range', 'farazmatin', 'signalchannel', 3, '2024-05-21 18:51:14', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(185, '05/21/2024 14:51:14', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 99999999.99, 5334.75, 0, 'skipped - price out of range', 'farazmatin', 'signalchannel', 3, '2024-05-21 18:51:14', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(186, '05/21/2024 14:57:24', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 1234.00, 5335.75, 0, 'skipped - price out of range', 'farazmatin', 'signalchannel', 3, '2024-05-21 18:57:24', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(187, '05/21/2024 15:05:31', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 12345678.00, 5334.50, 0, 'skipped - price out of range', 'farazmatin', 'signalchannel', 3, '2024-05-21 19:05:31', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(188, '05/21/2024 15:05:36', NULL, 'StockOptions', '', -1, 'close', 'QQQ_QQQS 230522 C 457', 1.33, 0.00, 0, 'pending', 'dcruz', '💎︱options-stock-alerts', 10, '2024-05-21 19:05:36', '1232475648396759132', '480583337661038602', '', 0, 0, '', NULL, NULL),
(189, '05/21/2024 15:10:47', NULL, 'StockOptions', '', 1, 'open', 'MCD_MCDS 230621 C 275', 1.40, 0.00, 0, 'pending', 'farazmatin', 'signalchannel', 1, '2024-05-21 19:10:47', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(190, '05/21/2024 15:14:13', NULL, 'Futures', 'ES', -1, 'close', 'ES JUN24', 534.00, 5340.25, 0, 'skipped - no long position to close', 'ocean212', '💫︱futures-alerts', 1, '2024-05-21 19:14:13', '1232475403407327303', '180421030605488128', '', 0, 0, '', NULL, NULL),
(191, '05/21/2024 15:14:44', NULL, 'Futures', 'ES', -1, 'close', 'ES JUN24', 534.00, 5340.50, 0, 'skipped - no long position to close', 'dcruz', '💫︱futures-alerts', 0, '2024-05-21 19:14:44', '1232475403407327303', '480583337661038602', '', 0, 0, '', NULL, NULL),
(192, '05/21/2024 15:25:47', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 12345678.00, 5339.50, 0, 'skipped - price out of range', 'farazmatin', 'signalchannel', 3, '2024-05-21 19:25:47', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(193, '05/21/2024 15:26:25', NULL, 'StockOptions', '', 1, 'open', 'MCD_MCDS 230621 C 275', 1.40, 0.00, 0, 'pending', 'farazmatin', 'signalchannel', 1, '2024-05-21 19:26:25', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(194, '05/21/2024 15:26:54', NULL, 'StockOptions', '', 1, 'open', 'MCD_MCDS 230621 C 275', 1.40, 0.00, 0, 'pending', 'farazmatin', 'signalchannel', 1, '2024-05-21 19:26:54', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(195, '05/21/2024 15:26:54', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 12345678.00, 5339.50, 0, 'skipped - price out of range', 'farazmatin', 'signalchannel', 3, '2024-05-21 19:26:54', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(196, '05/21/2024 15:27:04', '05/21/2024 15:27:05', 'Futures', 'ES', -1, 'open', 'ES JUN24', 5339.50, 5338.50, 5338.25, 'Enter Short Filled', 'dcruz', '💫︱futures-alerts', 0, '2024-05-21 19:27:04', '1232475403407327303', '480583337661038602', '', 1, 0, '', NULL, NULL),
(197, '05/21/2024 15:28:19', NULL, 'StockOptions', '', 1, 'open', 'MCD_MCDS 230621 C 275', 4.16, 0.00, 0, 'pending', 'farazmatin', 'signalchannel', 1, '2024-05-21 19:28:19', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(198, '05/21/2024 15:28:19', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 98765432.00, 5339.25, 0, 'skipped - position is not flat', 'farazmatin', 'signalchannel', 3, '2024-05-21 19:28:19', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(199, '05/21/2024 15:29:07', NULL, 'StockOptions', '', 1, 'open', 'MCD_MCDS 230621 C 275', 4.16, 0.00, 0, 'pending', 'farazmatin', 'signalchannel', 1, '2024-05-21 19:29:07', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(200, '05/21/2024 15:29:07', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 98765432.00, 5339.00, 0, 'skipped - position is not flat', 'farazmatin', 'signalchannel', 3, '2024-05-21 19:29:07', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(201, '05/21/2024 15:30:07', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 588.00, 5340.00, 0, 'skipped - position is not flat', 'farazmatin', 'signalchannel', 3, '2024-05-21 19:30:07', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(203, '05/21/2024 15:30:46', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 1600.00, 5340.75, 0, 'skipped - position is not flat', 'farazmatin', 'signalchannel', 3, '2024-05-21 19:30:46', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(204, '05/21/2024 15:31:36', NULL, 'Futures', 'ES', 1, 'close', 'ES JUN24', 5341.20, 5342.00, 0, 'skipped - no short position to close', 'dcruz', '💫︱futures-alerts', 0, '2024-05-21 19:31:36', '1232475403407327303', '480583337661038602', '', 0, 0, '', NULL, NULL);
INSERT INTO `signals` (`id`, `CreationTime`, `ExecutedTime`, `AssetType`, `InstrumentType`, `Action`, `Side`, `Instrument`, `Price`, `MarketPrice`, `FillPrice`, `Status`, `ProviderName`, `ChannelName`, `Quantity`, `TimeStamp`, `Channel_id`, `Provider_id`, `asset_id`, `ExecutedQuantity`, `user_id`, `webhook_URL`, `Userkey`, `Reason`) VALUES
(205, '05/21/2024 15:44:53', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 1600.00, 5341.75, 0, 'skipped - price out of range', 'farazmatin', 'signalchannel', 3, '2024-05-21 19:44:53', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(206, '05/21/2024 15:45:39', NULL, 'Futures', 'ES', 1, 'close', 'ES JUN24', 5341.20, 5341.50, 0, 'skipped - no short position to close', 'farazmatin', 'signalchannel', 0, '2024-05-21 19:45:39', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(207, '05/21/2024 15:46:06', NULL, 'Futures', 'ES', 1, 'close', 'ES JUN24', 5341.20, 5341.50, 0, 'skipped - no short position to close', 'farazmatin', 'signalchannel', 2, '2024-05-21 19:46:06', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(208, '05/21/2024 15:47:04', NULL, 'Futures', 'ES', 1, 'close', 'ES JUN24', 1600.00, 5341.25, 0, 'skipped - no short position to close', 'farazmatin', 'signalchannel', 2, '2024-05-21 19:47:04', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(209, '05/21/2024 15:49:18', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 99999999.99, 5341.00, 0, 'skipped - price out of range', 'farazmatin', 'signalchannel', 3, '2024-05-21 19:49:18', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(210, '05/21/2024 15:49:18', NULL, 'Futures', 'ES', -1, 'open', 'ES JUN24', 99999999.99, 5341.00, 0, 'skipped - price out of range', 'farazmatin', 'signalchannel', 3, '2024-05-21 19:49:18', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(211, '05/21/2024 15:49:18', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 5888.00, 5341.00, 0, 'skipped - price out of range', 'farazmatin', 'signalchannel', 3, '2024-05-21 19:49:18', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(212, '05/21/2024 15:49:18', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 16000.00, 5341.00, 0, 'skipped - price out of range', 'farazmatin', 'signalchannel', 3, '2024-05-21 19:49:18', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(213, '05/21/2024 15:49:18', NULL, 'Futures', 'ES', 1, 'close', 'ES JUN24', 16000.00, 5341.00, 0, 'skipped - no short position to close', 'farazmatin', 'signalchannel', 3, '2024-05-21 19:49:18', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(214, '05/21/2024 15:58:25', NULL, 'StockOptions', '', 1, 'open', 'MCD_MCDS 230621 C 275', 4.16, 0.00, 0, 'pending', 'farazmatin', 'signalchannel', 1, '2024-05-21 19:58:25', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(215, '05/21/2024 15:58:25', NULL, 'StockOptions', '', 1, 'open', 'MCD_MCDS 230621 C 275', 4.16, 0.00, 0, 'pending', 'farazmatin', 'signalchannel', 1, '2024-05-21 19:58:25', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(216, '05/21/2024 15:58:25', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 0.00, 5346.75, 0, 'skipped - price out of range', 'farazmatin', 'signalchannel', 3, '2024-05-21 19:58:25', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(217, '05/21/2024 15:58:25', NULL, 'Futures', 'ES', 1, 'close', 'ES JUN24', 0.00, 5346.75, 0, 'skipped - no short position to close', 'farazmatin', 'signalchannel', 0, '2024-05-21 19:58:25', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(218, '05/21/2024 15:58:25', NULL, 'Futures', 'ES', 1, 'close', 'ES JUN24', 0.00, 5346.75, 0, 'skipped - no short position to close', 'farazmatin', 'signalchannel', 2, '2024-05-21 19:58:25', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(219, '05/21/2024 15:58:25', NULL, 'Futures', 'ES', 1, 'close', 'ES JUN24', 0.00, 5347.00, 0, 'skipped - no short position to close', 'farazmatin', 'signalchannel', 2, '2024-05-21 19:58:25', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(220, '05/21/2024 15:58:25', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 0.00, 5347.00, 0, 'skipped - price out of range', 'farazmatin', 'signalchannel', 3, '2024-05-21 19:58:25', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(221, '05/21/2024 15:58:25', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 0.00, 5346.75, 0, 'skipped - price out of range', 'farazmatin', 'signalchannel', 3, '2024-05-21 19:58:25', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(222, '05/21/2024 15:58:25', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 0.00, 5346.75, 0, 'skipped - price out of range', 'farazmatin', 'signalchannel', 3, '2024-05-21 19:58:25', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(223, '05/21/2024 15:58:25', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 0.00, 5346.75, 0, 'skipped - price out of range', 'farazmatin', 'signalchannel', 3, '2024-05-21 19:58:25', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(224, '05/21/2024 15:58:25', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 0.00, 5346.75, 0, 'skipped - price out of range', 'farazmatin', 'signalchannel', 3, '2024-05-21 19:58:25', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(225, '05/21/2024 15:58:25', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 0.00, 5346.75, 0, 'skipped - price out of range', 'farazmatin', 'signalchannel', 3, '2024-05-21 19:58:25', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(226, '05/21/2024 15:58:25', NULL, 'Futures', 'ES', -1, 'open', 'ES JUN24', 0.00, 5347.00, 0, 'skipped - price out of range', 'farazmatin', 'signalchannel', 3, '2024-05-21 19:58:25', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(227, '05/21/2024 15:58:25', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 0.00, 5347.00, 0, 'skipped - price out of range', 'farazmatin', 'signalchannel', 3, '2024-05-21 19:58:25', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(228, '05/21/2024 15:58:25', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 0.00, 5347.00, 0, 'skipped - price out of range', 'farazmatin', 'signalchannel', 3, '2024-05-21 19:58:25', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(229, '05/21/2024 15:58:25', NULL, 'Futures', 'ES', 1, 'close', 'ES JUN24', 0.00, 5347.00, 0, 'skipped - no short position to close', 'farazmatin', 'signalchannel', 3, '2024-05-21 19:58:25', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(230, '05/21/2024 15:58:25', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 0.00, 5347.00, 0, 'skipped - price out of range', 'farazmatin', 'signalchannel', 3, '2024-05-21 19:58:25', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(231, '05/21/2024 15:58:25', NULL, 'Futures', 'ES', -1, 'open', 'ES JUN24', 0.00, 5346.75, 0, 'skipped - price out of range', 'farazmatin', 'signalchannel', 3, '2024-05-21 19:58:25', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(232, '05/21/2024 15:58:25', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 0.00, 5346.75, 0, 'skipped - price out of range', 'farazmatin', 'signalchannel', 3, '2024-05-21 19:58:25', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(233, '05/21/2024 15:58:25', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 0.00, 5347.00, 0, 'skipped - price out of range', 'farazmatin', 'signalchannel', 3, '2024-05-21 19:58:25', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(234, '05/21/2024 15:58:25', NULL, 'Futures', 'ES', 1, 'close', 'ES JUN24', 0.00, 5347.00, 0, 'skipped - no short position to close', 'farazmatin', 'signalchannel', 3, '2024-05-21 19:58:25', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(235, '05/21/2024 16:11:50', NULL, 'Stocks-Forex', '', -1, '', 'AAPL', 0.00, 0.00, 0, 'pending', 'farazmatin', 'signalchannel', 5, '2024-05-21 20:11:50', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(236, '05/21/2024 22:39:18', NULL, 'Futures', 'ES', 1, 'close', 'ES JUN24', 0.00, 5346.75, 0, 'skipped - no short position to close', 'farazmatin', 'signalchannel', 3, '2024-05-22 02:39:18', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(237, '05/21/2024 22:39:18', NULL, 'Stocks-Forex', '', -1, '', 'AAPL', 0.00, 0.00, 0, 'pending', 'farazmatin', 'signalchannel', 5, '2024-05-22 02:39:18', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(238, '05/21/2024 22:39:27', NULL, 'StockOptions', '', 1, 'open', 'MCD_MCDS 230621 C 275', 4.16, 0.00, 0, 'pending', 'farazmatin', 'signalchannel', 1, '2024-05-22 02:39:27', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(239, '05/21/2024 22:51:47', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 123456.00, 5346.50, 0, 'skipped - price out of range', 'farazmatin', 'signalchannel', 3, '2024-05-22 02:51:47', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(240, '05/21/2024 22:51:47', NULL, 'Futures', 'ES', -1, 'close', 'ES JUN24', 99999999.99, 5346.50, 0, 'skipped - no long position to close', 'farazmatin', 'signalchannel', 3, '2024-05-22 02:51:47', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(241, '05/21/2024 22:51:55', NULL, 'StockOptions', '', 1, 'open', 'MCD_MCDS 230621 C 275', 4.16, 0.00, 0, 'pending', 'farazmatin', 'signalchannel', 1, '2024-05-22 02:51:55', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(242, '05/21/2024 22:52:56', NULL, 'Stocks-Forex', '', -1, '', 'AAPL', 1.17, 0.00, 0, 'pending', 'farazmatin', 'signalchannel', 5, '2024-05-22 02:52:56', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(243, '05/21/2024 22:58:10', NULL, 'StockOptions', '', 1, 'open', 'MCD_MCDS 230621 C 275', 4.16, 0.00, 0, 'pending', 'farazmatin', 'signalchannel', 1, '2024-05-22 02:58:10', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(244, '05/21/2024 22:58:10', NULL, 'Stocks-Forex', '', -1, 'close', 'AAPL', 1.17, 0.00, 0, 'pending', 'farazmatin', 'signalchannel', 5, '2024-05-22 02:58:10', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(245, '05/21/2024 22:58:11', NULL, 'Futures', 'ES', 1, 'close', 'ES JUN24', 16000.00, 5346.75, 0, 'skipped - no short position to close', 'farazmatin', 'signalchannel', 3, '2024-05-22 02:58:11', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(246, '05/21/2024 23:05:19', NULL, 'StockOptions', '275', 1, 'open', 'MCD_MCDS 230621 C 275', 4.16, 0.00, 0, 'pending', 'farazmatin', 'signalchannel', 1, '2024-05-22 03:05:19', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(247, '05/21/2024 23:05:19', NULL, 'Futures', 'ES', 1, 'close', 'ES JUN24', 16000.00, 5346.50, 0, 'skipped - no short position to close', 'farazmatin', 'signalchannel', 3, '2024-05-22 03:05:19', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(248, '05/21/2024 23:05:19', NULL, 'Stocks-Forex', '', -1, 'close', 'AAPL', 1.17, 0.00, 0, 'pending', 'farazmatin', 'signalchannel', 5, '2024-05-22 03:05:19', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(249, '05/21/2024 23:08:18', NULL, 'StockOptions', 'MCD', 1, 'open', 'MCD_MCDS 230621 C 275', 4.16, 0.00, 0, 'pending', 'farazmatin', 'signalchannel', 1, '2024-05-22 03:08:18', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(250, '05/21/2024 23:08:18', NULL, 'Futures', 'ES', 1, 'close', 'ES JUN24', 16000.00, 5346.25, 0, 'skipped - no short position to close', 'farazmatin', 'signalchannel', 3, '2024-05-22 03:08:18', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(251, '05/21/2024 23:08:18', NULL, 'Stocks-Forex', 'AAPL', -1, 'close', 'AAPL', 1.17, 0.00, 0, 'pending', 'farazmatin', 'signalchannel', 5, '2024-05-22 03:08:18', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(252, '05/22/2024 02:06:03', NULL, 'Futures', 'ES', -1, 'close', 'ES JUN24', 5344.50, 5344.25, 0, 'skipped - no long position to close', 'ocean212', '💫︱futures-alerts', 1, '2024-05-22 06:06:03', '1232475403407327303', '180421030605488128', '', 0, 0, '', NULL, NULL),
(253, '05/22/2024 10:56:03', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 123456.00, 5340.75, 0, 'skipped - price out of range', 'farazmatin', 'signalchannel', 3, '2024-05-22 14:56:03', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(254, '05/22/2024 11:06:15', NULL, 'Futures', 'ES', 1, 'close', 'ES JUN24', 5344.25, 0.00, 0, 'expired - time', 'trav_trades', '💫︱futures-alerts', 3, '2024-05-22 15:06:15', '1232475403407327303', '399929170928467968', '', 0, 0, '', NULL, NULL),
(255, '05/22/2024 11:06:33', NULL, 'Futures', 'ES', -1, 'close', 'ES JUN24', 5344.00, 5344.25, 0, 'skipped - no long position to close', 'ocean212', '💫︱futures-alerts', 1, '2024-05-22 15:06:33', '1232475403407327303', '180421030605488128', '', 0, 0, '', NULL, NULL),
(256, '05/22/2024 11:14:14', NULL, 'StockOptions', 'CRWD', -1, 'close', 'CRWD_CRWDS 230524 C 360', 0.82, 0.00, 0, 'pending', 'moonshotdg', '💎︱options-stock-alerts', 2, '2024-05-22 15:14:14', '1232475648396759132', '936406954706878555', '', 0, 0, '', NULL, NULL),
(257, '05/22/2024 11:15:00', NULL, 'StockOptions', 'CRWD', -1, 'close', 'CRWD_CRWDS 230524 C 360', 0.82, 0.00, 0, 'pending', 'moonshotdg', '💎︱options-stock-alerts', 2, '2024-05-22 15:15:00', '1232475648396759132', '936406954706878555', '', 0, 0, '', NULL, NULL),
(258, '05/22/2024 11:18:46', NULL, 'Futures', 'GC', 1, 'open', 'GC JUN24', 2394.50, 0.00, 0, 'pending', 'trav_trades', '💫︱futures-alerts', 3, '2024-05-22 15:18:46', '1232475403407327303', '399929170928467968', '', 0, 0, '', NULL, NULL),
(259, '05/22/2024 11:21:42', NULL, 'Futures', 'GC', -1, 'close', 'GC JUN24', 2396.10, 0.00, 0, 'pending', 'trav_trades', '💫︱futures-alerts', 3, '2024-05-22 15:21:42', '1232475403407327303', '399929170928467968', '', 0, 0, '', NULL, NULL),
(260, '05/22/2024 11:22:03', NULL, 'Futures', 'ES', -1, 'close', 'ES JUN24', 5343.50, 5342.25, 0, 'skipped - no long position to close', 'dcruz', '💫︱futures-alerts', 0, '2024-05-22 15:22:03', '1232475403407327303', '480583337661038602', '', 0, 0, '', NULL, NULL),
(261, '05/22/2024 11:29:54', NULL, 'Stocks-Forex', 'MGCM', 1, 'open', 'MGCM', 2392.70, 0.00, 0, 'pending', 'presten.7', '💫︱futures-alerts', 2, '2024-05-22 15:29:54', '1232475403407327303', '820065977584451636', '', 0, 0, '', NULL, NULL),
(262, '05/22/2024 11:31:59', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 5340.75, 0.00, 0, 'expired - time', 'trav_trades', '💫︱futures-alerts', 3, '2024-05-22 15:31:59', '1232475403407327303', '399929170928467968', '', 0, 0, '', NULL, NULL),
(263, '05/22/2024 11:35:35', '05/22/2024 11:35:35', 'Futures', 'ES', 1, 'open', 'ES JUN24', 5340.75, 5341.00, 5341, 'Enter Long Filled', 'dcruz', '💫︱futures-alerts', 0, '2024-05-22 15:35:35', '1232475403407327303', '480583337661038602', '', 1, 0, '', NULL, NULL),
(264, '05/22/2024 11:44:29', NULL, 'Futures', 'ES', -1, 'close', 'ES JUN24', 5340.75, 0.00, 0, 'expired - time', 'trav_trades', '💫︱futures-alerts', 3, '2024-05-22 15:44:29', '1232475403407327303', '399929170928467968', '', 0, 0, '', NULL, NULL),
(265, '05/22/2024 11:50:25', NULL, 'Futures', 'ES', -1, 'close', 'ES JUN24', 5338.75, 5337.00, 0, 'skipped - no long position to close', 'dcruz', '💫︱futures-alerts', 0, '2024-05-22 15:50:25', '1232475403407327303', '480583337661038602', '', 0, 0, '', NULL, NULL),
(266, '05/22/2024 11:50:50', '05/22/2024 11:50:50', 'Futures', 'ES', 1, 'open', 'ES JUN24', 5334.25, 5335.25, 5335.5, 'Enter Long Filled', 'ocean212', '💫︱futures-alerts', 1, '2024-05-22 15:50:50', '1232475403407327303', '180421030605488128', '', 1, 0, '', NULL, NULL),
(267, '05/22/2024 11:53:00', NULL, 'Futures', 'ES', -1, 'close', 'ES JUN24', 5337.25, 5337.00, 0, 'Exit Long Placed', 'ocean212', '💫︱futures-alerts', 1, '2024-05-22 15:53:00', '1232475403407327303', '180421030605488128', '', 0, 0, '', NULL, NULL),
(268, '05/22/2024 11:55:01', NULL, 'StockOptions', 'XOM', -1, 'close', 'XOM_XOMS 230524 C 117', 0.44, 0.00, 0, 'pending', 'farazmatin', 'signalchannel', 50, '2024-05-22 15:55:01', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(269, '05/22/2024 11:55:01', NULL, 'StockOptions', 'NKE', -1, 'close', 'NKE_NKES 230524 C 94', 0.17, 0.00, 0, 'pending', 'farazmatin', 'signalchannel', 3, '2024-05-22 15:55:01', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(270, '05/22/2024 11:55:01', NULL, 'StockOptions', 'AMD', 1, 'open', 'AMD_AMDS 230524 C 175', 1.30, 0.00, 0, 'pending', 'farazmatin', 'signalchannel', 5, '2024-05-22 15:55:01', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(271, '05/22/2024 11:55:01', NULL, 'StockOptions', 'CRWD', -1, 'close', 'CRWD_CRWDS 230524 C 360', 0.82, 0.00, 0, 'pending', 'farazmatin', 'signalchannel', 2, '2024-05-22 15:55:01', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(272, '05/22/2024 11:58:54', NULL, 'Stocks-Forex', 'MGCM', 1, 'open', 'MGCM', 2392.70, 0.00, 0, 'pending', 'presten.7', '💫︱futures-alerts', 2, '2024-05-22 15:29:54', '1232475403407327303', '820065977584451636', '', 0, 0, '', NULL, NULL),
(273, '05/22/2024 11:58:50', NULL, 'Futures', 'GC', 1, 'open', 'GC JUN24', 2396.10, 0.00, 0, 'pending', 'trav_trades', '💫︱futures-alerts', 3, '2024-05-22 15:58:50', '1232475403407327303', '399929170928467968', '', 0, 0, '', NULL, NULL),
(274, '05/22/2024 11:59:17', NULL, 'Futures', 'ES', 1, 'close', 'ES JUN24', 16000.00, 5338.25, 0, 'skipped - no short position to close', 'farazmatin', 'signalchannel', 3, '2024-05-22 15:59:17', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(275, '05/22/2024 12:01:54', NULL, 'Stocks-Forex', 'MGCM', -1, 'close', 'MGCM', 2397.40, 0.00, 0, 'pending', 'presten.7', '💫︱futures-alerts', 2, '2024-05-22 16:01:54', '1232475403407327303', '820065977584451636', '', 0, 0, '', NULL, NULL),
(276, '05/22/2024 12:02:21', NULL, 'Futures', 'GC', -1, 'close', 'GC JUN24', 2397.30, 0.00, 0, 'pending', 'trav_trades', '💫︱futures-alerts', 3, '2024-05-22 16:02:21', '1232475403407327303', '399929170928467968', '', 0, 0, '', NULL, NULL),
(277, '05/22/2024 12:23:36', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 5340.50, 0.00, 0, 'expired - time', 'dcruz', '💫︱futures-alerts', 0, '2024-05-22 16:23:36', '1232475403407327303', '480583337661038602', '', 0, 0, '', NULL, NULL),
(278, '05/22/2024 12:37:37', NULL, 'Futures', 'NQ', 1, 'open', 'NQ JUN24', 18808.00, 0.00, 0, 'expired - time', 'srostrades', '💫︱futures-alerts', 10, '2024-05-22 16:37:37', '1232475403407327303', '500695745339588618', '', 0, 0, '', NULL, NULL),
(279, '05/22/2024 12:41:01', NULL, 'Futures', 'NQ', 1, 'close', 'NQ JUN24', 18819.00, 0.00, 0, 'expired - time', 'srostrades', '💫︱futures-alerts', 7, '2024-05-22 16:41:01', '1232475403407327303', '500695745339588618', '', 0, 0, '', NULL, NULL),
(280, '05/22/2024 12:42:16', NULL, 'Futures', 'NQ', -1, 'close', 'NQ JUN24', 18819.00, 0.00, 0, 'expired - time', 'srostrades', '💫︱futures-alerts', 7, '2024-05-22 16:42:16', '1232475403407327303', '500695745339588618', '', 0, 0, '', NULL, NULL),
(281, '05/22/2024 12:47:12', NULL, 'Futures', 'NQ', -1, 'close', 'NQ JUN24', 18812.00, 18801.25, 0, 'skipped - no long position to close', 'srostrades', '💫︱futures-alerts', 3, '2024-05-22 16:47:12', '1232475403407327303', '500695745339588618', '', 0, 0, '', NULL, NULL),
(282, '05/22/2024 12:49:58', NULL, 'Futures', 'ES', -1, 'open', 'ES JUN24', 5339.25, 5339.25, 0, 'skipped - price out of range', 'ocean212', '💫︱futures-alerts', 1, '2024-05-22 16:49:58', '1232475403407327303', '180421030605488128', '', 0, 0, '', NULL, NULL),
(283, '05/22/2024 12:56:34', NULL, 'Futures', 'GC', 1, 'open', 'GC JUN24', 2396.90, 0.00, 0, 'pending', 'trav_trades', '💫︱futures-alerts', 3, '2024-05-22 16:56:34', '1232475403407327303', '399929170928467968', '', 0, 0, '', NULL, NULL),
(284, '05/22/2024 13:04:44', NULL, 'Futures', 'GC', -1, 'close', 'GC JUN24', 2396.10, 0.00, 0, 'pending', 'trav_trades', '💫︱futures-alerts', 3, '2024-05-22 17:04:44', '1232475403407327303', '399929170928467968', '', 0, 0, '', NULL, NULL),
(285, '05/22/2024 13:09:19', NULL, 'StockOptions', 'XOM', -1, 'close', 'XOM_XOMS 230524 C 117', 0.54, 0.00, 0, 'pending', 'bcf', '💎︱options-stock-alerts', 50, '2024-05-22 17:09:19', '1232475648396759132', '526074289640833025', '', 0, 0, '', NULL, NULL),
(286, '05/22/2024 13:09:23', NULL, 'Futures', 'ES', 1, 'close', 'ES JUN24', 5342.25, 5341.75, 0, 'skipped - no short position to close', 'ocean212', '💫︱futures-alerts', 1, '2024-05-22 17:09:23', '1232475403407327303', '180421030605488128', '', 0, 0, '', NULL, NULL),
(287, '05/22/2024 13:17:22', NULL, 'Futures', 'ES', -1, 'close', 'ES JUN24', 5343.50, 5342.75, 0, 'skipped - no long position to close', 'dcruz', '💫︱futures-alerts', 0, '2024-05-22 17:17:22', '1232475403407327303', '480583337661038602', '', 0, 0, '', NULL, NULL),
(288, '05/22/2024 13:49:49', NULL, 'Stocks-Forex', '', 1, 'open', 'MES', 5333.25, 0.00, 0, 'pending', 'farazmatin', 'signalchannel', 5, '2024-05-22 17:49:49', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(289, '05/22/2024 14:04:30', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 5316.75, 0.00, 0, 'expired - time', 'dcruz', '💫︱futures-alerts', 0, '2024-05-22 18:04:30', '1232475403407327303', '480583337661038602', '', 0, 0, '', NULL, NULL),
(290, '05/22/2024 14:05:39', NULL, 'Futures', 'ES', -1, 'close', 'ES JUN24', 5324.75, 5331.25, 0, 'skipped - no long position to close', 'dcruz', '💫︱futures-alerts', 0, '2024-05-22 18:05:39', '1232475403407327303', '480583337661038602', '', 0, 0, '', NULL, NULL),
(291, '05/22/2024 14:11:42', NULL, 'StockOptions', '', 1, 'open', 'COIN_COINS 230719 C 350', 5.65, 0.00, 0, 'pending', 'evapanda', '💎︱options-stock-alerts', 3, '2024-05-22 18:11:42', '1232475648396759132', '536430344489009153', '', 0, 0, '', NULL, NULL),
(292, '05/22/2024 14:19:25', NULL, 'StockOptions', '', -1, 'close', 'PFE_PFES 230920 C 29', 1.72, 0.00, 0, 'pending', 'jw2014', '💎︱options-stock-alerts', 3, '2024-05-22 18:19:25', '1232475648396759132', '625952281040257034', '', 0, 0, '', NULL, NULL),
(293, '05/23/2024 00:33:23', NULL, 'StockOptions', '', -1, 'close', 'XOM_XOMS 230524 C 117', 0.44, 0.00, 0, 'pending', 'farazmatin', 'signalchannel', 50, '2024-05-23 04:33:23', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(294, '05/23/2024 00:33:23', NULL, 'StockOptions', '', -1, 'close', 'NKE_NKES 230524 C 94', 0.17, 0.00, 0, 'pending', 'farazmatin', 'signalchannel', 3, '2024-05-23 04:33:23', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(295, '05/23/2024 00:33:23', NULL, 'StockOptions', '', 1, 'open', 'AMD_AMDS 230524 C 175', 1.30, 0.00, 0, 'pending', 'farazmatin', 'signalchannel', 5, '2024-05-23 04:33:24', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(296, '05/23/2024 00:33:23', NULL, 'StockOptions', '', -1, 'close', 'CRWD_CRWDS 230524 C 360', 0.82, 0.00, 0, 'pending', 'farazmatin', 'signalchannel', 2, '2024-05-23 04:33:24', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(297, '05/23/2024 00:33:23', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 123456.00, 5361.25, 0, 'skipped - price out of range', 'farazmatin', 'signalchannel', 3, '2024-05-23 04:33:24', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(298, '05/23/2024 00:33:23', NULL, 'Futures', 'ES', 1, 'close', 'ES JUN24', 16000.00, 5361.25, 0, 'skipped - no short position to close', 'farazmatin', 'signalchannel', 3, '2024-05-23 04:33:24', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(299, '05/23/2024 00:33:23', NULL, 'Stocks-Forex', '', 1, 'open', 'MES', 5333.25, 0.00, 0, 'pending', 'farazmatin', 'signalchannel', 5, '2024-05-23 04:33:24', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(300, '05/23/2024 00:33:23', NULL, 'Stocks-Forex', '', 1, 'open', 'MES', 5333.25, 0.00, 0, 'pending', 'farazmatin', 'signalchannel', 5, '2024-05-23 04:33:24', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(301, '05/23/2024 00:33:24', NULL, 'StockOptions', '', -1, 'close', 'XOM_XOMS 230524 C 117', 0.44, 0.00, 0, 'pending', 'farazmatin', 'signalchannel', 50, '2024-05-23 04:33:24', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(302, '05/23/2024 00:33:24', NULL, 'StockOptions', '', -1, 'close', 'NKE_NKES 230524 C 94', 0.17, 0.00, 0, 'pending', 'farazmatin', 'signalchannel', 3, '2024-05-23 04:33:24', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(303, '05/23/2024 00:33:24', NULL, 'StockOptions', '', 1, 'open', 'AMD_AMDS 230524 C 175', 1.30, 0.00, 0, 'pending', 'farazmatin', 'signalchannel', 5, '2024-05-23 04:33:24', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(304, '05/23/2024 00:33:24', NULL, 'StockOptions', '', -1, 'close', 'CRWD_CRWDS 230524 C 360', 0.82, 0.00, 0, 'pending', 'farazmatin', 'signalchannel', 2, '2024-05-23 04:33:24', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(305, '05/23/2024 00:33:24', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 123456.00, 5361.25, 0, 'skipped - price out of range', 'farazmatin', 'signalchannel', 3, '2024-05-23 04:33:24', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(306, '05/23/2024 00:33:24', NULL, 'Futures', 'ES', 1, 'close', 'ES JUN24', 16000.00, 5361.25, 0, 'skipped - no short position to close', 'farazmatin', 'signalchannel', 3, '2024-05-23 04:33:24', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(307, '05/23/2024 00:33:24', NULL, 'Stocks-Forex', '', 1, 'open', 'MES', 5333.25, 0.00, 0, 'pending', 'farazmatin', 'signalchannel', 5, '2024-05-23 04:33:24', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(308, '05/23/2024 00:33:24', NULL, 'Stocks-Forex', '', 1, 'open', 'MES', 5333.25, 0.00, 0, 'pending', 'farazmatin', 'signalchannel', 5, '2024-05-23 04:33:24', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(309, '05/23/2024 00:33:24', NULL, 'StockOptions', '', -1, 'close', 'XOM_XOMS 230524 C 117', 0.44, 0.00, 0, 'pending', 'farazmatin', 'signalchannel', 50, '2024-05-23 04:33:24', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(310, '05/23/2024 00:33:24', NULL, 'StockOptions', '', -1, 'close', 'NKE_NKES 230524 C 94', 0.17, 0.00, 0, 'pending', 'farazmatin', 'signalchannel', 3, '2024-05-23 04:33:24', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(311, '05/23/2024 00:33:24', NULL, 'StockOptions', '', 1, 'open', 'AMD_AMDS 230524 C 175', 1.30, 0.00, 0, 'pending', 'farazmatin', 'signalchannel', 5, '2024-05-23 04:33:24', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(312, '05/23/2024 00:33:24', NULL, 'StockOptions', '', -1, 'close', 'CRWD_CRWDS 230524 C 360', 0.82, 0.00, 0, 'pending', 'farazmatin', 'signalchannel', 2, '2024-05-23 04:33:24', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(313, '05/23/2024 00:33:24', NULL, 'Futures', 'ES', 1, 'close', 'ES JUN24', 16000.00, 5361.50, 0, 'skipped - no short position to close', 'farazmatin', 'signalchannel', 3, '2024-05-23 04:33:24', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(314, '05/23/2024 00:33:24', NULL, 'Stocks-Forex', '', 1, 'open', 'MES', 5333.25, 0.00, 0, 'pending', 'farazmatin', 'signalchannel', 5, '2024-05-23 04:33:24', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(315, '05/23/2024 00:33:24', NULL, 'Stocks-Forex', '', 1, 'open', 'MES', 5333.25, 0.00, 0, 'pending', 'farazmatin', 'signalchannel', 5, '2024-05-23 04:33:24', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(316, '05/23/2024 00:33:25', NULL, 'Futures', 'ES', -1, 'close', 'ES JUN24', 99999999.99, 5361.50, 0, 'skipped - no long position to close', 'farazmatin', 'signalchannel', 3, '2024-05-23 04:33:25', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(317, '05/23/2024 08:56:03', NULL, 'Stocks-Forex', '', 0, 'Null', 'ES', 5366.00, 0.00, 0, 'pending', 'turnerdan94', '🚀︱member-alerts', 0, '2024-05-23 12:56:03', '1232475511150743632', '907996064630587432', '', 0, 0, '', NULL, NULL),
(318, '05/23/2024 09:35:57', '05/23/2024 09:35:57', 'Futures', 'ES', 1, 'open', 'ES JUN24', 5347.25, 5348.00, 5348, 'Enter Long Filled', 'dcruz', '💫︱futures-alerts', 0, '2024-05-23 13:35:57', '1232475403407327303', '480583337661038602', '', 1, 0, '', NULL, NULL),
(319, '05/23/2024 09:37:35', NULL, 'Futures', 'ES', -1, 'close', 'ES JUN24', 5344.25, 5344.75, 0, 'skipped - no long position to close', 'dcruz', '💫︱futures-alerts', 0, '2024-05-23 13:37:35', '1232475403407327303', '480583337661038602', '', 0, 0, '', NULL, NULL),
(320, '05/23/2024 09:38:45', '05/23/2024 09:38:45', 'Futures', 'ES', 1, 'open', 'ES JUN24', 5346.00, 5346.75, 5346.75, 'Enter Long Filled', 'ocean212', '💫︱futures-alerts', 1, '2024-05-23 13:38:45', '1232475403407327303', '180421030605488128', '', 1, 0, '', NULL, NULL),
(321, '05/23/2024 09:41:20', NULL, 'Futures', 'ES', -1, 'close', 'ES JUN24', 5342.00, 5342.50, 0, 'skipped - no long position to close', 'ocean212', '💫︱futures-alerts', 1, '2024-05-23 13:41:20', '1232475403407327303', '180421030605488128', '', 0, 0, '', NULL, NULL),
(322, '05/23/2024 09:41:26', NULL, 'Stocks-Forex', '', 1, 'open', 'MNQ', 18914.75, 0.00, 0, 'pending', 'presten.7', '💫︱futures-alerts', 3, '2024-05-23 13:41:26', '1232475403407327303', '820065977584451636', '', 0, 0, '', NULL, NULL),
(323, '05/23/2024 09:41:59', NULL, 'Futures', 'NQ', -1, 'close', 'NQ JUN24', 18930.00, 18919.75, 0, 'skipped - no long position to close', 'srostrades', '💫︱futures-alerts', 10, '2024-05-23 13:41:59', '1232475403407327303', '500695745339588618', '', 0, 0, '', NULL, NULL),
(324, '05/23/2024 09:44:36', NULL, 'Stocks-Forex', '', -1, 'close', 'MNQ', 18930.75, 0.00, 0, 'pending', 'presten.7', '💫︱futures-alerts', 3, '2024-05-23 13:44:36', '1232475403407327303', '820065977584451636', '', 0, 0, '', NULL, NULL),
(325, '05/23/2024 09:47:13', NULL, 'StockOptions', '', 1, 'open', 'SPY_SPYS 230523 C 532', 0.94, 0.00, 0, 'pending', 'dcruz', '💎︱options-stock-alerts', 10, '2024-05-23 13:47:13', '1232475648396759132', '480583337661038602', '', 0, 0, '', NULL, NULL),
(326, '05/23/2024 09:49:57', '05/23/2024 09:49:57', 'Futures', 'ES', 1, 'open', 'ES JUN24', 5335.75, 5337.00, 5337, 'Enter Long Filled', 'ocean212', '💫︱futures-alerts', 1, '2024-05-23 13:49:57', '1232475403407327303', '180421030605488128', '', 1, 0, '', NULL, NULL),
(327, '05/23/2024 09:51:25', NULL, 'Futures', 'ES', -1, 'close', 'ES JUN24', 5331.75, 5330.00, 0, 'skipped - no long position to close', 'ocean212', '💫︱futures-alerts', 1, '2024-05-23 13:51:25', '1232475403407327303', '180421030605488128', '', 0, 0, '', NULL, NULL),
(328, '05/23/2024 09:54:47', NULL, 'StockOptions', '', -1, 'close', 'SPY_SPYS 230523 C 532', 0.55, 0.00, 0, 'pending', 'dcruz', '💎︱options-stock-alerts', 10, '2024-05-23 13:54:47', '1232475648396759132', '480583337661038602', '', 0, 0, '', NULL, NULL),
(329, '05/23/2024 09:57:58', NULL, 'Futures', 'NQ', 1, 'open', 'NQ JUN24', 18844.00, 18855.75, 0, 'skipped - price out of range', 'srostrades', '💫︱futures-alerts', 10, '2024-05-23 13:57:58', '1232475403407327303', '500695745339588618', '', 0, 0, '', NULL, NULL),
(330, '05/23/2024 10:02:09', NULL, 'Futures', 'NQ', -1, 'close', 'NQ JUN24', 18873.00, 18866.75, 0, 'skipped - no long position to close', 'srostrades', '💫︱futures-alerts', 7, '2024-05-23 14:02:09', '1232475403407327303', '500695745339588618', '', 0, 0, '', NULL, NULL),
(331, '05/23/2024 10:08:21', NULL, 'StockOptions', '', 1, 'open', 'MSFT_MSFTS 230524 P 427.5', 0.82, 0.00, 0, 'pending', 'dcruz', '💎︱options-stock-alerts', 12, '2024-05-23 14:08:21', '1232475648396759132', '480583337661038602', '', 0, 0, '', NULL, NULL),
(332, '05/23/2024 10:08:55', '05/23/2024 10:08:55', 'Futures', 'ES', 1, 'open', 'ES JUN24', 5327.50, 5328.75, 5328.75, 'Enter Long Filled', 'ocean212', '💫︱futures-alerts', 1, '2024-05-23 14:08:55', '1232475403407327303', '180421030605488128', '', 1, 0, '', NULL, NULL),
(333, '05/23/2024 10:09:19', NULL, 'StockOptions', '', 1, 'open', 'META_METAS 230524 C 470', 2.66, 0.00, 0, 'pending', 'bcf', '💎︱options-stock-alerts', 10, '2024-05-23 14:09:19', '1232475648396759132', '526074289640833025', '', 0, 0, '', NULL, NULL),
(334, '05/23/2024 10:09:45', NULL, 'Futures', 'ES', -1, 'close', 'ES JUN24', 5330.25, 5329.00, 0, 'skipped - Mismatched provider', 'dcruz', '💫︱futures-alerts', 0, '2024-05-23 14:09:45', '1232475403407327303', '480583337661038602', '', 0, 0, '', NULL, NULL),
(335, '05/23/2024 10:10:42', NULL, 'Futures', 'ES', 1, 'close', 'ES JUN24', 5333.25, 5334.25, 0, 'skipped - no short position to close', 'dcruz', '💫︱futures-alerts', 0, '2024-05-23 14:10:42', '1232475403407327303', '480583337661038602', '', 0, 0, '', NULL, NULL),
(336, '05/23/2024 10:10:53', NULL, 'Futures', 'NQ', -1, 'close', 'NQ JUN24', 18890.00, 18897.75, 0, 'skipped - no long position to close', 'srostrades', '💫︱futures-alerts', 3, '2024-05-23 14:10:53', '1232475403407327303', '500695745339588618', '', 0, 0, '', NULL, NULL),
(337, '05/23/2024 10:11:05', NULL, 'Futures', 'ES', -1, 'close', 'ES JUN24', 5334.25, 5334.75, 0, 'skipped - no long position to close', 'ocean212', '💫︱futures-alerts', 1, '2024-05-23 14:11:05', '1232475403407327303', '180421030605488128', '', 0, 0, '', NULL, NULL),
(338, '05/23/2024 10:15:36', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 5334.00, 0.00, 0, 'expired - time', 'jw2014', '💫︱futures-alerts', 1, '2024-05-23 14:15:36', '1232475403407327303', '625952281040257034', '', 0, 0, '', NULL, NULL),
(339, '05/23/2024 10:16:29', NULL, 'StockOptions', '', 1, 'open', 'COIN_COINS 230719 C 350', 4.40, 0.00, 0, 'pending', 'evapanda', '💎︱options-stock-alerts', 3, '2024-05-23 14:16:29', '1232475648396759132', '536430344489009153', '', 0, 0, '', NULL, NULL),
(340, '05/23/2024 10:18:41', NULL, 'Futures', 'ES', -1, 'close', 'ES JUN24', 5331.00, 0.00, 0, 'expired - time', 'jw2014', '💫︱futures-alerts', 1, '2024-05-23 14:18:41', '1232475403407327303', '625952281040257034', '', 0, 0, '', NULL, NULL),
(341, '05/23/2024 11:59:32', NULL, 'StockOptions', '', 1, 'open', 'LMND_LMNDS 230117 C 10', 6.90, 0.00, 0, 'pending', 'skowih', '💎︱options-stock-alerts', 8, '2024-05-23 15:59:32', '1232475648396759132', '334147594039328790', '', 0, 0, '', NULL, NULL),
(342, '05/23/2024 12:28:54', NULL, 'StockOptions', '', -1, 'close', 'MSFT_MSFTS 230424 P 427.5', 0.46, 0.00, 0, 'pending', 'dcruz', '💎︱options-stock-alerts', 12, '2024-05-23 16:28:54', '1232475648396759132', '480583337661038602', '', 0, 0, '', NULL, NULL),
(343, '05/23/2024 12:48:13', NULL, 'StockOptions', '', 1, 'open', 'GME_GMES 230524 C 20.5', 1.07, 0.00, 0, 'pending', 'bcf', '💎︱options-stock-alerts', 10, '2024-05-23 16:48:13', '1232475648396759132', '526074289640833025', '', 0, 0, '', NULL, NULL),
(344, '05/23/2024 13:10:51', NULL, 'StockOptions', '', 1, 'open', 'MSFT_MSFTS 230524 P 427.5', 0.85, 0.00, 0, 'pending', 'dcruz', '💎︱options-stock-alerts', 15, '2024-05-23 17:10:51', '1232475648396759132', '480583337661038602', '', 0, 0, '', NULL, NULL),
(345, '05/23/2024 13:20:49', NULL, 'StockOptions', '', -1, 'close', 'GME_GMES 230524 C 20.5', 1.01, 0.00, 0, 'pending', 'bcf', '💎︱options-stock-alerts', 10, '2024-05-23 17:20:49', '1232475648396759132', '526074289640833025', '', 0, 0, '', NULL, NULL),
(346, '05/23/2024 13:35:00', NULL, 'StockOptions', '', 1, 'open', 'MSFT_MSFTS 230607 P 420', 1.97, 0.00, 0, 'pending', 'dcruz', '💎︱options-stock-alerts', 5, '2024-05-23 17:35:00', '1232475648396759132', '480583337661038602', '', 0, 0, '', NULL, NULL),
(347, '05/23/2024 13:38:35', NULL, 'StockOptions', '', -1, 'close', 'MSFT_MSFTS 230524 P 427', 1.46, 0.00, 0, 'pending', 'dcruz', '💎︱options-stock-alerts', 15, '2024-05-23 17:38:35', '1232475648396759132', '480583337661038602', '', 0, 0, '', NULL, NULL),
(348, '05/23/2024 13:39:04', NULL, 'StockOptions', '', -1, 'close', 'MSFT_MSFTS 230524 P 427.5', 1.46, 0.00, 0, 'pending', 'dcruz', '💎︱options-stock-alerts', 15, '2024-05-23 17:39:04', '1232475648396759132', '480583337661038602', '', 0, 0, '', NULL, NULL),
(349, '05/23/2024 13:45:39', NULL, 'StockOptions', '', 1, 'open', 'QQQ_QQQS 230524 C 460', 0.31, 0.00, 0, 'pending', 'bendc2r', '💎︱options-stock-alerts', 5, '2024-05-23 17:45:39', '1232475648396759132', '426126942505402371', '', 0, 0, '', NULL, NULL),
(350, '05/23/2024 14:00:14', NULL, 'Futures', 'GC', 1, 'open', 'GC JUN24', 2333.60, 0.00, 0, 'pending', 'trav_trades', '💫︱futures-alerts', 3, '2024-05-23 18:00:14', '1232475403407327303', '399929170928467968', '', 0, 0, '', NULL, NULL),
(351, '05/23/2024 14:00:18', NULL, 'StockOptions', '', -1, 'close', 'QQQ_QQQS 230524 C 460', 0.21, 0.00, 0, 'pending', 'bendc2r', '💎︱options-stock-alerts', 5, '2024-05-23 18:00:18', '1232475648396759132', '426126942505402371', '', 0, 0, '', NULL, NULL),
(352, '05/23/2024 14:01:18', NULL, 'StockOptions', '', -1, 'close', 'MSFT_MSFTS 230607 P 420', 2.62, 0.00, 0, 'pending', 'dcruz', '💎︱options-stock-alerts', 3, '2024-05-23 18:01:18', '1232475648396759132', '480583337661038602', '', 0, 0, '', NULL, NULL),
(353, '05/23/2024 14:05:59', NULL, 'StockOptions', '', -1, 'close', 'CRWD_CRWDS 230524 C 360', 0.82, 0.00, 0, 'pending', 'farazmatin', 'signalchannel', 2, '2024-05-23 18:05:59', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(354, '05/23/2024 14:05:59', NULL, 'Futures', 'ES', 1, 'close', 'ES JUN24', 16000.00, 5287.50, 0, 'skipped - no short position to close', 'farazmatin', 'signalchannel', 3, '2024-05-23 18:05:59', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(355, '05/23/2024 14:05:59', NULL, 'Futures', 'ES', -1, 'close', 'ES JUN24', 99999999.99, 5287.50, 0, 'skipped - no long position to close', 'farazmatin', 'signalchannel', 3, '2024-05-23 18:05:59', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(356, '05/23/2024 14:05:59', NULL, 'Stocks-Forex', '', 1, 'open', 'MES', 5333.25, 0.00, 0, 'pending', 'farazmatin', 'signalchannel', 5, '2024-05-23 18:05:59', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(357, '05/23/2024 14:05:59', NULL, 'Stocks-Forex', '', 1, 'open', 'MES', 5333.25, 0.00, 0, 'pending', 'farazmatin', 'signalchannel', 5, '2024-05-23 18:05:59', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(358, '05/23/2024 14:07:05', NULL, 'Futures', 'GC', 1, 'open', 'GC JUN24', 2333.60, 0.00, 0, 'pending', 'farazmatin', 'signalchannel', 3, '2024-05-23 18:07:05', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(359, '05/23/2024 14:09:26', NULL, 'Futures', 'GC', -1, 'close', 'GC JUN24', 2335.70, 0.00, 0, 'pending', 'trav_trades', '💫︱futures-alerts', 3, '2024-05-23 18:09:26', '1232475403407327303', '399929170928467968', '', 0, 0, '', NULL, NULL),
(360, '05/23/2024 14:54:48', NULL, 'StockOptions', '', -1, 'close', 'MSFT_MSFTS 230607 P 420', 3.15, 0.00, 0, 'pending', 'dcruz', '💎︱options-stock-alerts', 1, '2024-05-23 18:54:48', '1232475648396759132', '480583337661038602', '', 0, 0, '', NULL, NULL),
(361, '05/23/2024 16:58:03', '05/23/2024 16:58:04', 'Futures', 'ES', 1, 'open', 'ES JUN24', 5286.00, 5286.50, 5286.5, 'Enter Long Filled', 'farazmatin', 'signalchannel', 3, '2024-05-23 20:58:03', '1100830612383879188', '403285053259513858', '', 3, 0, '', NULL, NULL),
(362, '05/23/2024 16:58:40', NULL, 'Futures', 'ES', -1, 'close', 'ES JUN24', 5286.00, 5286.50, 0, 'Exit Long Placed', 'farazmatin', 'signalchannel', 3, '2024-05-23 20:58:40', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(363, '05/23/2024 16:59:00', '05/23/2024 16:59:00', 'Futures', 'ES', 1, 'open', 'ES JUN24', 5286.00, 5286.50, 5286.5, 'Enter Long Filled', 'farazmatin', 'signalchannel', 3, '2024-05-23 20:59:00', '1100830612383879188', '403285053259513858', '', 3, 0, '', NULL, NULL),
(364, '05/23/2024 17:01:41', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 5286.00, 5361.25, 0, 'skipped - price out of range', 'farazmatin', 'signalchannel', 3, '2024-05-23 21:01:41', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(365, '05/23/2024 17:03:11', NULL, 'Futures', 'ES', 1, 'open', 'ES JUN24', 5286.00, 0.00, 0, 'expired - time', 'farazmatin', 'signalchannel', 3, '2024-05-23 21:03:11', '1100830612383879188', '403285053259513858', '', 0, 0, '', NULL, NULL),
(366, '05/24/2024 08:47:35', NULL, 'Stocks-Forex', '', -1, 'close', 'MNQ', 18754.25, 0.00, 0, 'pending', 'presten.7', '💫︱futures-alerts', 3, '2024-05-24 12:47:35', '1232475403407327303', '820065977584451636', '', 0, 0, '', NULL, NULL),
(367, '05/24/2024 09:04:42', '05/24/2024 09:04:42', 'Futures', 'ES', 1, 'open', 'ES JUN24', 5302.00, 5302.25, 5302.25, 'Enter Long Filled', 'steveo21', '🚀︱member-alerts', 0, '2024-05-24 13:04:42', '1232475511150743632', '493829082924974103', '', 1, 0, '', NULL, NULL),
(368, '05/24/2024 13:25:32', NULL, 'Stocks-Forex', '', 0, 'Null', 'MNQ', 18898.00, 0.00, 0, 'pending', 'presten.7', '💫︱futures-alerts', 3, '2024-05-24 17:25:32', '1232475403407327303', '820065977584451636', '', 0, 0, '', NULL, NULL),
(369, '05/24/2024 14:52:39', NULL, 'Stocks-Forex', '', 1, 'open', 'IP', 45.51, 0.00, 0, 'pending', 'jw2014', '💎︱options-stock-alerts', 50, '2024-05-24 18:52:39', '1232475648396759132', '625952281040257034', '', 0, 0, '', NULL, NULL),
(370, '05/24/2024 15:37:57', NULL, 'StockOptions', '', 1, 'open', 'DD_DDS 231018  ', 2.85, 0.00, 0, 'pending', 'jw2014', '💎︱options-stock-alerts', 2, '2024-05-24 19:37:57', '1232475648396759132', '625952281040257034', '', 0, 0, '', NULL, NULL),
(371, '05/24/2024 15:45:43', NULL, 'Stocks-Forex', '', 1, 'open', 'IP', 45.51, 0.00, 0, 'pending', 'jw2014', '💎︱options-stock-alerts', 50, '2024-05-24 19:45:43', '1232475648396759132', '625952281040257034', '', 0, 0, '', NULL, NULL),
(372, '05/24/2024 15:45:55', NULL, 'StockOptions', '', 1, 'open', 'DD_DDS 231018 C 85', 2.85, 0.00, 0, 'pending', 'jw2014', '💎︱options-stock-alerts', 2, '2024-05-24 19:45:55', '1232475648396759132', '625952281040257034', '', 0, 0, '', NULL, NULL);

--
-- Triggers `signals`
--
DELIMITER $$
CREATE TRIGGER `UpdateUserProv` AFTER INSERT ON `signals` FOR EACH ROW INSERT INTO userprovider (Channel_id, Provider_id, AssetType, InstrumentType, ProviderName, ChannelName, StopLossPercent, PositionSizePercent, TrailPercent, BreakEvenPercent, TP1Percent, EntryOffsetPercent)
select distinct  temp.Channel_id, temp.Provider_id, temp.AssetType, temp.InstrumentType, temp.ProviderName, temp.ChannelName, 0.06634, 5, 0.022, 0.11057, 0.13057, 0.022 from (
select signals.* from signals left join userprovider on signals.Channel_id=userprovider.Channel_id and signals.Provider_id=userprovider.Provider_id and signals.AssetType=userprovider.AssetType and signals.InstrumentType=userprovider.InstrumentType
where userprovider.Channel_id is null and userprovider.Provider_id is null and userprovider.AssetType is null and userprovider.InstrumentType is null
)temp
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `subscription`
--

CREATE TABLE `subscription` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `UserKey` varchar(40) NOT NULL,
  `stocks` bit(1) DEFAULT NULL,
  `forex` bit(1) DEFAULT NULL,
  `options` bit(1) DEFAULT NULL,
  `crypto` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tradeexecution`
--

CREATE TABLE `tradeexecution` (
  `id` int(11) NOT NULL,
  `ChannelName` varchar(45) DEFAULT NULL,
  `ProviderName` varchar(45) DEFAULT NULL,
  `CreationTime` timestamp NULL DEFAULT NULL,
  `ExecutionTime` timestamp NULL DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Instrument` varchar(255) DEFAULT NULL,
  `EntryPrice` float DEFAULT NULL,
  `ExitPrice` float DEFAULT NULL,
  `PnL_amount` float DEFAULT NULL,
  `Pnl_perc` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tradeexecution`
--

INSERT INTO `tradeexecution` (`id`, `ChannelName`, `ProviderName`, `CreationTime`, `ExecutionTime`, `Quantity`, `Instrument`, `EntryPrice`, `ExitPrice`, `PnL_amount`, `Pnl_perc`) VALUES
(1, 'signalchannel', 'farazmatin', '2023-11-09 00:14:10', '2023-08-11 23:14:14', -49, 'SPX_SPXS 230811 P 4455', -0.4, 0, 0, 0),
(2, 'signalchannel', 'farazmatin', '2023-11-09 00:16:16', '2023-08-11 23:16:20', -131, 'TSLA_TSLAS 230811 C 245', -0.15, 0, 0, 0),
(3, 'signalchannel', 'farazmatin', '2023-11-09 00:17:28', '2023-08-11 23:17:32', -263, 'TSLA_TSLAS 230818 C 245', -0.15, 0, 0, 0),
(4, 'signalchannel', 'farazmatin', '2023-11-09 00:23:17', '2023-08-11 23:23:21', 263, 'TSLA_TSLAS 230818 C 245', 0.15, 0, 0, 0),
(5, 'signalchannel', 'farazmatin', NULL, '2023-08-14 13:56:31', 334, 'QQQ_QQQS 230814 P 364', 0.59, 0, 0, 0),
(6, 'signalchannel', 'farazmatin', NULL, '2023-08-14 13:56:34', 259, 'NFLX_NFLXS 230818 C 440', 1.52, 0, 0, 0),
(7, 'signalchannel', 'farazmatin', NULL, '2023-08-14 13:58:42', 257, 'QQQ_QQQS 230814 P 364', 0.76, 0, 0, 0),
(8, 'signalchannel', 'farazmatin', NULL, '2023-08-14 13:58:46', 2799, 'TSLA_TSLAS 230818 C 245', 0.14, 0, 0, 0),
(9, 'signalchannel', 'farazmatin', NULL, '2023-08-14 14:09:27', 9, 'ES SEP23', 4251.96, 0, 0, 0),
(10, 'signalchannel', 'farazmatin', NULL, '2023-08-14 15:01:30', 2, 'ES SEP23', 4251.96, 0, 0, 0),
(11, 'signalchannel', 'farazmatin', NULL, '2023-08-14 15:06:04', 90, 'SPY_SPYS 230814 C 446', 0.54, 0, 0, 0),
(12, 'signalchannel', 'farazmatin', NULL, '2023-08-14 15:06:07', 55, 'MSFT_MSFTS 230818 C 325', 1.75, 0, 0, 0),
(13, 'signalchannel', 'farazmatin', NULL, '2023-08-14 15:15:49', 79, 'WMT_WMTS 230818 C 165', 1.23, 0, 0, 0),
(14, 'signalchannel', 'farazmatin', NULL, '2023-08-14 15:20:18', 117, 'XLE_XLES 231020 P 80', 0.83, 0, 0, 0),
(15, '💫︱futures-alerts', 'cedar_options', NULL, '2023-08-17 14:30:44', 2, 'ES SEP23', 4270.25, 0, 0, 0),
(16, '🐐︱analyst-alerts', 'cedar_options', NULL, '2023-08-17 14:30:48', 179, 'SPY_SPYS 230821 C 448', 0.54, 0, 0, 0),
(17, '🐐︱analyst-alerts', 'evapanda', NULL, '2023-08-17 14:30:52', 85, 'SPX_SPXS 230816 C 4550', 1.14, 0, 0, 0),
(18, 'combine-alerts', 'moonshotdg', NULL, '2023-08-17 14:30:57', 104, 'WMT_WMTS 230818 C 165', 0.93, 0, 0, 0),
(19, 'combine-alerts', 'moonshotdg', NULL, '2023-08-17 14:31:01', 78, 'NFLX_NFLXS 230818 C 440', 1.23, 0, 0, 0),
(20, '🐐︱analyst-alerts', 'dcruz', NULL, '2023-08-17 14:31:04', 45, 'GOOGL_GOOGLS 230825 C 131', 2.14, 0, 0, 0),
(21, '🐐︱analyst-alerts', 'cedar_options', NULL, '2023-08-17 14:31:10', 39, 'QQQ_QQQS 230818 C 371', 2.45, 0, 0, 0),
(22, '💸︱bluecard-250-challenge', 'husky_trades', NULL, '2023-08-17 14:31:13', 61, 'COIN_COINS 230818 C 85', 1.57, 0, 0, 0),
(23, '🐐︱analyst-alerts', 'makeplays', NULL, '2023-08-17 14:31:20', 78, 'AMZN_AMZNS 230818 C 139', 1.23, 0, 0, 0),
(24, '🐐︱analyst-alerts', 'dcruz', NULL, '2023-08-17 14:31:25', 52, 'MSFT_MSFTS 230818 C 325', 1.85, 0, 0, 0),
(25, 'combine-alerts', 'tyler0777', NULL, '2023-08-17 14:31:31', 102, 'RIVN_RIVNS 230915 C 22.5', 0.95, 0, 0, 0),
(26, 'combine-alerts', 'moonshotdg', NULL, '2023-08-17 14:31:34', 75, 'UPST_UPSTS 230818 C 35.5', 1.28, 0, 0, 0),
(27, 'signalchannel', 'farazmatin', NULL, '2023-08-17 14:33:59', 2, 'ES SEP23', 4223.22, 0, 0, 0),
(28, '🐐︱analyst-alerts', 'cedar_options', NULL, '2023-08-17 15:14:02', 485, 'BA_BAS 230818 C 232.50', 0.2, 0, 0, 0),
(29, 'combine-alerts', 'moonshotdg', NULL, '2023-08-17 15:53:58', 180, 'BA_BAS 230818 C 230', 0.53, 0, 0, 0),
(30, 'combine-alerts', 'moonshotdg', NULL, '2023-08-17 15:57:19', 102, 'TQQQ_TQQQS 230825 C 38.5', 0.93, 0, 0, 0),
(31, '🐐︱analyst-alerts', 'cedar_options', NULL, '2023-08-18 18:13:44', 57, 'SPY_SPYS 230818 C 442', 0.83, 0, 0, 0),
(32, '💫︱futures-alerts', 'cedar_options', NULL, '2023-08-18 18:13:48', 2, 'ES SEP23', 4200.42, 0, 0, 0),
(33, '🕴︱jr-analyst-alerts', 'nickkell', NULL, '2023-08-18 18:13:51', 94, 'ZM_ZMS 231020 C 85', 1, 0, 0, 0),
(34, '🚀︱member-alerts', 'bendc2r', NULL, '2023-08-18 18:13:54', 338, 'QQQ_QQQS 230817 C 363', 0.28, 0, 0, 0),
(35, '💸︱bluecard-250-challenge', 'husky_trades', NULL, '2023-08-18 18:14:00', 80, 'TSLA_TSLAS 230818 C 220', 0.59, 0, 0, 0),
(36, '🐐︱analyst-alerts', 'dcruz', NULL, '2023-08-18 18:14:03', 81, 'AMD_AMDS 230818 C 104', 0.58, 0, 0, 0),
(37, '🐐︱analyst-alerts', 'evapanda', NULL, '2023-08-18 18:14:08', 89, 'NFLX_NFLXS 230818 C 405', 0.53, 0, 0, 0),
(38, '🐐︱analyst-alerts', 'husky_trades', NULL, '2023-08-18 18:14:12', 29, 'SPX_SPXS 230818 C 4380', 1.62, 0, 0, 0),
(39, '🐐︱analyst-alerts', 'evapanda', NULL, '2023-08-18 18:14:16', 107, 'NVDA_NVDAS 230818 C 430', 0.44, 0, 0, 0),
(40, '🐐︱analyst-alerts', 'dcruz', NULL, '2023-08-18 18:14:20', 56, 'AAPL_AAPLS 230825 C 175', 1.69, 0, 0, 0),
(41, 'combine-alerts', 'moonshotdg', NULL, '2023-08-18 18:14:24', 364, 'HD_HDS 230818 C 330', 0.13, 0, 0, 0),
(42, 'signalchannel', 'farazmatin', NULL, '2023-08-18 18:29:40', 26, 'MSFT_MSFTS 230818 C 320', 1.81, 0, 0, 0),
(43, '🕴︱jr-analyst-alerts', 'nickkell', NULL, '2023-08-18 19:49:59', 172, 'ORCL_ORCLS 230825 C 121', 0.55, 0, 0, 0),
(44, 'combine-alerts', 'catyline', NULL, '2023-08-22 15:53:34', 2, 'ES SEP23', 4166.46, 0, 0, 0),
(45, '🐐︱analyst-alerts', 'dcruz', NULL, '2023-08-22 15:53:39', 136, 'QQQ_QQQS 230821 C 362', 0.69, 0, 0, 0),
(46, '🐐︱analyst-alerts', 'husky_trades', NULL, '2023-08-22 15:53:43', 19, 'NFLX_NFLXS 230825 C 410', 4.84, 0, 0, 0),
(47, 'combine-alerts', 'trav_trades', NULL, '2023-08-22 15:53:47', 58, 'SPX_SPXS 230821 P 4350', 1.62, 0, 0, 0),
(48, '🐐︱analyst-alerts', 'husky_trades', NULL, '2023-08-22 15:53:50', 154, 'COIN_COINS 230825 C 80', 0.61, 0, 0, 0),
(49, '🐐︱analyst-alerts', 'evapanda', NULL, '2023-08-22 15:53:54', 218, 'PFE_PFES 230901 C 37.5', 0.43, 0, 0, 0),
(50, '🕴︱jr-analyst-alerts', 'nickkell', NULL, '2023-08-22 15:53:59', 82, 'TDOC_TDOCS 231020 C 25', 1.14, 0, 0, 0),
(51, '🐐︱analyst-alerts', 'dcruz', NULL, '2023-08-22 15:54:02', 98, 'SPY_SPYS 230821 P 437', 0.95, 0, 0, 0),
(52, 'combine-alerts', 'tyler0777', NULL, '2023-08-22 15:54:06', 114, 'GOOGL_GOOGLS 230825 P 125', 0.82, 0, 0, 0),
(53, 'combine-alerts', 'moonshotdg', NULL, '2023-08-22 15:59:15', 163, 'QQQ_QQQS 230821 C 361', 0.57, 0, 0, 0),
(54, '🕴︱jr-analyst-alerts', 'shadowtrader', NULL, '2023-08-22 15:59:19', 2, 'ES SEP23', 4156.25, 0, 0, 0),
(55, '🐐︱analyst-alerts', 'husky_trades', NULL, '2023-08-22 15:59:24', 89, 'BABA_BABAS 230825 C 90', 1.04, 0, 0, 0),
(56, '🐐︱analyst-alerts', 'dcruz', NULL, '2023-08-22 15:59:27', 57, 'MSFT_MSFTS 230825 C 325', 1.61, 0, 0, 0),
(57, '🚀︱member-alerts', 'Xûr', NULL, '2023-08-22 15:59:31', 65, 'PEP_PEPS 230901 C 177.5', 1.42, 0, 0, 0),
(58, '🐐︱analyst-alerts', 'evapanda', NULL, '2023-08-22 15:59:34', 55, 'COIN_COINS 230825 C 82', 1.67, 0, 0, 0),
(59, 'combine-alerts', 'trav_trades', NULL, '2023-08-22 15:59:38', 163, 'SPX_SPXS 230821 P 4395', 0.57, 0, 0, 0),
(60, '🚀︱member-alerts', 'slimreaper23', NULL, '2023-08-22 15:59:41', 152, 'XPEV_XPEVS 230901 P 16', 0.61, 0, 0, 0),
(61, '🚀︱member-alerts', 'slimreaper23', NULL, '2023-08-22 15:59:45', 193, 'JD_JDS 230901 P 32', 0.48, 0, 0, 0),
(62, 'signalchannel', 'farazmatin', NULL, '2023-08-22 15:59:49', 2, 'ES SEP23', 4193.77, 0, 0, 0),
(63, '🚀︱member-alerts', 'bendc2r', NULL, '2023-08-22 17:53:58', 232, 'QQQ_QQQS 230822 P 362', 0.2, 0, 0, 0),
(64, '🕴︱jr-analyst-alerts', 'shadowtrader', NULL, '2023-08-22 17:54:01', 2, 'ES SEP23', 4184.75, 0, 0, 0),
(65, '🕴︱jr-analyst-alerts', 'nickkell', NULL, '2023-08-22 17:54:08', 442, 'FXI_FXIS 231020 C 30', 0.21, 0, 0, 0),
(66, '🐐︱analyst-alerts', 'husky_trades', NULL, '2023-08-22 17:54:13', 108, 'SPX_SPXS 230822 C 4415', 0.43, 0, 0, 0),
(67, 'combine-alerts', 'tyler0777', NULL, '2023-08-22 18:23:57', 120, 'SPY_SPYS 230825 C 444', 0.77, 0, 0, 0),
(68, 'signalchannel', 'farazmatin', NULL, '2023-08-22 19:30:44', 2, 'ES SEP23', 4193.77, 0, 0, 0),
(69, 'signalchannel', 'farazmatin', NULL, '2023-08-22 19:39:56', 2, 'ES SEP23', 4193.77, 0, 0, 0),
(70, 'signalchannel', 'farazmatin', NULL, '2023-08-22 19:44:45', 2, 'ES SEP23', 4174.3, 0, 0, 0),
(71, 'signalchannel', 'farazmatin', NULL, '2023-08-22 19:51:53', 2, 'ES SEP23', 4199, 0, 0, 0),
(72, 'signalchannel', 'farazmatin', NULL, '2023-08-22 19:52:39', 2, 'ES SEP23', 4177.15, 0, 0, 0),
(73, 'signalchannel', 'farazmatin', NULL, '2023-08-22 20:01:56', 109, 'SPX_SPXS 230822 C 4415', 0.43, 0, 0, 0),
(74, 'combine-alerts', 'tyler0777', NULL, '2023-08-23 13:40:54', 2, 'ES SEP23', 4188.31, 0, 0, 0),
(75, '🕴︱jr-analyst-alerts', 'nickkell', NULL, '2023-08-23 13:44:00', 336, 'FXI_FXIS 231020 C 30', 0.28, 0, 0, 0),
(76, '🕴︱jr-analyst-alerts', 'nickkell', NULL, '2023-08-23 13:46:39', 196, 'EBAY_EBAYS 231020 C 47.5', 0.48, 0, 0, 0),
(77, '🐐︱analyst-alerts', 'dcruz', NULL, '2023-08-23 14:02:41', 49, 'QQQ_QQQS 230823 C 368', 0.94, 0, 0, 0),
(78, '💫︱futures-alerts', 'cedar_options', NULL, '2023-08-24 13:04:53', 2, 'ES SEP23', 4203.99, 0, 0, 0),
(79, 'combine-alerts', 'moonshotdg', NULL, '2023-08-24 13:04:56', 99, 'QQQ_QQQS 230823 C 368', 0.95, 0, 0, 0),
(80, '🐐︱analyst-alerts', 'cedar_options', NULL, '2023-08-24 13:05:00', 141, 'SPY_SPYS 230823 C 442', 0.67, 0, 0, 0),
(81, '🐐︱analyst-alerts', 'dcruz', NULL, '2023-08-24 13:05:04', 59, 'XOM_XOMS 230908 C 108', 1.59, 0, 0, 0),
(82, '🐐︱analyst-alerts', 'evapanda', NULL, '2023-08-24 13:05:07', 37, 'SPX_SPXS 230825 C 4500', 2.52, 0, 0, 0),
(83, '💫︱futures-alerts', 'cedar_options', NULL, '2023-08-24 13:08:51', 2, 'ES SEP23', 4231.3, 0, 0, 0),
(84, '🐐︱analyst-alerts', 'husky_trades', NULL, '2023-08-24 13:08:56', 57, 'SPX_SPXS 230823 C 4440', 1.66, 0, 0, 0),
(85, '🚀︱member-alerts', 'slimreaper23', NULL, '2023-08-24 13:09:00', 91, 'QQQ_QQQS 230828 P 360', 1.04, 0, 0, 0),
(86, '🐐︱analyst-alerts', 'evapanda', NULL, '2023-08-24 13:38:10', 246, 'AAPL_AAPLS 230825 P 177.5', 0.38, 0, 0, 0),
(87, '🐐︱analyst-alerts', 'dcruz', NULL, '2023-08-24 13:38:57', 58, 'QQQ_QQQS 230824 C 372', 0.8, 0, 0, 0),
(88, '🕴︱jr-analyst-alerts', 'nickkell', NULL, '2023-08-24 13:40:53', 187, 'MMM_MMMS 230915 C 105', 0.5, 0, 0, 0),
(89, '🚀︱member-alerts', 'bendc2r', NULL, '2023-08-24 14:06:52', 186, 'QQQ_QQQS 230824 C 374', 0.25, 0, 0, 0),
(90, '🚀︱member-alerts', 'bendc2r', NULL, '2023-08-24 14:16:52', 460, 'QQQ_QQQS 230824 C 374', 0.1, 0, 0, 0),
(91, '🕴︱jr-analyst-alerts', 'shadowtrader', NULL, '2023-08-24 14:17:25', 2, 'ES SEP23', 4223.7, 0, 0, 0),
(92, '🕴︱jr-analyst-alerts', 'shadowtrader', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'ES SEP23', 4435, 0, 0, 0),
(93, 'combine-alerts', 'tyler0777', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'ES SEP23', 4432.75, 0, 0, 0),
(94, '🕴︱jr-analyst-alerts', 'shadowtrader', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'ES SEP23', 4429, 0, 0, 0),
(95, '🕴︱jr-analyst-alerts', 'shadowtrader', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'ES SEP23', 4420, 0, 0, 0),
(96, '🕴︱jr-analyst-alerts', 'nickkell', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 206, 'PFE_PFES 230929 C 38', 0.44, 0, 0, 0),
(97, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 69, 'AAPL_AAPLS 230825 C 177.5', 1.3, 0, 0, 0),
(98, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'ES SEP23', 4420.5, 0, 0, 0),
(99, '🐐︱analyst-alerts', 'evapanda', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 34, 'META_METAS 230915 P 270', 2.63, 0, 0, 0),
(100, 'combine-alerts', 'tyler0777', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'ES SEP23', 4418, 0, 0, 0),
(101, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 33, 'TSLA_TSLAS 230825 P 230', 2.7, 0, 0, 0),
(102, '🚀︱member-alerts', 'Genos', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'NDX_NDXS 230824 P 14900', 29.1, 0, 0, 0),
(103, 'combine-alerts', 'trav_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'ES SEP23', 4411.25, 0, 0, 0),
(104, '🕴︱jr-analyst-alerts', 'shadowtrader', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'ES SEP23', 4408, 0, 0, 0),
(105, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'ES SEP23', 4411, 0, 0, 0),
(106, '🐐︱analyst-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 76, 'SPY_SPYS 230824 C 440', 0.59, 0, 0, 0),
(107, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 50, 'TSLA_TSLAS 230825 C 235', 1.81, 0, 0, 0),
(108, 'signalchannel', 'farazmatin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'ES SEP23', 4411, 0, 0, 0),
(109, '🕴︱jr-analyst-alerts', 'shadowtrader', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'ES SEP23', 4411, 0, 0, 0),
(110, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 65, 'SPY_SPYS 230824 P 459', 0.69, 0, 0, 0),
(111, '🚀︱member-alerts', 'bendc2r', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 216, 'QQQ_QQQS 230825 P 356', 0.21, 0, 0, 0),
(112, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 43, 'AMD_AMDS 230825 C 102', 1.05, 0, 0, 0),
(113, 'combine-alerts', 'moonshotdg', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 48, 'AMD_AMDS 230825 C 112', 0.94, 0, 0, 0),
(114, '🐐︱analyst-alerts', 'husky_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 25, 'TSLA_TSLAS 230825 C 235', 1.75, 0, 0, 0),
(115, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 60, 'AMD_AMDS 230825 C 104', 0.75, 0, 0, 0),
(116, '🐐︱analyst-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 18, 'QQQ_QQQS 230825 C 364', 2.5, 0, 0, 0),
(117, '🕴︱jr-analyst-alerts', 'shadowtrader', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'ES SEP23', 4395, 0, 0, 0),
(118, '🕴︱jr-analyst-alerts', 'shadowtrader', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'ES SEP23', 4388, 0, 0, 0),
(119, '🚀︱member-alerts', 'bendc2r', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 164, 'QQQ_QQQS 230825 C 366', 0.27, 0, 0, 0),
(120, '🕴︱jr-analyst-alerts', 'shadowtrader', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'ES SEP23', 4388, 0, 0, 0),
(121, '🚀︱member-alerts', 'bendc2r', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 314, 'QQQ_QQQS 230825 C 366', 0.14, 0, 0, 0),
(122, '🐐︱analyst-alerts', 'evapanda', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 92, 'AMD_AMDS 230915 P 90', 0.95, 0, 0, 0),
(123, '🕴︱jr-analyst-alerts', 'shadowtrader', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'ES SEP23', 4372, 0, 0, 0),
(124, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 46, 'SPY_SPYS 230825 P 434', 0.95, 0, 0, 0),
(125, '🕴︱jr-analyst-alerts', 'shadowtrader', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'ES SEP23', 4367.75, 0, 0, 0),
(126, '🚀︱member-alerts', 'bendc2r', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 217, 'QQQ_QQQS 230825 C 364', 0.2, 0, 0, 0),
(127, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES SEP23', 4370, 0, 0, 0),
(128, '🐐︱analyst-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 35, 'SPY_SPYS 230825 C 436', 1.23, 0, 0, 0),
(129, 'combine-alerts', 'tyler0777', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 86, 'SPY_SPYS 230825 P 435', 0.5, 0, 0, 0),
(130, '🕴︱jr-analyst-alerts', 'shadowtrader', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES SEP23', 4382, 0, 0, 0),
(131, '🕴︱jr-analyst-alerts', 'shadowtrader', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES SEP23', 4375, 0, 0, 0),
(132, 'combine-alerts', 'trav_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES SEP23', 4386.25, 0, 0, 0),
(133, '🚀︱member-alerts', 'bendc2r', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 180, 'QQQ_QQQS 230825 P 357', 0.24, 0, 0, 0),
(134, '🕴︱jr-analyst-alerts', 'shadowtrader', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES SEP23', 4395, 0, 0, 0),
(135, '🚀︱member-alerts', 'bendc2r', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 178, 'QQQ_QQQS 230825 P 357', 0.24, 0, 0, 0),
(136, '🕴︱jr-analyst-alerts', 'shadowtrader', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES SEP23', 4495, 0, 0, 0),
(137, 'combine-alerts', 'trav_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES SEP23', 4394, 0, 0, 0),
(138, '🕴︱jr-analyst-alerts', 'shadowtrader', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES SEP23', 4395, 0, 0, 0),
(139, '🕴︱jr-analyst-alerts', 'shadowtrader', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES SEP23', 4395, 0, 0, 0),
(140, '🚀︱member-alerts', 'kreedmonger', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 44, 'MRNA_MRNAS 230901 C 112', 1.93, 0, 0, 0),
(141, '🕴︱jr-analyst-alerts', 'shadowtrader', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES SEP23', 4391, 0, 0, 0),
(142, '🚀︱member-alerts', 'kreedmonger', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 78, 'META_METAS 230825 C 282.5', 0.55, 0, 0, 0),
(143, '🐐︱analyst-alerts', 'evapanda', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 31, 'TSLA_TSLAS 230915 C 260', 2.71, 0, 0, 0),
(144, '🐐︱analyst-alerts', 'makeplays', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 53, 'UVXY_UVXYS 230922 C 18', 1.6, 0, 0, 0),
(145, '🕴︱jr-analyst-alerts', 'shadowtrader', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES SEP23', 4423, 0, 0, 0),
(146, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 48, 'AAPL_AAPLS 230825 C 177.5', 0.88, 0, 0, 0),
(147, 'combine-alerts', 'trav_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES SEP23', 4424.75, 0, 0, 0),
(148, '🕴︱jr-analyst-alerts', 'shadowtrader', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES SEP23', 4428, 0, 0, 0),
(149, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 79, 'AAPL_AAPLS 230908 C 182.5', 1.08, 0, 0, 0),
(150, '🕴︱jr-analyst-alerts', 'shadowtrader', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES SEP23', 4413, 0, 0, 0),
(151, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 66, 'QQQ_QQQS 230830 C 368', 1.27, 0, 0, 0),
(152, 'combine-alerts', 'moonshotdg', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 37, 'TSLA_TSLAS 230901 C 245', 2.24, 0, 0, 0),
(153, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 64, 'MSFT_MSFTS 230901 C 330', 1.31, 0, 0, 0),
(154, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 40, 'NFLX_NFLXS 230901 C 435', 2.09, 0, 0, 0),
(155, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 74, 'AMD_AMDS 230901 C 107', 1.14, 0, 0, 0),
(156, '🕴︱jr-analyst-alerts', 'nickkell', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 67, 'OXY_OXYS 231020 C 65', 1.25, 0, 0, 0),
(157, '🐐︱analyst-alerts', 'makeplays', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 43, 'SPY_SPYS 230905 P 447', 1.94, 0, 0, 0),
(158, 'combine-alerts', 'moonshotdg', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 58, 'META_METAS 230901 C 305', 1.44, 0, 0, 0),
(159, '🐐︱analyst-alerts', 'husky_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 45, 'BA_BAS 230901 C 230', 1.84, 0, 0, 0),
(160, '🕴︱jr-analyst-alerts', 'tyler0777', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 71, 'AMZN_AMZNS 230901 C 135', 1.18, 0, 0, 0),
(161, '🐐︱analyst-alerts', 'makeplays', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 60, 'SPY_SPYS 230831 P 451', 1.4, 0, 0, 0),
(162, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 56, 'NFLX_NFLXS 230901 C 445', 1.48, 0, 0, 0),
(163, '🚀︱member-alerts', 'kreedmonger', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 33, 'NVDA_NVDAS 230901 C 510', 2.45, 0, 0, 0),
(164, '🐐︱analyst-alerts', 'evapanda', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 37, 'META_METAS 230901 C 300', 2.17, 0, 0, 0),
(165, '🐐︱analyst-alerts', 'evapanda', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 72, 'TSLA_TSLAS 230901 C 265', 1.11, 0, 0, 0),
(166, '🐐︱analyst-alerts', 'makeplays', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 67, 'SPY_SPYS 230901 P 451', 1.2, 0, 0, 0),
(167, 'signalchannel', 'farazmatin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 73, 'MSFT_MSFTS 230901 C 330', 1.1, 0, 0, 0),
(168, '🕴︱jr-analyst-alerts', 'tyler0777', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 34, 'NFLX_NFLXS 230908 C 440', 2.3, 0, 0, 0),
(169, '🕴︱jr-analyst-alerts', 'tyler0777', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 21, 'NFLX_NFLXS 230901 C 140', 1.9, 0, 0, 0),
(170, '🕴︱jr-analyst-alerts', 'nickkell', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 76, 'NKE_NKES 230929 C 110', 1.05, 0, 0, 0),
(171, '🕴︱jr-analyst-alerts', 'tyler0777', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 46, 'TSLA_TSLAS 230915 C 270', 1.72, 0, 0, 0),
(172, '🚀︱member-alerts', 'kreedmonger', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 69, 'COIN_COINS 230908 P 76', 1.15, 0, 0, 0),
(173, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 32, 'NFLX_NFLXS 230908 C 455', 2.48, 0, 0, 0),
(174, '🐐︱analyst-alerts', 'evapanda', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 38, 'SMCI_SMCIS 230908 C 300', 2.1, 0, 0, 0),
(175, '🐐︱analyst-alerts', 'husky_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 29, 'TSLA_TSLAS 230908 P 250', 2.72, 0, 0, 0),
(176, '🐐︱analyst-alerts', 'evapanda', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 48, 'NFLX_NFLXS 230908 C 460', 1.67, 0, 0, 0),
(177, '🕴︱jr-analyst-alerts', 'optionverde', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 50, 'TSLA_TSLAS 230908 P 240', 1.6, 0, 0, 0),
(178, '🐐︱analyst-alerts', 'makeplays', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 34, 'AMD_AMDS 230915 C 110', 2.3, 0, 0, 0),
(179, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 47, 'MSFT_MSFTS 230915 C 340', 1.7, 0, 0, 0),
(180, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 51, 'AAPL_AAPLS 230908 C 177.5', 1.56, 0, 0, 0),
(181, '🐐︱analyst-alerts', 'makeplays', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 47, 'TSLA_TSLAS 230908 C 250', 1.68, 0, 0, 0),
(182, '🐐︱analyst-alerts', 'evapanda', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 67, 'META_METAS 230908 C 310', 1.18, 0, 0, 0),
(183, '🐐︱analyst-alerts', 'evapanda', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 20, 'MSFT_MSFTS 231020 P 320', 4, 0, 0, 0),
(184, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 47, 'AMD_AMDS 230915 C 106', 1.7, 0, 0, 0),
(185, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 59, 'AMZN_AMZNS 230915 C 142', 1.34, 0, 0, 0),
(186, '🚀︱member-alerts', 'pbandi', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 67, 'TSLA_TSLAS 230915 C 280', 1.2, 0, 0, 0),
(187, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 62, 'MSFT_MSFTS 230915 C 337.5', 1.31, 0, 0, 0),
(188, '🐐︱analyst-alerts', 'evapanda', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 72, 'TSLA_TSLAS 230922 C 300', 1.14, 0, 0, 0),
(189, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 72, 'AMZN_AMZNS 230915 C 144', 1.14, 0, 0, 0),
(190, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 71, 'QQQ_QQQS 230915 C 378', 1.14, 0, 0, 0),
(191, '💸︱bluecard', 'husky_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 34, 'TSLA_TSLAS 230915 C 275', 1.17, 0, 0, 0),
(192, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 58, 'AMZN_AMZNS 230929 C 145', 1.39, 0, 0, 0),
(193, '🚀︱member-alerts', 'nickkell', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 73, 'UBER_UBERS 231013 P 44', 1.09, 0, 0, 0),
(194, '🐐︱analyst-alerts', 'evapanda', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 68, 'TSLA_TSLAS 231006 P 220', 1.18, 0, 0, 0),
(195, '🐐︱analyst-alerts', 'husky_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 38, 'QQQ_QQQS 230922 C 360', 1.04, 0, 0, 0),
(196, '🚀︱member-alerts', 'nickkell', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 43, 'META_METAS 231006 P 280', 1.83, 0, 0, 0),
(197, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 36, 'SPY_SPYS 230922 P 434', 1.09, 0, 0, 0),
(198, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 66, 'SPY_SPYS 230925 C 433', 1.21, 0, 0, 0),
(199, '🐐︱analyst-alerts', 'evapanda', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 30, 'NVDA_NVDAS 231006 P 380', 2.6, 0, 0, 0),
(200, '🐐︱analyst-alerts', 'evapanda', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 35, 'NVDA_NVDAS 231006 P 380', 2.25, 0, 0, 0),
(201, 'signalchannel', 'farazmatin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 24, 'TSLA_TSLAS 230929 C 250', 3.3, 0, 0, 0),
(202, 'signalchannel', 'farazmatin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 31, 'SPY_SPYS 230927 P 428', 1.27, 0, 0, 0),
(203, 'signalchannel', 'farazmatin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 23, 'SPY_SPYS 230927 C 428', 1.68, 0, 0, 0),
(204, 'signalchannel', 'farazmatin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 23, 'NVDA_NVDAS 231006 C 450', 3.4, 0, 0, 0),
(205, 'signalchannel', 'farazmatin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 51, 'AMZN_AMZNS 230929 C 128', 1.54, 0, 0, 0),
(206, 'signalchannel', 'farazmatin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 29, 'SPY_SPYS 231003 C 430', 2.73, 0, 0, 0),
(207, 'signalchannel', 'farazmatin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 24, 'TSLA_TSLAS 230929 C 250', 3.3, 0, 0, 0),
(208, 'signalchannel', 'farazmatin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 18, 'TSLA_TSLAS 230929 C 250', 4.4, 0, 0, 0),
(209, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 59, 'QQQ_QQQS 231002 C 360', 1.34, 0, 0, 0),
(210, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 38, 'QQQ_QQQS 230928 P 353', 1.03, 0, 0, 0),
(211, '🐐︱analyst-alerts', 'evapanda', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 35, 'NVDA_NVDAS 230929 C 435', 2.26, 0, 0, 0),
(212, '🐐︱analyst-alerts', 'oogwayta', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 79, 'AAPL_AAPLS 230929 C 170', 1.01, 0, 0, 0),
(213, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 57, 'QQQ_QQQS 231002 C 360', 1.4, 0, 0, 0),
(214, 'signalchannel', 'farazmatin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 78, 'AAPL_AAPLS 230929 C 170', 1.01, 0, 0, 0),
(215, 'signalchannel', 'farazmatin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 56, 'QQQ_QQQS 231002 C 360', 1.4, 0, 0, 0),
(216, 'signalchannel', 'farazmatin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 79, 'AAPL_AAPLS 230929 C 170', 1.01, 0, 0, 0),
(217, 'signalchannel', 'farazmatin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 79, 'AAPL_AAPLS 230929 C 170', 1.01, 0, 0, 0),
(218, 'signalchannel', 'farazmatin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 78, 'AAPL_AAPLS 230929 C 170', 1.01, 0, 0, 0),
(219, 'signalchannel', 'farazmatin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 56, 'QQQ_QQQS 231002 C 360', 1.4, 0, 0, 0),
(220, 'signalchannel', 'farazmatin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 80, 'AAPL_AAPLS 230929 C 170', 1.01, 0, 0, 0),
(221, 'signalchannel', 'farazmatin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 57, 'QQQ_QQQS 231002 C 360', 1.4, 0, 0, 0),
(222, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4136.77, 0, 0, 0),
(223, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4135.11, 0, 0, 0),
(224, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 44, 'AMZN_AMZNS 230929 C 128', 0.91, 0, 0, 0),
(225, '🚀︱member-alerts', 'nickkell', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 155, 'PFE_PFES 231020 C 33', 0.52, 0, 0, 0),
(226, '🕴︱jr-analyst-alerts', 'moonshotdg', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 366, 'MCD_MCDS 230929 C 267.5', 0.11, 0, 0, 0),
(227, '🐐︱analyst-alerts', 'evapanda', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 144, 'MSFT_MSFTS 231006 C 330', 0.56, 0, 0, 0),
(228, '🐐︱analyst-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 51, 'QQQ_QQQS 230929 C 363', 0.78, 0, 0, 0),
(229, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4142, 0, 0, 0),
(230, '🕴︱jr-analyst-alerts', 'moonshotdg', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 51, 'QQQ_QQQS 230929 C 363', 0.78, 0, 0, 0),
(231, '🕴︱jr-analyst-alerts', 'moonshotdg', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 79, 'SPY_SPYS 230929 C 433', 0.51, 0, 0, 0),
(232, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 81, 'QQQ_QQQS 231002 C 365', 0.99, 0, 0, 0),
(233, '📈︱makeplays-500', 'makeplays', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 44, 'SPY_SPYS 230929 P 431', 0.9, 0, 0, 0),
(234, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4144.85, 0, 0, 0),
(235, '🐐︱analyst-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 53, 'QQQ_QQQS 230929 C 363', 0.76, 0, 0, 0),
(236, '🐐︱analyst-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 64, 'QQQ_QQQS 230929 C 432', 0.63, 0, 0, 0),
(237, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4125.85, 0, 0, 0),
(238, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4137.25, 0, 0, 0),
(239, '📈︱makeplays-500', 'makeplays', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 36, 'TSLA_TSLAS 230929 P 252.5', 1.09, 0, 0, 0),
(240, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 71, 'QQQ_QQQS 231003 C 365', 1.13, 0, 0, 0),
(241, '🚀︱member-alerts', 'nickkell', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 84, 'ZM_ZMS 231117 C 80', 0.95, 0, 0, 0),
(242, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4135.11, 0, 0, 0),
(243, 'signalchannel', 'farazmatin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 155, 'PFE_PFES 231020 C 33', 0.52, 0, 0, 0),
(244, 'signalchannel', 'farazmatin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 84, 'ZM_ZMS 231117 C 80', 0.95, 0, 0, 0),
(245, 'signalchannel', 'farazmatin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 155, 'PFE_PFES 231020 C 33', 0.52, 0, 0, 0),
(246, 'signalchannel', 'farazmatin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 84, 'ZM_ZMS 231117 C 80', 0.95, 0, 0, 0),
(247, 'signalchannel', 'farazmatin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 155, 'AMD_AMDS 230929 C 104', 0.26, 0, 0, 0),
(248, 'signalchannel', 'farazmatin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 119, 'AMD_AMDS 230929 C 104', 0.34, 0, 0, 0),
(249, '🕴︱jr-analyst-alerts', 'shadowtrader', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4301.55, 0, 0, 0),
(250, '💫︱futures-alerts', 'trav_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4298.58, 0, 0, 0),
(251, '🕴︱jr-analyst-alerts', 'shadowtrader', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4301.55, 0, 0, 0),
(252, 'signalchannel', 'farazmatin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 87, 'AMD_AMDS 230929 C 104', 0.46, 0, 0, 0),
(253, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4276.55, 0, 0, 0),
(254, '🕴︱jr-analyst-alerts', 'moonshotdg', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 117, 'SPY_SPYS 230929 C 429', 0.34, 0, 0, 0),
(255, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4283.48, 0, 0, 0),
(256, '🕴︱jr-analyst-alerts', 'trav_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 69, 'SPY_SPYS 230929 C 427', 0.57, 0, 0, 0),
(257, '🐐︱analyst-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 32, 'QQQ_QQQS 231004 C 359', 2.49, 0, 0, 0),
(258, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4259.97, 0, 0, 0),
(259, '🚀︱member-alerts', 'slimreaper23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 55, 'BABA_BABAS 231013 C 88', 1.44, 0, 0, 0),
(260, '🚀︱member-alerts', 'nickkell', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 159, 'U_US 231006 C 31', 0.5, 0, 0, 0),
(261, '🚀︱member-alerts', 'bendc2r', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 181, 'QQQ_QQQS 231003 P 356', 0.22, 0, 0, 0),
(262, '🚀︱member-alerts', 'slimreaper23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 98, 'SPY_SPYS 231004 P 423', 0.81, 0, 0, 0),
(263, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 56, 'AMD_AMDS 231006 C 104', 1.4, 0, 0, 0),
(264, '🚀︱member-alerts', 'nickkell', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 71, 'BA_BAS 231006 C 195', 1.11, 0, 0, 0),
(265, '🐐︱analyst-alerts', 'tyler0777', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 99, 'AAPL_AAPLS 231006 P 170', 0.8, 0, 0, 0),
(266, '🕴︱jr-analyst-alerts', 'moonshotdg', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 72, 'SPY_SPYS 231003 C 425', 0.55, 0, 0, 0),
(267, '💫︱futures-alerts', 'trav_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4237.7, 0, 0, 0),
(268, '💫︱futures-alerts', 'trav_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4231.26, 0, 0, 0),
(269, '🐐︱analyst-alerts', 'evapanda', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 82, 'QQQ_QQQS 231004 P 353', 0.98, 0, 0, 0),
(270, '🐐︱analyst-alerts', 'tyler0777', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 36, 'TSLA_TSLAS 231006 C 255', 2.18, 0, 0, 0),
(271, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 43, 'QQQ_QQQS 231003 P 355', 0.9, 0, 0, 0),
(272, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 50, 'AAPL_AAPLS 231006 C 172.5', 1.57, 0, 0, 0),
(273, '🐐︱analyst-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 79, 'SPY_SPYS 231003 C 422', 1, 0, 0, 0),
(274, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4224.08, 0, 0, 0),
(275, '🚀︱member-alerts', 'slimreaper23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 82, 'QQQ_QQQS 231006 P 348', 0.97, 0, 0, 0),
(276, '🚀︱member-alerts', 'nickkell', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 30, 'CRM_CRMS 231027 P 190', 2.58, 0, 0, 0),
(277, '🕴︱jr-analyst-alerts', 'shadowtrader', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4215.42, 0, 0, 0),
(278, '📈︱makeplays-500', 'makeplays', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 64, 'AMD_AMDS 231006 C 102', 1.23, 0, 0, 0),
(279, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4219.38, 0, 0, 0),
(280, '🐐︱analyst-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 105, 'SPY_SPYS 231003 C 422', 0.76, 0, 0, 0),
(281, '🕴︱jr-analyst-alerts', 'moonshotdg', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 106, 'SPY_SPYS 231003 C 422', 0.75, 0, 0, 0),
(282, '💫︱futures-alerts', 'tyler0777', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4219.38, 0, 0, 0),
(283, '💫︱futures-alerts', 'catyline', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4231.26, 0, 0, 0),
(284, '🐐︱analyst-alerts', 'tyler0777', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 159, 'QQQ_QQQS 231003 P 354', 0.5, 0, 0, 0),
(285, '🐐︱analyst-alerts', 'makeplays', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 23, 'NFLX_NFLXS 231006 C 380', 3.42, 0, 0, 0),
(286, '🐐︱analyst-alerts', 'tyler0777', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 97, 'SPY_SPYS 231003 C 421', 0.82, 0, 0, 0),
(287, '💫︱futures-alerts', 'trav_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4212.7, 0, 0, 0),
(288, '🐐︱analyst-alerts', 'makeplays', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 76, 'UVXY_UVXYS 231006 P 18.5', 1.05, 0, 0, 0),
(289, '📈︱makeplays-500', 'makeplays', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 153, 'SPY_SPYS 231003 C 421', 0.52, 0, 0, 0),
(290, '🐐︱analyst-alerts', 'evapanda', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 61, 'QQQ_QQQS 231006 C 360', 1.29, 0, 0, 0),
(291, '🐐︱analyst-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 199, 'QQQ_QQQS 231003 C 355', 0.4, 0, 0, 0),
(292, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4215.42, 0, 0, 0),
(293, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4217.89, 0, 0, 0),
(294, '💫︱futures-alerts', 'tyler0777', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4216.9, 0, 0, 0),
(295, '🐐︱analyst-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 147, 'SPY_SPYS 231003 C 421', 0.54, 0, 0, 0),
(296, '💫︱futures-alerts', 'catyline', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4219.63, 0, 0, 0),
(297, '🕴︱jr-analyst-alerts', 'trav_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 53, 'SPY_SPYS 231003 P 420', 1.48, 0, 0, 0),
(298, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 50, 'BBY_BBYS 231215 C 75', 1.59, 0, 0, 0),
(299, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 43, 'QQQ_QQQS 231004 C 358', 0.91, 0, 0, 0),
(300, '🐐︱analyst-alerts', 'makeplays', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 25, 'TSLA_TSLAS 231006 P 250', 3.12, 0, 0, 0),
(301, '🚀︱member-alerts', 'kreedmonger', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 52, 'SPY_SPYS 231004 P 420', 0.76, 0, 0, 0),
(302, 'signalchannel', 'farazmatin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 76, 'QQQ_QQQS 231005 C 360', 1.05, 0, 0, 0),
(303, 'signalchannel', 'farazmatin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 40, 'SPY_SPYS 231004 C 422', 0.99, 0, 0, 0),
(304, '🐐︱analyst-alerts', 'evapanda', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 128, 'AMZN_AMZNS 231006 C 129', 0.62, 0, 0, 0),
(305, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 14, 'QQQ_QQQS 231215 C 380', 5.51, 0, 0, 0),
(306, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 80, 'AMD_AMDS 231006 C 103', 0.99, 0, 0, 0),
(307, '💫︱futures-alerts', 'catyline', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4245.86, 0, 0, 0),
(308, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4227.05, 0, 0, 0),
(309, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4229.28, 0, 0, 0),
(310, '💫︱futures-alerts', 'trav_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4228.54, 0, 0, 0),
(311, '🐐︱analyst-alerts', 'evapanda', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 70, 'GOOGL_GOOGLS 231020 C 140', 1.13, 0, 0, 0),
(312, '🐐︱analyst-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 85, 'BA_BAS 231020 C 200', 0.94, 0, 0, 0),
(313, '🚀︱member-alerts', 'bendc2r', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 268, 'QQQ_QQQS 231004 C 359', 0.15, 0, 0, 0),
(314, '🐐︱analyst-alerts', 'tyler0777', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 73, 'SPY_SPYS 231005 P 424', 1.09, 0, 0, 0),
(315, '🕴︱jr-analyst-alerts', 'nickkell', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 94, 'XLE_XLES 231020 P 80', 0.86, 0, 0, 0),
(316, '🕴︱jr-analyst-alerts', 'shadowtrader', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4271.85, 0, 0, 0),
(317, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4271.11, 0, 0, 0),
(318, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4267.89, 0, 0, 0),
(319, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4268.88, 0, 0, 0),
(320, '🕴︱jr-analyst-alerts', 'trav_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 9, 'SPY_SPYS 231020 C 425', 8.66, 0, 0, 0),
(321, '🚀︱member-alerts', 'nickkell', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 82, 'ZM_ZMS 231013 P 65', 0.99, 0, 0, 0),
(322, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4242.89, 0, 0, 0),
(323, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4271.85, 0, 0, 0),
(324, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4271.35, 0, 0, 0),
(325, '💫︱futures-alerts', 'tyler0777', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4276.3, 0, 0, 0),
(326, '🕴︱jr-analyst-alerts', 'shadowtrader', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4270.86, 0, 0, 0),
(327, '💫︱futures-alerts', 'catyline', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4264.92, 0, 0, 0),
(328, '💫︱futures-alerts', 'catyline', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4263.19, 0, 0, 0),
(329, '💫︱futures-alerts', 'catyline', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4263.19, 0, 0, 0),
(330, '💫︱futures-alerts', 'catyline', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4273.09, 0, 0, 0),
(331, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4281.5, 0, 0, 0),
(332, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 29, 'META_METAS 231006 C 305', 2.75, 0, 0, 0),
(333, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 20, 'NFLX_NFLXS 231006 C 385', 3.93, 0, 0, 0),
(334, '💫︱futures-alerts', 'shadowtrader', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4219.38, 0, 0, 0),
(335, '💫︱futures-alerts', 'shadowtrader', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4207.5, 0, 0, 0),
(336, '🕴︱jr-analyst-alerts', 'moonshotdg', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 77, 'QQQ_QQQS 231005 C 360', 1.05, 0, 0, 0),
(337, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 100, 'AMD_AMDS 231006 C 103', 0.81, 0, 0, 0),
(338, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 14, 'QQQ_QQQS 231215 C 380', 5.51, 0, 0, 0),
(339, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 30, 'NFLX_NFLXS 231006 C 380', 2.64, 0, 0, 0),
(340, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 30, 'TSLA_TSLAS 231006 C 260', 2.62, 0, 0, 0),
(341, '🐐︱analyst-alerts', 'evapanda', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 69, 'COST_COSTS 231020 C 600', 1.17, 0, 0, 0),
(342, '🐐︱analyst-alerts', 'evapanda', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 69, 'COST_COSTS 231020 C 600', 1.17, 0, 0, 0),
(343, '🚀︱member-alerts', 'nickkell', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 62, 'TSLA_TSLAS 231020 P 220', 1.29, 0, 0, 0),
(344, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 96, 'AAPL_AAPLS 231006 C 175', 0.75, 0, 0, 0),
(345, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4233.98, 0, 0, 0),
(346, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 108, 'CRWD_CRWDS 231006 C 165', 0.66, 0, 0, 0),
(347, '🐐︱analyst-alerts', 'tyler0777', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 80, 'SPY_SPYS 231006 C 427', 0.89, 0, 0, 0),
(348, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4235.72, 0, 0, 0),
(349, '💫︱futures-alerts', 'tyler0777', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4223.34, 0, 0, 0),
(350, '🚀︱member-alerts', 'bendc2r', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 128, 'QQQ_QQQS 231005 C 358', 0.27, 0, 0, 0),
(351, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4223.34, 0, 0, 0),
(352, '🐐︱analyst-alerts', 'moonshotdg', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 52, 'SPY_SPYS 231005 C 423', 0.66, 0, 0, 0),
(353, '💫︱futures-alerts', 'makeplays', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4221.36, 0, 0, 0),
(354, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4222.1, 0, 0, 0),
(355, '🐐︱analyst-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 35, 'SPY_SPYS 231005 C 422', 0.96, 0, 0, 0),
(356, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4225.81, 0, 0, 0),
(357, '💫︱futures-alerts', 'catyline', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4227.3, 0, 0, 0),
(358, '💫︱futures-alerts', 'makeplays', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4231.26, 0, 0, 0),
(359, '💫︱futures-alerts', 'catyline', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4234.48, 0, 0, 0),
(360, '🐐︱analyst-alerts', 'tyler0777', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 66, 'SPY_SPYS 231006 P 420', 1.04, 0, 0, 0),
(361, '💫︱futures-alerts', 'shadowtrader', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4227.3, 0, 0, 0),
(362, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4229.28, 0, 0, 0),
(363, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4224.33, 0, 0, 0),
(364, '💫︱futures-alerts', 'shadowtrader', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4227.3, 0, 0, 0),
(365, '💫︱futures-alerts', 'tyler0777', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4230.27, 0, 0, 0),
(366, '🚀︱member-alerts', 'bendc2r', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 144, 'QQQ_QQQS 231005 P 357', 0.24, 0, 0, 0),
(367, '🐐︱analyst-alerts', 'tyler0777', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 46, 'SPY_SPYS 231005 C 424', 0.75, 0, 0, 0),
(368, '💫︱futures-alerts', 'shadowtrader', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4242.15, 0, 0, 0),
(369, '🚀︱member-alerts', 'bendc2r', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 263, 'QQQ_QQQS 231005 P 357', 0.13, 0, 0, 0),
(370, '🚀︱member-alerts', 'nickkell', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 34, 'ORCL_ORCLS 231215 P 97.5', 1.98, 0, 0, 0),
(371, '🚀︱member-alerts', 'bendc2r', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 156, 'QQQ_QQQS 231005 P 358', 0.22, 0, 0, 0),
(372, '📈︱makeplays-500', 'makeplays', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 70, 'SPY_SPYS 231005 P 425', 0.49, 0, 0, 0),
(373, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4252.05, 0, 0, 0),
(374, '🐐︱analyst-alerts', 'tyler0777', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 264, 'CHWY_CHWYS 231020 C 20', 0.26, 0, 0, 0),
(375, '💫︱futures-alerts', 'shadowtrader', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4245.12, 0, 0, 0),
(376, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4209.48, 0, 0, 0),
(377, '💫︱futures-alerts', 'makeplays', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4209.48, 0, 0, 0),
(378, '💫︱futures-alerts', 'catyline', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4219.13, 0, 0, 0),
(379, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 35, 'AMD_AMDS 231006 C 103', 0.97, 0, 0, 0),
(380, '💫︱futures-alerts', 'catyline', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4224.82, 0, 0, 0),
(381, '💫︱futures-alerts', 'catyline', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4216.41, 0, 0, 0),
(382, '🐐︱analyst-alerts', 'evapanda', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 73, 'SNOW_SNOWS 231006 C 155', 0.47, 0, 0, 0),
(383, '🚀︱member-alerts', 'bendc2r', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 112, 'QQQ_QQQS 231006 C 359', 0.3, 0, 0, 0),
(384, '💫︱futures-alerts', 'makeplays', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4213.44, 0, 0, 0),
(385, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4215.42, 0, 0, 0),
(386, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 56, 'GOOGL_GOOGLS 231013 C 138', 1.21, 0, 0, 0),
(387, '📈︱makeplays-500', 'makeplays', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 34, 'SPY_SPYS 231006 C 422', 0.99, 0, 0, 0),
(388, '🚀︱member-alerts', 'bendc2r', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 113, 'QQQ_QQQS 231006 P 354', 0.3, 0, 0, 0),
(389, '🚀︱member-alerts', 'bendc2r', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 125, 'QQQ_QQQS 231006 P 355', 0.27, 0, 0, 0),
(390, '📈︱makeplays-500', 'makeplays', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 60, 'SPY_SPYS 231006 P 422', 0.56, 0, 0, 0),
(391, '🚀︱member-alerts', 'bendc2r', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 166, 'QQQ_QQQS 231006 P 355', 0.2, 0, 0, 0),
(392, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4238.19, 0, 0, 0),
(393, '💫︱futures-alerts', 'catyline', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4236.95, 0, 0, 0),
(394, '📈︱makeplays-500', 'makeplays', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 45, 'TSLA_TSLAS 231006 P 252.5', 0.74, 0, 0, 0),
(395, '🚀︱member-alerts', 'bendc2r', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 130, 'QQQ_QQQS 231006 P 358', 0.26, 0, 0, 0),
(396, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4281.75, 0, 0, 0),
(397, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4286.45, 0, 0, 0),
(398, '🚀︱member-alerts', 'bendc2r', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 120, 'QQQ_QQQS 231006 P 360', 0.28, 0, 0, 0),
(399, '🚀︱member-alerts', 'bendc2r', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 222, 'QQQ_QQQS 231006 P 360', 0.15, 0, 0, 0),
(400, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1650, 'PYPL_PYPLS 231013 C 65', 0.04, 0, 0, 0),
(401, '📈︱makeplays-500', 'makeplays', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 63, 'SPY_SPYS 231006 P 429', 0.51, 0, 0, 0),
(402, '💫︱futures-alerts', 'shadowtrader', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4307.49, 0, 0, 0),
(403, '💫︱futures-alerts', 'trav_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4311.7, 0, 0, 0),
(404, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 20, 'NFLX_NFLXS 231013 C 390', 3.2, 0, 0, 0),
(405, '💫︱futures-alerts', 'shadowtrader', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4305.51, 0, 0, 0),
(406, '💫︱futures-alerts', 'shadowtrader', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4268.88, 0, 0, 0),
(407, '💫︱futures-alerts', 'shadowtrader', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4259.97, 0, 0, 0),
(408, '💫︱futures-alerts', 'shadowtrader', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4263.93, 0, 0, 0),
(409, '💫︱futures-alerts', 'shadowtrader', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4263.93, 0, 0, 0),
(410, '💫︱futures-alerts', 'trav_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4279.52, 0, 0, 0),
(411, '🚀︱member-alerts', 'bendc2r', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 158, 'QQQ_QQQS 231009 C 365', 0.2, 0, 0, 0);
INSERT INTO `tradeexecution` (`id`, `ChannelName`, `ProviderName`, `CreationTime`, `ExecutionTime`, `Quantity`, `Instrument`, `EntryPrice`, `ExitPrice`, `PnL_amount`, `Pnl_perc`) VALUES
(412, '🐐︱analyst-alerts', 'husky_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 51, 'NFLX_NFLXS 231013 C 400', 1.22, 0, 0, 0),
(413, '🐐︱analyst-alerts', 'husky_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'NDX_NDXS 231009 C 15000', 16.78, 0, 0, 0),
(414, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 36, 'QQQ_QQQS 231009 P 362', 0.86, 0, 0, 0),
(415, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4287.94, 0, 0, 0),
(416, '🚀︱member-alerts', 'slimreaper23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 31, 'SPY_SPYS 231013 P 425', 1.98, 0, 0, 0),
(417, 'signalchannel', 'farazmatin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4287.94, 0, 0, 0),
(418, 'signalchannel', 'farazmatin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4287.94, 0, 0, 0),
(419, 'signalchannel', 'farazmatin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4287.94, 0, 0, 0),
(420, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4290.66, 0, 0, 0),
(421, 'signalchannel', 'farazmatin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4287.94, 0, 0, 0),
(422, '🚀︱member-alerts', 'bendc2r', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 122, 'QQQ_QQQS 231009 P 359', 0.26, 0, 0, 0),
(423, '💫︱futures-alerts', 'catyline', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4283.98, 0, 0, 0),
(424, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4287.2, 0, 0, 0),
(425, '🐐︱analyst-alerts', 'moonshotdg', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 63, 'SPY_SPYS 231009 C 430', 0.5, 0, 0, 0),
(426, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 35, 'QQQ_QQQS 231009 C 364', 0.89, 0, 0, 0),
(427, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4283.73, 0, 0, 0),
(428, 'signalchannel', 'farazmatin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 158, 'QQQ_QQQS 231009 P 359', 0.2, 0, 0, 0),
(429, 'signalchannel', 'farazmatin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 144, 'QQQ_QQQS 231009 P 359', 0.22, 0, 0, 0),
(430, 'signalchannel', 'farazmatin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 184, 'QQQ_QQQS 231009 P 359', 0.17, 0, 0, 0),
(431, '🐐︱analyst-alerts', 'tyler0777', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 58, 'SPY_SPYS 231010 P 425', 1.07, 0, 0, 0),
(432, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4276.8, 0, 0, 0),
(433, '🐐︱analyst-alerts', 'moonshotdg', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 9, 'SPX_SPXS 231009 C 4305', 3.17, 0, 0, 0),
(434, 'signalchannel', 'farazmatin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4276.8, 0, 0, 0),
(435, 'signalchannel', 'farazmatin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 9, 'SPX_SPXS 231009 C 4305', 3.17, 0, 0, 0),
(436, 'signalchannel', 'farazmatin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 9, 'SPX_SPXS 231009 C 4305', 3.17, 0, 0, 0),
(437, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 38, 'XOM_XOMS 231027 C 115', 1.63, 0, 0, 0),
(438, '🐐︱analyst-alerts', 'evapanda', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 66, 'LLY_LLYS 231013 C 600', 0.94, 0, 0, 0),
(439, '🚀︱member-alerts', 'bendc2r', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 155, 'QQQ_QQQS 231009 P 360', 0.2, 0, 0, 0),
(440, '🚀︱member-alerts', 'slimreaper23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 33, 'SPY_SPYS 231013 P 425', 1.86, 0, 0, 0),
(441, '💫︱futures-alerts', 'trav_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4330.75, 0, 0, 0),
(442, '🚀︱member-alerts', 'bendc2r', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 170, 'QQQ_QQQS 231009 P 361', 0.18, 0, 0, 0),
(443, '🚀︱member-alerts', 'bendc2r', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 121, 'QQQ_QQQS 231009 P 362', 0.25, 0, 0, 0),
(444, '🐐︱analyst-alerts', 'moonshotdg', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 13, 'SPX_SPXS 231009 P 4285', 2.28, 0, 0, 0),
(445, '🐐︱analyst-alerts', 'husky_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 18, 'TSLA_TSLAS 231013 C 260', 3.32, 0, 0, 0),
(446, '🐐︱analyst-alerts', 'evapanda', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 133, 'AVGO_AVGOS 231013 C 900', 0.45, 0, 0, 0),
(447, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 57, 'NVDA_NVDAS 231013 C 475', 1.04, 0, 0, 0),
(448, '💫︱futures-alerts', 'shadowtrader', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4353, 0, 0, 0),
(449, '🚀︱member-alerts', 'slimreaper23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 31, 'SPY_SPYS 231011 P 431', 1.98, 0, 0, 0),
(450, '🚀︱member-alerts', 'bendc2r', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 129, 'QQQ_QQQS 231009 P 365', 0.24, 0, 0, 0),
(451, '🚀︱member-alerts', 'bendc2r', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 181, 'QQQ_QQQS 231009 P 365', 0.17, 0, 0, 0),
(452, '🚀︱member-alerts', 'bendc2r', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 226, 'QQQ_QQQS 231010 P 361', 0.27, 0, 0, 0),
(453, '🚀︱member-alerts', 'molriel568', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 9, 'SPX_SPXS 231009 P 4330', 3.27, 0, 0, 0),
(454, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4366, 0, 0, 0),
(455, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4366.75, 0, 0, 0),
(456, '💫︱futures-alerts', 'shadowtrader', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4364, 0, 0, 0),
(457, 'signalchannel', 'farazmatin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4325.31, 0, 0, 0),
(458, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4366, 0, 0, 0),
(459, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4372, 0, 0, 0),
(460, 'signalchannel', 'farazmatin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4329.27, 0, 0, 0),
(461, 'signalchannel', 'farazmatin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4329.27, 0, 0, 0),
(462, 'signalchannel', 'farazmatin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4328.77, 0, 0, 0),
(463, 'signalchannel', 'farazmatin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4333.23, 0, 0, 0),
(464, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4372.75, 0, 0, 0),
(465, '💫︱futures-alerts', 'shadowtrader', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4373, 0, 0, 0),
(466, '🐐︱analyst-alerts', 'evapanda', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 45, 'META_METAS 231013 C 330', 1.31, 0, 0, 0),
(467, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4375.5, 0, 0, 0),
(468, '🐐︱analyst-alerts', 'evapanda', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 55, 'META_METAS 231013 C 330', 1.06, 0, 0, 0),
(469, '🐐︱analyst-alerts', 'moonshotdg', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 39, 'SPY_SPYS 231010 C 434', 0.75, 0, 0, 0),
(470, '🚀︱member-alerts', 'bendc2r', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 102, 'QQQ_QQQS 231010 P 364', 0.29, 0, 0, 0),
(471, '🚀︱member-alerts', 'slimreaper23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 13, 'SPX_SPXS 231010 C 4370', 2.28, 0, 0, 0),
(472, '🚀︱member-alerts', 'slimreaper23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 13, 'SPX_SPXS 231010 C 4370', 2.28, 0, 0, 0),
(473, '🐐︱analyst-alerts', 'makeplays', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 44, 'AMD_AMDS 231013 P 106', 1.33, 0, 0, 0),
(474, '🚀︱member-alerts', 'slimreaper23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 12, 'SPX_SPXS 231010 C 4370', 2.48, 0, 0, 0),
(475, '🐐︱analyst-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 48, 'QQQ_QQQS 231011 C 369', 1.22, 0, 0, 0),
(476, '🐐︱analyst-alerts', 'evapanda', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 53, 'ZS_ZSS 231020 C 185', 1.12, 0, 0, 0),
(477, '🚀︱member-alerts', 'bendc2r', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 610, 'QQQ_QQQS 231010 P 361', 0.05, 0, 0, 0),
(478, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 55, 'PYPL_PYPLS 231013 C 58', 1.09, 0, 0, 0),
(479, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4397.25, 0, 0, 0),
(480, '💫︱futures-alerts', 'shadowtrader', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4402, 0, 0, 0),
(481, '🚀︱member-alerts', 'bendc2r', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 99, 'QQQ_QQQS 231010 P 368', 0.3, 0, 0, 0),
(482, '💫︱futures-alerts', 'shadowtrader', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4412, 0, 0, 0),
(483, '📈︱makeplays-500', 'makeplays', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 53, 'SPY_SPYS 231010 P 436', 0.55, 0, 0, 0),
(484, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 74, 'COIN_COINS 231013 C 83', 0.79, 0, 0, 0),
(485, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 19, 'NFLX_NFLXS 231013 P 380', 2.94, 0, 0, 0),
(486, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 24, 'NFLX_NFLXS 231013 P 370', 2.44, 0, 0, 0),
(487, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4397.5, 0, 0, 0),
(488, '🚀︱member-alerts', 'bendc2r', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 125, 'QQQ_QQQS 231010 P 367', 0.23, 0, 0, 0),
(489, '💫︱futures-alerts', 'catyline', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4398, 0, 0, 0),
(490, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 40, 'QQQ_QQQS 231010 C 369', 0.72, 0, 0, 0),
(491, '🐐︱analyst-alerts', 'evapanda', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 29, 'SMCI_SMCIS 231013 C 330', 1.98, 0, 0, 0),
(492, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 59, 'QQQ_QQQS 231011 C 371', 0.98, 0, 0, 0),
(493, '💫︱futures-alerts', 'shadowtrader', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4403, 0, 0, 0),
(494, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4399.75, 0, 0, 0),
(495, '💸︱husky-bluecard', 'husky_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 26, 'TSLA_TSLAS 231013 C 270', 2.18, 0, 0, 0),
(496, '💸︱husky-bluecard', 'husky_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 9, 'SPX_SPXS 231010 C 4370', 3.07, 0, 0, 0),
(497, '🚀︱member-alerts', 'molriel568', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4, 'SPX_SPXS 231010 C 4365', 2.48, 0, 0, 0),
(498, '🐐︱analyst-alerts', 'husky_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 232, 'SPX_SPXS 231010 C 4370', 0.5, 0, 0, 0),
(499, '🐐︱analyst-alerts', 'oogwayta', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 306, 'AAPL_AAPLS 231013 P 175', 0.38, 0, 0, 0),
(500, '🚀︱member-alerts', 'bendc2r', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 55, 'QQQ_QQQS 231011 P 366', 0.21, 0, 0, 0),
(501, '🐐︱analyst-alerts', 'evapanda', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 78, 'TSLA_TSLAS 231013 C 275', 1.48, 0, 0, 0),
(502, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5, 'SPX_SPXS 231011 P 4330', 2.16, 0, 0, 0),
(503, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 9, 'NVDA_NVDAS 231013 P 455', 2.29, 0, 0, 0),
(504, '🐐︱analyst-alerts', 'moonshotdg', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 51, 'SPY_SPYS 231011 C 435', 1.1, 0, 0, 0),
(505, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 22, 'ENPH_ENPHS 231013 P 125', 1.01, 0, 0, 0),
(506, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 153, 'AAPL_AAPLS 231013 C 180', 0.74, 0, 0, 0),
(507, '🐐︱analyst-alerts', 'makeplays', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 54, 'META_METAS 231013 P 322.5', 2.06, 0, 0, 0),
(508, '🚀︱member-alerts', 'A_Weird_Folder', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 8, 'TSLA_TSLAS 231013 C 267.5', 2.83, 0, 0, 0),
(509, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 114, 'AAPL_AAPLS 231020 C 182.5', 1, 0, 0, 0),
(510, '🚀︱member-alerts', 'kreedmonger', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 23, 'MRNA_MRNAS 231013 C 106', 0.96, 0, 0, 0),
(511, '🚀︱member-alerts', 'tslabobb', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 7, 'SPX_SPXS 231011 C 4385', 1.48, 0, 0, 0),
(512, '🐐︱analyst-alerts', 'husky_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 25, 'SPX_SPXS 231011 C 4380', 2.18, 0, 0, 0),
(513, '📈︱makeplays-500', 'makeplays', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 27, 'XSP_XSPS 231011 C 437', 0.4, 0, 0, 0),
(514, '🐐︱analyst-alerts', 'trav_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 55, 'SPY_SPYS 231011 C 434', 0.99, 0, 0, 0),
(515, '🚀︱member-alerts', 'kreedmonger', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 11, 'META_METAS 231013 C 330', 1.91, 0, 0, 0),
(516, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 9, 'SPX_SPXS 231011 C 4380', 1.14, 0, 0, 0),
(517, '🐐︱analyst-alerts', 'tyler0777', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 108, 'SPY_SPYS 231011 C 435', 0.5, 0, 0, 0),
(518, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 15, 'SPX_SPXS 231011 C 4380', 0.69, 0, 0, 0),
(519, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 12, 'PANW_PANWS 231013 C 260', 1.73, 0, 0, 0),
(520, '🚀︱member-alerts', 'kreedmonger', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 28, 'MRNA_MRNAS 231013 C 105', 0.78, 0, 0, 0),
(521, '🚀︱member-alerts', 'kreedmonger', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 25, 'NFLX_NFLXS 231013 C 380', 0.89, 0, 0, 0),
(522, '🐐︱analyst-alerts', 'makeplays', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 57, 'SPY_SPYS 231016 C 437', 1.94, 0, 0, 0),
(523, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 11, 'NFLX_NFLXS 231013 C 375', 1.88, 0, 0, 0),
(524, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 188, 'QQQ_QQQS 231011 C 370', 0.59, 0, 0, 0),
(525, '🚀︱member-alerts', 'kreedmonger', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 15, 'SPY_SPYS 231012 C 436', 0.73, 0, 0, 0),
(526, '📈︱makeplays-500', 'makeplays', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 24, 'AMD_AMDS 231013 P 109', 0.89, 0, 0, 0),
(527, '🐐︱analyst-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 108, 'QQQ_QQQS 231012 C 374', 0.51, 0, 0, 0),
(528, '🐐︱analyst-alerts', 'husky_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 25, 'SPX_SPXS 231012 C 4400', 2.18, 0, 0, 0),
(529, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 8, 'TSLA_TSLAS 231013 C 265', 2.71, 0, 0, 0),
(530, '🐐︱analyst-alerts', 'makeplays', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 117, 'MSFT_MSFTS 231013 P 330', 0.94, 0, 0, 0),
(531, '🐐︱analyst-alerts', 'tyler0777', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 108, 'SPY_SPYS 231012 C 437', 0.51, 0, 0, 0),
(532, '🐐︱analyst-alerts', 'moonshotdg', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 110, 'AMZN_AMZNS 231013 P 134', 1, 0, 0, 0),
(533, '🚀︱member-alerts', 'bendc2r', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 54, 'QQQ_QQQS 231012 P 370', 0.2, 0, 0, 0),
(534, '🐐︱analyst-alerts', 'husky_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 131, 'TSLA_TSLAS 231013 C 270', 0.83, 0, 0, 0),
(535, '🐐︱analyst-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 121, 'QQQ_QQQS 231012 C 374', 0.45, 0, 0, 0),
(536, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 155, 'COIN_COINS 231013 C 81', 0.14, 0, 0, 0),
(537, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 30, 'AMD_AMDS 231013 C 111', 0.71, 0, 0, 0),
(538, '🚀︱member-alerts', 'slimreaper23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'SPX_SPXS 231012 C 4390', 3.66, 0, 0, 0),
(539, '🚀︱member-alerts', 'slimreaper23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 21, 'SPY_SPYS 231013 C 438', 1.01, 0, 0, 0),
(540, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 17, 'SPY_SPYS 231013 C 436', 1.29, 0, 0, 0),
(541, '🚀︱member-alerts', 'bendc2r', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 48, 'QQQ_QQQS 231012 C 372', 0.24, 0, 0, 0),
(542, '🚀︱member-alerts', 'bendc2r', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 63, 'QQQ_QQQS 231012 P 368', 0.19, 0, 0, 0),
(543, '🐐︱analyst-alerts', 'tyler0777', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 119, 'SPY_SPYS 231012 C 434', 0.5, 0, 0, 0),
(544, '📈︱makeplays-500', 'makeplays', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 29, 'SPY_SPYS 231012 C 434', 0.42, 0, 0, 0),
(545, '🐐︱analyst-alerts', 'husky_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 38, 'SPX_SPXS 231012 C 4360', 1.58, 0, 0, 0),
(546, '🐐︱analyst-alerts', 'moonshotdg', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 76, 'SPY_SPYS 231012 P 433', 0.79, 0, 0, 0),
(547, '🐐︱analyst-alerts', 'tyler0777', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 208, 'SPY_SPYS 231016 P 428', 0.56, 0, 0, 0),
(548, '💫︱futures-alerts', 'kreedmonger', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4346.1, 0, 0, 0),
(549, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 10, 'SPX_SPXS 231013 P 4300', 1.09, 0, 0, 0),
(550, '📈︱makeplays-500', 'makeplays', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 41, 'UVXY_UVXYS 231013 P 16', 0.28, 0, 0, 0),
(551, '🚀︱member-alerts', 'bendc2r', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 36, 'QQQ_QQQS 231013 C 370', 0.32, 0, 0, 0),
(552, '🚀︱member-alerts', 'bendc2r', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 52, 'QQQ_QQQS 231013 C 370', 0.22, 0, 0, 0),
(553, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 10, 'META_METAS 231020 C 330', 2.1, 0, 0, 0),
(554, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 16, 'SPX_SPXS 231013 C 4380', 0.69, 0, 0, 0),
(555, '🚀︱member-alerts', 'bendc2r', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 30, 'QQQ_QQQS 231013 C 368', 0.38, 0, 0, 0),
(556, '🚀︱member-alerts', 'slimreaper23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 12, 'SE_SES 231103 C 48', 1.83, 0, 0, 0),
(557, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 16, 'CVNA_CVNAS 231020 C 35', 1.39, 0, 0, 0),
(558, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 10, 'GOOGL_GOOGLS 231020 C 140', 1.09, 0, 0, 0),
(559, 'zetrading', 'innovation11988', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 22, 'MSFT_MSFTS 231020 C 340', 1.02, 0, 0, 0),
(560, 'signalchannel', 'farazmatin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4, 'QQQ_QQQS 231013 C 366', 1.19, 0, 0, 0),
(561, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 8, 'QQQ_QQQS 231016 C 367', 1.37, 0, 0, 0),
(562, '🚀︱member-alerts', 'slimreaper23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 8, 'SPY_SPYS 231016 P 429', 1.39, 0, 0, 0),
(563, 'signalchannel', 'farazmatin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5, 'SPX_SPXS 231013 C 4360', 1.1, 0, 0, 0),
(564, 'signalchannel', 'farazmatin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'SPX_SPXS 231013 C 4330', 4.26, 0, 0, 0),
(565, 'signalchannel', 'farazmatin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4, 'SPX_SPXS 231013 C 4360', 1.32, 0, 0, 0),
(566, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5, 'SPX_SPXS 231016 C 4390', 1.09, 0, 0, 0),
(567, '🚀︱member-alerts', 'kreedmonger', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, 'SPX_SPXS 231016 P 4315', 1.88, 0, 0, 0),
(568, '💸︱husky-1k-bluecard', 'husky_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'TSLA_TSLAS 231020 C 260', 4.8, 0, 0, 0),
(569, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'SPX_SPXS 231016 C 4400', 1.98, 0, 0, 0),
(570, '📈︱makeplays-500', 'makeplays', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 14, 'SPY_SPYS 231016 P 434', 0.38, 0, 0, 0),
(571, '🐐︱analyst-alerts', 'tyler0777', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 14, 'SPY_SPYS 231016 P 435', 0.39, 0, 0, 0),
(572, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 7, 'QQQ_QQQS 231016 P 369', 0.72, 0, 0, 0),
(573, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 11, 'AMZN_AMZNS 231020 C 134', 0.97, 0, 0, 0),
(574, '🐐︱analyst-alerts', 'tyler0777', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 12, 'SPY_SPYS 231016 P 435', 0.47, 0, 0, 0),
(575, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 7, 'SPY_SPYS 231016 C 437', 0.74, 0, 0, 0),
(576, '💸︱husky-1k-bluecard', 'husky_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'SPX_SPXS 231016 C 4390', 2.18, 0, 0, 0),
(577, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 12, 'SPY_SPYS 231017 C 438', 0.89, 0, 0, 0),
(578, '🐐︱analyst-alerts', 'tyler0777', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 9, 'GOOGL_GOOGLS 231020 C 140', 1.13, 0, 0, 0),
(579, '🐐︱analyst-alerts', 'tyler0777', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 11, 'GOOGL_GOOGLS 231020 C 140', 0.97, 0, 0, 0),
(580, '🐐︱analyst-alerts', 'tyler0777', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 22, 'SPY_SPYS 231017 C 439', 0.5, 0, 0, 0),
(581, '💸︱husky-1k-bluecard', 'husky_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, 'SPX_SPXS 231016 C 4385', 1.44, 0, 0, 0),
(582, '🚀︱member-alerts', 'slimreaper23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 9, 'SE_SES 231027 C 48', 1.24, 0, 0, 0),
(583, '🐐︱analyst-alerts', 'evapanda', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 8, 'SPX_SPXS 231018 C 4450', 1.39, 0, 0, 0),
(584, '🚀︱member-alerts', 'molriel568', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 8, 'SPX_SPXS 231016 C 4380', 0.69, 0, 0, 0),
(585, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4, 'QQQ_QQQS 231017 P 365', 1.14, 0, 0, 0),
(586, '💸︱husky-1k-bluecard', 'husky_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 28, 'RIVN_RIVNS 231020 C 20', 0.4, 0, 0, 0),
(587, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, 'SPX_SPXS 231017 C 4380', 1.53, 0, 0, 0),
(588, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5, 'TSLA_TSLAS 231020 C 260', 1.95, 0, 0, 0),
(589, '🐐︱analyst-alerts', 'moonshotdg', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 6, 'SPY_SPYS 231017 C 434', 0.82, 0, 0, 0),
(590, '🚀︱member-alerts', 'bendc2r', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 17, 'QQQ_QQQS 231017 C 367', 0.33, 0, 0, 0),
(591, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'SPX_SPXS 231017 P 4305', 2.67, 0, 0, 0),
(592, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5, 'QQQ_QQQS 231017 C 365', 1.08, 0, 0, 0),
(593, '🐐︱analyst-alerts', 'makeplays', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 7, 'AMD_AMDS 231020 C 103', 1.47, 0, 0, 0),
(594, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 6, 'SPX_SPXS 231017 P 4310', 0.94, 0, 0, 0),
(595, '🚀︱member-alerts', 'bendc2r', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 18, 'QQQ_QQQS 231017 P 365', 0.3, 0, 0, 0),
(596, '🐐︱analyst-alerts', 'tyler0777', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 8, 'SPY_SPYS 231017 P 434', 0.64, 0, 0, 0),
(597, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 9, 'QQQ_QQQS 231018 C 369', 1.24, 0, 0, 0),
(598, '📈︱makeplays-500', 'makeplays', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 10, 'SPY_SPYS 231017 P 435', 0.56, 0, 0, 0),
(599, '🚀︱member-alerts', 'nickkell', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 23, 'XLE_XLES 231117 P 84', 0.49, 0, 0, 0),
(600, '🚀︱member-alerts', 'jay50234', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5, 'SPX_SPXS 231117 P 4370', 2.08, 0, 0, 0),
(601, '🐐︱analyst-alerts', 'tyler0777', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 17, 'SPY_SPYS 231017 C 438', 0.33, 0, 0, 0),
(602, '💸︱husky-1k-bluecard', 'husky_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'SPX_SPXS 231017 P 4365', 2.43, 0, 0, 0),
(603, '🚀︱member-alerts', 'molriel568', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'SPX_SPXS 231017 P 4365', 2.28, 0, 0, 0),
(604, '🚀︱member-alerts', 'jay50234', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 6, 'SPX_SPXS 231017 C 4390', 0.89, 0, 0, 0),
(605, '🐐︱analyst-alerts', 'evapanda', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 26, 'SQQQ_SQQQS 231027 C 20', 0.42, 0, 0, 0),
(606, '🐐︱analyst-alerts', 'moonshotdg', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 8, 'SPY_SPYS 231017 C 435', 0.67, 0, 0, 0),
(607, '🐐︱analyst-alerts', 'trav_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 9, 'QQQ_QQQS 231017 P 368', 0.59, 0, 0, 0),
(608, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, 'SPX_SPXS 231018 C 4400', 3.46, 0, 0, 0),
(609, '🐐︱analyst-alerts', 'trav_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 7, 'SPY_SPYS 231020 C 438', 1.56, 0, 0, 0),
(610, '🐐︱analyst-alerts', 'moonshotdg', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 9, 'SPY_SPYS 231019 C 438', 1.23, 0, 0, 0),
(611, '💫︱futures-alerts', 'tyler0777', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4402, 0, 0, 0),
(612, '🐐︱analyst-alerts', 'moonshotdg', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 9, 'SPY_SPYS 231019 C 438', 1.23, 0, 0, 0),
(613, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, 'SPX_SPXS 231018 C 4400', 3.46, 0, 0, 0),
(614, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 8, 'ENPH_ENPHS 231020 P 125', 1.27, 0, 0, 0),
(615, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5, 'SPY_SPYS 231018 P 433', 1.12, 0, 0, 0),
(616, '📈︱makeplays-500', 'makeplays', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 9, 'AMD_AMDS 231020 C 104', 1.18, 0, 0, 0),
(617, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4369.05, 0, 0, 0),
(618, '🗣｜member-plays', 'clavitopaz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 11, 'SPY_SPYS 231027 C 440', 2, 0, 0, 0),
(619, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4366.81, 0, 0, 0),
(620, '🐐︱analyst-alerts', 'evapanda', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 11, 'NVDA_NVDAS 231020 P 400', 0.99, 0, 0, 0),
(621, '🚀︱member-alerts', 'bendc2r', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 20, 'QQQ_QQQS 231018 P 363', 0.28, 0, 0, 0),
(622, '💸︱husky-1k-bluecard', 'husky_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, 'SPX_SPXS 231018 C 4390', 1.68, 0, 0, 0),
(623, '🐐︱analyst-alerts', 'makeplays', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, 'SPY_SPYS 231023 C 435', 2.93, 0, 0, 0),
(624, '📈︱makeplays-500', 'makeplays', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 16, 'UVXY_UVXYS 231020 P 17', 0.7, 0, 0, 0),
(625, '🚀︱member-alerts', 'bendc2r', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 14, 'SPX_SPXS 231018 C 4390', 0.4, 0, 0, 0),
(626, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 9, 'GOOGL_GOOGLS 231020 C 140', 1.19, 0, 0, 0),
(627, '💫︱futures-alerts', 'catyline', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4326.05, 0, 0, 0),
(628, '🚀︱member-alerts', 'kreedmonger', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 15, 'SPY_SPYS 231018 C 435', 0.37, 0, 0, 0),
(629, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 9, 'TSLA_TSLAS 231020 C 270', 1.25, 0, 0, 0),
(630, '🚀︱member-alerts', 'jay50234', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'SPX_SPXS 231018 C 4370', 2.08, 0, 0, 0),
(631, '🗣｜member-plays', 'tradeaware21', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 17, 'LULU_LULUS 231020 P 407.5', 3.27, 0, 0, 0),
(632, '💸︱husky-1k-bluecard', 'husky_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'SPX_SPXS 231018 C 4360', 4.65, 0, 0, 0),
(633, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 8, 'AAPL_AAPLS 231020 C 177.5', 1.38, 0, 0, 0),
(634, '💫︱futures-alerts', 'catyline', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4327.29, 0, 0, 0),
(635, '💫︱futures-alerts', 'catyline', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4324.07, 0, 0, 0),
(636, '🚀︱member-alerts', 'jay50234', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'SPX_SPXS 231018 P 4315', 2.77, 0, 0, 0),
(637, '🚀︱member-alerts', 'jay50234', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'SPX_SPXS 231018 P 4315', 2.77, 0, 0, 0),
(638, '🐐︱analyst-alerts', 'tyler0777', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 16, 'SPY_SPYS 231018 C 435', 0.34, 0, 0, 0),
(639, '🐐︱analyst-alerts', 'makeplays', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, 'SPY_SPYS 231024 C 433', 3.6, 0, 0, 0),
(640, '💫︱futures-alerts', 'tyler0777', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4328.28, 0, 0, 0),
(641, '🐐︱analyst-alerts', 'makeplays', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, 'SPY_SPYS 231024 C 433', 3.27, 0, 0, 0),
(642, '🗣｜member-plays', 'emmaten', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 25, 'SPY_SPYS 231018 C 433', 0.44, 0, 0, 0),
(643, '💸︱husky-1k-bluecard', 'husky_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 14, 'SPX_SPXS 231020 C 4450', 0.79, 0, 0, 0),
(644, '🐐︱analyst-alerts', 'tyler0777', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 14, 'SPY_SPYS 231018 C 434', 0.4, 0, 0, 0),
(645, '🚀︱member-alerts', 'jay50234', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4, 'SPX_SPXS 231018 C 4350', 1.39, 0, 0, 0),
(646, '🗣｜member-plays', 'tradeaware21', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 19, 'QQQ_QQQS 231018 C 365', 0.57, 0, 0, 0),
(647, '🗣｜member-plays', 'Gizmo', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 23, 'DIS_DISS 231103 P 83', 0.94, 0, 0, 0),
(648, '🗣｜member-plays', 'Gizmo', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 10, 'AAPL_AAPLS 231103 P 170', 2.08, 0, 0, 0),
(649, '🐐︱analyst-alerts', 'tyler0777', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 9, 'SPY_SPYS 231018 C 433', 0.57, 0, 0, 0),
(650, '🗣｜member-plays', 'dryx1476', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5, 'TSLA_TSLAS 231027 C 260', 4.01, 0, 0, 0),
(651, '🐐︱analyst-alerts', 'tyler0777', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 13, 'SPY_SPYS 231018 P 431', 0.43, 0, 0, 0),
(652, '🐐︱analyst-alerts', 'makeplays', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 6, 'SPY_SPYS 231019 C 432', 1.73, 0, 0, 0),
(653, '🚀︱member-alerts', 'molriel568', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5, 'SPX_SPXS 231018 P 4305', 0.99, 0, 0, 0),
(654, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 32, 'SPX_SPXS 231020 C 4450', 0.35, 0, 0, 0),
(655, '🗣｜member-plays', 'dryx1476', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 14, 'LLY_LLYS 231020 C 620', 1.58, 0, 0, 0),
(656, '🚀︱member-alerts', 'kreedmonger', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 14, 'SPX_SPXS 231018 C 4320', 0.79, 0, 0, 0),
(657, '🐐︱analyst-alerts', 'trav_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 6, 'QQQ_QQQS 231020 C 365', 1.88, 0, 0, 0),
(658, '💫︱futures-alerts', 'shadowtrader', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4292.64, 0, 0, 0),
(659, '🗣｜member-plays', 'tradeaware21', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 17, 'QQQ_QQQS 231019 C 365', 1.29, 0, 0, 0),
(660, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'SPX_SPXS 231020 C 4390', 2.23, 0, 0, 0),
(661, '🗣｜member-plays', 'emmaten', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 22, 'SPY_SPYS 231019 C 432', 0.99, 0, 0, 0),
(662, '🚀︱member-alerts', 'bendc2r', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 32, 'QQQ_QQQS 231019 C 368', 0.34, 0, 0, 0),
(663, '🐐︱analyst-alerts', 'moonshotdg', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 10, 'QQQ_QQQS 231019 C 365', 1.1, 0, 0, 0),
(664, '🗣｜member-plays', 'Gizmo', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4, 'NFLX_NFLXS 231215 P 350', 4.55, 0, 0, 0),
(665, '🚀︱member-alerts', 'legacy7177', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 33, 'AAPL_AAPLS 231020 C 177.5', 0.84, 0, 0, 0),
(666, '🗣｜member-plays', 'emmaten', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 16, 'SPY_SPYS 231019 P 430', 1.31, 0, 0, 0),
(667, '🐐︱analyst-alerts', 'evapanda', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 20, 'NVDA_NVDAS 231103 C 500', 0.55, 0, 0, 0),
(668, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'SPX_SPXS 231020 P 4245', 4.36, 0, 0, 0),
(669, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4285.46, 0, 0, 0),
(670, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4289.42, 0, 0, 0),
(671, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4287.69, 0, 0, 0),
(672, '🚀︱member-alerts', 'bendc2r', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 34, 'QQQ_QQQS 231019 P 360', 0.32, 0, 0, 0),
(673, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4289.18, 0, 0, 0),
(674, '🐐︱analyst-alerts', 'tyler0777', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'NVDA_NVDAS 231020 P 420', 2.16, 0, 0, 0),
(675, '📈︱makeplays-500', 'makeplays', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 10, 'UVXY_UVXYS 231020 P 17.5', 0.54, 0, 0, 0),
(676, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4287.69, 0, 0, 0),
(677, '🗣｜member-plays', 'clavitopaz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 6, 'CAT_CATS 231027 C 260', 3.27, 0, 0, 0),
(678, '🗣｜member-plays', 'clavitopaz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 27, 'UBER_UBERS 231027 C 43', 0.82, 0, 0, 0),
(679, '💫︱futures-alerts', 'trav_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4287.94, 0, 0, 0),
(680, '🐐︱analyst-alerts', 'tyler0777', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 8, 'META_METAS 231020 C 325', 0.65, 0, 0, 0),
(681, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4296.85, 0, 0, 0),
(682, '🗣｜member-plays', 'tradeaware21', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, 'LMT_LMTS 231020 C 445', 2.97, 0, 0, 0),
(683, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4302.29, 0, 0, 0),
(684, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, 'NVDA_NVDAS 231020 P 420', 1.58, 0, 0, 0),
(685, '💫︱futures-alerts', 'catyline', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4304.27, 0, 0, 0),
(686, '🗣｜member-plays', 'Gizmo', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 10, 'QQQ_QQQS 231117 P 340', 2.13, 0, 0, 0),
(687, '🗣｜member-plays', 'tradeaware21', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'NFLX_NFLXS 231020 P 400', 4.65, 0, 0, 0),
(688, '💫︱futures-alerts', 'catyline', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4232.25, 0, 0, 0),
(689, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 16, 'SPY_SPYS 231020 P 420', 0.34, 0, 0, 0),
(690, '🐐︱analyst-alerts', 'makeplays', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, 'TSLA_TSLAS 231020 C 215', 1.53, 0, 0, 0),
(691, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, 'SNOW_SNOWS 231027 P 145', 3.09, 0, 0, 0),
(692, '🚀︱member-alerts', 'bendc2r', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 21, 'QQQ_QQQS 231020 C 360', 0.26, 0, 0, 0),
(693, '🐐︱analyst-alerts', 'moonshotdg', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 6, 'SPY_SPYS 231020 C 424', 0.83, 0, 0, 0),
(694, '📈︱makeplays-500', 'makeplays', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 16, 'UVXY_UVXYS 231020 P 19', 0.33, 0, 0, 0),
(695, '🐐︱analyst-alerts', 'moonshotdg', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 6, 'SPY_SPYS 231020 C 424', 0.83, 0, 0, 0),
(696, '🐐︱analyst-alerts', 'husky_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 8, 'COIN_COINS 231020 C 75', 0.63, 0, 0, 0),
(697, '🐐︱analyst-alerts', 'husky_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, 'SPX_SPXS 231020 C 4385', 1.48, 0, 0, 0),
(698, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, 'TSLA_TSLAS 231027 P 205', 3.45, 0, 0, 0),
(699, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, 'AAPL_AAPLS 231027 C 172.5', 3.01, 0, 0, 0),
(700, 'signalchannel', 'farazmatin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, 'SPX_SPXS 231020 C 4385', 1.48, 0, 0, 0),
(701, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4, 'SPX_SPXS 231020 C 4285', 1.24, 0, 0, 0),
(702, '🐐︱analyst-alerts', 'moonshotdg', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, 'SPX_SPXS 231020 C 4285', 1.44, 0, 0, 0),
(703, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 7, 'AMD_AMDS 231020 C 102', 0.77, 0, 0, 0),
(704, '🐐︱analyst-alerts', 'evapanda', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 10, 'QQQ_QQQS 231020 P 354', 0.55, 0, 0, 0),
(705, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4219.38, 0, 0, 0),
(706, '🚀︱member-alerts', 'havenshi', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 15, 'AMD_AMDS 231103 C 105', 3.56, 0, 0, 0),
(707, '💫︱futures-alerts', 'shadowtrader', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4212.45, 0, 0, 0),
(708, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'SPX_SPXS 231023 P 4165', 2.57, 0, 0, 0),
(709, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'SPX_SPXS 231023 P 4165', 3.96, 0, 0, 0),
(710, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'SPX_SPXS 231023 P 4165', 2.23, 0, 0, 0),
(711, '📈︱makeplays-500', 'makeplays', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 8, 'AMD_AMDS 231027 C 103', 1.34, 0, 0, 0),
(712, '🐐︱analyst-alerts', 'moonshotdg', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 6, 'SPY_SPYS 231023 P 419', 0.8, 0, 0, 0),
(713, '💫︱futures-alerts', 'tyler0777', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4196.61, 0, 0, 0),
(714, '💸︱husky-1k-bluecard', 'husky_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 8, 'TSLA_TSLAS 231027 C 220', 1.29, 0, 0, 0),
(715, '🐐︱analyst-alerts', 'tyler0777', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 10, 'SPY_SPYS 231023 C 423', 0.51, 0, 0, 0),
(716, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'SPX_SPXS 231023 P 4190', 3.27, 0, 0, 0),
(717, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, 'SNOW_SNOWS 231027 C 150', 2.97, 0, 0, 0),
(718, '🚀︱member-alerts', 'molriel568', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'SPX_SPXS 231023 P 4210', 2.97, 0, 0, 0),
(719, '🚀︱member-alerts', 'slimreaper23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5, 'QQQ_QQQS 231101 P 346', 1.91, 0, 0, 0),
(720, '🚀︱member-alerts', 'molriel568', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'SPX_SPXS 231023 P 4210', 2.67, 0, 0, 0),
(721, '🚀︱member-alerts', 'kreedmonger', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, 'SPX_SPXS 231023 P 4200', 1.39, 0, 0, 0),
(722, '💫︱futures-alerts', 'catyline', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4222.6, 0, 0, 0),
(723, '🚀︱member-alerts', 'slimreaper23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5, 'COIN_COINS 231103 C 90', 1.93, 0, 0, 0),
(724, '🚀︱member-alerts', 'slimreaper23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 27, 'MARA_MARAS 231103 C 9.5', 0.4, 0, 0, 0),
(725, '🐐︱analyst-alerts', 'evapanda', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, 'SPX_SPXS 231023 C 4265', 1.44, 0, 0, 0),
(726, '🗣｜member-plays', 'emmaten', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 9, 'QQQ_QQQS 231023 P 359', 1.14, 0, 0, 0),
(727, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 13, 'COIN_COINS 231103 C 100', 0.82, 0, 0, 0),
(728, '🐐︱analyst-alerts', 'makeplays', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4, 'SPY_SPYS 231027 C 425', 2.66, 0, 0, 0),
(729, '🐐︱analyst-alerts', 'tyler0777', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 10, 'SPY_SPYS 231023 P 422', 0.51, 0, 0, 0),
(730, '🚀︱member-alerts', 'jay50234', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'SPX_SPXS 231023 C 4255', 3.37, 0, 0, 0),
(731, '💸︱husky-1k-bluecard', 'husky_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 9, 'SPY_SPYS 231023 C 424', 0.56, 0, 0, 0),
(732, '🗣｜member-plays', 'tradeaware21', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 6, 'SPY_SPYS 231023 C 424', 1.62, 0, 0, 0),
(733, '🗣｜member-plays', 'tradeaware21', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 13, 'SPY_SPYS 231024 C 424', 1.6, 0, 0, 0),
(734, '🗣｜member-plays', 'emmaten', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 13, 'QQQ_QQQS 231023 P 359', 0.84, 0, 0, 0),
(735, '🐐︱analyst-alerts', 'tyler0777', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 9, 'SPY_SPYS 231023 P 423', 0.58, 0, 0, 0),
(736, '🚀︱member-alerts', 'jay50234', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, 'SPX_SPXS 231023 C 4255', 1.73, 0, 0, 0),
(737, '🗣｜member-plays', 'emmaten', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 23, 'QQQ_QQQS 231023 C 358', 0.47, 0, 0, 0),
(738, '🐐︱analyst-alerts', 'husky_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, 'SPX_SPXS 231023 C 4250', 1.58, 0, 0, 0),
(739, '🚀︱member-alerts', 'jay50234', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, 'SPX_SPXS 231023 C 4250', 1.68, 0, 0, 0),
(740, '🗣｜member-plays', 'tradeaware21', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 11, 'IWM_IWMS 231027 C 166', 1.95, 0, 0, 0),
(741, '🚀︱member-alerts', 'slimreaper23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 10, 'COIN_COINS 231027 C 82', 1.01, 0, 0, 0),
(742, '🐐︱analyst-alerts', 'moonshotdg', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 10, 'SPY_SPYS 231025 C 425', 1.02, 0, 0, 0),
(743, '💫︱futures-alerts', 'tyler0777', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4134.98, 0, 0, 0),
(744, '🚀︱member-alerts', 'bendc2r', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 16, 'QQQ_QQQS 231031 P 346', 0.34, 0, 0, 0),
(745, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 9, 'QQQ_QQQS 231031 P 347', 0.56, 0, 0, 0),
(746, '🐐︱analyst-alerts', 'tyler0777', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 9, 'SPY_SPYS 231031 C 417', 0.55, 0, 0, 0),
(747, '🚀︱member-alerts', 'bendc2r', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 17, 'QQQ_QQQS 231031 C 350', 0.31, 0, 0, 0),
(748, '🐐︱analyst-alerts', 'tyler0777', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 10, 'SPY_SPYS 231031 C 417', 0.54, 0, 0, 0),
(749, '🐐︱analyst-alerts', 'evapanda', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5, 'SPX_SPXS 231031 C 4200', 1.04, 0, 0, 0),
(750, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4149.58, 0, 0, 0),
(751, '🐐︱analyst-alerts', 'tyler0777', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 13, 'SPY_SPYS 231101 C 420', 0.82, 0, 0, 0),
(752, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 8, 'QQQ_QQQS 231101 C 352', 1.31, 0, 0, 0),
(753, '🚀︱member-alerts', 'bendc2r', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 18, 'QQQ_QQQS 231031 C 351', 0.3, 0, 0, 0),
(754, '🐐︱analyst-alerts', 'tyler0777', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 10, 'QQQ_QQQS 231031 P 347', 0.5, 0, 0, 0),
(755, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 7, 'AMD_AMDS 231103 P 90', 1.39, 0, 0, 0),
(756, '🐐︱analyst-alerts', 'tyler0777', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 10, 'SPY_SPYS 231031 C 417', 0.52, 0, 0, 0),
(757, '🚀︱member-alerts', 'kreedmonger', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5, 'NVDA_NVDAS 231103 C 420', 1.85, 0, 0, 0),
(758, '🚀︱member-alerts', 'richkm', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 36, 'SPX_SPXS 231031 C 4210', 0.3, 0, 0, 0),
(759, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4, 'QQQ_QQQS 231101 P 348', 1.2, 0, 0, 0),
(760, '🚀︱member-alerts', 'wehttam', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 16, 'SPX_SPXS 231031 P 4180', 3.37, 0, 0, 0),
(761, '🚀︱member-alerts', 'wehttam', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 29, 'SPX_SPXS 231031 P 4175', 1.83, 0, 0, 0),
(762, '🚀︱member-alerts', 'slimreaper23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 22, 'MARA_MARAS 231117 C 10', 0.48, 0, 0, 0),
(763, '📈︱makeplays-500', 'makeplays', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 6, 'SPY_SPYS 231101 P 415', 0.79, 0, 0, 0),
(764, '💫︱futures-alerts', 'husky_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4160.23, 0, 0, 0),
(765, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'SPX_SPXS 231101 P 4150', 2.08, 0, 0, 0),
(766, '🐐︱analyst-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, 'SPY_SPYS 231101 C 420', 1.51, 0, 0, 0),
(767, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'SPX_SPXS 231101 P 4155', 2.38, 0, 0, 0),
(768, '🐐︱analyst-alerts', 'moonshotdg', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 6, 'QQQ_QQQS 231101 P 350', 0.87, 0, 0, 0),
(769, '🐐︱analyst-alerts', 'husky_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4, 'COIN_COINS 231103 C 80', 2.48, 0, 0, 0),
(770, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5, 'MSFT_MSFTS 231103 C 347.5', 1.81, 0, 0, 0),
(771, '🚀︱member-alerts', 'bendc2r', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 18, 'QQQ_QQQS 231101 P 348', 0.29, 0, 0, 0),
(772, '💸︱husky-1k-bluecard', 'husky_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 27, 'TSLA_TSLAS 231103 C 215', 0.4, 0, 0, 0),
(773, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4, 'TSLA_TSLAS 231103 P 195', 2.17, 0, 0, 0),
(774, '🐐︱analyst-alerts', 'moonshotdg', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4, 'SPY_SPYS 231101 P 420', 1.09, 0, 0, 0),
(775, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5, 'NVDA_NVDAS 231103 P 405', 1.81, 0, 0, 0),
(776, '🚀︱member-alerts', 'bendc2r', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 15, 'QQQ_QQQS 231101 P 350', 0.34, 0, 0, 0),
(777, '💫︱futures-alerts', 'cedar_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4183.24, 0, 0, 0),
(778, '🚀︱member-alerts', 'jnunez23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4, 'SPX_SPXS 231101 P 4155', 1.19, 0, 0, 0),
(779, '💫︱futures-alerts', 'husky_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4187.2, 0, 0, 0),
(780, '💫︱futures-alerts', 'trav_trades', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'ES DEC23', 4184.98, 0, 0, 0),
(781, '📈︱makeplays-500', 'makeplays', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5, 'SPY_SPYS 231101 P 421', 0.99, 0, 0, 0),
(782, '🐐︱analyst-alerts', 'evapanda', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 9, 'SPX_SPXS 231102 C 4300', 1.19, 0, 0, 0),
(783, '🐐︱analyst-alerts', 'dcruz', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 7, 'QQQ_QQQS 231101 C 356', 0.71, 0, 0, 0),
(784, '🚀︱member-alerts', 'slimreaper23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 10, 'SPY_SPYS 231103 P 417', 0.99, 0, 0, 0),
(785, '🐐︱analyst-alerts', 'evapanda', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5, 'NFLX_NFLXS 231103 C 425', 1.86, 0, 0, 0),
(786, '🚀︱member-alerts', 'slimreaper23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 9, 'CVNA_CVNAS 231103 C 30', 1.19, 0, 0, 0),
(787, '🚀︱member-alerts', 'jnunez23', '2023-11-06 16:14:42', '2023-06-11 15:14:47', 1, 'SPX_SPXS 231106 C 4375', 3.37, 0, 0, 0),
(788, '🐐︱analyst-alerts', 'tyler0777', '2023-11-06 17:25:24', '2023-06-11 16:25:28', 12, 'SPY_SPYS 231107 P 434', 0.88, 0, 0, 0),
(789, '🚀︱member-alerts', 'bendc2r', '2023-11-06 17:37:04', '2023-06-11 16:37:08', 13, 'QQQ_QQQS 231107 C 370', 0.79, 0, 0, 0),
(790, 'signalchannel', 'farazmatin', '2023-11-06 17:44:45', '2023-06-11 16:44:50', 12, 'SPY_SPYS 231107 P 434', 0.85, 0, 0, 0),
(791, 'signalchannel', 'farazmatin', '2023-11-06 17:45:17', '2023-06-11 16:45:21', 12, 'SPY_SPYS 231107 P 434', 0.9, 0, 0, 0),
(792, 'signalchannel', 'farazmatin', '2023-11-06 17:54:15', '2023-06-11 16:54:20', 11, 'SPY_SPYS 231107 P 434', 0.97, 0, 0, 0),
(793, 'signalchannel', 'farazmatin', '2023-11-06 18:04:45', '2023-06-11 17:04:49', 11, 'TSLA_TSLAS 231110 C 230', 0.97, 0, 0, 0),
(794, 'signalchannel', 'farazmatin', '2023-11-06 18:09:11', '2023-06-11 17:09:17', 2, 'TSLA_TSLAS 231110 C 217.5', 4.37, 0, 0, 0),
(795, '🚀︱member-alerts', 'bendc2r', '2023-11-06 18:11:29', '2023-06-11 17:11:34', 17, 'QQQ_QQQS 231107 C 370', 0.62, 0, 0, 0),
(796, '🚀︱member-alerts', 'bendc2r', '2023-11-06 18:42:00', '2023-06-11 17:42:04', 15, 'QQQ_QQQS 231107 P 366', 0.71, 0, 0, 0),
(797, '🚀︱member-alerts', 'jsloan24', '2023-11-06 19:21:48', '2023-07-11 13:27:46', 200, 'AMZN_AMZNS 231124 C 150', 0.27, 0, 0, 0),
(798, '🐐︱analyst-alerts', 'dcruz', '2023-11-06 19:30:45', '2023-07-11 13:27:51', 12, 'QQQ_QQQS 231106 C 367', 0.86, 0, 0, 0),
(799, '🚀︱member-alerts', 'jsloan24', '2023-11-06 20:03:11', '2023-07-11 13:27:55', 200, 'AMZN_AMZNS 231124 C 150', 0.27, 0, 0, 0),
(800, '🐐︱analyst-alerts', 'moonshotdg', '2023-11-06 20:30:31', '2023-07-11 13:27:59', 13, 'SPY_SPYS 231108 C 437', 0.82, 0, 0, 0),
(801, '🚀︱member-alerts', 'slimreaper23', '2023-11-06 20:58:44', '2023-07-11 13:28:04', 7, 'TSLA_TSLAS 231117 P 200', 1.5, 0, 0, 0),
(802, '🚀︱member-alerts', 'bendc2r', '2023-11-07 14:35:25', '2023-07-11 13:35:31', 12, 'QQQ_QQQS 231107 C 371', 0.42, 0, 0, 0),
(803, '🐐︱analyst-alerts', 'dcruz', '2023-11-07 14:38:23', '2023-07-11 18:05:31', 7, 'QQQ_QQQS 231107 C 370', 0.74, 0, 0, 0),
(804, '📈︱makeplays-500', 'makeplays', '2023-11-07 14:45:09', '2023-07-11 18:05:36', 10, 'ROKU_ROKUS 231110 P 81', 0.99, 0, 0, 0),
(805, '🐐︱analyst-alerts', 'dcruz', '2023-11-07 15:01:07', '2023-07-11 18:05:41', 7, 'SPY_SPYS 231107 C 436', 0.75, 0, 0, 0),
(806, '🐐︱analyst-alerts', 'evapanda', '2023-11-07 15:02:22', '2023-07-11 18:05:45', 12, 'SPX_SPXS 231107 C 4400', 0.45, 0, 0, 0);
INSERT INTO `tradeexecution` (`id`, `ChannelName`, `ProviderName`, `CreationTime`, `ExecutionTime`, `Quantity`, `Instrument`, `EntryPrice`, `ExitPrice`, `PnL_amount`, `Pnl_perc`) VALUES
(807, '🚀︱member-alerts', 'bendc2r', '2023-11-07 15:25:23', '2023-07-11 18:05:49', 14, 'QQQ_QQQS 231107 P 370', 0.38, 0, 0, 0),
(808, '🐐︱analyst-alerts', 'tyler0777', '2023-11-07 15:30:59', '2023-07-11 18:05:54', 16, 'SPY_SPYS 231108 C 438', 0.64, 0, 0, 0),
(809, '🚀︱member-alerts', 'bendc2r', '2023-11-07 15:50:16', '2023-07-11 18:05:59', 16, 'QQQ_QQQS 231107 P 371', 0.32, 0, 0, 0),
(810, '🚀︱member-alerts', 'bendc2r', '2023-11-07 15:56:57', '2023-07-11 18:06:03', 18, 'QQQ_QQQS 231107 P 371', 0.29, 0, 0, 0),
(811, '🐐︱analyst-alerts', 'tyler0777', '2023-11-07 16:20:47', '2023-07-11 18:06:08', 30, 'BAC_BACS 231117 C 28.5', 0.35, 0, 0, 0),
(812, '🐐︱analyst-alerts', 'dcruz', '2023-11-07 16:46:00', '2023-07-11 18:06:12', 7, 'QQQ_QQQS 231107 P 373', 0.71, 0, 0, 0),
(813, '🚀︱member-alerts', 'jnunez23', '2023-11-07 17:02:27', '2023-07-11 18:06:17', 10, 'SPX_SPXS 231107 C 4385', 2.57, 0, 0, 0),
(814, '🚀︱member-alerts', 'slimreaper23', '2023-11-07 19:01:55', '2023-07-11 18:06:22', 10, 'COIN_COINS 231124 C 100', 1.03, 0, 0, 0),
(815, '🐐︱analyst-alerts', 'dcruz', '2023-11-07 19:11:15', '2023-07-11 18:11:19', 6, 'SPY_SPYS 231107 P 438', 0.84, 0, 0, 0),
(816, '🐐︱analyst-alerts', 'dcruz', '2023-11-07 19:59:28', '2023-08-11 13:14:41', 9, 'SPY_SPYS 231110 P 435', 1.16, 0, 0, 0),
(817, '🐐︱analyst-alerts', 'tyler0777', '2023-11-07 20:24:07', '2023-08-11 13:14:46', 20, 'SPY_SPYS 231109 C 440', 0.53, 0, 0, 0),
(818, '🐐︱analyst-alerts', 'trav_trades', '2023-11-07 20:44:17', '2023-08-11 13:14:51', 5, 'SPX_SPXS 231107 C 4385', 1.88, 0, 0, 0),
(819, '🐐︱analyst-alerts', 'dcruz', '2023-11-08 14:40:15', '2023-08-11 13:40:20', 6, 'QQQ_QQQS 231108 P 373', 0.89, 0, 0, 0),
(820, '🐐︱analyst-alerts', 'moonshotdg', '2023-11-08 15:29:53', '2023-08-11 14:29:58', 10, 'QQQ_QQQS 231108 P 371', 0.51, 0, 0, 0),
(821, '🐐︱analyst-alerts', 'dcruz', '2023-11-08 15:39:45', '2023-08-11 14:39:50', 6, 'SPY_SPYS 231108 P 437', 0.89, 0, 0, 0),
(822, '🐐︱analyst-alerts', 'tyler0777', '2023-11-08 16:14:44', '2023-08-11 15:14:48', 13, 'SPY_SPYS 231108 P 436', 0.4, 0, 0, 0),
(823, 'signalchannel', 'farazmatin', '2023-11-08 16:31:58', '2023-08-11 15:32:03', 6, 'QQQ_QQQS 231108 P 373', 0.89, 0, 0, 0),
(824, 'signalchannel', 'farazmatin', '2023-11-08 16:31:58', '2023-08-11 15:32:09', 6, 'SPY_SPYS 231108 P 437', 0.89, 0, 0, 0),
(825, 'signalchannel', 'farazmatin', '2023-11-08 16:36:20', '2023-08-11 15:36:25', 5, 'SPY_SPYS 231108 C 436', 1.01, 0, 0, 0),
(826, 'signalchannel', 'farazmatin', '2023-11-08 17:53:53', '2023-08-11 16:53:58', 6, 'SPY_SPYS 231108 P 437', 0.89, 0, 0, 0),
(827, 'signalchannel', 'farazmatin', '2023-11-08 17:53:53', '2023-08-11 16:54:03', 13, 'SPY_SPYS 231108 P 436', 0.4, 0, 0, 0),
(828, 'signalchannel', 'farazmatin', '2023-11-08 17:56:34', '2023-08-11 16:56:39', 6, 'SPY_SPYS 231108 P 437', 0.89, 0, 0, 0),
(829, 'signalchannel', 'farazmatin', '2023-11-08 17:56:34', '2023-08-11 16:56:43', 13, 'SPY_SPYS 231108 P 436', 0.4, 0, 0, 0),
(830, 'signalchannel', 'farazmatin', '2023-11-08 17:59:47', '2023-08-11 16:59:52', 6, 'SPY_SPYS 231108 P 437', 0.89, 0, 0, 0),
(831, 'signalchannel', 'farazmatin', '2023-11-08 17:59:47', '2023-08-11 16:59:56', 13, 'SPY_SPYS 231108 P 436', 0.4, 0, 0, 0),
(832, '💸︱husky-1k-bluecard', 'husky_trades', '2023-11-08 18:00:27', '2023-08-11 17:00:33', 8, 'CELH_CELHS 231110 C 190', 1.24, 0, 0, 0),
(833, '🐐︱analyst-alerts', 'tyler0777', '2023-11-08 18:03:40', '2023-08-11 17:03:45', 9, 'SPY_SPYS 231108 C 436', 0.55, 0, 0, 0),
(834, 'signalchannel', 'farazmatin', '2023-11-08 18:13:20', '2023-08-11 17:13:25', 13, 'SPY_SPYS 231108 P 436', 0.4, 0, 0, 0),
(835, 'signalchannel', 'farazmatin', '2023-11-08 18:13:20', '2023-08-11 17:13:31', 2, 'SPX_SPXS 231109 C 4400', 3.66, 0, 0, 0),
(836, '🐐︱analyst-alerts', 'tyler0777', '2023-11-08 19:03:02', '2023-08-11 18:03:07', 18, 'SPY_SPYS 231108 C 437', 0.3, 0, 0, 0),
(837, '🐐︱analyst-alerts', 'tyler0777', '2023-11-08 19:07:22', '2023-08-11 18:07:27', 13, 'SPY_SPYS 231109 C 438', 0.83, 0, 0, 0),
(838, '📈︱makeplays-500', 'makeplays', '2023-11-08 19:29:19', '2023-08-11 18:29:24', 10, 'SPX_SPXS 231108 P 4370', 0.5, 0, 0, 0),
(839, '🐐︱analyst-alerts', 'tyler0777', '2023-11-08 20:17:47', '2023-08-11 19:17:52', 14, 'SPY_SPYS 231109 C 438', 0.75, 0, 0, 0),
(840, '🐐︱analyst-alerts', 'makeplays', '2023-11-08 20:18:03', '2023-08-11 19:18:08', 5, 'COIN_COINS 231117 P 85', 2.16, 0, 0, 0),
(841, '🐐︱analyst-alerts', 'makeplays', '2023-11-08 20:36:48', '2023-08-11 19:36:53', 3, 'ROKU_ROKUS 231208 P 80', 3.22, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `Username` varchar(16) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(32) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `Username`, `email`, `password`, `create_time`) VALUES
(3, 'farazmatin', 'farazmatin@gmail.com', '123', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userprovider`
--

CREATE TABLE `userprovider` (
  `id` int(11) UNSIGNED NOT NULL,
  `CopyTrade` bit(1) DEFAULT NULL,
  `ProviderName` varchar(255) DEFAULT NULL,
  `ChannelName` varchar(255) DEFAULT NULL,
  `AssetType` varchar(20) DEFAULT NULL,
  `InstrumentType` varchar(10) NOT NULL,
  `PositionSizePercent` float DEFAULT NULL,
  `EntryOffsetPercent` float DEFAULT NULL,
  `StopLossPercent` float DEFAULT NULL,
  `TP1Percent` float DEFAULT NULL,
  `TrailPercent` float DEFAULT NULL,
  `BreakevenPercent` float DEFAULT 15,
  `positionAmount` float NOT NULL,
  `EntryOffsetAmount` float NOT NULL,
  `StopLossAmount` decimal(10,0) NOT NULL DEFAULT 16,
  `TP1Amount` decimal(10,0) NOT NULL DEFAULT 16,
  `TrailAmount` decimal(10,2) DEFAULT 0.00,
  `BreakEvenAmountPerContract` decimal(10,0) NOT NULL DEFAULT 3,
  `CreationTime` timestamp NULL DEFAULT current_timestamp(),
  `EntryStrategy` varchar(40) DEFAULT NULL,
  `ExitStrategy` varchar(40) DEFAULT NULL,
  `PremiumMin` float DEFAULT 0,
  `PremiumMax` float DEFAULT 5,
  `MktCapMin` float DEFAULT 0,
  `MktCapMax` float DEFAULT 1e19,
  `Size1` float DEFAULT NULL,
  `Provider_id` varchar(40) DEFAULT NULL,
  `Channel_id` varchar(40) DEFAULT NULL,
  `user_id` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userprovider`
--

INSERT INTO `userprovider` (`id`, `CopyTrade`, `ProviderName`, `ChannelName`, `AssetType`, `InstrumentType`, `PositionSizePercent`, `EntryOffsetPercent`, `StopLossPercent`, `TP1Percent`, `TrailPercent`, `BreakevenPercent`, `positionAmount`, `EntryOffsetAmount`, `StopLossAmount`, `TP1Amount`, `TrailAmount`, `BreakEvenAmountPerContract`, `CreationTime`, `EntryStrategy`, `ExitStrategy`, `PremiumMin`, `PremiumMax`, `MktCapMin`, `MktCapMax`, `Size1`, `Provider_id`, `Channel_id`, `user_id`) VALUES
(4, b'1', '_atdt', '🚀︱member-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-09-28 17:17:54', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '701491541092335687', '739553494176104639', 1),
(5, b'1', 'bendc2r', '🚀︱member-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-09-28 17:17:54', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '426126942505402371', '739553494176104639', 1),
(6, b'1', 'moonshotdg', 'combine-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-09-28 17:17:54', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '936406954706878555', '1113579133868458155', 1),
(7, NULL, 'shadowtrader', '🕴︱jr-analyst-alerts', 'Futures', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-12-21 19:33:59', NULL, NULL, 0, 5, 0, 1e19, NULL, '602859673053429776', '952916697008984154', 1),
(8, b'1', 'oogwayta', '🐐︱analyst-alerts', 'Stocks-Forex', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-09-28 17:17:54', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '307774286100299776', '738943464259059752', 1),
(10, b'1', 'makeplays', '🐐︱analyst-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-09-28 17:17:54', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '430889651901956096', '738943464259059752', 1),
(11, NULL, 'dcruz', '🐐︱analyst-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-12-21 19:33:59', NULL, NULL, 0, 5, 0, 1e19, NULL, '480583337661038602', '738943464259059752', 1),
(12, b'1', 'cedar_options', '🐐︱analyst-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-09-28 17:17:54', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '706687912225538109', '738943464259059752', 1),
(13, NULL, 'husky_trades', '💸︱cblast-250-challenge', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-12-21 19:33:59', NULL, NULL, 0, 5, 0, 1e19, NULL, '269994371280142336', '1058040359038492712', 1),
(14, b'1', 'evapanda', '🐐︱analyst-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-09-28 17:17:54', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '536430344489009153', '738943464259059752', 1),
(16, b'1', 'tyler0777', 'combine-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-09-28 17:17:54', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '930194877453598750', '1113579133868458155', 1),
(17, NULL, 'husky_trades', '💸︱bluecard-250-challenge', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-12-21 19:33:59', NULL, NULL, 0, 5, 0, 1e19, NULL, '269994371280142336', '1058040359038492712', 1),
(18, NULL, 'trav_trades', 'combine-alerts', 'Futures', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-12-21 19:33:59', NULL, NULL, 0, 5, 0, 1e19, NULL, '399929170928467968', '1113579133868458155', 1),
(19, b'1', 'nickkell', '🕴︱jr-analyst-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-09-28 17:17:54', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '296859492778508288', '952916697008984154', 1),
(20, NULL, 'tyler0777', 'combine-alerts', 'Futures', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-09-28 17:17:54', NULL, NULL, 0, 5, 0, 1e16, NULL, '930194877453598750', '1113579133868458155', 1),
(21, b'1', 'jay50234', '🚀︱member-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-09-28 17:17:54', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '616147721182773263', '739553494176104639', 1),
(22, b'1', 'tyler0777', 'combine-alerts', 'Stocks-Forex', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-09-28 17:17:54', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '930194877453598750', '1113579133868458155', 1),
(23, NULL, 'husky_trades', '💫︱futures-alerts', 'Futures', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-12-21 19:33:59', NULL, NULL, 0, 5, 0, 1e19, NULL, '269994371280142336', '1102240963109331085', 1),
(25, NULL, 'husky_trades', '🐐︱analyst-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-12-21 19:33:59', NULL, NULL, 0, 5, 0, 1e19, NULL, '269994371280142336', '738943464259059752', 1),
(26, b'1', 'austinscawt', '🚀︱member-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-09-28 17:17:54', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '371860598633267212', '739553494176104639', 1),
(27, b'1', 'slimreaper23', '🚀︱member-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-09-28 17:17:54', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '895382286256709673', '739553494176104639', 1),
(28, b'1', 'optionverde', '🕴︱jr-analyst-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-09-28 17:17:54', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '431865434736820237', '952916697008984154', 1),
(29, NULL, 'trav_trades', 'combine-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-12-21 19:33:59', NULL, NULL, 0, 5, 0, 1e19, NULL, '399929170928467968', '1113579133868458155', 1),
(30, b'1', 'skowih', '🐐︱analyst-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-09-28 17:17:54', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '334147594039328790', '738943464259059752', 1),
(31, b'1', 'moonshotdg', '🕴︱jr-analyst-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-09-28 17:17:54', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '936406954706878555', '952916697008984154', 1),
(32, b'1', 'tyler0777', '🐐︱analyst-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-09-28 17:17:54', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '930194877453598750', '738943464259059752', 1),
(33, b'1', 'cedar_trades', '💫︱futures-alerts', 'Futures', 'ES', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-09-28 17:17:54', NULL, NULL, 0, 5, 0, 1e16, NULL, '706687912225538109', '1102240963109331085', 1),
(34, NULL, 'trav_trades', '💫︱futures-alerts', 'Futures', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-12-21 19:33:59', NULL, NULL, 0, 5, 0, 1e19, NULL, '399929170928467968', '1102240963109331085', 1),
(36, NULL, 'trav_trades', '🕴︱jr-analyst-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-12-21 19:33:59', NULL, NULL, 0, 5, 0, 1e19, NULL, '399929170928467968', '952916697008984154', 1),
(37, b'1', 'nickkell', '🚀︱member-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-09-28 17:17:54', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '296859492778508288', '739553494176104639', 1),
(38, b'1', 'kreedmonger', '🚀︱member-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-09-28 17:17:54', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '734994061253017671', '739553494176104639', 1),
(39, b'1', 'EclipseTrades', '💎︱eclipse-signals', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-09-28 17:17:54', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '1080824633126830162', '1080477916149862480', 1),
(40, NULL, 'catyline', '💫︱futures-alerts', 'Futures', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-12-21 19:33:59', NULL, NULL, 0, 5, 0, 1e19, NULL, '180421030605488128', '1102240963109331085', 1),
(41, b'1', 'oogwayta', '🐐︱analyst-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-09-28 17:17:54', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '307774286100299776', '738943464259059752', 1),
(42, b'1', 'makeplays', '📈︱makeplays-500', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-09-28 17:17:54', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '430889651901956096', '1134476321792200784', 1),
(43, b'1', 'robmythoughts', '🚀︱member-alerts', 'Stocks-Forex', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-09-28 17:17:54', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '473640750429634581', '739553494176104639', 1),
(64, b'1', 'farazmatin', 'signalchannel', 'Stocks-Forex', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '0000-00-00 00:00:00', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '403285053259513858', '1100830612383879188', 1),
(65, NULL, 'farazmatin', 'signalchannel', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-12-21 19:33:59', NULL, NULL, 0, 5, 0, 1e19, NULL, '403285053259513858', '1100830612383879188', 1),
(67, b'1', 'gottomg', '🚀︱member-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-09-28 19:17:04', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '870689088909508618', '739553494176104639', 1),
(68, b'1', 'aatazona', '🚀︱member-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-09-28 21:54:52', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '928651258900914186', '739553494176104639', 1),
(76, b'1', 'trav_trades', '🕴︱jr-analyst-alerts', 'Stocks-Forex', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '0000-00-00 00:00:00', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '399929170928467968', '952916697008984154', 1),
(77, b'1', 'shadowtrader', '💫︱futures-alerts', 'Futures', 'NQ', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 1, '2023-09-28 17:17:54', NULL, NULL, 0, 5, 0, 1e16, NULL, '602859673053429776', '1102240963109331085', 1),
(78, b'1', 'purifiy', '🚀︱member-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-04 18:37:58', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '513602847569346574', '739553494176104639', 1),
(79, b'1', 'moonshotdg', '🐐︱analyst-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-05 13:59:37', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '936406954706878555', '738943464259059752', 1),
(80, b'1', 'tslabobb', '🚀︱member-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-05 16:22:50', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '996985994081472602', '739553494176104639', 1),
(81, b'1', 'makeplays', '💹︱investing-long-term', 'Stocks-Forex', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-06 12:40:14', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '430889651901956096', '1020457230094577745', 1),
(82, b'1', 'molriel568', '🚀︱member-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-06 19:01:26', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '1151612668310990898', '739553494176104639', 1),
(84, b'1', 'stockit2306', '🚀︱member-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-09 15:45:39', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '755308333719748658', '739553494176104639', 1),
(85, b'1', 'dcruz', '🐐︱analyst-alerts', 'Stocks-Forex', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '0000-00-00 00:00:00', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '480583337661038602', '738943464259059752', 1),
(86, b'1', 'trav_trades', '🐐︱analyst-alerts', 'Stocks-Forex', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '0000-00-00 00:00:00', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '399929170928467968', '738943464259059752', 1),
(87, b'1', 'A_Weird_Folder', '🚀︱member-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-10 15:28:11', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '694744028138176583', '739553494176104639', 1),
(88, b'1', 'EclipseTrades', '💎︱eclipse-signals', 'Stocks-Forex', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-11 14:25:28', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '1080824633126830162', '1080477916149862480', 1),
(89, b'1', 'cedar_trades', '💹︱investing-long-term', 'Stocks-Forex', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '0000-00-00 00:00:00', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '706687912225538109', '1020457230094577745', 1),
(90, NULL, 'trav_trades', '🐐︱analyst-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-12-21 19:33:59', NULL, NULL, 0, 5, 0, 1e19, NULL, '399929170928467968', '738943464259059752', 1),
(92, b'1', 'jnunez23', '🚀︱member-alerts', 'Stocks-Forex', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-12 14:42:11', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '707621101294977145', '739553494176104639', 1),
(94, NULL, 'kreedmonger', '💫︱futures-alerts', 'Stocks-Forex', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-13 14:54:38', NULL, NULL, 0, 5, 0, 1e19, NULL, '734994061253017671', '1102240963109331085', 1),
(95, b'1', 'branjan22', '🚀︱member-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-13 16:21:00', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '863562319447851038', '739553494176104639', 1),
(96, b'1', 'innovation11988', 'signalchannel', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-13 17:04:43', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '1162429064968151040', '1100830612383879188', 1),
(97, b'1', 'innovation11988', 'zetrading', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-13 17:09:55', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '1162429064968151040', '1162436635066114198', 1),
(98, b'1', 'dexx5174', '🚀︱member-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-13 17:24:48', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '740222854435569714', '739553494176104639', 1),
(99, NULL, 'zxn_killz', '🚀︱member-alerts', 'Futures', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-13 17:53:02', NULL, NULL, 0, 5, 0, 1e16, NULL, '621078059659034635', '739553494176104639', 1),
(100, NULL, 'molriel568', '🚀︱member-alerts', 'Futures', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-13 17:55:51', NULL, NULL, 0, 5, 0, 1e16, NULL, '1151612668310990898', '739553494176104639', 1),
(101, b'1', 'whitedragon8787', '🚀︱member-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-13 19:05:25', NULL, NULL, 0.25, 5, 0, 1e19, NULL, '913918362726326303', '739553494176104639', 1),
(102, b'1', 'wagsxt', '📲｜pro-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-16 13:53:22', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '398880706375319562', '990331623260180580', 1),
(103, b'1', 'hydra9283', '📲｜pro-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-16 14:09:31', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '280067149412958209', '990331623260180580', 1),
(104, b'1', 'krazya', '📲｜pro-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-16 14:21:37', NULL, NULL, 0, 5, 0, 1e19, NULL, '655170656039731231', '990331623260180580', 1),
(105, b'1', 'notmike2.0', '🚀︱member-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-16 18:27:08', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '1139417600296747019', '739553494176104639', 1),
(106, b'1', 'LeedingTrades', '💸︱day-trades', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-16 18:29:02', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '747291456548372556', '834867334106841098', 1),
(107, b'1', 'iiizbloodshot', '🚀︱member-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-16 18:34:25', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '729370161198661652', '739553494176104639', 1),
(108, b'1', 'richkm', '🚀︱member-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-16 19:26:54', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '1001664237724250253', '739553494176104639', 1),
(109, b'1', 'seabasss11', '🚀︱member-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-16 19:42:30', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '592434692175822865', '739553494176104639', 1),
(110, b'1', 'LeedingTrades', '💵︱swings', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-17 13:46:39', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '747291456548372556', '780137896040202251', 1),
(111, b'1', 'moonshotdg', '💫︱futures-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-17 14:07:02', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '936406954706878555', '1102240963109331085', 1),
(112, b'1', 'nyqu1llbu113t5', '🚀︱member-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-17 18:21:18', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '612034021584797727', '739553494176104639', 1),
(113, b'1', 'petiterunner', '🗣｜member-plays', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-17 18:55:05', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '1148668782840123562', '991451376750174238', 1),
(114, b'1', 'khohezion', '🗣｜member-plays', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-17 18:57:15', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '183032845915127808', '991451376750174238', 1),
(115, b'1', 'AYEITSNAC', '🗣｜member-plays', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-17 19:00:25', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '493763970210201602', '991451376750174238', 1),
(116, b'1', 'Gizmo', '🗣｜member-plays', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-17 19:01:01', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '723194618455261305', '991451376750174238', 1),
(117, b'1', 'jrod2888', '🚀︱member-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-17 19:10:54', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '1116227963491459073', '739553494176104639', 1),
(118, b'1', 'emmaten', '🗣｜member-plays', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-17 19:26:07', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '613829838507343873', '991451376750174238', 1),
(119, b'1', 'vicerys', '🗣｜member-plays', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-17 19:34:48', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '263474188113805315', '991451376750174238', 1),
(120, b'1', 'ku.mo', '💵︱swings', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-17 19:41:11', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '725886099184156737', '780137896040202251', 1),
(121, b'1', 'optionsniperharryfur', '🗣｜member-plays', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-17 19:45:55', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '515756876785385482', '991451376750174238', 1),
(122, b'1', 'clavitopaz', '🗣｜member-plays', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-17 19:57:26', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '387036638745722880', '991451376750174238', 1),
(123, b'1', 'mikeb018', '🗣｜member-plays', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-18 13:32:17', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '722448924576579624', '991451376750174238', 1),
(124, b'1', 'luc_rcoks', '🗣｜member-plays', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-18 13:32:49', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '762432164398235700', '991451376750174238', 1),
(125, b'1', 'tradeaware21', '🗣｜member-plays', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-18 13:36:04', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '797964447712935956', '991451376750174238', 1),
(126, b'1', 'Genos', '🚀︱member-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-18 13:45:12', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '201083933515841536', '739553494176104639', 1),
(127, b'1', 'fakebelledelphine', '🗣｜member-plays', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-18 14:00:18', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '311003050166714379', '991451376750174238', 1),
(128, b'1', 'moonshot618', '📲｜pro-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-18 14:04:00', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '283704832781451266', '990331623260180580', 1),
(129, b'1', 'sweet_louuu', '🗣｜member-plays', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-18 14:22:30', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '490953199386230785', '991451376750174238', 1),
(130, b'1', 'spybrainsspygains', '🗣｜member-plays', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-18 14:30:26', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '1161684908377395272', '991451376750174238', 1),
(131, b'1', 'dryx1476', '🗣｜member-plays', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-18 14:59:02', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '880815479059521547', '991451376750174238', 1),
(132, b'1', '_maidmarian', '🗣｜member-plays', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-18 15:07:41', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '758927076685905931', '991451376750174238', 1),
(133, b'1', 'tki11a', '🗣｜member-plays', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-18 15:14:41', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '712009846811000894', '991451376750174238', 1),
(134, b'1', 'clairvoyant', '🗣｜member-plays', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-18 16:34:54', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '734185829353914428', '991451376750174238', 1),
(135, b'1', 'shinobinator', '🗣｜member-plays', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-18 16:36:20', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '621157173455749141', '991451376750174238', 1),
(136, b'1', 'hypothesis2304', '🗣｜member-plays', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-18 16:42:02', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '634240481970356224', '991451376750174238', 1),
(137, b'1', '_ken_spx', '🗣｜staff-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-18 18:00:08', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '736159798579560448', '990331641094361109', 1),
(138, b'1', 'cha_cha_chaudhary', '🗣｜member-plays', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-18 18:21:56', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '502094420389396501', '991451376750174238', 1),
(139, b'1', 'master_redwit', '🗣｜member-plays', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-18 18:30:45', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '512385326308786198', '991451376750174238', 1),
(140, b'1', 'ishaaneagle', '💰︱ishaan', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-18 18:31:50', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '496150067720224779', '906961010550796338', 1),
(141, b'1', 'sadboy3084', '🗣｜member-plays', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-18 18:33:29', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '836368143269363824', '991451376750174238', 1),
(142, NULL, 'kreedmonger', '🚀︱member-alerts', 'Futures', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-18 19:06:54', NULL, NULL, 0, 5, 0, 1e19, NULL, '734994061253017671', '739553494176104639', 1),
(143, b'1', 'terminator1_', '🗣｜member-plays', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-18 19:45:51', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '454257968368582666', '991451376750174238', 1),
(144, b'1', 'dylan.eagle', '💵︱swings', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-18 19:52:59', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '580082705094541312', '780137896040202251', 1),
(145, b'1', 'Gizmo', '🗣｜staff-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-18 19:54:30', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '723194618455261305', '990331641094361109', 1),
(146, b'1', 'lilubes', '🗣｜staff-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-18 19:57:57', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '423964623092580352', '990331641094361109', 1),
(147, NULL, 'pizzaiolo_1', '🚀︱member-alerts', 'Stocks-Forex', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-18 20:28:41', NULL, NULL, 0, 5, 0, 1e19, NULL, '1153440834142879864', '739553494176104639', 1),
(148, NULL, 'evapanda', '🐐︱analyst-alerts', 'Stocks-Forex', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-19 13:30:55', NULL, NULL, 0, 5, 0, 1e19, NULL, '536430344489009153', '738943464259059752', 1),
(149, b'1', 'sean1985', '🗣｜member-plays', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-19 13:39:27', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '741788925282222222', '991451376750174238', 1),
(150, b'1', 'looking_capital', '🗣｜member-plays', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-19 13:57:03', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '447785466284998667', '991451376750174238', 1),
(151, b'1', 'legacy7177', '🚀︱member-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-19 14:05:45', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '619672922541260804', '739553494176104639', 1),
(152, b'1', 'bcf', '🚀︱member-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-19 15:40:53', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '526074289640833025', '739553494176104639', 1),
(153, b'1', 'wa1sted_dropout', '🚀︱member-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-20 15:05:30', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '937854267098800189', '739553494176104639', 1),
(154, b'1', 'havenshi', '🚀︱member-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-20 19:01:55', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '524660087235674112', '739553494176104639', 1),
(155, NULL, 'Dz', '🚀︱member-alerts', 'Futures', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-23 07:32:42', NULL, NULL, 0, 5, 0, 1e19, NULL, '426091821224165378', '739553494176104639', 1),
(156, b'1', 'aaron1021', '🗣｜member-plays', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-23 16:33:12', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '292080167386349568', '991451376750174238', 1),
(157, b'1', 'dom0912.', '🗣｜member-plays', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-23 17:26:56', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '885363891842977842', '991451376750174238', 1),
(158, b'1', 'yabba_trades', '🗣｜member-plays', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-23 18:34:21', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '232410637009944586', '991451376750174238', 1),
(159, b'1', 'djkharthik', '🗣｜member-plays', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-23 18:35:00', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '332371640119721984', '991451376750174238', 1),
(160, b'1', 'booxzy', '🗣｜member-plays', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-23 18:59:10', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '582943658563600402', '991451376750174238', 1),
(161, b'1', 'astralsigns', '🚀︱member-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-23 19:13:40', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '743181574039666809', '739553494176104639', 1),
(162, b'1', 'insaftrades', '🗣｜member-plays', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-23 19:27:58', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '798740227366584393', '991451376750174238', 1),
(163, b'1', 'janayyyy', '🗣｜member-plays', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-23 19:33:00', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '380018066026659850', '991451376750174238', 1),
(164, b'1', 'hit_the_lights99', '🗣｜member-plays', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-23 19:33:51', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '284549637329649665', '991451376750174238', 1),
(165, b'1', '.jtw', '📲｜pro-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-23 19:51:04', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '608727754627874871', '990331623260180580', 1),
(166, b'1', 'adktrades', '🗣｜member-plays', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-24 13:32:57', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '231169401049710592', '991451376750174238', 1),
(167, b'1', 'Mitchmad9', '🗣｜member-plays', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-24 13:40:25', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '561014548253900801', '991451376750174238', 1),
(168, b'1', 'Carl Halden', '🗣｜member-plays', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-24 13:42:31', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '529439744036438028', '991451376750174238', 1),
(169, b'1', 'nalzay', '🗣｜member-plays', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-24 13:45:34', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '746143018322755724', '991451376750174238', 1),
(170, b'1', 'Nimesh', '🗣｜member-plays', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-24 13:47:52', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '531651826202837009', '991451376750174238', 1),
(171, b'1', 'masteroogway8600', '🗣｜staff-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-24 14:30:05', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '695278894017675317', '990331641094361109', 1),
(172, b'1', 'papakev21', '🗣｜member-plays', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-24 14:34:55', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '518458459793129484', '991451376750174238', 1),
(173, b'1', 'tylervcobb', '🚀︱member-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-24 14:49:52', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '1161436738363863101', '739553494176104639', 1),
(174, b'1', '_hasselhoff', '🗣｜staff-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-24 15:21:38', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '363565057050935299', '990331641094361109', 1),
(175, b'1', 'mthorseman', '🗣｜member-plays', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-24 16:14:48', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '729750982094749727', '991451376750174238', 1),
(176, b'1', 'mcplunderballs', '🗣｜member-plays', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-24 16:48:45', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '406975904347193344', '991451376750174238', 1),
(177, b'1', 'abhilohani', '🗣｜member-plays', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-24 18:47:52', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '740424526046691391', '991451376750174238', 1),
(178, b'1', 'shinobinator', '🗣｜staff-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-24 19:55:11', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '621157173455749141', '990331641094361109', 1),
(179, b'1', 'Legendary Trader', '🗣｜member-plays', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-25 13:53:48', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '796951018008346634', '991451376750174238', 1),
(180, b'1', 'graedous', '🗣｜member-plays', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-25 15:22:41', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '177249049873874944', '991451376750174238', 1),
(181, b'1', 'gandalfthetradingwizard', '🗣｜member-plays', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-25 15:23:11', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '854360154320797716', '991451376750174238', 1),
(182, b'1', 'lou0900', '🗣｜member-plays', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-25 16:45:54', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '690811067881881689', '991451376750174238', 1),
(183, NULL, 'havenshi', '🚀︱member-alerts', 'Stocks-Forex', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-25 16:56:08', NULL, NULL, 0, 5, 0, 1e19, NULL, '524660087235674112', '739553494176104639', 1),
(184, b'1', 'nfthabib', '🗣｜member-plays', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-25 17:34:59', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '699327596801818674', '991451376750174238', 1),
(186, NULL, 'bobbybullish', '🚀︱member-alerts', 'Stocks-Forex', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-30 17:41:06', NULL, NULL, 0, 5, 0, 1e19, NULL, '703363330147876916', '739553494176104639', 1),
(187, b'1', 'wehttam', '🚀︱member-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-30 19:27:37', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '692526761837330545', '739553494176104639', 1),
(188, b'1', 'jnunez23', '🚀︱member-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-31 15:31:42', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '707621101294977145', '739553494176104639', 1),
(189, b'1', 'JohnnyRetail', '🚀︱member-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-10-31 19:23:46', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '793881098710941746', '739553494176104639', 1),
(190, b'1', 'jsloan24', '🚀︱member-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-11-06 17:40:59', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '449200072337653780', '739553494176104639', 1),
(191, b'1', 'husky_trades', '💫︱futures-alerts', 'Stocks-Forex', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '0000-00-00 00:00:00', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '269994371280142336', '1102240963109331085', 1),
(193, b'1', 'feathers97', '🚀︱member-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-11-07 16:59:23', NULL, NULL, 0.25, 5, 0, 1e16, NULL, '804128184319868949', '739553494176104639', 1),
(194, NULL, 'eternalking', '💹︱investing-long-term', 'Stocks-Forex', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-11-08 16:06:06', NULL, NULL, 0, 5, 0, 1e19, NULL, '518400725445771264', '1020457230094577745', 1),
(195, NULL, 'makeplays', '💫︱futures-alerts', 'Stocks-Forex', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-11-08 16:29:36', NULL, NULL, 0, 5, 0, 1e19, NULL, '430889651901956096', '1102240963109331085', 1),
(196, NULL, 'poseidon360', '🚀︱member-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-11-08 19:58:20', NULL, NULL, 0, 5, 0, 1e19, NULL, '555449832668528640', '739553494176104639', 1),
(201, NULL, 'moo1800', '🚀︱member-alerts', 'Futures', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-11-14 14:02:12', NULL, NULL, 0, 5, 0, 1e19, NULL, '811808206476148746', '739553494176104639', 1),
(202, NULL, 'eclipsetrades', '💎︱eclipse-signals', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-11-14 14:44:26', NULL, NULL, 0, 5, 0, 1e19, NULL, '919433334373904416', '1080477916149862480', 1),
(203, NULL, 'eternalking', '🐐︱analyst-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-11-14 16:03:04', NULL, NULL, 0, 5, 0, 1e19, NULL, '518400725445771264', '738943464259059752', 1),
(204, NULL, '7_sevens', '🚀︱member-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-11-15 15:03:29', NULL, NULL, 0, 5, 0, 1e19, NULL, '614231292652945424', '739553494176104639', 1),
(205, NULL, 'dot_cipher', '🐐︱analyst-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-11-15 15:48:41', NULL, NULL, 0, 5, 0, 1e19, NULL, '140639819876401152', '738943464259059752', 1),
(207, NULL, 'innovation11988', 'general', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-11-17 15:56:35', NULL, NULL, 0, 5, 0, 1e19, NULL, '1162429064968151040', '1100830492464533537', 1),
(209, NULL, 'dcruz', '💫︱futures-alerts', 'Futures', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-12-21 19:33:59', NULL, NULL, 0, 5, 0, 1e19, NULL, '480583337661038602', '1102240963109331085', 1),
(210, NULL, 'eternalking', '💫︱futures-alerts', 'Futures', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-11-21 03:03:03', NULL, NULL, 0, 5, 0, 1e19, NULL, '518400725445771264', '1102240963109331085', 1),
(211, NULL, 'bendc2r', '🐐︱analyst-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-11-21 16:59:57', NULL, NULL, 0, 5, 0, 1e19, NULL, '426126942505402371', '738943464259059752', 1),
(212, NULL, 'zescu', '🚀︱member-alerts', 'Futures', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-11-21 18:39:16', NULL, NULL, 0, 5, 0, 1e19, NULL, '410040675191750657', '739553494176104639', 1),
(213, NULL, 'tryhardernextime', '🚀︱member-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-11-22 15:43:22', NULL, NULL, 0, 5, 0, 1e19, NULL, '287068547094675457', '739553494176104639', 1),
(214, NULL, 'goodhumorbars', '🚀︱member-alerts', 'Futures', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-11-22 17:11:49', NULL, NULL, 0, 5, 0, 1e19, NULL, '225759264390643732', '739553494176104639', 1),
(215, NULL, 'tslabobb', '🚀︱member-alerts', 'Futures', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-11-23 01:11:40', NULL, NULL, 0, 5, 0, 1e19, NULL, '996985994081472602', '739553494176104639', 1),
(216, NULL, 'doctor_swing', '🚀︱member-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-11-29 16:29:46', NULL, NULL, 0, 5, 0, 1e19, NULL, '1058578857810202624', '739553494176104639', 1),
(217, NULL, 'waftly', '🚀︱member-alerts', 'Futures', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-11-30 04:22:19', NULL, NULL, 0, 5, 0, 1e19, NULL, '104406931862454272', '739553494176104639', 1),
(218, NULL, 'jakeleonard44', '🚀︱member-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-12-08 19:34:14', NULL, NULL, 0, 5, 0, 1e19, NULL, '748741635755475034', '739553494176104639', 1),
(219, NULL, 'byron0234', '🚀︱member-alerts', 'Futures', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-12-14 15:28:19', NULL, NULL, 0, 5, 0, 1e19, NULL, '757419186556502086', '739553494176104639', 1),
(220, NULL, 'saucegod999', '🚀︱member-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-12-15 15:59:45', NULL, NULL, 0, 5, 0, 1e19, NULL, '292058439264501760', '739553494176104639', 1),
(221, NULL, 'anish____', '🚀︱member-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-12-15 17:23:10', NULL, NULL, 0, 5, 0, 1e19, NULL, '774071013876826152', '739553494176104639', 1),
(227, b'1', 'cedar_trades', '💫︱futures-alerts', 'Futures', 'NQ', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 1, '2023-09-28 17:17:54', NULL, NULL, 0, 5, 0, 1e16, NULL, '706687912225538109', '1102240963109331085', 1),
(228, NULL, 'cedar_trades', '💫︱futures-alerts', 'Futures', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-12-21 19:33:59', NULL, NULL, 0, 5, 0, 1e19, NULL, '706687912225538109', '1102240963109331085', 1),
(229, NULL, 'cedar_trades', '💫︱futures-alerts', 'StockOptions', '', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-12-21 19:33:59', NULL, NULL, 0, 5, 0, 1e19, NULL, '706687912225538109', '1102240963109331085', 1),
(231, b'1', 'shadowtrader', '💫︱futures-alerts', 'Futures', 'ES', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2023-09-28 17:17:54', NULL, NULL, 0, 5, 0, 1e16, NULL, '602859673053429776', '1102240963109331085', 1),
(233, b'1', 'CopyUser', 'CopyChannel', 'Futures', 'NQ', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 19000, 1.01, 16, 32, 0.00, 1, '2023-09-28 17:17:54', NULL, NULL, 0, 5, 0, 1e16, NULL, '1', '1', 1),
(234, b'1', 'CopyUser', 'CopyChannel', 'Futures', 'ES', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 6000, 0.51, 12, 16, 0.00, 0, '2023-09-28 17:17:54', NULL, NULL, 0, 5, 0, 1e16, NULL, '1', '1', 1),
(236, b'1', 'farazmatin', 'signalchannel', 'Futures', 'ES', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 18000, 3, 16, 32, 0.00, 0, '2024-05-04 21:24:01', NULL, NULL, 0, 5, 0, 1e19, NULL, '403285053259513858', '1100830612383879188', 1),
(256, b'1', 'farazmatin', 'signalchannel', 'Futures', 'NQ', 5, 0.022, 0.06634, 0.13057, 0.022, 0.11057, 0, 0, 16, 16, 0.00, 3, '2024-05-22 15:57:22', NULL, NULL, 0, 5, 0, 1e19, NULL, '403285053259513858', '1100830612383879188', 1),
(257, b'1', 'cedar_trades', '🟨-futures-alerts', 'Futures', 'ES', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 6000, 3, 12, 16, 0.00, 0, '2024-05-22 15:57:22', NULL, NULL, 0, 5, 0, 1e19, NULL, '706687912225538109', '829041100181995571', 1),
(258, b'1', 'shadowtrader', '🟨-futures-alerts', 'Futures', 'ES', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 6000, 3, 12, 16, 0.00, 0, '2024-05-22 15:57:22', NULL, NULL, 0, 5, 0, 1e19, NULL, '602859673053429776', '829041100181995571', 1),
(259, b'1', 'ocean212', '💫︱futures-alerts', 'Futures', 'ES', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 6000, 3, 12, 16, 0.00, 0, '2024-05-22 15:57:22', NULL, NULL, 0, 5, 0, 1e19, NULL, '180421030605488128', '1232475403407327303', 1),
(260, b'1', 'dcruz', '💫︱futures-alerts', 'Futures', 'ES', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 6000, 3, 12, 16, 0.00, 0, '2024-05-22 15:57:22', NULL, NULL, 0, 5, 0, 1e19, NULL, '480583337661038602', '1232475403407327303', 1),
(262, b'1', 'steveo21', '🚀︱member-alerts', 'Futures', 'ES', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 6000, 3, 12, 16, 0.00, 0, '2024-05-22 15:57:22', NULL, NULL, 0, 5, 0, 1e19, NULL, '493829082924974103', '1232475511150743632', 1),
(263, b'1', 'srostrades', '💫︱futures-alerts', 'Futures', 'NQ', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 19000, 3, 16, 32, 0.00, 1, '2024-05-22 15:57:22', NULL, NULL, 0, 5, 0, 1e19, NULL, '500695745339588618', '1232475403407327303', 1),
(265, b'1', 'trav_trades', '💫︱futures-alerts', 'Futures', 'GC', 5, 0.022, 0.06634, 0.13057, 0.022, 0.11057, 0, 0, 16, 16, 0.00, 3, '2024-05-22 15:57:22', NULL, NULL, 0, 5, 0, 1e19, NULL, '399929170928467968', '1232475403407327303', 1),
(271, b'1', 'trav_trades', '💫︱futures-alerts', 'Futures', 'NQ', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 19000, 3, 16, 32, 0.00, 1, '2024-05-22 16:47:12', NULL, NULL, 0, 5, 0, 1e19, NULL, '399929170928467968', '1232475403407327303', 1),
(272, b'1', 'trav_trades', '💫︱futures-alerts', 'Futures', 'ES', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 6000, 3, 12, 16, 0.00, 0, '2024-05-22 16:47:12', NULL, NULL, 0, 5, 0, 1e19, NULL, '399929170928467968', '1232475403407327303', 1),
(274, b'1', 'trav_trades', '💫︱futures-alerts', 'Futures', 'NQ', 5, 0.022, 0.06634, 0.13057, 0.022, 0.11057, 0, 0, 16, 16, 0.00, 3, '2024-05-22 17:17:22', NULL, NULL, 0, 5, 0, 1e19, NULL, '399929170928467968', '1102240963109331085', 1),
(275, NULL, 'dcruz', '💎︱options-stock-alerts', 'StockOptions', '', 5, 0.022, 0.06634, 0.13057, 0.022, 0.11057, 0, 0, 16, 16, 0.00, 3, '2024-05-22 17:17:22', NULL, NULL, 0, 5, 0, 1e19, NULL, '480583337661038602', '1232475648396759132', 1),
(289, NULL, 'evapanda', '💎︱options-stock-alerts', 'StockOptions', '', 5, 0.022, 0.06634, 0.13057, 0.022, 0.11057, 0, 0, 16, 16, 0.00, 3, '2024-05-22 18:11:42', NULL, NULL, 0, 5, 0, 1e19, NULL, '536430344489009153', '1232475648396759132', 1),
(290, NULL, 'jw2014', '💎︱options-stock-alerts', 'StockOptions', '', 5, 0.022, 0.06634, 0.13057, 0.022, 0.11057, 0, 0, 16, 16, 0.00, 3, '2024-05-22 18:19:25', NULL, NULL, 0, 5, 0, 1e19, NULL, '625952281040257034', '1232475648396759132', 1),
(291, NULL, 'turnerdan94', '🚀︱member-alerts', 'Stocks-Forex', '', 5, 0.022, 0.06634, 0.13057, 0.022, 0.11057, 0, 0, 16, 16, 0.00, 3, '2024-05-23 12:56:03', NULL, NULL, 0, 5, 0, 1e19, NULL, '907996064630587432', '1232475511150743632', 1),
(292, NULL, 'presten.7', '💫︱futures-alerts', 'Stocks-Forex', '', 5, 0.022, 0.06634, 0.13057, 0.022, 0.11057, 0, 0, 16, 16, 0.00, 3, '2024-05-23 13:41:26', NULL, NULL, 0, 5, 0, 1e19, NULL, '820065977584451636', '1232475403407327303', 1),
(293, NULL, 'bcf', '💎︱options-stock-alerts', 'StockOptions', '', 5, 0.022, 0.06634, 0.13057, 0.022, 0.11057, 0, 0, 16, 16, 0.00, 3, '2024-05-23 14:09:19', NULL, NULL, 0, 5, 0, 1e19, NULL, '526074289640833025', '1232475648396759132', 1),
(294, b'1', 'jw2014', '💫︱futures-alerts', 'Futures', 'ES', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 6000, 3, 12, 16, 0.00, 0, '2024-05-23 14:15:36', NULL, NULL, 0, 5, 0, 1e19, NULL, '625952281040257034', '1232475403407327303', 1),
(295, b'1', 'skowih', '💎︱options-stock-alerts', 'StockOptions', '', 5, 0.022, 0.06634, 0.13057, 0.022, 0.11057, 0, 0, 16, 16, 0.00, 3, '2024-05-23 15:59:32', NULL, NULL, 0, 5, 0, 1e19, NULL, '334147594039328790', '1232475648396759132', 1),
(296, b'1', 'bendc2r', '💎︱options-stock-alerts', 'StockOptions', '', 5, 0.022, 0.06634, 0.13057, 0.022, 0.11057, 0, 0, 16, 16, 0.00, 3, '2024-05-23 17:45:39', NULL, NULL, 0, 5, 0, 1e19, NULL, '426126942505402371', '1232475648396759132', 1),
(297, b'1', 'farazmatin', 'signalchannel', 'Futures', 'GC', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 3000, 3, 12, 16, 0.00, 0, '2024-05-23 18:07:05', NULL, NULL, 0, 5, 0, 1e19, NULL, '403285053259513858', '1100830612383879188', 1),
(298, b'1', 'CopyUser', 'CopyChannel', 'Futures', 'GC', 1, 0.022, 0.06634, 0.13057, 0.13268, 0.11057, 3000, 0.51, 12, 16, 0.00, 0, '2023-09-28 17:17:54', NULL, NULL, 0, 5, 0, 1e16, NULL, '1', '1', 1),
(299, NULL, 'farazmatin', 'signalchannel', 'StockOptions', '275', 5, 0.022, 0.06634, 0.13057, 0.022, 0.11057, 0, 0, 16, 16, 0.00, 3, '2024-05-23 20:58:03', NULL, NULL, 0, 5, 0, 1e19, NULL, '403285053259513858', '1100830612383879188', 1),
(300, NULL, 'farazmatin', 'signalchannel', 'StockOptions', 'MCD', 5, 0.022, 0.06634, 0.13057, 0.022, 0.11057, 0, 0, 16, 16, 0.00, 3, '2024-05-23 20:58:03', NULL, NULL, 0, 5, 0, 1e19, NULL, '403285053259513858', '1100830612383879188', 1);
INSERT INTO `userprovider` (`id`, `CopyTrade`, `ProviderName`, `ChannelName`, `AssetType`, `InstrumentType`, `PositionSizePercent`, `EntryOffsetPercent`, `StopLossPercent`, `TP1Percent`, `TrailPercent`, `BreakevenPercent`, `positionAmount`, `EntryOffsetAmount`, `StopLossAmount`, `TP1Amount`, `TrailAmount`, `BreakEvenAmountPerContract`, `CreationTime`, `EntryStrategy`, `ExitStrategy`, `PremiumMin`, `PremiumMax`, `MktCapMin`, `MktCapMax`, `Size1`, `Provider_id`, `Channel_id`, `user_id`) VALUES
(301, NULL, 'farazmatin', 'signalchannel', 'Stocks-Forex', 'AAPL', 5, 0.022, 0.06634, 0.13057, 0.022, 0.11057, 0, 0, 16, 16, 0.00, 3, '2024-05-23 20:58:03', NULL, NULL, 0, 5, 0, 1e19, NULL, '403285053259513858', '1100830612383879188', 1),
(302, NULL, 'moonshotdg', '💎︱options-stock-alerts', 'StockOptions', 'CRWD', 5, 0.022, 0.06634, 0.13057, 0.022, 0.11057, 0, 0, 16, 16, 0.00, 3, '2024-05-23 20:58:03', NULL, NULL, 0, 5, 0, 1e19, NULL, '936406954706878555', '1232475648396759132', 1),
(303, NULL, 'presten.7', '💫︱futures-alerts', 'Stocks-Forex', 'MGCM', 5, 0.022, 0.06634, 0.13057, 0.022, 0.11057, 0, 0, 16, 16, 0.00, 3, '2024-05-23 20:58:03', NULL, NULL, 0, 5, 0, 1e19, NULL, '820065977584451636', '1232475403407327303', 1),
(304, NULL, 'farazmatin', 'signalchannel', 'StockOptions', 'XOM', 5, 0.022, 0.06634, 0.13057, 0.022, 0.11057, 0, 0, 16, 16, 0.00, 3, '2024-05-23 20:58:03', NULL, NULL, 0, 5, 0, 1e19, NULL, '403285053259513858', '1100830612383879188', 1),
(305, NULL, 'farazmatin', 'signalchannel', 'StockOptions', 'NKE', 5, 0.022, 0.06634, 0.13057, 0.022, 0.11057, 0, 0, 16, 16, 0.00, 3, '2024-05-23 20:58:03', NULL, NULL, 0, 5, 0, 1e19, NULL, '403285053259513858', '1100830612383879188', 1),
(306, NULL, 'farazmatin', 'signalchannel', 'StockOptions', 'AMD', 5, 0.022, 0.06634, 0.13057, 0.022, 0.11057, 0, 0, 16, 16, 0.00, 3, '2024-05-23 20:58:03', NULL, NULL, 0, 5, 0, 1e19, NULL, '403285053259513858', '1100830612383879188', 1),
(307, NULL, 'farazmatin', 'signalchannel', 'StockOptions', 'CRWD', 5, 0.022, 0.06634, 0.13057, 0.022, 0.11057, 0, 0, 16, 16, 0.00, 3, '2024-05-23 20:58:03', NULL, NULL, 0, 5, 0, 1e19, NULL, '403285053259513858', '1100830612383879188', 1),
(308, NULL, 'bcf', '💎︱options-stock-alerts', 'StockOptions', 'XOM', 5, 0.022, 0.06634, 0.13057, 0.022, 0.11057, 0, 0, 16, 16, 0.00, 3, '2024-05-23 20:58:03', NULL, NULL, 0, 5, 0, 1e19, NULL, '526074289640833025', '1232475648396759132', 1),
(314, NULL, 'jw2014', '💎︱options-stock-alerts', 'Stocks-Forex', '', 5, 0.022, 0.06634, 0.13057, 0.022, 0.11057, 0, 0, 16, 16, 0.00, 3, '2024-05-24 18:52:39', NULL, NULL, 0, 5, 0, 1e19, NULL, '625952281040257034', '1232475648396759132', 1);

-- --------------------------------------------------------

--
-- Table structure for table `webhook`
--

CREATE TABLE `webhook` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `URL` varchar(255) NOT NULL,
  `Source` varchar(40) NOT NULL,
  `Target` varchar(40) NOT NULL,
  `UserKey` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure for view `futures_view`
--
DROP TABLE IF EXISTS `futures_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `futures_view`  AS SELECT `userprovider`.`id` AS `id`, `userprovider`.`CopyTrade` AS `CopyTrade`, `userprovider`.`ProviderName` AS `ProviderName`, `userprovider`.`ChannelName` AS `ChannelName`, `userprovider`.`AssetType` AS `AssetType`, `userprovider`.`InstrumentType` AS `InstrumentType`, `userprovider`.`PositionSizePercent` AS `PositionSizePercent`, `userprovider`.`EntryOffsetPercent` AS `EntryOffsetPercent`, `userprovider`.`StopLossPercent` AS `StopLossPercent`, `userprovider`.`TP1Percent` AS `TP1Percent`, `userprovider`.`TrailPercent` AS `TrailPercent`, `userprovider`.`BreakevenPercent` AS `BreakevenPercent`, `userprovider`.`positionAmount` AS `positionAmount`, `userprovider`.`EntryOffsetAmount` AS `EntryOffsetAmount`, `userprovider`.`StopLossAmount` AS `StopLossAmount`, `userprovider`.`TP1Amount` AS `TP1Amount`, `userprovider`.`TrailAmount` AS `TrailAmount`, `userprovider`.`BreakEvenAmountPerContract` AS `BreakEvenAmountPerContract`, `userprovider`.`CreationTime` AS `CreationTime`, `userprovider`.`EntryStrategy` AS `EntryStrategy`, `userprovider`.`ExitStrategy` AS `ExitStrategy`, `userprovider`.`PremiumMin` AS `PremiumMin`, `userprovider`.`PremiumMax` AS `PremiumMax`, `userprovider`.`MktCapMin` AS `MktCapMin`, `userprovider`.`MktCapMax` AS `MktCapMax`, `userprovider`.`Size1` AS `Size1`, `userprovider`.`Provider_id` AS `Provider_id`, `userprovider`.`Channel_id` AS `Channel_id`, `userprovider`.`user_id` AS `user_id` FROM `userprovider` WHERE `userprovider`.`CopyTrade` is null AND `userprovider`.`AssetType` = 'Futures' ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `asset`
--
ALTER TABLE `asset`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assetstrategy-futureuse`
--
ALTER TABLE `assetstrategy-futureuse`
  ADD PRIMARY KEY (`AssetID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `channel`
--
ALTER TABLE `channel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provider`
--
ALTER TABLE `provider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `signals`
--
ALTER TABLE `signals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription`
--
ALTER TABLE `subscription`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_subscription_user1` (`user_id`);

--
-- Indexes for table `tradeexecution`
--
ALTER TABLE `tradeexecution`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userprovider`
--
ALTER TABLE `userprovider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `webhook`
--
ALTER TABLE `webhook`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_webhook_user1` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `asset`
--
ALTER TABLE `asset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assetstrategy-futureuse`
--
ALTER TABLE `assetstrategy-futureuse`
  MODIFY `AssetID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `channel`
--
ALTER TABLE `channel`
  MODIFY `id` int(40) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `signals`
--
ALTER TABLE `signals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=373;

--
-- AUTO_INCREMENT for table `subscription`
--
ALTER TABLE `subscription`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tradeexecution`
--
ALTER TABLE `tradeexecution`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=842;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `userprovider`
--
ALTER TABLE `userprovider`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=315;

--
-- AUTO_INCREMENT for table `webhook`
--
ALTER TABLE `webhook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assetstrategy-futureuse`
--
ALTER TABLE `assetstrategy-futureuse`
  ADD CONSTRAINT `UserID` FOREIGN KEY (`UserID`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `subscription`
--
ALTER TABLE `subscription`
  ADD CONSTRAINT `fk_subscription_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `webhook`
--
ALTER TABLE `webhook`
  ADD CONSTRAINT `fk_webhook_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`root`@`localhost` EVENT `timedout` ON SCHEDULE EVERY 15 SECOND STARTS '2021-02-08 14:30:00' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
    UPDATE `automatedtrading`.`signals` SET `Status` = 'timed out' WHERE `Status` = 'pending' AND TIMESTAMPDIFF(MINUTE, TimeStamp, NOW()) >= 1;
END$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
