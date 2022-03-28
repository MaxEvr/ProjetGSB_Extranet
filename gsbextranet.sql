-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 28 mars 2022 à 15:25
-- Version du serveur :  5.7.31
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gsbextranet`
--

-- --------------------------------------------------------

--
-- Structure de la table `archivagehistoriqueconnexion`
--

DROP TABLE IF EXISTS `archivagehistoriqueconnexion`;
CREATE TABLE IF NOT EXISTS `archivagehistoriqueconnexion` (
  `idMedecin` int(11) NOT NULL,
  `dateDebutLog` datetime NOT NULL,
  `dateFinLog` datetime NOT NULL,
  PRIMARY KEY (`idMedecin`,`dateDebutLog`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `archivagehistoriqueconnexion`
--

INSERT INTO `archivagehistoriqueconnexion` (`idMedecin`, `dateDebutLog`, `dateFinLog`) VALUES
(3, '2021-10-25 00:00:00', '2021-10-26 00:00:00'),
(4, '2021-10-25 00:00:00', '2021-10-26 00:00:00'),
(5, '2021-11-10 14:16:51', '2021-11-10 14:16:51'),
(5, '2021-11-10 16:45:11', '2021-11-12 15:54:41'),
(5, '2021-11-12 15:51:42', '2021-11-12 15:54:41'),
(8, '2021-11-10 14:16:51', '2021-11-10 14:16:51'),
(8, '2021-11-10 16:45:11', '2021-11-12 15:54:41'),
(8, '2021-11-12 15:51:42', '2021-11-12 15:54:41'),
(9, '2021-11-12 16:19:56', '2021-11-12 16:19:56'),
(12, '2022-03-07 15:30:34', '2022-03-07 15:30:34'),
(13, '2022-03-07 15:46:01', '2022-03-07 15:46:01');

-- --------------------------------------------------------

--
-- Structure de la table `archivagemedecin`
--

DROP TABLE IF EXISTS `archivagemedecin`;
CREATE TABLE IF NOT EXISTS `archivagemedecin` (
  `idMedecin` int(11) NOT NULL AUTO_INCREMENT,
  `anneeNaissance` year(4) NOT NULL,
  `dateCreation` datetime NOT NULL,
  PRIMARY KEY (`idMedecin`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `archivagemedecin`
--

INSERT INTO `archivagemedecin` (`idMedecin`, `anneeNaissance`, `dateCreation`) VALUES
(3, 2000, '2021-10-10 00:00:00'),
(4, 2000, '2021-10-10 00:00:00'),
(5, 2002, '2021-11-10 14:16:51'),
(8, 2002, '2021-11-10 14:16:51'),
(9, 2002, '2021-11-12 16:19:56'),
(10, 2002, '2021-11-12 16:35:26'),
(11, 2000, '2021-11-12 16:51:39'),
(12, 2001, '2022-03-07 15:30:34'),
(13, 2002, '2022-03-07 15:46:01');

-- --------------------------------------------------------

--
-- Structure de la table `archivageproduit`
--

DROP TABLE IF EXISTS `archivageproduit`;
CREATE TABLE IF NOT EXISTS `archivageproduit` (
  `idMedecin` int(11) NOT NULL,
  `idProduit` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Heure` time NOT NULL,
  PRIMARY KEY (`idMedecin`,`idProduit`,`Date`,`Heure`),
  KEY `fk_medecinprod_idpro` (`idProduit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `archivageproduit`
--

INSERT INTO `archivageproduit` (`idMedecin`, `idProduit`, `Date`, `Heure`) VALUES
(3, 1, '2021-10-12', '16:00:00'),
(4, 1, '2021-10-12', '16:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `archivagevisio`
--

DROP TABLE IF EXISTS `archivagevisio`;
CREATE TABLE IF NOT EXISTS `archivagevisio` (
  `idMedecin` int(11) NOT NULL,
  `idVisio` int(11) NOT NULL,
  `dateInscription` datetime NOT NULL,
  PRIMARY KEY (`idMedecin`,`idVisio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `archivagevisio`
--

INSERT INTO `archivagevisio` (`idMedecin`, `idVisio`, `dateInscription`) VALUES
(3, 8, '2021-06-30 00:00:00'),
(4, 8, '2021-06-30 00:00:00'),
(5, 5, '2021-11-12 00:00:00'),
(8, 5, '2021-11-12 00:00:00'),
(9, 5, '2021-11-12 00:00:00'),
(10, 5, '2021-11-12 00:00:00'),
(11, 5, '2021-11-12 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `historiqueconnexion`
--

DROP TABLE IF EXISTS `historiqueconnexion`;
CREATE TABLE IF NOT EXISTS `historiqueconnexion` (
  `idMedecin` int(11) NOT NULL,
  `dateDebutLog` datetime NOT NULL,
  `dateFinLog` datetime DEFAULT NULL,
  PRIMARY KEY (`idMedecin`,`dateDebutLog`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `historiqueconnexion`
--

INSERT INTO `historiqueconnexion` (`idMedecin`, `dateDebutLog`, `dateFinLog`) VALUES
(1, '2021-10-04 10:28:16', '2021-10-04 11:39:24'),
(1, '2021-10-06 14:14:16', '2021-10-06 14:39:32'),
(1, '2021-10-06 14:23:12', '2021-10-06 14:39:32'),
(1, '2021-10-06 14:28:04', '2021-10-06 14:39:32'),
(1, '2021-10-06 14:28:37', '2021-10-06 14:39:32'),
(1, '2021-10-06 14:30:38', '2021-10-06 14:39:32'),
(1, '2021-10-06 14:31:14', '2021-10-06 14:39:32'),
(1, '2021-10-06 14:34:10', '2021-10-06 14:39:32'),
(1, '2021-10-06 14:37:54', '2021-10-06 14:39:32'),
(1, '2021-10-06 14:40:38', '2021-10-06 15:02:03'),
(1, '2021-10-06 14:42:58', '2021-10-06 15:02:03'),
(1, '2021-10-06 15:01:40', '2021-10-06 15:02:03'),
(1, '2021-10-08 15:30:50', '2021-10-15 15:53:34'),
(1, '2021-10-08 15:49:55', '2021-10-15 15:53:34'),
(1, '2021-10-15 15:53:31', '2021-10-15 15:53:34'),
(1, '2021-11-10 13:38:45', '2021-11-10 13:38:51'),
(1, '2021-11-10 13:38:55', '2021-11-10 13:39:35'),
(1, '2021-11-15 12:49:14', '2021-11-15 12:49:56'),
(1, '2021-11-15 12:51:12', '2021-11-15 13:25:31'),
(1, '2021-11-15 13:25:13', '2021-11-15 13:25:31'),
(1, '2021-11-19 15:50:33', '2021-11-19 15:57:46'),
(1, '2021-11-29 11:38:44', '2021-11-29 11:38:51'),
(1, '2021-11-29 11:39:19', '2021-11-29 11:39:21'),
(1, '2021-12-03 16:53:14', '2022-03-07 14:21:50'),
(1, '2022-03-07 14:06:38', '2022-03-07 14:21:50'),
(1, '2022-03-07 14:13:56', '2022-03-07 14:21:50'),
(1, '2022-03-07 14:23:11', '2022-03-07 14:23:25'),
(1, '2022-03-07 14:24:39', '2022-03-07 14:24:45'),
(1, '2022-03-07 14:26:22', '2022-03-07 14:32:53'),
(1, '2022-03-07 14:33:28', '2022-03-07 14:33:33'),
(1, '2022-03-07 14:33:42', '2022-03-07 14:40:48'),
(1, '2022-03-07 14:40:55', '2022-03-07 14:41:08'),
(1, '2022-03-07 14:43:01', '2022-03-07 14:53:50'),
(1, '2022-03-07 15:50:38', '2022-03-07 15:50:52'),
(1, '2022-03-07 16:39:53', '2022-03-07 17:26:23'),
(1, '2022-03-21 12:44:24', '2022-03-21 12:45:51'),
(1, '2022-03-25 14:13:13', '2022-03-25 14:13:15'),
(1, '2022-03-28 13:20:11', '2022-03-28 13:20:43'),
(1, '2022-03-28 14:38:16', '2022-03-28 14:38:36'),
(1, '2022-03-28 14:40:03', '2022-03-28 14:40:24'),
(7, '2021-10-04 11:34:06', '2021-10-04 11:38:14'),
(7, '2021-12-17 15:12:17', '2021-12-17 16:21:48'),
(7, '2021-12-17 16:21:53', NULL),
(7, '2021-12-17 16:42:39', NULL),
(7, '2022-03-07 14:54:52', '2022-03-07 14:54:52'),
(7, '2022-03-07 16:36:48', '2022-03-07 16:36:48'),
(7, '2022-03-25 14:11:57', '2022-03-25 14:11:57'),
(14, '2021-12-10 17:12:37', '2021-12-10 17:12:37'),
(15, '2021-12-10 17:24:22', '2021-12-10 17:24:22'),
(15, '2021-12-10 17:27:38', '2021-12-10 17:27:47'),
(16, '2021-12-10 17:31:04', '2021-12-10 17:31:04'),
(16, '2021-12-10 17:31:17', '2021-12-10 17:31:22'),
(17, '2021-12-17 15:10:34', '2021-12-17 15:10:34'),
(17, '2021-12-17 15:10:41', '2021-12-17 15:12:07'),
(26, '2022-03-07 16:37:47', '2022-03-07 16:37:47'),
(26, '2022-03-07 16:37:54', '2022-03-07 16:39:47'),
(28, '2022-03-25 14:13:39', '2022-03-25 14:13:39'),
(28, '2022-03-25 14:13:47', '2022-03-25 14:17:04'),
(28, '2022-03-25 14:26:16', '2022-03-28 14:39:44'),
(28, '2022-03-28 13:21:06', '2022-03-28 14:39:44'),
(28, '2022-03-28 14:38:48', '2022-03-28 14:39:44');

-- --------------------------------------------------------

--
-- Structure de la table `maintenance`
--

DROP TABLE IF EXISTS `maintenance`;
CREATE TABLE IF NOT EXISTS `maintenance` (
  `Etat` int(1) NOT NULL,
  PRIMARY KEY (`Etat`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `maintenance`
--

INSERT INTO `maintenance` (`Etat`) VALUES
(1);

-- --------------------------------------------------------

--
-- Structure de la table `medecin`
--

DROP TABLE IF EXISTS `medecin`;
CREATE TABLE IF NOT EXISTS `medecin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(40) DEFAULT NULL,
  `prenom` varchar(30) DEFAULT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `dateNaissance` year(4) DEFAULT NULL,
  `motDePasse` varchar(260) DEFAULT NULL,
  `dateCreation` datetime DEFAULT NULL,
  `rpps` varchar(10) DEFAULT NULL,
  `token` varchar(100) DEFAULT NULL,
  `dateDiplome` year(4) DEFAULT NULL,
  `dateConsentement` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `medecin`
--

INSERT INTO `medecin` (`id`, `nom`, `prenom`, `mail`, `dateNaissance`, `motDePasse`, `dateCreation`, `rpps`, `token`, `dateDiplome`, `dateConsentement`) VALUES
(1, 'Admin', NULL, '????-??????.?g???z?????d<?', NULL, '$2y$10$MSWWJIx/gm30hSUrDI4fd.hgA/NaftSJ0dV8QXf3W34tUC/xfniQO', NULL, NULL, NULL, NULL, NULL),
(7, 'Evraere', 'Maxime', '?z?U???M?uK??????y?????kI	6?g????;z=?', NULL, '$2y$10$0Rs.VQoqAtXgsqexglP2vORCUHgueVer2/HuMbpzr/NuZMyg175me', '2021-09-22 15:58:28', NULL, NULL, NULL, '2021-09-22'),
(14, 'Tqt', 'Tqt', 'U???~g???x?T???????{?????c@U0?m', NULL, '$2y$10$Kx60Qa7fftM0ou2P70Z46u5Ztg1K4iOF1LwEr1WXQBRkfNTVB179i', '2021-12-10 17:12:37', NULL, NULL, NULL, '2021-12-10'),
(15, 'Dup', 'Math', ';???????WR/????T?????$O>', NULL, '$2y$10$0sAR/DnoqtDHp5OjLqPRf.C438AkphbNyviV056tWtLne5h0qlqY.', '2021-12-10 17:24:22', NULL, NULL, NULL, '2021-12-10'),
(16, 'zsd', 'zsf', '?OTDA?^\'?>?????\nT?????$O>', NULL, '$2y$10$k.YTuN836JHZzi4k/jmcD.lZStAc2aJ3/EpShDm5cbQwckznAfsbK', '2021-12-10 17:31:04', NULL, NULL, NULL, '2021-12-10'),
(17, 'Evraere', 'Maxime', '?z?U???M?uK??????y?????kI	6?g????;z=?', NULL, '$2y$10$V2/uIiEPe30etDre30G1LukEbiUHMJxSlrpqssCMRN0YdLZ/O85c6', '2021-12-17 15:10:34', NULL, NULL, NULL, '2021-12-17'),
(19, 'A', 'Admin', '????-??????.?g???z?????d<?', NULL, '$2y$10$YE9eqzNBkwXpDDf4vwKxPO7EmcLGDmyt/OmwNSZKoTFJI7QVNhjYa', '2022-03-07 14:06:17', NULL, NULL, NULL, '2022-03-07'),
(20, 'Evr', 'Max', '?z?U???M?uK??????y?????kI	6?g????;z=?', NULL, '$2y$10$NUYhBJZNQJA893YqQ7AjZu0lo5US6NlXrHbyNjEKP/f3SUDPiLm9.', '2022-03-07 14:54:52', NULL, NULL, NULL, '2022-03-07'),
(26, 'jfe', 'Math', 'J??wz6??? ??_???\rT?????$O>', 2002, '$2y$10$vu.BObyyPmqaieLfF17b5uQvC4PjdJ6WgFfOUM6M3Jf67MLYQrhKe', '2022-03-07 16:37:47', NULL, NULL, NULL, '2022-03-07'),
(27, 'Evraere', 'Maxime', '?z?U???M?uK??????y?????kI	6?g????;z=?', 2022, '$2y$10$BFbOSC3JEGv9F./pQAOUM.m5bSKgkVxPbOtKRlka8uCMadnQ/Pp/G', '2022-03-25 14:11:57', NULL, NULL, NULL, '2022-03-25'),
(28, 'Evraere', 'Max', '???[?Bk?M;??#???Kq?????mA\Z:?.???', 2022, '$2y$10$MSWWJIx/gm30hSUrDI4fd.hgA/NaftSJ0dV8QXf3W34tUC/xfniQO', '2022-03-25 14:13:39', NULL, NULL, NULL, '2022-03-25');

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `medecinaeffacer`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `medecinaeffacer`;
CREATE TABLE IF NOT EXISTS `medecinaeffacer` (
`idMedecin` int(11)
,`dateDebutLog` datetime
,`dateFinLog` datetime
);

-- --------------------------------------------------------

--
-- Structure de la table `medecinproduit`
--

DROP TABLE IF EXISTS `medecinproduit`;
CREATE TABLE IF NOT EXISTS `medecinproduit` (
  `idMedecin` int(11) NOT NULL,
  `idProduit` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Heure` time NOT NULL,
  PRIMARY KEY (`idMedecin`,`idProduit`,`Date`,`Heure`),
  KEY `idProduit` (`idProduit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `medecinvisio`
--

DROP TABLE IF EXISTS `medecinvisio`;
CREATE TABLE IF NOT EXISTS `medecinvisio` (
  `idMedecin` int(11) NOT NULL,
  `idVisio` int(11) NOT NULL,
  `dateInscription` date NOT NULL,
  PRIMARY KEY (`idMedecin`,`idVisio`),
  KEY `idVisio` (`idVisio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `medecinvisio`
--

INSERT INTO `medecinvisio` (`idMedecin`, `idVisio`, `dateInscription`) VALUES
(1, 5, '2021-10-20'),
(7, 5, '2021-10-13');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(60) NOT NULL,
  `objectif` mediumtext NOT NULL,
  `information` mediumtext NOT NULL,
  `effetIndesirable` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id`, `nom`, `objectif`, `information`, `effetIndesirable`) VALUES
(1, 'Dafalgan', 'te soulager', 'Il trouve là où t\'as mal comme par magie', 'La non mort');

-- --------------------------------------------------------

--
-- Structure de la table `visioconference`
--

DROP TABLE IF EXISTS `visioconference`;
CREATE TABLE IF NOT EXISTS `visioconference` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nomVisio` varchar(100) DEFAULT NULL,
  `objectif` text,
  `url` varchar(100) DEFAULT NULL,
  `dateVisio` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `visioconference`
--

INSERT INTO `visioconference` (`id`, `nomVisio`, `objectif`, `url`, `dateVisio`) VALUES
(4, 'Dupirettes', 'Donne la mort', 'www.uhgigegejgoiudfshgi.fr', '2021-02-15'),
(5, 'Dupirette', 'Donne la mort', 'www.uhgigegejgoiudfshgi.fr', '2021-02-15'),
(7, 'Visio1', 'c\'est une visio', 'visio.com', '2022-03-01');

-- --------------------------------------------------------

--
-- Structure de la vue `medecinaeffacer`
--
DROP TABLE IF EXISTS `medecinaeffacer`;

DROP VIEW IF EXISTS `medecinaeffacer`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `medecinaeffacer`  AS  select `historiqueconnexion`.`idMedecin` AS `idMedecin`,`historiqueconnexion`.`dateDebutLog` AS `dateDebutLog`,`historiqueconnexion`.`dateFinLog` AS `dateFinLog` from `historiqueconnexion` group by `historiqueconnexion`.`idMedecin` having (timestampdiff(YEAR,max(`historiqueconnexion`.`dateDebutLog`),now()) >= 3) ;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `archivagehistoriqueconnexion`
--
ALTER TABLE `archivagehistoriqueconnexion`
  ADD CONSTRAINT `fk_medecinco_idmed` FOREIGN KEY (`idMedecin`) REFERENCES `archivagemedecin` (`idMedecin`);

--
-- Contraintes pour la table `archivageproduit`
--
ALTER TABLE `archivageproduit`
  ADD CONSTRAINT `fk_medecinprod_idmed` FOREIGN KEY (`idMedecin`) REFERENCES `archivagemedecin` (`idMedecin`);

--
-- Contraintes pour la table `archivagevisio`
--
ALTER TABLE `archivagevisio`
  ADD CONSTRAINT `fk_medecinvisio_idmed` FOREIGN KEY (`idMedecin`) REFERENCES `archivagemedecin` (`idMedecin`);

--
-- Contraintes pour la table `historiqueconnexion`
--
ALTER TABLE `historiqueconnexion`
  ADD CONSTRAINT `historiqueconnexion_ibfk_1` FOREIGN KEY (`idMedecin`) REFERENCES `medecin` (`id`);

--
-- Contraintes pour la table `medecinproduit`
--
ALTER TABLE `medecinproduit`
  ADD CONSTRAINT `medecinproduit_ibfk_1` FOREIGN KEY (`idMedecin`) REFERENCES `medecin` (`id`),
  ADD CONSTRAINT `medecinproduit_ibfk_2` FOREIGN KEY (`idProduit`) REFERENCES `produit` (`id`);

--
-- Contraintes pour la table `medecinvisio`
--
ALTER TABLE `medecinvisio`
  ADD CONSTRAINT `medecinvisio_ibfk_1` FOREIGN KEY (`idMedecin`) REFERENCES `medecin` (`id`),
  ADD CONSTRAINT `medecinvisio_ibfk_2` FOREIGN KEY (`idVisio`) REFERENCES `visioconference` (`id`);

DELIMITER $$
--
-- Évènements
--
DROP EVENT `Efface médecin inactif de 3 ans`$$
CREATE DEFINER=`gsbExtraNet`@`%` EVENT `Efface médecin inactif de 3 ans` ON SCHEDULE EVERY 1 DAY STARTS '2021-10-08 23:59:59' ON COMPLETION NOT PRESERVE ENABLE COMMENT 'Efface médecin inactif de 3 ans' DO BEGIN

DELETE FROM medecinproduit WHERE idMedecin IN(SELECT idMedecin FROM medecinaeffacer);

DELETE FROM medecinvisio WHERE idMedecin IN(SELECT idMedecin FROM medecinaeffacer);

CREATE TABLE Temporaire SELECT * FROM medecinaeffacer;

DELETE FROM historiqueconnexion WHERE idMedecin IN(SELECT idMedecin FROM medecinaeffacer);

DELETE FROM medecin WHERE id IN(SELECT idMedecin FROM temporaire);

DROP TABLE Temporaire;

END$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
