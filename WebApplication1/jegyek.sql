-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Okt 14. 07:47
-- Kiszolgáló verziója: 10.4.20-MariaDB
-- PHP verzió: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `jegyek`
--
CREATE DATABASE IF NOT EXISTS `jegyek` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE `jegyek`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `szamonkeres`
--

CREATE TABLE `szamonkeres` (
  `id` int(11) NOT NULL,
  `Jegy` int(11) DEFAULT NULL,
  `Leiras` text COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Letrehozas_ideje` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `szamonkeres`
--

INSERT INTO `szamonkeres` (`id`, `Jegy`, `Leiras`, `Letrehozas_ideje`) VALUES
(1, 2, 'ads', '0000-00-00 00:00:00'),
(2, 5, 'dsa', '0000-00-00 00:00:00'),
(3, 2, 'ads', '2024-10-14 00:00:00');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `szamonkeres`
--
ALTER TABLE `szamonkeres`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `szamonkeres`
--
ALTER TABLE `szamonkeres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
