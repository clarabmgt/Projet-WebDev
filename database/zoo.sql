-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 22 nov. 2024 à 08:43
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `zoo`
--
CREATE DATABASE IF NOT EXISTS `zoo` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `zoo`;

-- --------------------------------------------------------

--
-- Structure de la table `animals`
--

DROP TABLE IF EXISTS `animals`;
CREATE TABLE IF NOT EXISTS `animals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `animals`
--

INSERT INTO `animals` (`id`, `name`) VALUES
(1, 'Python'),
(2, 'Tortue'),
(3, 'Iguane'),
(4, 'Ara'),
(5, 'Grand Hocco'),
(6, 'Panthère'),
(7, 'Perroquet'),
(8, 'Tamarin'),
(9, 'Capucin'),
(10, 'Ouistiti'),
(11, 'Gibbon'),
(12, 'Varan de Komodo'),
(13, 'Eléphant'),
(14, 'Girafe'),
(15, 'Grivet'),
(16, 'Cercorpithèque'),
(17, 'Hyène'),
(18, 'Loup à crinière'),
(19, 'Lion'),
(20, 'Hippopotame'),
(21, 'Zèbre'),
(22, 'Panda roux'),
(23, 'Lémurien'),
(24, 'Chèvre naine'),
(25, 'Mouflon'),
(26, 'Binturong'),
(27, 'Loutre'),
(28, 'Macaque crabier'),
(29, 'Cerf'),
(30, 'Vautour'),
(31, 'Daim'),
(32, 'Antilope'),
(33, 'Nilgut'),
(34, 'Loup d\'Europe'),
(35, 'Rhinocéros'),
(36, 'Suricate'),
(37, 'Fennec'),
(38, 'Coati'),
(39, 'Saïmiri'),
(40, 'Tapir'),
(41, 'Casoar'),
(42, 'Crocodile nain'),
(43, 'Guépard'),
(44, 'Gazelle'),
(45, 'Autruche'),
(46, 'Gnou'),
(47, 'Oryx beisa'),
(48, 'Marabout'),
(49, 'Cigogne'),
(50, 'Oryx algazelle'),
(51, 'Watusi'),
(52, 'Ane de Somalie'),
(53, 'Yack'),
(54, 'Mouton noir'),
(55, 'Ibis'),
(56, 'Pécari'),
(57, 'Tamanoir'),
(58, 'Flamant rose'),
(59, 'Nandou'),
(60, 'Emeu'),
(61, 'Wallaby'),
(62, 'Porc-épic'),
(63, 'Lynx'),
(64, 'Serval'),
(65, 'Chien des buissons'),
(66, 'Tigre'),
(67, 'Bison'),
(68, 'Ane de provence'),
(69, 'Dromadaire');

-- --------------------------------------------------------

--
-- Structure de la table `biomes`
--

DROP TABLE IF EXISTS `biomes`;
CREATE TABLE IF NOT EXISTS `biomes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `color` text NOT NULL,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `biomes`
--

INSERT INTO `biomes` (`id`, `color`, `name`) VALUES
(1, '#70D5C2', 'La Bergerie des reptiles'),
(2, '#A4BDCC', 'Le Vallon des cascades'),
(3, '#B5A589', 'Le Belvédère'),
(4, '#E2A59D', 'Le Plateau'),
(5, '#E2CA9D', 'Les Clairières'),
(6, '#C5E29D', 'Le Bois des pins');

-- --------------------------------------------------------

--
-- Structure de la table `enclosures`
--

DROP TABLE IF EXISTS `enclosures`;
CREATE TABLE IF NOT EXISTS `enclosures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_biomes` int NOT NULL,
  `meal` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `enclosures`
--

INSERT INTO `enclosures` (`id`, `id_biomes`, `meal`) VALUES
(1, 2, ''),
(2, 2, ''),
(3, 2, ''),
(4, 2, ''),
(5, 2, ''),
(6, 2, ''),
(7, 2, ''),
(8, 2, ''),
(9, 2, ''),
(10, 1, ''),
(11, 3, ''),
(12, 3, ''),
(13, 3, ''),
(14, 3, ''),
(15, 3, ''),
(16, 3, '[]'),
(17, 3, ''),
(18, 3, ''),
(19, 3, ''),
(20, 4, ''),
(21, 4, ''),
(22, 4, ''),
(23, 4, ''),
(24, 4, ''),
(25, 4, ''),
(26, 4, ''),
(27, 4, ''),
(28, 4, ''),
(29, 4, ''),
(30, 4, ''),
(31, 4, ''),
(32, 6, ''),
(33, 6, ''),
(34, 6, ''),
(35, 6, ''),
(36, 6, ''),
(37, 5, ''),
(38, 5, ''),
(39, 5, ''),
(40, 5, ''),
(41, 5, ''),
(42, 5, ''),
(43, 5, ''),
(44, 5, ''),
(45, 5, ''),
(46, 5, ''),
(47, 5, ''),
(48, 5, ''),
(49, 5, ''),
(50, 5, ''),
(51, 5, '');

-- --------------------------------------------------------

--
-- Structure de la table `relation_enclos_animals`
--

DROP TABLE IF EXISTS `relation_enclos_animals`;
CREATE TABLE IF NOT EXISTS `relation_enclos_animals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_enclos` int NOT NULL,
  `id_animal` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `relation_enclos_animals`
--

INSERT INTO `relation_enclos_animals` (`id`, `id_enclos`, `id_animal`) VALUES
(1, 1, 4),
(2, 1, 7),
(3, 2, 5),
(4, 3, 6),
(5, 4, 22),
(6, 5, 24),
(7, 6, 23),
(8, 7, 24),
(9, 7, 2),
(10, 8, 25),
(11, 9, 26),
(12, 9, 27),
(13, 10, 1),
(14, 10, 2),
(15, 10, 3),
(16, 11, 35),
(17, 11, 47),
(18, 11, 46),
(19, 12, 36),
(20, 13, 37),
(21, 14, 38),
(22, 14, 39),
(23, 15, 40),
(24, 16, 41),
(25, 17, 42),
(26, 18, 43),
(27, 19, 44),
(28, 19, 45),
(29, 20, 8),
(30, 21, 9),
(31, 18, 43),
(32, 19, 44),
(33, 19, 45),
(34, 20, 8),
(35, 21, 9),
(36, 22, 10),
(37, 23, 11),
(38, 24, 15),
(39, 24, 16),
(40, 25, 12),
(41, 26, 14),
(42, 27, 13),
(43, 28, 17),
(44, 29, 18),
(45, 30, 19),
(46, 31, 19),
(47, 32, 28),
(48, 33, 29),
(49, 35, 31),
(50, 35, 32),
(51, 35, 33),
(52, 36, 34),
(53, 0, 0),
(54, 37, 49),
(55, 0, 0),
(56, 39, 50),
(57, 39, 51),
(58, 39, 52),
(59, 40, 53),
(60, 40, 54),
(61, 41, 55),
(62, 41, 2),
(63, 42, 56),
(64, 43, 57),
(65, 43, 58),
(66, 43, 59),
(67, 44, 60),
(68, 44, 61),
(69, 45, 62),
(70, 46, 63),
(71, 47, 64),
(72, 48, 65),
(73, 49, 66),
(74, 50, 67),
(75, 51, 68),
(76, 51, 69);

-- --------------------------------------------------------

--
-- Structure de la table `services`
--

DROP TABLE IF EXISTS `services`;
CREATE TABLE IF NOT EXISTS `services` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_biome` int NOT NULL,
  `name` text,
  `type` enum('wc','water','shop','station','lodge','tent','paillote','nomad_cofee','little_cofee','play_area','picnic_area','view') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mail` text NOT NULL,
  `nickname` text NOT NULL,
  `password` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
