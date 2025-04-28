-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 28 avr. 2025 à 08:22
-- Version du serveur : 9.1.0
-- Version de PHP : 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `parcinfoapi`
--

-- --------------------------------------------------------

--
-- Structure de la table `appareils`
--

DROP TABLE IF EXISTS `appareils`;
CREATE TABLE IF NOT EXISTS `appareils` (
  `id_appareil` bigint NOT NULL AUTO_INCREMENT,
  `libelle` varchar(30) NOT NULL,
  PRIMARY KEY (`id_appareil`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `appareils`
--

INSERT INTO `appareils` (`id_appareil`, `libelle`) VALUES
(2, '');

-- --------------------------------------------------------

--
-- Structure de la table `ordinateurs`
--

DROP TABLE IF EXISTS `ordinateurs`;
CREATE TABLE IF NOT EXISTS `ordinateurs` (
  `id_appareil` bigint NOT NULL,
  `de_bureau` bit(1) NOT NULL,
  PRIMARY KEY (`id_appareil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `peripheriques`
--

DROP TABLE IF EXISTS `peripheriques`;
CREATE TABLE IF NOT EXISTS `peripheriques` (
  `id_appareil` bigint NOT NULL,
  `type` tinyint NOT NULL,
  PRIMARY KEY (`id_appareil`)
) ;

--
-- Déchargement des données de la table `peripheriques`
--

INSERT INTO `peripheriques` (`id_appareil`, `type`) VALUES
(2, 15);

-- --------------------------------------------------------

--
-- Structure de la table `personnes`
--

DROP TABLE IF EXISTS `personnes`;
CREATE TABLE IF NOT EXISTS `personnes` (
  `id_personne` bigint NOT NULL AUTO_INCREMENT,
  `adresse` varchar(50) NOT NULL,
  `date_naissance` date NOT NULL,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(25) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  PRIMARY KEY (`id_personne`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personnes_appareils`
--

DROP TABLE IF EXISTS `personnes_appareils`;
CREATE TABLE IF NOT EXISTS `personnes_appareils` (
  `proprietaires_id_personne` bigint NOT NULL,
  `appareils_id_appareil` bigint NOT NULL,
  KEY `FK57xevcbmietjb8f99rh2idnlq` (`appareils_id_appareil`),
  KEY `FKg6pd9enlhoxb1mshonybocacx` (`proprietaires_id_personne`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `ordinateurs`
--
ALTER TABLE `ordinateurs`
  ADD CONSTRAINT `FKe30bhkjl1un1x55e6k1ai701f` FOREIGN KEY (`id_appareil`) REFERENCES `appareils` (`id_appareil`);

--
-- Contraintes pour la table `peripheriques`
--
ALTER TABLE `peripheriques`
  ADD CONSTRAINT `FK2xcxhx1q3p639p8s1be3gje05` FOREIGN KEY (`id_appareil`) REFERENCES `appareils` (`id_appareil`);

--
-- Contraintes pour la table `personnes_appareils`
--
ALTER TABLE `personnes_appareils`
  ADD CONSTRAINT `FK57xevcbmietjb8f99rh2idnlq` FOREIGN KEY (`appareils_id_appareil`) REFERENCES `appareils` (`id_appareil`),
  ADD CONSTRAINT `FKg6pd9enlhoxb1mshonybocacx` FOREIGN KEY (`proprietaires_id_personne`) REFERENCES `personnes` (`id_personne`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
