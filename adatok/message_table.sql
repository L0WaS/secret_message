-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2022. Jún 08. 05:21
-- Kiszolgáló verziója: 10.4.21-MariaDB
-- PHP verzió: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `secret_table`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `secret` text COLLATE utf8mb4_hungarian_ci NOT NULL,
  `remainingViews` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `expiresAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `hash` varchar(128) COLLATE utf8mb4_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `message`
--

INSERT INTO `message` (`id`, `secret`, `remainingViews`, `createdAt`, `expiresAt`, `hash`) VALUES
(11, 'bela', 667, '2022-06-05 20:57:44', '2022-06-14 22:00:00', '809da5f0e559c6925004e9b1862e2d608473b6103a10d7432ccbd37449658cfa'),
(22, 'Sajt32', 0, '2022-06-06 19:07:29', '2022-06-06 19:08:09', '04fad08f36bed3746831f6edf4bb25cf0ccb285e58cd6028594602e285d48fac'),
(24, '', 0, '2022-06-06 19:16:33', '2022-06-21 22:00:00', 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'),
(25, 'Laura', 0, '2022-06-06 19:20:20', '2022-06-06 19:20:45', 'f0b8649dbd8cc269a6a9f57166490602cb5e17344007e29c1591f6cdad29aa37'),
(26, 'Faszxd', 0, '2022-06-06 19:24:45', '2022-06-06 19:35:57', '9c0f794b517e8c6e4b92f187dd877ec07ef05aee64b05dbf3e38f85cd4f1a3fa'),
(27, 'Laura nem tud enekelni', 7, '2022-06-06 19:39:22', '2022-06-06 19:40:43', '90a501b142cccb8702b0f1982ae3015585267e3a42accc29bdc392259e32c495'),
(28, 'Adam a best', 2, '2022-06-06 19:46:21', '2022-06-06 19:47:00', '38eb803e000107994ed618d7412e29b7ecb38d5b30210a6268a7f152b29420e0'),
(29, 'Vaddiszno teszt', 18, '2022-06-06 20:00:16', '2022-06-06 20:01:00', '89b5524e52dfcb26e66f315b9b729f6eb8ce412ca5f47eacff0b4127ed24c9d3'),
(30, 'asd1', 20, '2022-06-06 20:14:35', '2022-06-06 20:17:42', 'c31097bc49e7cbdbec19cfa5193ee0ae8a0763e031040912c725f61ad20e7b26'),
(31, 'asd', 316, '2022-06-08 02:58:44', '2022-06-11 02:00:00', '688787d8ff144c502c7f5cffaafe2cc588d86079f9de88304c26b0cb99ce91c6'),
(32, '', 0, '2022-06-08 03:01:55', '0000-00-00 00:00:00', 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'),
(33, '', 2, '2022-06-08 03:02:05', '2022-06-11 03:02:00', 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'),
(34, '', 2, '2022-06-08 03:02:10', '2022-06-11 03:02:00', 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'),
(35, '', 32, '2022-06-08 03:02:57', '2022-06-11 03:02:00', 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'),
(36, '', 0, '2022-06-08 03:03:19', '0000-00-00 00:00:00', 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'),
(37, 'ds', 0, '2022-06-08 03:04:03', '0000-00-00 00:00:00', 'f9c7af7ebcbf098b9f5f37361d1b168bb2e5b98d930ceef0f055377a8c94db61'),
(38, 'asd', 23, '2022-06-08 03:05:48', '0000-00-00 00:00:00', '688787d8ff144c502c7f5cffaafe2cc588d86079f9de88304c26b0cb99ce91c6');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
