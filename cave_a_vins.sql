-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 20 jan. 2022 à 17:15
-- Version du serveur :  10.4.18-MariaDB
-- Version de PHP : 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `cave_a_vins`
--
DROP DATABASE IF EXISTS `cave_a_vins`;
CREATE DATABASE IF NOT EXISTS `cave_a_vins` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `cave_a_vins`;

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20220117134644', '2022-01-17 14:49:33', 45),
('DoctrineMigrations\\Version20220117152653', '2022-01-17 16:27:03', 182),
('DoctrineMigrations\\Version20220117153850', '2022-01-17 16:41:39', 88),
('DoctrineMigrations\\Version20220119103018', '2022-01-19 11:31:54', 190);

-- --------------------------------------------------------

--
-- Structure de la table `region`
--

CREATE TABLE `region` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `region`
--

INSERT INTO `region` (`id`, `nom`) VALUES
(1, 'Bordeaux'),
(2, 'Anjou'),
(3, 'Bourgogne');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`) VALUES
(1, 'admin@dwwm.fr', '[\"ROLE_ADMIN\"]', '$2y$13$5UT4UpgEVJGLGGw1b28z3u.MgiCw.sMNp.FK2o1IV4it8W/ZnBGDK'),
(2, 'client01@gmail.com', '[\"ROLE_CLIENT\"]', '$2y$13$yunvhL78SEAwWjtVBr0KSOGBU2/L9onEgwq2T1k7OjD7KCaYsF0wi'),
(3, 'client02@gmail.com', '[\"ROLE_CLIENT\"]', '$2y$13$/HZbSagwX.P3FVD3yOyPfexeQW1Vdsj3IWf4o23FJVhmkPajx7Yxi');

-- --------------------------------------------------------

--
-- Structure de la table `vin`
--

CREATE TABLE `vin` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `millesime` int(11) NOT NULL,
  `robe` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qtt_stock` int(11) NOT NULL,
  `contenance` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarques` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vin`
--

INSERT INTO `vin` (`id`, `nom`, `millesime`, `robe`, `qtt_stock`, `contenance`, `remarques`, `region_id`) VALUES
(1, 'Bonnezeau', 2015, 'blanc', 5, '75cl', NULL, 2),
(2, 'Chateau Dwwm', 2020, 'rouge', 2, '75cl', 'Vin de garde', 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- Index pour la table `vin`
--
ALTER TABLE `vin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B108514198260155` (`region_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `region`
--
ALTER TABLE `region`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `vin`
--
ALTER TABLE `vin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `vin`
--
ALTER TABLE `vin`
  ADD CONSTRAINT `FK_B108514198260155` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
