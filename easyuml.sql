-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  ven. 25 jan. 2019 à 13:34
-- Version du serveur :  10.1.33-MariaDB
-- Version de PHP :  7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `easyuml`
--
CREATE DATABASE IF NOT EXISTS `easyuml` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `easyuml`;

-- --------------------------------------------------------

--
-- Structure de la table `diagramme`
--

CREATE TABLE `diagramme` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `nom` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `diagramme`
--

INSERT INTO `diagramme` (`id`, `user_id`, `content`, `date`, `nom`) VALUES
(6, 1, '{\"cells\":[{\"type\":\"class.Element\",\"position\":{\"x\":541,\"y\":41},\"size\":{\"width\":170,\"height\":100},\"angle\":0,\"id\":\"ca6e26a7-895e-41de-9cd3-786a873935cb\",\"items\":\"+ UUUUU\",\"name\":\"Test\",\"fns\":\"- OOOO\",\"z\":1,\"attrs\":{}},{\"type\":\"class.Element\",\"position\":{\"x\":930,\"y\":65},\"size\":{\"width\":170,\"height\":100},\"angle\":0,\"id\":\"03b2bb37-6f1d-49b3-92be-51a63b06ddc8\",\"items\":\"\",\"name\":\"Test -1\",\"z\":2,\"attrs\":{}},{\"type\":\"custom.links.Extend\",\"router\":{\"name\":\"manhattan\"},\"connector\":{\"name\":\"rounded\"},\"source\":{\"id\":\"ca6e26a7-895e-41de-9cd3-786a873935cb\"},\"target\":{\"id\":\"03b2bb37-6f1d-49b3-92be-51a63b06ddc8\"},\"id\":\"7a68a079-d0a0-4274-96bb-c1c097ad3407\",\"z\":3,\"attrs\":{}},{\"type\":\"class.Element\",\"position\":{\"x\":541,\"y\":289},\"size\":{\"width\":170,\"height\":100},\"angle\":0,\"id\":\"e60da695-0a52-452f-9075-617341a7ae3f\",\"items\":\"\",\"name\":\"classname\",\"z\":4,\"attrs\":{}},{\"type\":\"custom.links.Agregate\",\"router\":{\"name\":\"manhattan\"},\"connector\":{\"name\":\"rounded\"},\"source\":{\"id\":\"ca6e26a7-895e-41de-9cd3-786a873935cb\"},\"target\":{\"id\":\"e60da695-0a52-452f-9075-617341a7ae3f\"},\"id\":\"eec39551-73a7-4cf7-99b5-cb68065626ab\",\"z\":5,\"attrs\":{}},{\"type\":\"class.Element\",\"position\":{\"x\":44,\"y\":408},\"size\":{\"width\":170,\"height\":100},\"angle\":0,\"id\":\"551e5f27-7672-4554-9c7b-1b57370d8361\",\"items\":\"\",\"name\":\"classname\",\"fns\":\"\",\"z\":6,\"attrs\":{}},{\"type\":\"custom.links.Agregate\",\"router\":{\"name\":\"manhattan\"},\"connector\":{\"name\":\"rounded\"},\"source\":{\"id\":\"551e5f27-7672-4554-9c7b-1b57370d8361\"},\"target\":{\"id\":\"e60da695-0a52-452f-9075-617341a7ae3f\"},\"id\":\"dfe3fe65-a4d7-4e3a-8c75-65186a2f56b0\",\"z\":7,\"attrs\":{}}]}', '2019-01-25 12:20:26', 'bobby'),
(7, 1, '{\"cells\":[{\"type\":\"class.Element\",\"position\":{\"x\":80,\"y\":80},\"size\":{\"width\":170,\"height\":100},\"angle\":0,\"name\":\"classname\",\"items\":\"\",\"fns\":\"\",\"id\":\"8c4be1e7-db29-4cd3-85c8-0440083f1a44\",\"z\":1,\"attrs\":{}}]}', '2019-01-25 01:38:40', 'test'),
(8, 1, '{\"cells\":[{\"type\":\"class.Element\",\"position\":{\"x\":483,\"y\":109},\"size\":{\"width\":170,\"height\":100},\"angle\":0,\"name\":\"classname\",\"items\":\"\",\"fns\":\"\",\"id\":\"50f14f3f-9ffb-4af4-854e-fb29937aca1c\",\"z\":1,\"attrs\":{}},{\"type\":\"class.Element\",\"position\":{\"x\":80,\"y\":80},\"size\":{\"width\":170,\"height\":100},\"angle\":0,\"name\":\"classname\",\"items\":\"\",\"fns\":\"\",\"id\":\"c7763785-9517-4531-a03f-bbbcb0cdd97b\",\"z\":2,\"attrs\":{}}]}', '2019-01-25 01:44:06', 'test33'),
(9, 1, '{\"cells\":[{\"type\":\"class.Element\",\"position\":{\"x\":547,\"y\":20},\"size\":{\"width\":170,\"height\":100},\"angle\":0,\"name\":\"classname\",\"items\":\"\",\"fns\":\"\",\"id\":\"361a505b-a505-457e-a6f9-4fa8aac929f9\",\"z\":1,\"attrs\":{}}]}', '2019-01-25 01:45:39', 'test4'),
(10, 1, '{\"cells\":[{\"type\":\"class.Element\",\"position\":{\"x\":442,\"y\":52},\"size\":{\"width\":170,\"height\":100},\"angle\":0,\"id\":\"e9eeaeb1-1f8d-4e44-a029-78ca0ff76b24\",\"items\":\"\",\"name\":\"classname\",\"fns\":\"\",\"z\":1,\"attrs\":{}},{\"type\":\"class.Element\",\"position\":{\"x\":80,\"y\":80},\"size\":{\"width\":170,\"height\":100},\"angle\":0,\"id\":\"c3a4bc9f-d825-4c78-a538-e0a8f784fcce\",\"items\":\"\",\"name\":\"classname\",\"fns\":\"\",\"z\":2,\"attrs\":{}},{\"type\":\"custom.links.Extend\",\"source\":{\"id\":\"c3a4bc9f-d825-4c78-a538-e0a8f784fcce\"},\"target\":{\"id\":\"e9eeaeb1-1f8d-4e44-a029-78ca0ff76b24\"},\"id\":\"87dfc550-307b-443f-bbf5-d64d800a7a54\",\"z\":3,\"attrs\":{}}]}', '2019-01-25 01:49:37', 'test5'),
(16, 1, '{\"cells\":[]}', '2019-01-25 02:15:16', 'bobby2');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `mail` varchar(30) NOT NULL,
  `pwd` varchar(30) NOT NULL,
  `login` varchar(30) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`nom`, `prenom`, `mail`, `pwd`, `login`, `id`) VALUES
('root', 'root', 'roo@test.com', 'root', 'root', 1),
('root2', 'root2', 'root2', 'root2', 'root2', 2),
('root3', 'root3', 'root3', 'root3', 'root3', 3),
('root4', 'root4', 'root4', 'root4', 'root4', 4);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `diagramme`
--
ALTER TABLE `diagramme`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nom` (`nom`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `diagramme`
--
ALTER TABLE `diagramme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `diagramme`
--
ALTER TABLE `diagramme`
  ADD CONSTRAINT `diagramme_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
