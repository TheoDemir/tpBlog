-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 25 nov. 2021 à 15:12
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bdmyblog`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `NumArt` int(11) NOT NULL AUTO_INCREMENT,
  `TitreArt` varchar(255) NOT NULL,
  `ContenuArt` text NOT NULL,
  `AuteurArt` varchar(100) NOT NULL,
  `DateCreaArt` date NOT NULL,
  PRIMARY KEY (`NumArt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Contenu de la table `article`
--

INSERT INTO `article` (`TitreArt`, `ContenuArt`, `AuteurArt`, `DateCreaArt`) VALUES
("COVID-19: CONSEIL DE DÉFENSE SANITAIRE DÉCISIF AVANT NOËL, SUIVEZ L'ACTUALITÉ MINUTE PAR MINUTE", 
"L'émergence fulgurante du variant Omicron du Covid-19 rebat les cartes sanitaires à quelques jours de Noël. Ce vendredi, l'exécutif se réunit en Conseil de défense sanitaire pour envisager de nouvelles mesures.",
"François de la Taille", "2021-12-17"),
("Affaire Jubillar : l'enquête dans l'impasse après la garde à vue levée de Séverine L., compagne de Cédric Jubillar",
"Après plus de 35 heures de garde à vue, Séverine L. est ressortie libre de la gendarmerie de Gaillac, jeudi 16 décembre, à 21 heures. Soupçonnée de « complicité de recel de cadavre », 
dans l’enquête sur le meurtre de Delphine Jubillar, elle était interrogée depuis mercredi par les enquêteurs de la section de recherches de Toulouse.
« Ma cliente est ressortie libre sans aucune charge. Elle est très fatiguée, elle va pouvoir rentrer chez elle. », a simplement déclaré Me Fabienne Bex à l’issue.",
"Frédéric Abela","2021-12-17"),
("Halo Infinite : tous les détails sur la nouvelle mise à jour, un gros bug enfin corrigé",
"Après des années et des années d’attente, Halo Infinite est désormais une réalité : heureusement, toute cette patience n’aura pas été vaine puisque 
le jeu est franchement bon, proposant un multijoueur extrêmement jouissif en free-to-play ainsi qu’une campagne efficace, elle vendue séparément. 
Le mois de décembre est ainsi marqué au fer rouge par ce bon vieux Masterchief, que l’on avait hâte de retrouver en bonne et due forme.
Pour autant, 343 Industries n’a pas livré une expérience parfaite et comme c’est souvent le cas, de petits problèmes techniques subsistent :
 avec une telle audience, leur correction est une nécessité absolue et les développeurs ont justement livré un nouveau patch il y a quelques heures.",
 "Max Cagnard", "2021-12-16"),
 ("DANA WHITE QUALIFIE UN ANALYSTE DE « C*NNARD » APRÈS LA DÉFAITE D’AMANDA NUNES",
 "Dana White commençait à rêver d’un superfight entre Amanda Nunes et Kayla Harrison, mais Julianna Pena est venue tout chambouler. Le week-end dernier, l’Américaine a créé l’une des plus
grosses surprise de l’Histoire de UFC en battant Nunes pour le titre bantamweight. Dana White a profité de cette occasion pour s’en prendre à l’analyste Darren Rovell.",
"Nicolas Zampatti", "2021-12-16");

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

DROP TABLE IF EXISTS `commentaire`;
CREATE TABLE IF NOT EXISTS `commentaire` (
  `NumComm` int(11) NOT NULL AUTO_INCREMENT,
  `ContenuComm` text NOT NULL,
  `DateCreaComm` date NOT NULL,
  `AuteurComm` varchar(100) NOT NULL,
  `NumArt` int(11) NOT NULL,
  PRIMARY KEY (`NumComm`),
  KEY `FK_commentaire_article` (`NumArt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Contenu de la table `commentaire`
--

INSERT INTO `commentaire` (`ContenuComm`, `DateCreaComm`, `AuteurComm`, `NumArt`) VALUES
("Super article", "2021-12-17", "toto","1"),
("Vraiment super article", "2021-12-18", "tata","1"),
("Super article", "2021-12-17", "toto","2"),
("Vraiment super article", "2021-12-18", "tata","2"),
("Super article", "2021-12-17", "toto","3"),
("Vraiment super article", "2021-12-18", "tata","3"),
("Super article", "2021-12-17", "toto","4"),
("Vraiment super article", "2021-12-18", "tata","4");

-- --------------------------------------------------------

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `FK_commentaire_article` FOREIGN KEY (`NumArt`) REFERENCES `article` (`NumArt`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;