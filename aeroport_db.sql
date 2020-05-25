-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : sam. 23 mai 2020 à 18:08
-- Version du serveur :  5.7.24
-- Version de PHP : 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `aeroport_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `aeroport`
--

CREATE TABLE `aeroport` (
  `Id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `pays` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `aeroport`
--

INSERT INTO `aeroport` (`Id`, `nom`, `pays`) VALUES
(1, 'Charles de Gaulle', 'France'),
(2, 'Dubai', 'Dubai'),
(3, 'Porto', 'Portugal');

-- --------------------------------------------------------

--
-- Structure de la table `avion`
--

CREATE TABLE `avion` (
  `Id` int(11) NOT NULL,
  `modele` varchar(100) NOT NULL,
  `nombre_de_places` int(11) NOT NULL,
  `Id_compagnies` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `avion`
--

INSERT INTO `avion` (`Id`, `modele`, `nombre_de_places`, `Id_compagnies`) VALUES
(1, 'A380', 500, 1),
(2, 'A737', 120, 2);

-- --------------------------------------------------------

--
-- Structure de la table `bagage_soute`
--

CREATE TABLE `bagage_soute` (
  `Id` int(11) NOT NULL,
  `Id_utilisateur` int(11) NOT NULL,
  `Id_vol` int(11) NOT NULL,
  `nombre_bagage` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `bagage_soute`
--

INSERT INTO `bagage_soute` (`Id`, `Id_utilisateur`, `Id_vol`, `nombre_bagage`) VALUES
(1, 1, 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `billet`
--

CREATE TABLE `billet` (
  `Id` int(11) NOT NULL,
  `Id_reservation_vol` int(11) NOT NULL,
  `numero_billet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `billet`
--

INSERT INTO `billet` (`Id`, `Id_reservation_vol`, `numero_billet`) VALUES
(1, 2, 123);

-- --------------------------------------------------------

--
-- Structure de la table `carte_payement`
--

CREATE TABLE `carte_payement` (
  `Id` int(11) NOT NULL,
  `Id_utilisateur` int(11) NOT NULL,
  `montant` int(11) NOT NULL,
  `numero_carte` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `carte_payement`
--

INSERT INTO `carte_payement` (`Id`, `Id_utilisateur`, `montant`, `numero_carte`) VALUES
(1, 1, 9960, 21),
(2, 1, 1, 99);

-- --------------------------------------------------------

--
-- Structure de la table `compagnies`
--

CREATE TABLE `compagnies` (
  `Id` int(11) NOT NULL,
  `nom_compagnies` varchar(100) NOT NULL,
  `image` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `compagnies`
--

INSERT INTO `compagnies` (`Id`, `nom_compagnies`, `image`) VALUES
(1, 'Air france', 'images/airFrance.png'),
(2, 'Emirates', 'images/emirates.png'),
(3, 'Jet airways', '');

-- --------------------------------------------------------

--
-- Structure de la table `embarquement`
--

CREATE TABLE `embarquement` (
  `Id` int(11) NOT NULL,
  `Id_billet` int(11) NOT NULL,
  `numero_place` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `paiement`
--

CREATE TABLE `paiement` (
  `Id_paiement` int(11) NOT NULL,
  `id_vol` int(11) NOT NULL,
  `Id_utilisateur` int(11) NOT NULL,
  `Id_bagage_soute` int(11) NOT NULL,
  `paiement_effectuer` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `reservation_vol`
--

CREATE TABLE `reservation_vol` (
  `Id` int(11) NOT NULL,
  `Id_utlisateur` int(11) NOT NULL,
  `Id_vol` int(11) NOT NULL,
  `Id_bagage_soute` int(11) NOT NULL,
  `numero_reservation` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `reservation_vol`
--

INSERT INTO `reservation_vol` (`Id`, `Id_utlisateur`, `Id_vol`, `Id_bagage_soute`, `numero_reservation`) VALUES
(2, 1, 1, 1, '123');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id_client` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `sexe` varchar(100) NOT NULL,
  `date_de_naissance` date NOT NULL,
  `adresse_mail` varchar(100) NOT NULL,
  `adresse` varchar(100) NOT NULL,
  `ville` varchar(50) NOT NULL,
  `code_postal` int(6) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id_client`, `nom`, `prenom`, `sexe`, `date_de_naissance`, `adresse_mail`, `adresse`, `ville`, `code_postal`, `telephone`, `password`) VALUES
(1, 'Youssif', 'Jessy', 'M', '2000-05-21', 'Jessy@gmail.com', 'Lycée de La Tourelle', 'Sarcelles', 95200, '0665477707', '123456');

-- --------------------------------------------------------

--
-- Structure de la table `vol`
--

CREATE TABLE `vol` (
  `Id_vol` int(11) NOT NULL,
  `Id_avion` int(11) NOT NULL,
  `date_depart` date NOT NULL,
  `date_arrivee` date NOT NULL,
  `heure_depart` time NOT NULL,
  `heure_arrivee` time NOT NULL,
  `Id_depart` varchar(100) NOT NULL,
  `Id_arrivee` varchar(100) NOT NULL,
  `duree_vol` time NOT NULL,
  `numero_vol` varchar(5) NOT NULL,
  `prix` int(11) NOT NULL,
  `prix_bagage` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `vol`
--

INSERT INTO `vol` (`Id_vol`, `Id_avion`, `date_depart`, `date_arrivee`, `heure_depart`, `heure_arrivee`, `Id_depart`, `Id_arrivee`, `duree_vol`, `numero_vol`, `prix`, `prix_bagage`) VALUES
(1, 1, '2020-03-14', '2020-03-20', '10:00:00', '15:00:00', 'Charles de Gaulle', 'Dubai', '04:00:00', 'ek098', 450, ''),
(2, 2, '2020-04-01', '2020-03-01', '09:00:00', '11:00:00', 'Charles de Gaulle', 'Porto', '02:00:00', 'AF413', 300, ''),
(3, 2, '2020-05-01', '2020-04-01', '17:22:00', '10:00:00', 'Charles de Gaulle', 'Dubai', '04:00:00', 'ek076', 400, ''),
(5, 2, '2020-05-02', '2020-05-02', '11:00:00', '16:00:00', 'Dubai', 'Charles de Gaulle', '10:00:00', 'AF232', 230, ''),
(6, 1, '2020-04-21', '2020-03-22', '05:30:00', '13:00:00', 'Dubai', 'Charles de Gaulle', '06:00:00', 'EK056', 700, ''),
(7, 2, '2020-05-01', '2020-05-01', '09:00:00', '16:00:00', 'Charles de Gaulle', 'Dubai', '10:00:00', 'EK065', 230, '11');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `aeroport`
--
ALTER TABLE `aeroport`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `nom` (`nom`);

--
-- Index pour la table `avion`
--
ALTER TABLE `avion`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_compagnies` (`Id_compagnies`);

--
-- Index pour la table `bagage_soute`
--
ALTER TABLE `bagage_soute`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_utilisateur` (`Id_utilisateur`),
  ADD KEY `Id_vol` (`Id_vol`);

--
-- Index pour la table `billet`
--
ALTER TABLE `billet`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_reservation_vol` (`Id_reservation_vol`);

--
-- Index pour la table `carte_payement`
--
ALTER TABLE `carte_payement`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_utilisateur` (`Id_utilisateur`);

--
-- Index pour la table `compagnies`
--
ALTER TABLE `compagnies`
  ADD PRIMARY KEY (`Id`);

--
-- Index pour la table `embarquement`
--
ALTER TABLE `embarquement`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_reservation_vol` (`Id_billet`);

--
-- Index pour la table `paiement`
--
ALTER TABLE `paiement`
  ADD PRIMARY KEY (`Id_paiement`),
  ADD KEY `id_vol` (`id_vol`,`Id_utilisateur`),
  ADD KEY `Id_utilisateur` (`Id_utilisateur`),
  ADD KEY `Id_bagage_soute` (`Id_bagage_soute`);

--
-- Index pour la table `reservation_vol`
--
ALTER TABLE `reservation_vol`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_utlisateur` (`Id_utlisateur`,`Id_vol`),
  ADD KEY `Id_vol` (`Id_vol`),
  ADD KEY `Id_bagage_soute` (`Id_bagage_soute`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id_client`);

--
-- Index pour la table `vol`
--
ALTER TABLE `vol`
  ADD PRIMARY KEY (`Id_vol`),
  ADD KEY `Id_depart` (`Id_depart`),
  ADD KEY `Id_arrivee` (`Id_arrivee`),
  ADD KEY `Id_avion` (`Id_avion`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `aeroport`
--
ALTER TABLE `aeroport`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `avion`
--
ALTER TABLE `avion`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `bagage_soute`
--
ALTER TABLE `bagage_soute`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `billet`
--
ALTER TABLE `billet`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `carte_payement`
--
ALTER TABLE `carte_payement`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `compagnies`
--
ALTER TABLE `compagnies`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `embarquement`
--
ALTER TABLE `embarquement`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `paiement`
--
ALTER TABLE `paiement`
  MODIFY `Id_paiement` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `reservation_vol`
--
ALTER TABLE `reservation_vol`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `vol`
--
ALTER TABLE `vol`
  MODIFY `Id_vol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `avion`
--
ALTER TABLE `avion`
  ADD CONSTRAINT `avion_ibfk_1` FOREIGN KEY (`Id_compagnies`) REFERENCES `compagnies` (`Id`);

--
-- Contraintes pour la table `bagage_soute`
--
ALTER TABLE `bagage_soute`
  ADD CONSTRAINT `bagage_soute_ibfk_1` FOREIGN KEY (`Id_utilisateur`) REFERENCES `utilisateur` (`id_client`),
  ADD CONSTRAINT `bagage_soute_ibfk_2` FOREIGN KEY (`Id_vol`) REFERENCES `vol` (`Id_vol`);

--
-- Contraintes pour la table `billet`
--
ALTER TABLE `billet`
  ADD CONSTRAINT `billet_ibfk_1` FOREIGN KEY (`Id_reservation_vol`) REFERENCES `reservation_vol` (`Id`);

--
-- Contraintes pour la table `carte_payement`
--
ALTER TABLE `carte_payement`
  ADD CONSTRAINT `carte_payement_ibfk_1` FOREIGN KEY (`Id_utilisateur`) REFERENCES `utilisateur` (`id_client`);

--
-- Contraintes pour la table `embarquement`
--
ALTER TABLE `embarquement`
  ADD CONSTRAINT `embarquement_ibfk_1` FOREIGN KEY (`Id_billet`) REFERENCES `billet` (`Id`);

--
-- Contraintes pour la table `paiement`
--
ALTER TABLE `paiement`
  ADD CONSTRAINT `paiement_ibfk_1` FOREIGN KEY (`id_vol`) REFERENCES `vol` (`Id_vol`),
  ADD CONSTRAINT `paiement_ibfk_2` FOREIGN KEY (`Id_utilisateur`) REFERENCES `utilisateur` (`id_client`),
  ADD CONSTRAINT `paiement_ibfk_3` FOREIGN KEY (`Id_bagage_soute`) REFERENCES `bagage_soute` (`Id`);

--
-- Contraintes pour la table `reservation_vol`
--
ALTER TABLE `reservation_vol`
  ADD CONSTRAINT `reservation_vol_ibfk_1` FOREIGN KEY (`Id_utlisateur`) REFERENCES `utilisateur` (`id_client`),
  ADD CONSTRAINT `reservation_vol_ibfk_2` FOREIGN KEY (`Id_vol`) REFERENCES `vol` (`Id_vol`),
  ADD CONSTRAINT `reservation_vol_ibfk_3` FOREIGN KEY (`Id_bagage_soute`) REFERENCES `bagage_soute` (`Id`);

--
-- Contraintes pour la table `vol`
--
ALTER TABLE `vol`
  ADD CONSTRAINT `vol_ibfk_1` FOREIGN KEY (`Id_depart`) REFERENCES `aeroport` (`nom`),
  ADD CONSTRAINT `vol_ibfk_2` FOREIGN KEY (`Id_arrivee`) REFERENCES `aeroport` (`nom`),
  ADD CONSTRAINT `vol_ibfk_3` FOREIGN KEY (`Id_avion`) REFERENCES `avion` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
