-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Čtv 21. bře 2019, 18:55
-- Verze serveru: 5.7.14
-- Verze PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `skola`
--
CREATE DATABASE IF NOT EXISTS `skola` DEFAULT CHARACTER SET utf8 COLLATE utf8_czech_ci;
USE `skola`;

-- --------------------------------------------------------

--
-- Struktura tabulky `zaci`
--

CREATE TABLE `zaci` (
  `jmenoPrijmeni` varchar(100) COLLATE utf8_czech_ci NOT NULL,
  `datumNarozeni` date NOT NULL,
  `trida` char(3) COLLATE utf8_czech_ci NOT NULL,
  `tridniUcitel` varchar(30) COLLATE utf8_czech_ci NOT NULL,
  `kontakty` varchar(255) COLLATE utf8_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `zaci`
--

INSERT INTO `zaci` (`jmenoPrijmeni`, `datumNarozeni`, `trida`, `tridniUcitel`, `kontakty`) VALUES
('Jiří Žák', '1996-05-08', '1.A', 'Ing. Jan Novák', '721987654;602123456;466741852'),
('Karel Šmíd', '1996-02-13', '1.A', 'Ing. Jan Novák', '737951267;465123789;604843642'),
('Petr Hudec', '1997-07-18', '1.B', 'Mgr. Světlana Hubáčková', '474148624;608112456;729927813');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
