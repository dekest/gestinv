-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Ven 15 Janvier 2016 à 16:13
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `gestinv1`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `idClient` int(11) NOT NULL AUTO_INCREMENT,
  `nomClient` varchar(25) DEFAULT NULL,
  `email` varchar(35) DEFAULT NULL,
  `idSite` int(11) NOT NULL,
  PRIMARY KEY (`idClient`),
  KEY `FK_client_idSite` (`idSite`) COMMENT 'clé étrangère site idsite'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `comporte`
--

CREATE TABLE IF NOT EXISTS `comporte` (
  `idImmo` bigint(20) NOT NULL AUTO_INCREMENT,
  `idEquipement` bigint(20) NOT NULL,
  `idSite` bigint(20) NOT NULL,
  PRIMARY KEY (`idImmo`,`idEquipement`,`idSite`),
  KEY `FK_comporte_idEquipement` (`idEquipement`),
  KEY `FK_comporte_idSite` (`idSite`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `contratloc`
--

CREATE TABLE IF NOT EXISTS `contratloc` (
  `idContratloc` bigint(20) NOT NULL AUTO_INCREMENT,
  `numeroContratloc` bigint(20) DEFAULT NULL,
  `dateFinLoc` date DEFAULT NULL,
  `equipement_idequipement` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`idContratloc`),
  KEY `FK_contratloc_equipement_idequipement` (`equipement_idequipement`) COMMENT 'clé étrangère equipement idEquipement'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `equipement`
--

CREATE TABLE IF NOT EXISTS `equipement` (
  `idEquipement` bigint(20) NOT NULL AUTO_INCREMENT,
  `nomEquipement` varchar(20) DEFAULT NULL,
  `modele` varchar(30) DEFAULT NULL,
  `numserie` varchar(30) DEFAULT NULL,
  `achatloc` tinyint(1) DEFAULT NULL,
  `os` varchar(15) DEFAULT NULL,
  `adressemac` varchar(15) DEFAULT NULL,
  `dateinstallation` date DEFAULT NULL,
  `firmware` varchar(25) DEFAULT NULL,
  `service` varchar(15) DEFAULT NULL,
  `garantie_idgarantie` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`idEquipement`),
  KEY `FK_equipement_garantie_idgarantie` (`garantie_idgarantie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `etat`
--

CREATE TABLE IF NOT EXISTS `etat` (
  `idEtat` bigint(11) NOT NULL AUTO_INCREMENT,
  `nomEtat` varchar(15) DEFAULT NULL,
  `idEquipement` bigint(20) NOT NULL,
  PRIMARY KEY (`idEtat`),
  KEY `FK_etat_idEquipement` (`idEquipement`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `garantie`
--

CREATE TABLE IF NOT EXISTS `garantie` (
  `idGarantie` bigint(20) NOT NULL AUTO_INCREMENT,
  `datedebutGarantie` date DEFAULT NULL,
  `datefinGarantie` date DEFAULT NULL,
  `dureeGarantie` date DEFAULT NULL,
  `equipement_idequipement` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`idGarantie`),
  KEY `FK_garantie_equipement_idequipement` (`equipement_idequipement`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `immobilisation`
--

CREATE TABLE IF NOT EXISTS `immobilisation` (
  `idImmo` bigint(20) NOT NULL AUTO_INCREMENT,
  `numeroImmo` bigint(20) DEFAULT NULL,
  `dateImmo` date DEFAULT NULL,
  PRIMARY KEY (`idImmo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `marque`
--

CREATE TABLE IF NOT EXISTS `marque` (
  `idMarque` bigint(20) NOT NULL AUTO_INCREMENT,
  `nomMarque` varchar(20) DEFAULT NULL,
  `idEquipement` bigint(20) NOT NULL,
  PRIMARY KEY (`idMarque`),
  KEY `FK_Marque_idEquipement` (`idEquipement`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `site`
--

CREATE TABLE IF NOT EXISTS `site` (
  `idSite` bigint(20) NOT NULL AUTO_INCREMENT,
  `nomSite` varchar(15) DEFAULT NULL,
  `adresseSite` varchar(30) DEFAULT NULL,
  `numeroSite` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`idSite`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `typeequipement`
--

CREATE TABLE IF NOT EXISTS `typeequipement` (
  `idTypeequipement` bigint(20) NOT NULL AUTO_INCREMENT,
  `nomTypeequipement` varchar(25) DEFAULT NULL,
  `idEquipement` bigint(20) NOT NULL,
  PRIMARY KEY (`idTypeequipement`),
  KEY `FK_typeequipement_idEquipement` (`idEquipement`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `comporte`
--
ALTER TABLE `comporte`
  ADD CONSTRAINT `FK_comporte_idSite` FOREIGN KEY (`idSite`) REFERENCES `site` (`idSite`),
  ADD CONSTRAINT `FK_comporte_idEquipement` FOREIGN KEY (`idEquipement`) REFERENCES `equipement` (`idEquipement`),
  ADD CONSTRAINT `FK_comporte_idImmo` FOREIGN KEY (`idImmo`) REFERENCES `immobilisation` (`idImmo`);

--
-- Contraintes pour la table `etat`
--
ALTER TABLE `etat`
  ADD CONSTRAINT `FK_etat_idEquipement` FOREIGN KEY (`idEquipement`) REFERENCES `equipement` (`idEquipement`);

--
-- Contraintes pour la table `garantie`
--
ALTER TABLE `garantie`
  ADD CONSTRAINT `FK_garantie_equipement_idequipement` FOREIGN KEY (`equipement_idequipement`) REFERENCES `equipement` (`idEquipement`);

--
-- Contraintes pour la table `marque`
--
ALTER TABLE `marque`
  ADD CONSTRAINT `FK_Marque_idEquipement` FOREIGN KEY (`idEquipement`) REFERENCES `equipement` (`idEquipement`);

--
-- Contraintes pour la table `typeequipement`
--
ALTER TABLE `typeequipement`
  ADD CONSTRAINT `FK_typeequipement_idEquipement` FOREIGN KEY (`idEquipement`) REFERENCES `equipement` (`idEquipement`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
