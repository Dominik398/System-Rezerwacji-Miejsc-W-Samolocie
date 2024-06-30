-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 25, 2024 at 09:49 AM
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
-- Database: `flightsdatabase`
--

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `ClientID` int(13) NOT NULL,
  `IDSocial` varchar(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Surname` varchar(50) NOT NULL,
  `Age` int(3) NOT NULL,
  `InsuranceProvider` varchar(50) DEFAULT NULL,
  `InsuranceExpirationDate` date DEFAULT NULL,
  `InsuranceCode` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`ClientID`, `IDSocial`, `Name`, `Surname`, `Age`, `InsuranceProvider`, `InsuranceExpirationDate`, `InsuranceCode`) VALUES
(2, '1537689210', 'Joon', 'Yamada', 18, NULL, NULL, NULL),
(3, '2679348152', 'Mia', 'Tanaka', 25, NULL, NULL, NULL),
(4, '3894127653', 'Liam', 'Kimura', 30, NULL, NULL, NULL),
(5, '4962831704', 'Olivia', 'Hoshino', 22, NULL, NULL, NULL),
(6, '5123986475', 'Noah', 'Ishida', 27, NULL, NULL, NULL),
(7, '6239847156', 'Emma', 'Sato', 34, NULL, NULL, NULL),
(8, '7348295617', 'Oliver', 'Nakano', 29, NULL, NULL, NULL),
(9, '8457269138', 'Ava', 'Suzuki', 24, NULL, NULL, NULL),
(10, '9563718429', 'William', 'Kobayashi', 32, NULL, NULL, NULL),
(11, '1762935480', 'Sophia', 'Watanabe', 28, NULL, NULL, NULL),
(12, '2846519301', 'James', 'Yamamoto', 21, NULL, NULL, NULL),
(13, '3951742682', 'Isabella', 'Nakamura', 26, NULL, NULL, NULL),
(14, '4185297633', 'Benjamin', 'Kato', 31, NULL, NULL, NULL),
(15, '5239876144', 'Mia', 'Yoshida', 23, NULL, NULL, NULL),
(16, '6341289755', 'Lucas', 'Inoue', 27, NULL, NULL, NULL),
(17, '7495632816', 'Amelia', 'Kinoshita', 33, NULL, NULL, NULL),
(18, '8512743967', 'Henry', 'Murakami', 29, NULL, NULL, NULL),
(19, '9641835728', 'Evelyn', 'Abe', 25, NULL, NULL, NULL),
(20, '1725398469', 'Alexander', 'Matsumoto', 35, NULL, NULL, NULL),
(21, '2854917630', 'Harper', 'Okada', 22, NULL, NULL, NULL),
(22, '3978162451', 'Sebastian', 'Kaneko', 20, NULL, NULL, NULL),
(23, '4187359622', 'Ella', 'Takahashi', 28, NULL, NULL, NULL),
(24, '5239416873', 'Aiden', 'Ono', 30, NULL, NULL, NULL),
(25, '6348752194', 'Grace', 'Hayashi', 27, NULL, NULL, NULL),
(26, '7412389565', 'Daniel', 'Fujii', 26, NULL, NULL, NULL),
(27, '8531726496', 'Chloe', 'Takagi', 31, NULL, NULL, NULL),
(28, '9624817357', 'Matthew', 'Ueda', 29, NULL, NULL, NULL),
(29, '1746295838', 'Mila', 'Endo', 24, NULL, NULL, NULL),
(30, '2837154969', 'Jackson', 'Nagai', 34, NULL, NULL, NULL),
(31, '3952746810', 'Scarlett', 'Yoshikawa', 23, NULL, NULL, NULL),
(32, '4128396751', 'Leo', 'Fukuda', 25, NULL, NULL, NULL),
(33, '5261943872', 'Victoria', 'Sakamoto', 32, NULL, NULL, NULL),
(34, '6384219753', 'Mason', 'Saito', 28, NULL, NULL, NULL),
(35, '7483526194', 'Penelope', 'Kojima', 21, NULL, NULL, NULL),
(36, '8592764135', 'Logan', 'Yamashita', 27, NULL, NULL, NULL),
(37, '9645872316', 'Luna', 'Sakamoto', 29, NULL, NULL, NULL),
(38, '1735964827', 'Elijah', 'Matsuo', 24, NULL, NULL, NULL),
(39, '2846513978', 'Hazel', 'Kuwahara', 31, NULL, NULL, NULL),
(40, '3974815269', 'Carter', 'Kondo', 30, NULL, NULL, NULL),
(41, '4152936870', 'Aria', 'Yamashiro', 22, NULL, NULL, NULL),
(42, '5283746911', 'Lucas', 'Oda', 33, NULL, NULL, NULL),
(43, '6395142872', 'Aurora', 'Saeki', 26, NULL, NULL, NULL),
(44, '7428693513', 'Jackson', 'Mizuno', 35, NULL, NULL, NULL),
(45, '8513976244', 'Zoe', 'Miyamoto', 25, NULL, NULL, NULL),
(46, '9627835415', 'Levi', 'Nakata', 28, NULL, NULL, NULL),
(47, '1748369526', 'Stella', 'Teraoka', 27, NULL, NULL, NULL),
(48, '2864917357', 'Wyatt', 'Fujimura', 24, NULL, NULL, NULL),
(49, '3915826478', 'Nora', 'Nishimoto', 32, NULL, NULL, NULL),
(50, '4129763589', 'David', 'Kojima', 29, NULL, NULL, NULL),
(51, '5271849630', 'Camila', 'Inagaki', 21, NULL, NULL, NULL),
(52, '6352871941', 'Samuel', 'Honda', 23, NULL, NULL, NULL),
(53, '7486193522', 'Violet', 'Nagao', 25, NULL, NULL, NULL),
(54, '8591327463', 'Owen', 'Tsumura', 34, NULL, NULL, NULL),
(55, '9634851724', 'Hannah', 'Sone', 28, NULL, NULL, NULL),
(56, '1726943855', 'Dylan', 'Hanamura', 27, NULL, NULL, NULL),
(57, '2845731966', 'Paisley', 'Kishi', 24, NULL, NULL, NULL),
(58, '3964827597', 'Lincoln', 'Yoshino', 30, NULL, NULL, NULL),
(59, '4127596848', 'Ellie', 'Fujii', 31, NULL, NULL, NULL),
(60, '5281946739', 'Nathan', 'Sano', 33, NULL, NULL, NULL),
(61, '6348512970', 'Lily', 'Amano', 29, NULL, NULL, NULL),
(62, '7492138561', 'Grayson', 'Shimizu', 35, NULL, NULL, NULL),
(63, '8519476232', 'Sofia', 'Kawahara', 27, NULL, NULL, NULL),
(64, '9635827413', 'Jack', 'Hori', 22, NULL, NULL, NULL),
(65, '1746932854', 'Avery', 'Sato', 26, NULL, NULL, NULL),
(66, '2854719365', 'Gabriel', 'Kimoto', 30, NULL, NULL, NULL),
(67, '3981526746', 'Audrey', 'Wakabayashi', 24, NULL, NULL, NULL),
(68, '4128793567', 'Julian', 'Taniguchi', 29, NULL, NULL, NULL),
(69, '5291467838', 'Aubrey', 'Tsukuda', 28, NULL, NULL, NULL),
(70, '6319582749', 'Isaac', 'Nishikawa', 21, NULL, NULL, NULL),
(71, '7468315920', 'Brooklyn', 'Furukawa', 32, NULL, NULL, NULL),
(72, '8579234611', 'John', 'Smith', 70, NULL, NULL, NULL),
(73, '9641587232', 'Jane', 'Doe', 68, NULL, NULL, NULL),
(74, '1734962583', 'Robert', 'Johnson', 72, NULL, NULL, NULL),
(75, '2854179634', 'Mary', 'Lee', 67, NULL, NULL, NULL),
(76, '3962845175', 'William', 'Brown', 75, NULL, NULL, NULL),
(77, '4157398266', 'Liam', 'Taylor', 12, NULL, NULL, NULL),
(78, '5279143857', 'Emma', 'Wilson', 15, NULL, NULL, NULL),
(79, '6381952748', 'Noah', 'Moore', 16, NULL, NULL, NULL),
(80, '7419836529', 'Olivia', 'Anderson', 10, NULL, NULL, NULL),
(81, '8592173640', 'Mason', 'Thomas', 17, NULL, NULL, NULL),
(82, '9634285711', 'Shion', 'Yamada', 18, 'SafeFlightInsurance', '2024-06-27', '123412341234'),
(83, '1725496832', 'Mika', 'Tanaka', 25, 'HealthGuard', '2024-07-15', '234523452345'),
(84, '2857319463', 'Taro', 'Suzuki', 30, 'LifeSecure', '2025-01-10', '345634563456'),
(85, '3982461754', 'Aiko', 'Yamamoto', 22, 'WellCare', '2024-09-05', '456745674567'),
(86, '4127896355', 'Yuki', 'Kobayashi', 27, 'PrimeHealth', '2025-04-21', '567856785678'),
(87, '5291634786', 'Hiro', 'Nakamura', 34, 'SafeFlightInsurance', '2024-12-13', '678967896789'),
(88, '6319842577', 'Sakura', 'Inoue', 29, 'HealthGuard', '2025-03-30', '789078907890'),
(89, '7458213968', 'Kaito', 'Hasegawa', 24, 'LifeSecure', '2024-11-18', '890189018901'),
(90, '8529173649', 'Emi', 'Sato', 32, 'WellCare', '2024-08-02', '901290129012'),
(91, '9635842710', 'Ken', 'Kato', 28, 'PrimeHealth', '2025-02-14', '012301230123'),
(92, '1738462951', 'Akira', 'Matsumoto', 35, 'SafeFlightInsurance', '2025-05-26', '123412341235'),
(93, '2849175362', 'Mai', 'Yoshida', 20, 'HealthGuard', '2024-07-03', '234523452346'),
(94, '3962874153', 'Riku', 'Kimura', 31, 'LifeSecure', '2024-10-27', '345634563457'),
(95, '4129357684', 'Nao', 'Shimizu', 23, 'WellCare', '2024-09-19', '456745674568'),
(96, '5284716935', 'Yuna', 'Ishida', 26, 'PrimeHealth', '2025-01-06', '567856785679'),
(97, '6319742586', 'Ren', 'Fujita', 33, 'SafeFlightInsurance', '2024-12-25', '678967896790'),
(98, '7451823967', 'Sora', 'Takeuchi', 29, 'HealthGuard', '2025-04-07', '789078907891'),
(99, '8521936478', 'Mio', 'Ogawa', 21, 'LifeSecure', '2024-11-30', '890189018902'),
(100, '9635482719', 'Haruto', 'Arai', 25, 'WellCare', '2024-08-11', '901290129013'),
(101, '1742358960', 'Ayumi', 'Takeda', 30, 'PrimeHealth', '2025-02-23', '012301230124'),
(102, '2859643711', 'Yuto', 'Kondo', 27, 'SafeFlightInsurance', '2024-10-15', '123412341236'),
(103, '3968742512', 'Misaki', 'Miyazaki', 28, 'HealthGuard', '2025-01-29', '234523452347'),
(104, '4123897563', 'Kazuki', 'Nakajima', 22, 'LifeSecure', '2024-09-23', '345634563458'),
(105, '5284179364', 'Hinata', 'Ueno', 24, 'WellCare', '2025-03-12', '456745674569'),
(106, '6318975425', 'Eri', 'Kawasaki', 32, 'PrimeHealth', '2024-12-08', '567856785680'),
(107, '7452896136', 'Hana', 'Yoshida', 45, 'SafeFlightInsurance', '2023-01-15', '789012345678'),
(108, '8523491677', 'Kenji', 'Sakamoto', 53, 'HealthGuard', '2022-11-30', '890123456789'),
(109, '9635872418', 'Naoko', 'Mori', 39, 'LifeSecure', '2023-04-20', '901234567890'),
(110, '1738465299', 'Takumi', 'Ito', 47, 'WellCare', '2023-02-10', '012345678901'),
(111, '2849137560', 'Yui', 'Abe', 52, 'PrimeHealth', '2022-12-25', '123456789012'),
(112, '1999000999', 'Jack', 'Bool', 20, NULL, NULL, NULL),
(113, '1888000888', 'Annie', 'Book', 20, NULL, NULL, NULL),
(114, '1555000555', 'Broke', 'Broke', 24, NULL, NULL, NULL),
(115, '1111000111', 'al', 'ala', 0, 'ala', '2026-02-25', 'ala'),
(116, '9000999000', 'Jack', 'Rich', 18, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `flights`
--

CREATE TABLE `flights` (
  `FlightID` int(13) NOT NULL,
  `Code` varchar(13) NOT NULL,
  `StartCountry` varchar(50) NOT NULL,
  `StartLocation` varchar(50) NOT NULL,
  `FinishLocation` varchar(50) NOT NULL,
  `FinishCountry` varchar(50) NOT NULL,
  `Date` date NOT NULL,
  `Time` time(6) NOT NULL,
  `TotalSeats` int(4) NOT NULL,
  `Price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `flights`
--

INSERT INTO `flights` (`FlightID`, `Code`, `StartCountry`, `StartLocation`, `FinishLocation`, `FinishCountry`, `Date`, `Time`, `TotalSeats`, `Price`) VALUES
(136, 'WAR-00011150', 'Polska', 'Warszawa', 'Berlin', 'Niemcy', '2024-06-20', '19:00:00.000000', 50, 499.99),
(137, 'WAR-00011240', 'Polska', 'Warszawa', 'Paryż', 'Francja', '2024-06-21', '14:30:00.000000', 40, 1000),
(138, 'WAR-00011330', 'Polska', 'Warszawa', 'Londyn', 'Wielka Brytania', '2024-06-22', '10:00:00.000000', 30, 900.9),
(139, 'WAR-00011450', 'Polska', 'Warszawa', 'Rzym', 'Włochy', '2024-06-23', '08:15:00.000000', 50, 345.45),
(140, 'WAR-00011540', 'Polska', 'Warszawa', 'Madryt', 'Hiszpania', '2024-06-24', '12:00:00.000000', 40, 1000),
(141, 'WAR-00011630', 'Polska', 'Warszawa', 'Wiedeń', 'Austria', '2024-06-25', '07:45:00.000000', 30, 800),
(142, 'WAR-00011750', 'Polska', 'Warszawa', 'Amsterdam', 'Holandia', '2024-06-26', '17:00:00.000000', 50, 800),
(143, 'WAR-00011840', 'Polska', 'Warszawa', 'Praga', 'Czechy', '2024-06-27', '13:30:00.000000', 40, 600),
(144, 'WAR-00011930', 'Polska', 'Warszawa', 'Sztokholm', 'Szwecja', '2024-06-28', '09:15:00.000000', 30, 1000),
(145, 'WAR-00012050', 'Polska', 'Warszawa', 'Oslo', 'Norwegja', '2024-06-29', '15:00:00.000000', 50, 1209),
(146, 'WAR-00012140', 'Polska', 'Warszawa', 'Helsinki', 'Finlandia', '2024-06-30', '11:30:00.000000', 40, 1300),
(147, 'WAR-00012230', 'Polska', 'Warszawa', 'Kopenhaga', 'Dania', '2024-07-01', '08:00:00.000000', 30, 1000),
(148, 'WAR-00012350', 'Polska', 'Warszawa', 'Bruksela', 'Belgia', '2024-07-02', '18:45:00.000000', 50, 800),
(149, 'WAR-00012440', 'Polska', 'Warszawa', 'Zurych', 'Szwajcaria', '2024-07-03', '14:00:00.000000', 40, 1000),
(150, 'WAR-00012530', 'Polska', 'Warszawa', 'Lizbona', 'Portugalia', '2024-07-04', '09:45:00.000000', 30, 1200),
(151, 'WAR-00012650', 'Polska', 'Warszawa', 'Dublin', 'Irlandia', '2024-07-05', '19:00:00.000000', 50, 899.99),
(152, 'WAR-00012740', 'Polska', 'Warszawa', 'Ateny', 'Grecja', '2024-07-06', '15:30:00.000000', 40, 1020.2),
(153, 'WAR-00012830', 'Polska', 'Warszawa', 'Budapeszt', 'Węgry', '2024-07-07', '11:15:00.000000', 30, 1000),
(154, 'WAR-00012950', 'Polska', 'Warszawa', 'Wiedeń', 'Austria', '2024-07-08', '17:00:00.000000', 50, 5000),
(155, 'WAR-00013040', 'Polska', 'Warszawa', 'Mediolan', 'Włochy', '2024-07-09', '13:30:00.000000', 40, 1200.2),
(156, 'BER-00013130', 'Niemcy', 'Berlin', 'Warszawa', 'Polska', '2024-07-10', '09:00:00.000000', 30, 1100),
(157, 'PAR-00013240', 'Francja', 'Paryż', 'Madryt', 'Hiszpania', '2024-07-11', '11:30:00.000000', 40, 500),
(158, 'LON-00013350', 'Wielka Brytania', 'Londyn', 'Berlin', 'Niemcy', '2024-07-12', '15:00:00.000000', 50, 800),
(159, 'ROM-00013430', 'Włochy', 'Rzym', 'Wiedeń', 'Austria', '2024-07-13', '07:45:00.000000', 30, 800),
(160, 'MAD-00013540', 'Hiszpania', 'Madryt', 'Lizbona', 'Portugalia', '2024-07-14', '14:00:00.000000', 40, 1200),
(161, 'VIE-00013650', 'Austria', 'Wiedeń', 'Zurych', 'Szwajcaria', '2024-07-15', '18:45:00.000000', 50, 1200),
(162, 'AMS-00013730', 'Holandia', 'Amsterdam', 'Bruksela', 'Belgia', '2024-07-16', '08:00:00.000000', 30, 900),
(163, 'BRU-00013840', 'Belgia', 'Bruksela', 'Dublin', 'Irlandia', '2024-07-17', '12:00:00.000000', 40, 1500),
(164, 'STO-00013950', 'Szwecja', 'Sztokholm', 'Kopenhaga', 'Dania', '2024-07-18', '10:00:00.000000', 50, 750),
(165, 'CPH-00014030', 'Dania', 'Kopenhaga', 'Oslo', 'Norwegja', '2024-07-19', '19:00:00.000000', 30, 850),
(166, 'WAR-00014130', 'Polska', 'Warszawa', 'Berlin', 'Niemcy', '2024-04-15', '09:00:00.000000', 30, 560),
(167, 'WAR-00014240', 'Polska', 'Warszawa', 'Paryż', 'Francja', '2024-04-18', '11:30:00.000000', 40, 860),
(168, 'WAR-00014350', 'Polska', 'Warszawa', 'Londyn', 'Wielka Brytania', '2024-08-20', '15:00:00.000000', 50, 859.99),
(169, 'WAR-00014430', 'Polska', 'Warszawa', 'Rzym', 'Włochy', '2024-08-23', '07:45:00.000000', 30, 1200),
(170, 'WAR-00014540', 'Polska', 'Warszawa', 'Madryt', 'Hiszpania', '2024-08-25', '14:00:00.000000', 40, 1200);

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `ReservationID` int(13) NOT NULL,
  `FlightID` int(13) NOT NULL,
  `ClientID` int(13) NOT NULL,
  `SeatCol` int(2) NOT NULL,
  `SeatRow` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`ReservationID`, `FlightID`, `ClientID`, `SeatCol`, `SeatRow`) VALUES
(1, 136, 2, 0, 0),
(2, 136, 3, 0, 1),
(3, 136, 4, 0, 2),
(4, 136, 5, 0, 3),
(5, 136, 6, 0, 4),
(6, 136, 7, 0, 5),
(7, 136, 8, 0, 6),
(8, 136, 9, 0, 7),
(9, 136, 10, 0, 8),
(10, 136, 11, 0, 9),
(11, 136, 12, 1, 0),
(12, 136, 13, 1, 1),
(13, 136, 14, 1, 2),
(14, 136, 15, 1, 3),
(15, 136, 16, 1, 4),
(16, 136, 17, 1, 5),
(17, 136, 18, 1, 6),
(18, 136, 19, 1, 7),
(19, 136, 20, 1, 8),
(20, 136, 21, 1, 9),
(21, 136, 22, 2, 0),
(22, 136, 23, 2, 1),
(23, 136, 24, 2, 2),
(24, 136, 25, 2, 3),
(25, 136, 26, 2, 4),
(26, 136, 27, 2, 5),
(27, 136, 28, 2, 6),
(28, 136, 29, 2, 7),
(29, 136, 30, 2, 8),
(30, 136, 31, 2, 9),
(31, 136, 32, 3, 0),
(32, 136, 33, 3, 1),
(33, 136, 34, 3, 2),
(34, 136, 35, 3, 3),
(35, 136, 36, 3, 4),
(36, 136, 37, 3, 5),
(37, 136, 38, 3, 6),
(38, 136, 39, 3, 7),
(39, 136, 40, 3, 8),
(40, 136, 41, 3, 9),
(41, 136, 42, 4, 0),
(42, 136, 43, 4, 1),
(43, 136, 44, 4, 2),
(44, 136, 45, 4, 3),
(45, 136, 46, 4, 4),
(46, 136, 47, 4, 5),
(47, 136, 48, 4, 6),
(48, 136, 49, 4, 7),
(49, 136, 51, 4, 8),
(50, 136, 52, 4, 9),
(51, 137, 12, 0, 0),
(52, 137, 13, 0, 1),
(53, 137, 14, 0, 2),
(54, 137, 15, 0, 3),
(55, 137, 16, 0, 4),
(56, 137, 17, 0, 5),
(57, 137, 18, 0, 6),
(58, 137, 19, 0, 7),
(59, 137, 20, 0, 8),
(60, 137, 21, 0, 9),
(61, 137, 22, 1, 0),
(62, 137, 23, 1, 1),
(63, 137, 24, 1, 2),
(64, 137, 25, 1, 3),
(65, 137, 26, 1, 4),
(66, 137, 27, 1, 5),
(67, 137, 28, 1, 6),
(68, 137, 29, 1, 7),
(69, 137, 30, 1, 8),
(70, 137, 31, 1, 9),
(71, 137, 32, 2, 0),
(72, 137, 33, 2, 1),
(73, 137, 34, 2, 2),
(74, 137, 35, 2, 3),
(75, 137, 36, 2, 4),
(76, 137, 37, 2, 5),
(77, 137, 38, 2, 6),
(78, 137, 39, 2, 7),
(79, 137, 40, 2, 8),
(80, 137, 41, 2, 9),
(81, 137, 42, 3, 0),
(82, 137, 43, 3, 1),
(83, 137, 44, 3, 2),
(84, 137, 45, 3, 3),
(85, 137, 46, 3, 4),
(86, 137, 47, 3, 5),
(87, 137, 48, 3, 6),
(88, 137, 49, 3, 7),
(89, 137, 51, 3, 8),
(90, 137, 52, 3, 9),
(91, 138, 12, 0, 0),
(92, 138, 13, 0, 1),
(93, 138, 14, 0, 2),
(94, 138, 15, 0, 3),
(95, 138, 16, 0, 4),
(96, 138, 17, 0, 5),
(97, 138, 18, 0, 6),
(98, 138, 19, 0, 7),
(99, 138, 20, 0, 8),
(100, 138, 21, 0, 9),
(101, 138, 22, 1, 0),
(102, 138, 23, 1, 1),
(103, 138, 24, 1, 2),
(104, 138, 25, 1, 3),
(105, 138, 26, 1, 4),
(106, 138, 27, 1, 5),
(107, 138, 28, 1, 6),
(108, 138, 29, 1, 7),
(109, 138, 30, 1, 8),
(110, 138, 31, 1, 9),
(111, 138, 32, 2, 0),
(112, 138, 33, 2, 1),
(113, 138, 34, 2, 2),
(114, 138, 35, 2, 3),
(115, 138, 36, 2, 4),
(116, 138, 37, 2, 5),
(117, 138, 38, 2, 6),
(118, 138, 39, 2, 7),
(119, 138, 40, 2, 8),
(120, 138, 41, 2, 9),
(121, 139, 111, 0, 0),
(122, 139, 110, 0, 1),
(123, 139, 109, 0, 2),
(124, 139, 108, 0, 3),
(125, 139, 107, 0, 4),
(126, 139, 106, 0, 5),
(127, 139, 105, 0, 6),
(128, 139, 104, 0, 7),
(129, 139, 103, 0, 8),
(130, 139, 102, 0, 9),
(131, 139, 101, 1, 0),
(132, 139, 100, 1, 1),
(133, 139, 99, 1, 2),
(134, 139, 98, 1, 3),
(135, 139, 97, 1, 4),
(136, 139, 96, 1, 5),
(137, 139, 95, 1, 6),
(138, 139, 94, 1, 7),
(139, 139, 93, 1, 8),
(140, 139, 92, 1, 9),
(141, 139, 91, 2, 0),
(142, 139, 90, 2, 1),
(143, 139, 89, 2, 2),
(144, 139, 88, 2, 3),
(145, 139, 87, 2, 4),
(146, 139, 86, 2, 5),
(147, 139, 85, 2, 6),
(148, 139, 84, 2, 7),
(149, 139, 83, 2, 8),
(150, 139, 82, 2, 9),
(151, 139, 81, 3, 0),
(152, 139, 80, 3, 1),
(153, 139, 79, 3, 2),
(154, 139, 78, 3, 3),
(155, 139, 77, 3, 4),
(156, 139, 76, 3, 5),
(157, 139, 75, 3, 6),
(158, 139, 74, 3, 7),
(159, 139, 73, 3, 8),
(160, 139, 72, 3, 9),
(161, 139, 71, 4, 0),
(162, 139, 70, 4, 1),
(163, 139, 69, 4, 2),
(164, 139, 68, 4, 3),
(165, 139, 67, 4, 4),
(166, 139, 66, 4, 5),
(167, 139, 65, 4, 6),
(168, 139, 64, 4, 7),
(169, 139, 63, 4, 8),
(170, 139, 62, 4, 9),
(171, 140, 61, 0, 0),
(172, 140, 60, 0, 1),
(173, 140, 59, 0, 2),
(174, 140, 58, 0, 3),
(175, 140, 57, 0, 4),
(176, 140, 56, 0, 5),
(177, 140, 55, 0, 6),
(178, 140, 54, 0, 7),
(179, 140, 53, 0, 8),
(180, 140, 52, 0, 9),
(181, 140, 51, 1, 0),
(182, 140, 50, 1, 1),
(183, 140, 49, 1, 2),
(184, 140, 48, 1, 3),
(185, 140, 47, 1, 4),
(186, 140, 46, 1, 5),
(187, 140, 45, 1, 6),
(188, 140, 44, 1, 7),
(189, 140, 43, 1, 8),
(190, 140, 42, 1, 9),
(191, 140, 41, 2, 0),
(192, 140, 40, 2, 1),
(193, 140, 39, 2, 2),
(194, 140, 38, 2, 3),
(195, 140, 37, 2, 4),
(196, 140, 36, 2, 5),
(197, 140, 35, 2, 6),
(198, 140, 34, 2, 7),
(199, 140, 33, 2, 8),
(200, 140, 32, 2, 9),
(201, 140, 31, 3, 0),
(202, 140, 30, 3, 1),
(203, 140, 29, 3, 2),
(204, 140, 28, 3, 3),
(205, 140, 27, 3, 4),
(206, 140, 26, 3, 5),
(207, 140, 25, 3, 6),
(208, 140, 24, 3, 7),
(209, 140, 23, 3, 8),
(210, 140, 22, 3, 9),
(211, 141, 9, 0, 0),
(212, 141, 9, 0, 1),
(213, 141, 9, 0, 2),
(214, 141, 9, 0, 3),
(215, 141, 9, 0, 4),
(216, 141, 9, 0, 5),
(217, 141, 9, 0, 6),
(218, 141, 9, 0, 7),
(219, 141, 9, 0, 8),
(220, 141, 9, 0, 9),
(221, 141, 10, 1, 0),
(222, 141, 10, 1, 1),
(223, 141, 10, 1, 2),
(224, 141, 10, 1, 3),
(225, 141, 10, 1, 4),
(226, 141, 10, 1, 5),
(227, 141, 10, 1, 6),
(228, 141, 10, 1, 7),
(229, 141, 10, 1, 8),
(230, 141, 10, 1, 9),
(231, 141, 12, 2, 0),
(232, 141, 12, 2, 1),
(233, 141, 12, 2, 2),
(234, 141, 12, 2, 3),
(235, 141, 12, 2, 4),
(236, 141, 12, 2, 5),
(237, 141, 12, 2, 6),
(238, 141, 12, 2, 7),
(239, 141, 12, 2, 8),
(240, 141, 12, 2, 9),
(241, 142, 111, 0, 0),
(242, 142, 110, 0, 1),
(243, 142, 109, 0, 2),
(244, 142, 108, 0, 3),
(245, 142, 107, 0, 4),
(246, 142, 106, 0, 5),
(247, 142, 105, 0, 6),
(248, 142, 104, 0, 7),
(249, 142, 103, 0, 8),
(250, 142, 102, 0, 9),
(251, 142, 101, 1, 0),
(252, 142, 100, 1, 1),
(253, 142, 99, 1, 2),
(254, 142, 98, 1, 3),
(255, 142, 97, 1, 4),
(256, 142, 96, 1, 5),
(257, 142, 95, 1, 6),
(258, 142, 94, 1, 7),
(259, 142, 93, 1, 8),
(260, 142, 92, 1, 9),
(261, 142, 91, 2, 0),
(262, 142, 90, 2, 1),
(263, 142, 89, 2, 2),
(264, 142, 88, 2, 3),
(265, 142, 87, 2, 4),
(266, 142, 86, 2, 5),
(267, 142, 85, 2, 6),
(268, 142, 84, 2, 7),
(269, 142, 83, 2, 8),
(270, 142, 82, 2, 9),
(271, 142, 81, 3, 0),
(272, 142, 80, 3, 1),
(273, 142, 79, 3, 2),
(274, 142, 78, 3, 3),
(275, 142, 77, 3, 4),
(276, 142, 76, 3, 5),
(277, 142, 75, 3, 6),
(278, 142, 74, 3, 7),
(279, 142, 73, 3, 8),
(280, 142, 72, 3, 9),
(281, 142, 71, 4, 0),
(282, 142, 70, 4, 1),
(283, 142, 69, 4, 2),
(284, 142, 68, 4, 3),
(285, 142, 67, 4, 4),
(286, 142, 66, 4, 5),
(287, 142, 65, 4, 6),
(288, 142, 64, 4, 7),
(289, 142, 63, 4, 8),
(290, 142, 62, 4, 9),
(291, 143, 61, 0, 0),
(292, 143, 60, 0, 1),
(293, 143, 59, 0, 2),
(294, 143, 58, 0, 3),
(295, 143, 57, 0, 4),
(296, 143, 56, 0, 5),
(297, 143, 55, 0, 6),
(298, 143, 54, 0, 7),
(299, 143, 53, 0, 8),
(300, 143, 52, 0, 9),
(301, 143, 51, 1, 0),
(302, 143, 50, 1, 1),
(303, 143, 49, 1, 2),
(304, 143, 48, 1, 3),
(305, 143, 47, 1, 4),
(306, 143, 46, 1, 5),
(307, 143, 45, 1, 6),
(308, 143, 44, 1, 7),
(309, 143, 43, 1, 8),
(310, 143, 42, 1, 9),
(311, 143, 41, 2, 0),
(312, 143, 40, 2, 1),
(313, 143, 39, 2, 2),
(314, 143, 38, 2, 3),
(315, 143, 37, 2, 4),
(316, 143, 36, 2, 5),
(317, 143, 35, 2, 6),
(318, 143, 34, 2, 7),
(319, 143, 33, 2, 8),
(320, 143, 32, 2, 9),
(321, 143, 31, 3, 0),
(322, 143, 30, 3, 1),
(323, 143, 29, 3, 2),
(324, 143, 28, 3, 3),
(325, 143, 27, 3, 4),
(326, 143, 26, 3, 5),
(327, 143, 25, 3, 6),
(328, 143, 24, 3, 7),
(329, 143, 23, 3, 8),
(330, 143, 22, 3, 9),
(331, 144, 111, 0, 0),
(332, 144, 110, 0, 1),
(333, 144, 109, 0, 2),
(334, 144, 108, 0, 3),
(335, 144, 107, 0, 4),
(336, 144, 106, 0, 5),
(337, 144, 105, 0, 6),
(338, 144, 104, 0, 7),
(339, 144, 103, 0, 8),
(340, 144, 102, 0, 9),
(341, 144, 101, 1, 0),
(342, 144, 100, 1, 1),
(343, 144, 99, 1, 2),
(344, 144, 98, 1, 3),
(345, 144, 97, 1, 4),
(346, 144, 96, 1, 5),
(347, 144, 95, 1, 6),
(348, 144, 94, 1, 7),
(349, 144, 93, 1, 8),
(350, 144, 92, 1, 9),
(351, 144, 91, 2, 0),
(352, 144, 90, 2, 1),
(353, 144, 89, 2, 2),
(354, 144, 88, 2, 3),
(355, 144, 87, 2, 4),
(356, 144, 86, 2, 5),
(357, 144, 85, 2, 6),
(358, 144, 84, 2, 7),
(359, 144, 83, 2, 8),
(360, 144, 82, 2, 9),
(361, 145, 111, 0, 0),
(362, 145, 110, 0, 1),
(363, 145, 109, 0, 2),
(364, 145, 108, 0, 3),
(365, 145, 107, 0, 4),
(366, 145, 106, 0, 5),
(367, 145, 105, 0, 6),
(368, 145, 104, 0, 7),
(369, 145, 103, 0, 8),
(370, 145, 102, 0, 9),
(371, 145, 101, 1, 0),
(372, 145, 100, 1, 1),
(373, 145, 99, 1, 2),
(374, 145, 98, 1, 3),
(375, 145, 97, 1, 4),
(376, 145, 96, 1, 5),
(377, 145, 95, 1, 6),
(378, 145, 94, 1, 7),
(379, 145, 93, 1, 8),
(380, 145, 92, 1, 9),
(381, 145, 91, 2, 0),
(382, 145, 90, 2, 1),
(383, 145, 89, 2, 2),
(384, 145, 88, 2, 3),
(385, 145, 87, 2, 4),
(386, 145, 86, 2, 5),
(387, 145, 85, 2, 6),
(388, 145, 84, 2, 7),
(389, 145, 83, 2, 8),
(390, 145, 82, 2, 9),
(391, 145, 81, 3, 0),
(392, 145, 80, 3, 1),
(393, 145, 79, 3, 2),
(394, 145, 78, 3, 3),
(395, 145, 77, 3, 4),
(396, 145, 76, 3, 5),
(397, 145, 75, 3, 6),
(398, 145, 74, 3, 7),
(399, 145, 73, 3, 8),
(400, 145, 72, 3, 9),
(401, 145, 71, 4, 0),
(402, 145, 70, 4, 1),
(403, 145, 69, 4, 2),
(404, 145, 68, 4, 3),
(405, 145, 67, 4, 4),
(406, 145, 66, 4, 5),
(407, 145, 65, 4, 6),
(408, 145, 64, 4, 7),
(409, 145, 63, 4, 8),
(410, 145, 62, 4, 9),
(411, 146, 111, 0, 0),
(412, 146, 110, 0, 1),
(413, 146, 109, 0, 2),
(414, 146, 108, 0, 3),
(415, 146, 107, 0, 4),
(416, 146, 106, 0, 5),
(417, 146, 105, 0, 6),
(418, 146, 104, 0, 7),
(419, 146, 103, 0, 8),
(420, 146, 102, 0, 9),
(421, 146, 101, 1, 0),
(422, 146, 100, 1, 1),
(423, 146, 99, 1, 2),
(424, 146, 98, 1, 3),
(425, 146, 97, 1, 4),
(426, 146, 96, 1, 5),
(427, 146, 95, 1, 6),
(428, 146, 94, 1, 7),
(429, 146, 93, 1, 8),
(430, 146, 92, 1, 9),
(431, 146, 91, 2, 0),
(432, 146, 90, 2, 1),
(433, 146, 89, 2, 2),
(434, 146, 88, 2, 3),
(435, 146, 87, 2, 4),
(436, 146, 86, 2, 5),
(437, 146, 85, 2, 6),
(438, 146, 84, 2, 7),
(439, 146, 83, 2, 8),
(440, 146, 82, 2, 9),
(441, 146, 81, 3, 0),
(442, 146, 80, 3, 1),
(443, 146, 79, 3, 2),
(444, 146, 78, 3, 3),
(445, 146, 77, 3, 4),
(446, 146, 76, 3, 5),
(447, 146, 75, 3, 6),
(448, 146, 74, 3, 7),
(449, 146, 73, 3, 8),
(450, 146, 72, 3, 9),
(451, 147, 111, 0, 0),
(452, 147, 110, 0, 1),
(453, 147, 109, 0, 2),
(454, 147, 108, 0, 3),
(455, 147, 107, 0, 4),
(456, 147, 106, 0, 5),
(457, 147, 105, 0, 6),
(458, 147, 104, 0, 7),
(459, 147, 103, 0, 8),
(460, 147, 102, 0, 9),
(461, 147, 101, 1, 0),
(462, 147, 100, 1, 1),
(463, 147, 99, 1, 2),
(464, 147, 98, 1, 3),
(465, 147, 97, 1, 4),
(466, 147, 96, 1, 5),
(467, 147, 95, 1, 6),
(468, 147, 94, 1, 7),
(469, 147, 93, 1, 8),
(470, 147, 92, 1, 9),
(471, 147, 91, 2, 0),
(472, 147, 90, 2, 1),
(473, 147, 89, 2, 2),
(474, 147, 88, 2, 3),
(475, 147, 87, 2, 4),
(476, 147, 86, 2, 5),
(477, 147, 85, 2, 6),
(478, 147, 84, 2, 7),
(479, 147, 83, 2, 8),
(480, 147, 82, 2, 9),
(481, 148, 111, 0, 0),
(482, 148, 110, 0, 1),
(483, 148, 109, 0, 2),
(484, 148, 108, 0, 3),
(485, 148, 107, 0, 4),
(486, 148, 106, 0, 5),
(487, 148, 105, 0, 6),
(488, 148, 104, 0, 7),
(489, 148, 103, 0, 8),
(490, 148, 102, 0, 9),
(491, 148, 101, 1, 0),
(492, 148, 100, 1, 1),
(493, 148, 99, 1, 2),
(494, 148, 98, 1, 3),
(495, 148, 97, 1, 4),
(496, 148, 96, 1, 5),
(497, 148, 95, 1, 6),
(498, 148, 94, 1, 7),
(499, 148, 93, 1, 8),
(500, 148, 92, 1, 9),
(501, 148, 91, 2, 0),
(502, 148, 90, 2, 1),
(503, 148, 89, 2, 2),
(504, 148, 88, 2, 3),
(505, 148, 87, 2, 4),
(506, 148, 86, 2, 5),
(507, 148, 85, 2, 6),
(508, 148, 84, 2, 7),
(509, 148, 83, 2, 8),
(510, 148, 82, 2, 9),
(511, 148, 81, 3, 0),
(512, 148, 80, 3, 1),
(513, 148, 79, 3, 2),
(514, 148, 78, 3, 3),
(515, 148, 77, 3, 4),
(516, 148, 76, 3, 5),
(517, 148, 75, 3, 6),
(518, 148, 74, 3, 7),
(519, 148, 73, 3, 8),
(520, 148, 72, 3, 9),
(521, 148, 71, 4, 0),
(522, 148, 70, 4, 1),
(523, 148, 69, 4, 2),
(524, 148, 68, 4, 3),
(525, 148, 67, 4, 4),
(526, 148, 66, 4, 5),
(527, 148, 65, 4, 6),
(528, 148, 64, 4, 7),
(529, 148, 63, 4, 8),
(530, 148, 62, 4, 9),
(531, 149, 111, 0, 0),
(532, 149, 110, 0, 1),
(533, 149, 109, 0, 2),
(534, 149, 108, 0, 3),
(535, 149, 107, 0, 4),
(536, 149, 106, 0, 5),
(537, 149, 105, 0, 6),
(538, 149, 104, 0, 7),
(539, 149, 103, 0, 8),
(540, 149, 102, 0, 9),
(541, 149, 101, 1, 0),
(542, 149, 100, 1, 1),
(543, 149, 99, 1, 2),
(544, 149, 98, 1, 3),
(545, 149, 97, 1, 4),
(546, 149, 96, 1, 5),
(547, 149, 95, 1, 6),
(548, 149, 94, 1, 7),
(549, 149, 93, 1, 8),
(550, 149, 92, 1, 9),
(551, 149, 91, 2, 0),
(552, 149, 90, 2, 1),
(553, 149, 89, 2, 2),
(554, 149, 88, 2, 3),
(555, 149, 87, 2, 4),
(556, 149, 86, 2, 5),
(557, 149, 85, 2, 6),
(558, 149, 84, 2, 7),
(559, 149, 83, 2, 8),
(560, 149, 82, 2, 9),
(561, 149, 81, 3, 0),
(562, 149, 80, 3, 1),
(563, 149, 79, 3, 2),
(564, 149, 78, 3, 3),
(565, 149, 77, 3, 4),
(566, 149, 76, 3, 5),
(567, 149, 75, 3, 6),
(568, 149, 74, 3, 7),
(569, 149, 73, 3, 8),
(570, 149, 72, 3, 9),
(571, 150, 111, 0, 0),
(572, 150, 110, 0, 1),
(573, 150, 109, 0, 2),
(574, 150, 108, 0, 3),
(575, 150, 107, 0, 4),
(576, 150, 106, 0, 5),
(577, 150, 105, 0, 6),
(578, 150, 104, 0, 7),
(579, 150, 103, 0, 8),
(580, 150, 102, 0, 9),
(581, 150, 101, 1, 0),
(582, 150, 100, 1, 1),
(583, 150, 99, 1, 2),
(584, 150, 98, 1, 3),
(585, 150, 97, 1, 4),
(586, 150, 96, 1, 5),
(587, 150, 95, 1, 6),
(588, 150, 94, 1, 7),
(589, 150, 93, 1, 8),
(590, 150, 92, 1, 9),
(591, 150, 91, 2, 0),
(592, 150, 90, 2, 1),
(593, 150, 89, 2, 2),
(594, 150, 88, 2, 3),
(595, 150, 87, 2, 4),
(596, 150, 86, 2, 5),
(597, 150, 85, 2, 6),
(598, 150, 84, 2, 7),
(599, 150, 83, 2, 8),
(600, 150, 82, 2, 9),
(602, 151, 108, 0, 3),
(603, 151, 107, 0, 4),
(604, 151, 106, 0, 5),
(605, 151, 105, 0, 6),
(606, 151, 104, 0, 7),
(607, 151, 103, 0, 8),
(608, 151, 102, 0, 9),
(609, 151, 101, 1, 0),
(610, 151, 100, 1, 1),
(611, 151, 99, 1, 2),
(612, 151, 98, 1, 3),
(613, 151, 97, 1, 4),
(614, 151, 93, 1, 8),
(615, 151, 92, 1, 9),
(616, 151, 91, 2, 0),
(617, 151, 90, 2, 1),
(618, 151, 89, 2, 2),
(619, 151, 88, 2, 3),
(620, 151, 87, 2, 4),
(621, 151, 83, 2, 8),
(622, 151, 82, 2, 9),
(623, 151, 81, 3, 0),
(624, 151, 80, 3, 1),
(625, 151, 79, 3, 2),
(626, 151, 78, 3, 3),
(627, 151, 77, 3, 4),
(628, 151, 75, 3, 6),
(629, 151, 74, 3, 7),
(630, 151, 73, 3, 8),
(631, 151, 72, 3, 9),
(632, 151, 71, 4, 0),
(633, 151, 70, 4, 1),
(634, 151, 69, 4, 2),
(635, 151, 68, 4, 3),
(636, 151, 67, 4, 4),
(637, 151, 66, 4, 5),
(638, 151, 65, 4, 6),
(639, 151, 64, 4, 7),
(640, 151, 63, 4, 8),
(641, 151, 62, 4, 9),
(642, 152, 111, 0, 0),
(643, 152, 110, 0, 1),
(644, 152, 109, 0, 2),
(645, 152, 108, 0, 3),
(646, 152, 107, 0, 4),
(647, 152, 106, 0, 5),
(648, 152, 105, 0, 6),
(649, 152, 104, 0, 7),
(650, 152, 101, 1, 0),
(651, 152, 100, 1, 1),
(652, 152, 99, 1, 2),
(653, 152, 98, 1, 3),
(654, 152, 97, 1, 4),
(655, 152, 96, 1, 5),
(656, 152, 95, 1, 6),
(657, 152, 94, 1, 7),
(658, 152, 91, 2, 0),
(659, 152, 90, 2, 1),
(660, 152, 89, 2, 2),
(661, 152, 88, 2, 3),
(662, 152, 87, 2, 4),
(663, 152, 86, 2, 5),
(664, 152, 85, 2, 6),
(665, 152, 84, 2, 7),
(666, 152, 81, 3, 0),
(667, 152, 80, 3, 1),
(668, 152, 79, 3, 2),
(669, 152, 78, 3, 3),
(670, 152, 77, 3, 4),
(671, 152, 76, 3, 5),
(672, 152, 75, 3, 6),
(673, 152, 74, 3, 7),
(674, 153, 111, 0, 0),
(675, 153, 110, 0, 1),
(676, 153, 109, 0, 2),
(677, 153, 108, 0, 3),
(678, 153, 107, 0, 4),
(679, 153, 106, 0, 5),
(680, 153, 105, 0, 6),
(681, 153, 104, 0, 7),
(682, 153, 103, 0, 8),
(683, 153, 102, 0, 9),
(684, 153, 101, 1, 0),
(685, 153, 100, 1, 1),
(686, 153, 99, 1, 2),
(687, 153, 98, 1, 3),
(688, 153, 97, 1, 4),
(689, 153, 96, 1, 5),
(690, 153, 95, 1, 6),
(691, 153, 94, 1, 7),
(692, 153, 93, 1, 8),
(693, 153, 92, 1, 9),
(694, 154, 2, 0, 0),
(695, 154, 2, 0, 1),
(696, 154, 2, 0, 2),
(697, 154, 2, 0, 3),
(698, 154, 2, 0, 4),
(699, 154, 2, 0, 5),
(700, 154, 2, 0, 6),
(701, 154, 2, 0, 7),
(702, 154, 2, 0, 8),
(703, 154, 2, 0, 9),
(704, 154, 2, 1, 0),
(705, 154, 2, 1, 1),
(706, 154, 2, 1, 2),
(707, 154, 2, 1, 3),
(708, 154, 2, 1, 4),
(709, 154, 2, 1, 5),
(710, 154, 2, 1, 6),
(711, 154, 2, 1, 7),
(712, 154, 2, 1, 8),
(713, 154, 2, 1, 9),
(714, 154, 2, 2, 0),
(715, 154, 2, 2, 1),
(716, 154, 2, 2, 2),
(717, 154, 2, 2, 3),
(718, 154, 2, 2, 4),
(719, 154, 2, 2, 6),
(720, 154, 2, 2, 7),
(721, 154, 2, 2, 8),
(722, 154, 2, 2, 9),
(723, 154, 2, 3, 0),
(724, 154, 2, 3, 1),
(725, 154, 2, 3, 2),
(726, 154, 2, 3, 3),
(727, 154, 2, 3, 4),
(728, 154, 2, 3, 5),
(729, 154, 2, 3, 6),
(730, 154, 2, 3, 7),
(731, 154, 2, 3, 8),
(732, 154, 2, 3, 9),
(733, 154, 2, 4, 0),
(734, 154, 2, 4, 1),
(735, 154, 2, 4, 2),
(736, 154, 2, 4, 3),
(737, 154, 2, 4, 4),
(738, 154, 2, 4, 5),
(739, 154, 2, 4, 6),
(740, 154, 2, 4, 7),
(741, 154, 2, 4, 8),
(742, 154, 2, 4, 9),
(743, 168, 111, 0, 0),
(744, 168, 108, 0, 3),
(745, 168, 107, 0, 4),
(746, 168, 106, 0, 5),
(747, 168, 105, 0, 6),
(748, 168, 104, 0, 7),
(749, 168, 103, 0, 8),
(750, 168, 102, 0, 9),
(751, 168, 101, 1, 0),
(752, 168, 100, 1, 1),
(753, 168, 99, 1, 2),
(754, 168, 98, 1, 3),
(755, 168, 97, 1, 4),
(756, 168, 93, 1, 8),
(757, 168, 92, 1, 9),
(758, 168, 91, 2, 0),
(759, 168, 90, 2, 1),
(760, 168, 89, 2, 2),
(761, 168, 88, 2, 3),
(762, 168, 87, 2, 4),
(763, 168, 83, 2, 8),
(764, 168, 82, 2, 9),
(765, 168, 81, 3, 0),
(766, 168, 80, 3, 1),
(767, 168, 79, 3, 2),
(768, 168, 78, 3, 3),
(769, 168, 77, 3, 4),
(770, 168, 75, 3, 6),
(771, 168, 74, 3, 7),
(772, 168, 73, 3, 8),
(773, 168, 72, 3, 9),
(774, 168, 71, 4, 0),
(775, 168, 70, 4, 1),
(776, 168, 69, 4, 2),
(777, 168, 68, 4, 3),
(778, 168, 67, 4, 4),
(779, 168, 66, 4, 5),
(780, 168, 65, 4, 6),
(781, 168, 64, 4, 7),
(782, 168, 63, 4, 8),
(783, 168, 62, 4, 9),
(784, 169, 111, 0, 0),
(785, 169, 110, 0, 1),
(786, 169, 109, 0, 2),
(787, 169, 108, 0, 3),
(788, 169, 107, 0, 4),
(789, 169, 106, 0, 5),
(790, 169, 105, 0, 6),
(791, 169, 104, 0, 7),
(792, 169, 101, 0, 8),
(793, 169, 100, 0, 9),
(794, 169, 99, 1, 1),
(795, 169, 98, 1, 2),
(796, 169, 97, 1, 3),
(797, 169, 96, 1, 4),
(798, 169, 95, 1, 5),
(799, 169, 94, 1, 6),
(800, 169, 91, 1, 7),
(801, 169, 90, 1, 8),
(802, 169, 89, 1, 9),
(803, 169, 88, 2, 0),
(804, 169, 87, 2, 1),
(805, 169, 86, 2, 2),
(806, 169, 85, 2, 3),
(807, 169, 84, 2, 4),
(808, 169, 81, 2, 5),
(809, 169, 80, 2, 6),
(810, 169, 79, 2, 7),
(811, 169, 78, 2, 8),
(812, 169, 77, 2, 9),
(813, 169, 76, 1, 0),
(816, 170, 111, 0, 0),
(817, 170, 110, 0, 1),
(818, 170, 109, 0, 2),
(819, 170, 108, 0, 3),
(820, 170, 107, 0, 4),
(821, 170, 106, 0, 5),
(822, 170, 105, 0, 6),
(823, 170, 104, 0, 7),
(824, 170, 103, 0, 8),
(825, 170, 102, 0, 9),
(826, 170, 101, 1, 0),
(827, 170, 100, 1, 1),
(828, 170, 99, 1, 2),
(829, 170, 98, 1, 3),
(830, 170, 97, 1, 4),
(831, 170, 96, 1, 5),
(832, 170, 95, 1, 6),
(833, 170, 94, 1, 7),
(834, 170, 93, 1, 8),
(835, 170, 92, 1, 9),
(836, 160, 2, 0, 0),
(838, 151, 113, 0, 1),
(840, 151, 114, 0, 2),
(842, 151, 115, 0, 0),
(843, 151, 116, 1, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`ClientID`),
  ADD UNIQUE KEY `IDSocial` (`IDSocial`),
  ADD UNIQUE KEY `InsuranceCode` (`InsuranceCode`);

--
-- Indexes for table `flights`
--
ALTER TABLE `flights`
  ADD PRIMARY KEY (`FlightID`),
  ADD UNIQUE KEY `Code` (`Code`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`ReservationID`),
  ADD KEY `FlightID` (`FlightID`),
  ADD KEY `ClientID` (`ClientID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `ClientID` int(13) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `flights`
--
ALTER TABLE `flights`
  MODIFY `FlightID` int(13) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `ReservationID` int(13) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=844;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`FlightID`) REFERENCES `flights` (`FlightID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`ClientID`) REFERENCES `clients` (`ClientID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
