-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 17 mai 2023 à 01:57
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `departements`
--

CREATE TABLE `departements` (
  `id` bigint(20) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `departements`
--

INSERT INTO `departements` (`id`, `description`, `image`, `nom`) VALUES
(1, 'Département Informatique', '', 'Département Informatique'),
(2, 'Département Electronique description', '', 'Département Electronique');

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
  `niveau` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `etudiants`
--

INSERT INTO `etudiants` (`id`, `cne`, `email`, `etat`, `filiere`, `niveau`, `nom`, `password`, `prenom`) VALUES
(1, 'k142037530', 'yassirmerfouk1@gmail.com', b'0', 'Génie Informatique', '4eme année', 'Merfouk', '123456', 'Yassir'),
(2, 'k142037500', 'aminedouaoui1@gmail.com', b'1', 'Génie Informatique', '4eme année', 'Douaoui', '123456', 'Amine'),
(3, 'k142037599', 'yassirmerfouk2@gmail.com', b'1', 'Génie Electronique', '4eme année', 'Merfouk2', 'k142037599', 'Yassir2');

-- --------------------------------------------------------

--
-- Structure de la table `etudiant_seance`
--

CREATE TABLE `etudiant_seance` (
  `idEtudiant` bigint(20) NOT NULL,
  `idSeance` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `inscription_cour`
--

CREATE TABLE `inscription_cour` (
  `id` bigint(20) NOT NULL,
  `etat` bit(1) NOT NULL,
  `idCour` bigint(20) DEFAULT NULL,
  `idEtudiant` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `matieres`
--

INSERT INTO `matieres` (`id`, `description`, `image`, `nom`, `idDepartement`) VALUES
(1, 'Apparu avec Internet, le développement web fait référence au processus d\'écriture d\'un site ou d\'une page web dans un langage technique. Il s\'agit d\'une étape incontournable pour qu\'un contenu soit mis en ligne et atteigne ses lecteurs.', '491099.jpeg', 'Développement web', 1),
(2, 'Le Développeur Mobile effectue la réalisation technique et le développement informatique d\'applications pour mobiles, smartphones et autres tablettes. Il a pour responsabilité de tenir compte des spécificités de l\'affichage des applications sur les différents outils.', '2379901.png', 'Développement mobile', 1);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `cours`
--
ALTER TABLE `cours`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `departements`
--
ALTER TABLE `departements`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `etudiants`
--
ALTER TABLE `etudiants`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `inscription_cour`
--
ALTER TABLE `inscription_cour`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `matieres`
--
ALTER TABLE `matieres`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `seance`
--
ALTER TABLE `seance`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
