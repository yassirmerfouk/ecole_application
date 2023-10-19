-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 18 juil. 2023 à 15:11
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `j2ee_application_ecole`
--

-- --------------------------------------------------------

--
-- Structure de la table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `admins`
--

INSERT INTO `admins` (`id`, `email`, `password`, `username`) VALUES
(1, 'admin1@gmail.com', '123456', 'admin');

-- --------------------------------------------------------

--
-- Structure de la table `cours`
--

CREATE TABLE `cours` (
  `id` bigint(20) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `idMatiere` bigint(20) DEFAULT NULL,
  `idEtudiant` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `cours`
--

INSERT INTO `cours` (`id`, `description`, `image`, `nom`, `idMatiere`, `idEtudiant`) VALUES
(2, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur..', '8063433.jpeg', 'HTML en partant de zéro', 1, 1),
(3, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur...', '1891691.jpeg', 'Développeur PHP, HTML et CSS', 1, 1),
(4, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur...', '9290595.jpeg', 'Créez votre site WordPress', 1, 1),
(5, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur...', '8279538.jpeg', 'Flutter & Dart -The Complete', 2, 3),
(6, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur...', '8506535.jpeg', 'Complete React Native in 2023', 2, 3),
(7, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur...', '7124249.jpeg', 'Android App with Kotlin', 2, 3),
(10, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur...', '145213.jpeg', 'Maîtriser Spring Boot', 1, 1),
(11, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur...', '4766329.jpeg', 'Apprenez et maitrisez Hibernate', 1, 1),
(12, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur...', '576450.jpeg', 'Formation Oracle \"DBA 1\"', 4, 3),
(13, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur...', '2450732.jpeg', 'Beginner to Advanced PL/SQL', 4, 3);

-- --------------------------------------------------------

--
-- Structure de la table `departements`
--

CREATE TABLE `departements` (
  `id` bigint(20) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `departements`
--

INSERT INTO `departements` (`id`, `description`, `image`, `nom`) VALUES
(1, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur...', '5402940.webp', 'Département Informatique'),
(2, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur...', '3447187.avif', 'Département Electronique'),
(3, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur...', '7613181.jpeg', 'Département Management'),
(14, '', '2648396.png', 'infoElec');

-- --------------------------------------------------------

--
-- Structure de la table `documents`
--

CREATE TABLE `documents` (
  `id` bigint(20) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `courId` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `documents`
--

INSERT INTO `documents` (`id`, `nom`, `courId`) VALUES
(1, 'Conteneurs + widgets de base android.pdf', 2),
(5, 'CTL_BIG_DATA_22.pdf', 2),
(6, 'Examen Final 2CI ISI Java EE 21-22.pdf', 2),
(7, 'Conteneurs + widgets de base android.pdf', 12),
(8, 'Conteneurs + widgets de base android.pdf', 5),
(9, 'Programmation Réseau Outzourhit chp 1 et 2.pdf', 5);

-- --------------------------------------------------------

--
-- Structure de la table `etudiants`
--

CREATE TABLE `etudiants` (
  `id` bigint(20) NOT NULL,
  `cne` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `etat` bit(1) NOT NULL,
  `filiere` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `niveau` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `etudiants`
--

INSERT INTO `etudiants` (`id`, `cne`, `email`, `etat`, `filiere`, `image`, `niveau`, `nom`, `password`, `prenom`, `telephone`) VALUES
(1, 'k142037530', 'yassirmerfouk1@gmail.com', b'1', 'Génie Informatique', NULL, '4eme année', 'Merfouk', '123456', 'Yassir', '0615950195'),
(2, 'k142037500', 'yassirmerfouk2@gmail.com', b'1', 'Génie Informatique', NULL, '4eme année', 'Merfouk', '123456', 'Yassir', '0615950195'),
(3, 'k142037599', 'aminedouaoui1@gmail.com', b'1', 'Génie Informatique', NULL, '4eme année', 'Douaoui', '123456', 'Amine', '0615950195'),
(5, 'k142037111', 'aminedouaoui2@gmail.com', b'1', 'Génie Informatique', NULL, '4eme année', 'Douaoui', '123456', 'Amine', NULL),
(6, 'k142037666', 'yassirmerfouk3@gmail.com', b'1', 'Génie Electronique', NULL, '3eme année', 'Merfouk', '123456', 'Yassir', NULL),
(7, 'k142037444', 'aminedouaoui3@gmail.com', b'1', 'Management', NULL, '3eme année', 'Douaoui', '123456', 'Amine', '0615950177'),
(8, 'k142035544', 'yassirmerfouk4@gmail.com', b'1', 'Génie Electronique', NULL, '4eme année', 'Merfouk', '123456', 'Yassir2', NULL),
(9, 'k142037123', 'aminedouaoui4@gmail.com', b'1', 'Génie Electronique', NULL, '4eme année', 'Douaoui', '123456', 'Amine', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `etudiant_seance`
--

CREATE TABLE `etudiant_seance` (
  `idEtudiant` bigint(20) NOT NULL,
  `idSeance` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `etudiant_seance`
--

INSERT INTO `etudiant_seance` (`idEtudiant`, `idSeance`) VALUES
(2, 1),
(2, 2),
(2, 5),
(2, 6),
(2, 9);

-- --------------------------------------------------------

--
-- Structure de la table `inscription_cour`
--

CREATE TABLE `inscription_cour` (
  `id` bigint(20) NOT NULL,
  `etat` bit(1) NOT NULL,
  `idCour` bigint(20) DEFAULT NULL,
  `idEtudiant` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `inscription_cour`
--

INSERT INTO `inscription_cour` (`id`, `etat`, `idCour`, `idEtudiant`) VALUES
(14, b'1', 2, 3),
(15, b'1', 3, 2),
(20, b'0', 5, 2),
(21, b'1', 5, 7),
(23, b'1', 10, 2),
(24, b'1', 2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `matieres`
--

CREATE TABLE `matieres` (
  `id` bigint(20) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `idDepartement` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `matieres`
--

INSERT INTO `matieres` (`id`, `description`, `image`, `nom`, `idDepartement`) VALUES
(1, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur...', '7562250.jpeg', 'Développement web', 1),
(2, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur...', '5584042.png', 'Développement mobile', 1),
(3, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur...', '515555.png', 'Machine learning ', 1),
(4, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur...', '67540.jpeg', 'Database management système', 1),
(5, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur...', '3161192.jpeg', 'Réseau informatique', 1),
(11, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur...', '', 'Sécurité des reseaux informatique', 1),
(12, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur...', '', 'Cryptographie', 1),
(13, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur...', '', 'Management de qualité', 3),
(14, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur...', '', 'Management de l\'environement', 3),
(15, '', '4543530.jpeg', 'matier1', 14);

-- --------------------------------------------------------

--
-- Structure de la table `seance`
--

CREATE TABLE `seance` (
  `id` bigint(20) NOT NULL,
  `Titre` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `etat` bit(1) NOT NULL,
  `temps` varchar(255) DEFAULT NULL,
  `type` bit(1) NOT NULL,
  `idCour` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `seance`
--

INSERT INTO `seance` (`id`, `Titre`, `date`, `description`, `etat`, `temps`, `type`, `idCour`) VALUES
(1, 'Seance 01 cour', '2023-05-28', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', b'0', '20:00', b'0', 2),
(2, 'Seance 02 cour', '2023-05-30', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur', b'0', '12:30', b'1', 2),
(4, 'Seance 03 cour', '2023-06-01', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', b'0', '16:00', b'0', 3),
(5, 'Seance 01 cour', '2023-06-18', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', b'0', '11:30', b'0', 6),
(6, 'Seance 04 cour', '2023-06-20', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur..', b'0', '16:30', b'0', 2),
(7, 'Seance 01 cour spring', '2023-06-21', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur...', b'0', '10:00', b'0', 10),
(8, 'Seance 01 cour PLSQL', '2023-06-22', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur...', b'1', '15:00', b'0', 13),
(9, 'Seance 01 cour DBA1', '2023-06-21', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur....', b'0', '18:00', b'1', 12),
(10, 'Seance 01 cour flutter', '2023-06-24', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur....', b'1', '14:42', b'0', 5);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_47bvqemyk6vlm0w7crc3opdd4` (`email`),
  ADD UNIQUE KEY `UK_mi8vkhus4xbdbqcac2jm4spvd` (`username`);

--
-- Index pour la table `cours`
--
ALTER TABLE `cours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKmol23gprevfuwtho4fnl1psqc` (`idMatiere`),
  ADD KEY `FKk3bpql2uws52r8ybkqmhht60y` (`idEtudiant`);

--
-- Index pour la table `departements`
--
ALTER TABLE `departements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_o7gxpwc0wow8fsm1u9ox55f01` (`nom`);

--
-- Index pour la table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKlqcqqvy5okphrpjwqjkjicit` (`courId`);

--
-- Index pour la table `etudiants`
--
ALTER TABLE `etudiants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_g1bnulsgsk9d8laepcu8ekduy` (`cne`),
  ADD UNIQUE KEY `UK_28gbsstpf8tpc298hhmpffi99` (`email`);

--
-- Index pour la table `etudiant_seance`
--
ALTER TABLE `etudiant_seance`
  ADD KEY `FK2vglsaribgwwdlwb5mtj49kpg` (`idSeance`),
  ADD KEY `FKmqhb63wqxyivbj5lbbvy2ui37` (`idEtudiant`);

--
-- Index pour la table `inscription_cour`
--
ALTER TABLE `inscription_cour`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKc555992m12ik8vsgq6keyatjk` (`idCour`),
  ADD KEY `FK2wjk527sdlq43udgb6aiw4jbc` (`idEtudiant`);

--
-- Index pour la table `matieres`
--
ALTER TABLE `matieres`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_rvraaeu7dcn7rgoroif7xiwgr` (`nom`),
  ADD KEY `FKgern4urpiv2sxlxdnwj6w9rv7` (`idDepartement`);

--
-- Index pour la table `seance`
--
ALTER TABLE `seance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKpbje4qf76k58fr7f6ji75es6f` (`idCour`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `cours`
--
ALTER TABLE `cours`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `departements`
--
ALTER TABLE `departements`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `etudiants`
--
ALTER TABLE `etudiants`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `inscription_cour`
--
ALTER TABLE `inscription_cour`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT pour la table `matieres`
--
ALTER TABLE `matieres`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `seance`
--
ALTER TABLE `seance`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `cours`
--
ALTER TABLE `cours`
  ADD CONSTRAINT `FKk3bpql2uws52r8ybkqmhht60y` FOREIGN KEY (`idEtudiant`) REFERENCES `etudiants` (`id`),
  ADD CONSTRAINT `FKmol23gprevfuwtho4fnl1psqc` FOREIGN KEY (`idMatiere`) REFERENCES `matieres` (`id`);

--
-- Contraintes pour la table `etudiant_seance`
--
ALTER TABLE `etudiant_seance`
  ADD CONSTRAINT `FK2vglsaribgwwdlwb5mtj49kpg` FOREIGN KEY (`idSeance`) REFERENCES `seance` (`id`),
  ADD CONSTRAINT `FKmqhb63wqxyivbj5lbbvy2ui37` FOREIGN KEY (`idEtudiant`) REFERENCES `etudiants` (`id`);

--
-- Contraintes pour la table `inscription_cour`
--
ALTER TABLE `inscription_cour`
  ADD CONSTRAINT `FK2wjk527sdlq43udgb6aiw4jbc` FOREIGN KEY (`idEtudiant`) REFERENCES `etudiants` (`id`),
  ADD CONSTRAINT `FKc555992m12ik8vsgq6keyatjk` FOREIGN KEY (`idCour`) REFERENCES `cours` (`id`);

--
-- Contraintes pour la table `matieres`
--
ALTER TABLE `matieres`
  ADD CONSTRAINT `FKgern4urpiv2sxlxdnwj6w9rv7` FOREIGN KEY (`idDepartement`) REFERENCES `departements` (`id`);

--
-- Contraintes pour la table `seance`
--
ALTER TABLE `seance`
  ADD CONSTRAINT `FKpbje4qf76k58fr7f6ji75es6f` FOREIGN KEY (`idCour`) REFERENCES `cours` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
