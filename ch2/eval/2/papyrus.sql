-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : ven. 01 sep. 2023 à 09:30
-- Version du serveur : 10.6.12-MariaDB-0ubuntu0.22.04.1
-- Version de PHP : 8.1.2-1ubuntu2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `papyrus`
--

-- --------------------------------------------------------

--
-- Structure de la table `entcom`
--

CREATE TABLE `entcom` (
  `numcom` int(11) NOT NULL,
  `obscom` varchar(50) DEFAULT NULL,
  `datcom` date NOT NULL,
  `numfou` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `entcom`
--

INSERT INTO `entcom` (`numcom`, `obscom`, `datcom`, `numfou`) VALUES
(70010, '', '2010-02-07', '00120'),
(70011, 'Commande urgente', '2001-03-07', '00540'),
(70020, '', '2025-04-07', '09180'),
(70025, 'Commande urgente', '2030-04-07', '09150'),
(70210, 'Commande cadencée', '2005-05-07', '00120'),
(70250, 'Commande cadencée', '2002-10-07', '08700'),
(70300, '', '2006-06-07', '09120'),
(70620, '', '2002-10-07', '00540'),
(70625, '', '2009-10-07', '00120'),
(70629, '', '2012-10-07', '09180');

-- --------------------------------------------------------

--
-- Structure de la table `fournis`
--

CREATE TABLE `fournis` (
  `numfou` varchar(25) NOT NULL,
  `nomfou` varchar(25) NOT NULL,
  `ruefou` varchar(50) NOT NULL,
  `posfou` char(5) NOT NULL,
  `confou` varchar(15) NOT NULL,
  `satisf` tinyint(4) DEFAULT NULL,
  `vilfou` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `fournis`
--

INSERT INTO `fournis` (`numfou`, `nomfou`, `ruefou`, `posfou`, `confou`, `satisf`, `vilfou`) VALUES
('00120', 'GROBRIGAN', '20 rue du papier', '92200', 'Georges ', 8, 'papercity'),
('00540', 'ECLIPSE', '53, rue laisse flotter les rubans', '78250', 'Nestor', 7, 'Bugbugville'),
('08700', 'MEDICIS', '120 rue des plantes', '75014', 'Lison', 3, 'Paris'),
('09120', 'DISCOBOL', '11 rue des sports', '85100', 'Hercule', 8, 'La Roche sur Yon'),
('09150', 'DEPANPAP', '26, avenue des locomotives', '59987', 'Pollux', 5, 'Coroncountry'),
('09180', 'HURRYTAPE', '68, boulevard des octets', '04044', 'Track', 4, 'Dumpville');

-- --------------------------------------------------------

--
-- Structure de la table `ligcom`
--

CREATE TABLE `ligcom` (
  `numlig` int(11) NOT NULL,
  `qtecde` int(11) NOT NULL,
  `priuni` varchar(50) NOT NULL,
  `qteliv` int(11) DEFAULT NULL,
  `numcom` int(11) DEFAULT NULL,
  `codart` char(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `ligcom`
--

INSERT INTO `ligcom` (`numlig`, `qtecde`, `priuni`, `qteliv`, `numcom`, `codart`) VALUES
(1, 3000, '470', 3000, 70010, 'I100'),
(2, 2000, '485', 2000, 70010, 'I105'),
(3, 1000, '680', 250, 70010, 'I108'),
(4, 2000, '40', 6000, 70010, 'D035'),
(5, 6000, '3500', 2000, 70010, 'P220'),
(6, 6000, '2000', 1000, 70010, 'P240');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `codart` char(4) NOT NULL,
  `libart` varchar(30) NOT NULL,
  `stkale` int(11) NOT NULL,
  `stkphy` int(11) NOT NULL,
  `qteann` int(11) NOT NULL,
  `unimes` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`codart`, `libart`, `stkale`, `stkphy`, `qteann`, `unimes`) VALUES
('B001', 'Bande magnétique 1200', 20, 87, 240, 'unité'),
('B002', 'Bande magnétique 6250', 20, 12, 410, 'unite'),
('D035', 'CD R slim 80 mm', 40, 42, 150, 'B010'),
('D050', 'CD R-W 80mm', 50, 4, 0, 'B010'),
('I100', 'Papier 1 ex continu', 100, 557, 3500, 'B1000'),
('I105', 'Papier 2 ex continu', 75, 5, 2300, 'B1000'),
('I108', 'Papier 3 ex continu', 200, 557, 3500, 'B500'),
('I110', 'Papier 4 ex continu', 10, 12, 63, 'B400'),
('P220', 'Pré-imprimé commande', 500, 2500, 24500, 'B500'),
('P230', 'Pré-imprimé facture', 500, 250, 12500, 'B500'),
('P240', 'Pré-imprimé bulletin paie', 500, 3000, 6250, 'B500'),
('P250', 'Pré-imprimé bon livraison', 500, 2500, 24500, 'B500'),
('P270', 'Pré-imprimé bon fabrication', 500, 2500, 24500, 'B500'),
('R080', 'ruban Epson 850', 10, 2, 120, 'unite'),
('R132', 'ruban impl 1200 lignes', 25, 200, 182, 'unite');

-- --------------------------------------------------------

--
-- Structure de la table `vente`
--

CREATE TABLE `vente` (
  `codart` char(4) NOT NULL,
  `numfou` varchar(25) NOT NULL,
  `delliv` smallint(6) NOT NULL,
  `qte1` int(11) NOT NULL,
  `prix1` decimal(9,2) NOT NULL,
  `qte2` int(11) NOT NULL,
  `prix2` decimal(9,2) NOT NULL,
  `qte3` int(11) NOT NULL,
  `prix3` decimal(9,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `vente`
--

INSERT INTO `vente` (`codart`, `numfou`, `delliv`, `qte1`, `prix1`, `qte2`, `prix2`, `qte3`, `prix3`) VALUES
('B001', '8700', 15, 0, '150.00', 50, '145.00', 100, '140.00'),
('B002', '8700', 15, 0, '210.00', 50, '200.00', 100, '185.00'),
('D035', '120', 0, 0, '40.00', 0, '0.00', 0, '0.00'),
('D035', '9120', 5, 0, '40.00', 100, '30.00', 0, '0.00'),
('I100', '120', 90, 0, '700.00', 50, '600.00', 120, '500.00'),
('I100', '540', 70, 0, '710.00', 60, '630.00', 100, '600.00'),
('I100', '9120', 60, 0, '800.00', 70, '600.00', 90, '500.00'),
('I100', '9150', 90, 0, '650.00', 90, '600.00', 200, '590.00'),
('I100', '9180', 30, 0, '720.00', 50, '670.00', 100, '490.00'),
('I105', '120', 90, 10, '705.00', 50, '630.00', 120, '500.00'),
('I105', '540', 70, 0, '810.00', 60, '645.00', 100, '600.00'),
('I105', '8700', 30, 0, '720.00', 50, '670.00', 100, '510.00'),
('I105', '9120', 60, 0, '920.00', 70, '800.00', 90, '700.00'),
('I105', '9150', 90, 0, '685.00', 90, '600.00', 200, '590.00'),
('I108', '120', 90, 5, '795.00', 30, '720.00', 100, '680.00'),
('I108', '9120', 60, 0, '920.00', 70, '820.00', 100, '780.00'),
('I110', '9120', 60, 0, '950.00', 70, '850.00', 90, '790.00'),
('I110', '9180', 90, 0, '900.00', 70, '870.00', 90, '835.00'),
('P220', '120', 15, 0, '3700.00', 100, '3500.00', 0, '0.00'),
('P220', '8700', 20, 50, '3500.00', 100, '3350.00', 0, '0.00'),
('P230', '120', 30, 0, '5200.00', 100, '5000.00', 0, '0.00'),
('P230', '8700', 60, 0, '5000.00', 50, '4900.00', 0, '0.00'),
('P240', '120', 15, 0, '2200.00', 100, '2000.00', 0, '0.00'),
('P250', '120', 30, 0, '1500.00', 100, '1400.00', 500, '1200.00'),
('P250', '9120', 30, 0, '1500.00', 100, '1400.00', 500, '1200.00'),
('R080', '9120', 10, 0, '120.00', 100, '100.00', 0, '0.00'),
('R132', '9120', 5, 0, '275.00', 0, '0.00', 0, '0.00');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `entcom`
--
ALTER TABLE `entcom`
  ADD PRIMARY KEY (`numcom`),
  ADD KEY `fourninum` (`numfou`) USING BTREE;

--
-- Index pour la table `fournis`
--
ALTER TABLE `fournis`
  ADD PRIMARY KEY (`numfou`);

--
-- Index pour la table `ligcom`
--
ALTER TABLE `ligcom`
  ADD PRIMARY KEY (`numlig`),
  ADD KEY `numcom` (`numcom`),
  ADD KEY `codart` (`codart`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`codart`);

--
-- Index pour la table `vente`
--
ALTER TABLE `vente`
  ADD PRIMARY KEY (`codart`,`numfou`),
  ADD KEY `numfou` (`numfou`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `entcom`
--
ALTER TABLE `entcom`
  MODIFY `numcom` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70630;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `entcom`
--
ALTER TABLE `entcom`
  ADD CONSTRAINT `entcom_ibfk_1` FOREIGN KEY (`numfou`) REFERENCES `fournis` (`numfou`);

--
-- Contraintes pour la table `ligcom`
--
ALTER TABLE `ligcom`
  ADD CONSTRAINT `ligcom_ibfk_1` FOREIGN KEY (`numcom`) REFERENCES `entcom` (`numcom`),
  ADD CONSTRAINT `ligcom_ibfk_2` FOREIGN KEY (`codart`) REFERENCES `produit` (`codart`);

--
-- Contraintes pour la table `vente`
--
ALTER TABLE `vente`
  ADD CONSTRAINT `vente_ibfk_1` FOREIGN KEY (`codart`) REFERENCES `produit` (`codart`),
  ADD CONSTRAINT `vente_ibfk_2` FOREIGN KEY (`numfou`) REFERENCES `fournis` (`numfou`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
