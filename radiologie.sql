-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 30. Apr 2026 um 09:23
-- Server-Version: 10.4.32-MariaDB
-- PHP-Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `radiologie`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `device`
--

CREATE TABLE `device` (
  `id` int(11) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `room_number` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `device`
--

INSERT INTO `device` (`id`, `designation`, `room_number`, `type`) VALUES
(1, 'MR-01', 'R101', 'MR'),
(2, 'CT-01', 'R102', 'CT'),
(3, 'RX-01', 'R103', 'Röntgen'),
(4, 'US-01', 'R104', 'Ultraschall');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `patient`
--

CREATE TABLE `patient` (
  `id` int(11) NOT NULL,
  `birth_date` date NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `gender` enum('DIVERS','MÄNNLICH','WEIBLICH') NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `social_security_number` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `patient`
--

INSERT INTO `patient` (`id`, `birth_date`, `first_name`, `gender`, `last_name`, `social_security_number`) VALUES
(1, '2000-02-12', 'Valerie', 'WEIBLICH', 'Wojner', '9876543210'),
(2, '2003-04-13', 'Ermin', 'MÄNNLICH', 'delicia', '1234567890'),
(3, '2004-01-14', 'Elias', 'DIVERS', 'Lessterk', '1234567891'),
(4, '2002-12-12', 'Valerie', 'WEIBLICH', 'Wojner', '2045200509');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `reservation`
--

CREATE TABLE `reservation` (
  `id` int(11) NOT NULL,
  `body_region` enum('ABDOMEN','ARM','BECKEN','BEIN','BRUSTKORB','FUSS','GANZER_KOERPER','HALS','HAND','KNIE','KOPF','WIRBELSAEULE') NOT NULL,
  `comment` varchar(1000) DEFAULT NULL,
  `end_time` datetime(6) NOT NULL,
  `start_time` datetime(6) NOT NULL,
  `device_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `reservation`
--

INSERT INTO `reservation` (`id`, `body_region`, `comment`, `end_time`, `start_time`, `device_id`, `patient_id`) VALUES
(1, 'BEIN', 'Aua am Ben', '2026-04-30 14:00:00.000000', '2026-04-30 12:00:00.000000', 2, 1),
(2, 'BEIN', 'Ermin tut weh', '2026-05-01 13:00:00.000000', '2026-05-01 10:00:00.000000', 3, 2),
(3, 'WIRBELSAEULE', 'Wirbelsäule schmerzt', '2026-05-09 13:00:00.000000', '2026-05-09 12:00:00.000000', 1, 3);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `device`
--
ALTER TABLE `device`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKp3d7k0057eoax7kroy0i87c16` (`designation`);

--
-- Indizes für die Tabelle `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK9docwt49y5gmrqxoe05swnas` (`social_security_number`);

--
-- Indizes für die Tabelle `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKcjc9b9oyt5lwt049mjoiqtb7r` (`device_id`),
  ADD KEY `FKrrjvkskqqxgliwmqgbl3ijc4n` (`patient_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `device`
--
ALTER TABLE `device`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `patient`
--
ALTER TABLE `patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `FKcjc9b9oyt5lwt049mjoiqtb7r` FOREIGN KEY (`device_id`) REFERENCES `device` (`id`),
  ADD CONSTRAINT `FKrrjvkskqqxgliwmqgbl3ijc4n` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
