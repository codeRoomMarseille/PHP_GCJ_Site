-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 06 sep. 2018 à 16:46
-- Version du serveur :  5.7.21
-- Version de PHP :  5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gcj`
--

-- --------------------------------------------------------

--
-- Structure de la table `acteur`
--

DROP TABLE IF EXISTS `acteur`;
CREATE TABLE IF NOT EXISTS `acteur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_NiveauDroit` int(11) NOT NULL,
  `Login` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `EtatConnection` varchar(255) NOT NULL,
  `Nom` varchar(255) NOT NULL,
  `Prenom` varchar(255) NOT NULL,
  `Mail` varchar(255) NOT NULL,
  `Telephone` varchar(255) NOT NULL,
  `Adresse` varchar(255) NOT NULL,
  `Inscription` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `acteur`
--

INSERT INTO `acteur` (`id`, `id_NiveauDroit`, `Login`, `Password`, `EtatConnection`, `Nom`, `Prenom`, `Mail`, `Telephone`, `Adresse`, `Inscription`) VALUES
(2, 400, 'DavidKiApprend', '2k+cr2o72-', 'Actif', 'Picou', 'David', 'david.picou@orange.com', '01010101', 'Bureau 411 Batiment D 413 Rue Félix Pyat 13003 Marseille', '2018-08-31');

-- --------------------------------------------------------

--
-- Structure de la table `attente`
--

DROP TABLE IF EXISTS `attente`;
CREATE TABLE IF NOT EXISTS `attente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_Acteur` int(11) NOT NULL,
  `id_Prestation` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `attente`
--

INSERT INTO `attente` (`id`, `id_Acteur`, `id_Prestation`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `competence`
--

DROP TABLE IF EXISTS `competence`;
CREATE TABLE IF NOT EXISTS `competence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TypeCompetence` varchar(255) NOT NULL,
  `id_Prestation` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `competence`
--

INSERT INTO `competence` (`id`, `TypeCompetence`, `id_Prestation`) VALUES
(1, 'Technique', 1),
(2, 'Pédagogique', 1);

-- --------------------------------------------------------

--
-- Structure de la table `disponibilite`
--

DROP TABLE IF EXISTS `disponibilite`;
CREATE TABLE IF NOT EXISTS `disponibilite` (
  `Disponibilite` int(11) NOT NULL AUTO_INCREMENT,
  `Genre` int(11) NOT NULL,
  `Date` date NOT NULL,
  `id_Acteur` int(11) DEFAULT NULL,
  `id_Salle` int(11) DEFAULT NULL,
  PRIMARY KEY (`Disponibilite`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `disponibilite`
--

INSERT INTO `disponibilite` (`Disponibilite`, `Genre`, `Date`, `id_Acteur`, `id_Salle`) VALUES
(1, 0, '2018-12-24', 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `droit`
--

DROP TABLE IF EXISTS `droit`;
CREATE TABLE IF NOT EXISTS `droit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Niveau` int(11) NOT NULL,
  `Nom` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `droit`
--

INSERT INTO `droit` (`id`, `Niveau`, `Nom`) VALUES
(1, 100, 'Visiteur');

-- --------------------------------------------------------

--
-- Structure de la table `membre`
--

DROP TABLE IF EXISTS `membre`;
CREATE TABLE IF NOT EXISTS `membre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` text NOT NULL,
  `pass_md5` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `prestation`
--

DROP TABLE IF EXISTS `prestation`;
CREATE TABLE IF NOT EXISTS `prestation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(255) NOT NULL,
  `Objectif` varchar(255) NOT NULL,
  `Contenu` varchar(255) NOT NULL,
  `Organisation` varchar(255) NOT NULL,
  `Prerequis` varchar(255) NOT NULL,
  `Maximum` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `prestation`
--

INSERT INTO `prestation` (`id`, `Nom`, `Objectif`, `Contenu`, `Organisation`, `Prerequis`, `Maximum`) VALUES
(1, 'HTML 5 et CSS 3', 'S\'initier et apprendre à apprendre HTML 5 et CSS 3', 'Les bases. Le principes. Ou trouver le comment faire ? Comment aller plus loin ?', 'Une journée de 6 heures', 'Savoir se servir d\'un ordinateur et être motivé pour apprendre', 10);

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

DROP TABLE IF EXISTS `salle`;
CREATE TABLE IF NOT EXISTS `salle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(255) NOT NULL,
  `Adresse` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `salle`
--

INSERT INTO `salle` (`id`, `Nom`, `Adresse`) VALUES
(1, 'CodeRoom marseille', '93 rue Félix Pyat 13003 Marseille');

-- --------------------------------------------------------

--
-- Structure de la table `session`
--

DROP TABLE IF EXISTS `session`;
CREATE TABLE IF NOT EXISTS `session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_Prestation` int(11) NOT NULL,
  `id_Salle` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Inscrits` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `session`
--

INSERT INTO `session` (`id`, `id_Prestation`, `id_Salle`, `Date`, `Inscrits`) VALUES
(1, 1, 1, '2018-08-21', 8);

-- --------------------------------------------------------

--
-- Structure de la table `x_acteur_competence`
--

DROP TABLE IF EXISTS `x_acteur_competence`;
CREATE TABLE IF NOT EXISTS `x_acteur_competence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_Acteur` int(11) NOT NULL,
  `id_Competence` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `x_acteur_droit`
--

DROP TABLE IF EXISTS `x_acteur_droit`;
CREATE TABLE IF NOT EXISTS `x_acteur_droit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_Acteur` int(11) NOT NULL,
  `id_Droit` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `x_session_acteur`
--

DROP TABLE IF EXISTS `x_session_acteur`;
CREATE TABLE IF NOT EXISTS `x_session_acteur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_Session` int(11) NOT NULL,
  `id_Acteur` int(11) NOT NULL,
  `id_Droit` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
