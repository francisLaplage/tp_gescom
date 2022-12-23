-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 23 déc. 2022 à 15:27
-- Version du serveur : 10.4.21-MariaDB
-- Version de PHP : 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gescategorie`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `nom`) VALUES
(1, 'Vêtements'),
(2, 'Chaussures'),
(3, 'Parfums'),
(4, 'Ordinateurs'),
(9, 'Romans'),
(11, 'DVD'),
(14, 'LIVRES');

-- --------------------------------------------------------

--
-- Structure de la table `panier`
--

CREATE TABLE `panier` (
  `idPanier` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `date` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `panier`
--

INSERT INTO `panier` (`idPanier`, `idUser`, `date`) VALUES
(14, 1, '22/12/2022'),
(15, 1, '22/12/2022'),
(16, 2, '23/12/2022'),
(22, 6, '23/12/2022 12:13:00');

-- --------------------------------------------------------

--
-- Structure de la table `panier_produit`
--

CREATE TABLE `panier_produit` (
  `idPanier` int(11) NOT NULL,
  `idProd` int(11) NOT NULL,
  `quantite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `panier_produit`
--

INSERT INTO `panier_produit` (`idPanier`, `idProd`, `quantite`) VALUES
(14, 2, 10),
(14, 1, 2),
(15, 1, 12),
(15, 5, 8),
(16, 4, 4),
(16, 12, 4),
(16, 2, 9);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id` int(11) NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prix` double NOT NULL,
  `stock` int(11) NOT NULL,
  `image_url` varchar(1000) DEFAULT NULL,
  `categorie_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id`, `designation`, `nom`, `prix`, `stock`, `image_url`, `categorie_id`) VALUES
(1, 'Robe Ete Femme Mi-Longue Chic élégante Sexy Robes Courte D\'été Cou Rond Sans Manches Imprimé Floral Bohème Grande Taille 2022 Mode Rétro Mini Jupe De Plage Décontracté Ample #01 Beige XXLRobe Ete Femme', 'Robe Ete Femme Mi-Longue', 33, 125, 'https://images.unsplash.com/photo-1496747611176-843222e1e57c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1173&q=80', 4),
(2, 'CityComfort Pyjama Femme Hiver, Ensembles de Pyjama en Polaire VÃªtements de Nuit Femme Ã  Capuche', 'CityComfort', 55, 250, 'https://images.unsplash.com/photo-1485570661444-73b3f0ff9d2f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1185&q=80', 1),
(3, 'ESPRIT Collection Robe Femme\n4,1 sur 5 étoiles\n', 'ESPRIT Collection Robe Femme', 15, 25, 'https://images.unsplash.com/photo-1520640023173-50a135e35804?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80', 1),
(4, 'Cœur Imprimée (6609-MOCBLK-14), Noir/Moka (6609), 42', 'KRISP Robe Cache', 5, 2500, 'https://images.unsplash.com/photo-1620799140188-3b2a02fd9a77?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2872&q=80', 1),
(5, 'Robe, Beige (Cream Beige), 38 Femme', 'Esprit 042ee1e311 Robe', 45, 55, 'https://images.unsplash.com/photo-1483985988355-763728e1935b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80', 1),
(6, 'Casual Robe à Pois Col Rond Robe Longue Bohème d\'Eté Rétro Casual Robe de Plage Vacances Chic', 'Yingke Femme Robe', 25, 125, 'https://images.unsplash.com/photo-1602810318383-e386cc2a3ccf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80', 1),
(7, 'Amazon Essentials Robe Encolure Cache', 'Amazon Essentials Robe Encolure Cache', 25, 125, 'https://images.unsplash.com/photo-1541377182189-74e4a4ea12e5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2016&q=80', 1),
(8, 'Tops Robe Grande Taille pour Femmes Robe Cache-Cœur Transparente', 'YOUKD Boho Tunique', 55, 50, 'https://images.unsplash.com/photo-1562157873-818bc0726f68?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3000&q=80', 1),
(9, 'Longue Robe de Plage Maxi Kaftan Pareos Bohème Maillot De Bain Élegante Bikini Cover Up pour Femme, Convient M-5XL,Taille Unique, Multicolore', 'Lazz1on Robe de plage', 15, 25, 'https://images.unsplash.com/photo-1483985988355-763728e1935b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80', 1),
(10, 'Clavier', 'Clavier Azerty', 5, 2500, 'https://images.unsplash.com/flagged/photo-1564468781192-f023d514222d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80', 1),
(11, 'AWOCAN Robe de plage longue en mousseline de soie pour femme', 'AWOCAN Robe ', 45, 55, 'https://images.unsplash.com/photo-1602810316693-3667c854239a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80', 1),
(12, 'Bsubseach Robe de Caftan à Epaule Dénudée Turque Maillot de Bain Cover Up Robe Maxi', 'Bsubseach', 25, 125, 'https://images.unsplash.com/photo-1543087903-1ac2ec7aa8c5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2098&q=80', 1),
(13, 'Robe de Caftan à Epaule Dénudée Turque Maillot de Bain Cover Up Robe Maxi', 'Bsubseach', 25, 125, 'https://images.unsplash.com/photo-1602810316498-ab67cf68c8e1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80', 1),
(14, 'Sarong/paréo - pour femme - look de plage - à porter au-dessus du maillot de bain - taille unique - ananas', 'SHU-SHI ', 55, 50, 'https://images.unsplash.com/photo-1485125639709-a60c3a500bf1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80', 1),
(15, 'Les misérable', 'Roman 100 pages', 15, 25, 'https://images.unsplash.com/photo-1532453288672-3a27e9be9efd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2448&q=80', 1),
(16, 'Sarong Paréo Beach Wrap pour Femmes Funky Casual Bikini Cover Up Very Loud Maillot De Bain Fleur Imprimer', 'Hawaïenne', 50, 2500, 'https://images.unsplash.com/photo-1520591799316-6b30425429aa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80', 1),
(17, 'Beach Wrap pour Femmes Funky Casual Bikini Cover Up Very Loud Maillot De Bain Melon Flamant Imprimer', 'Hawaïenne Sarong Paréo', 45, 55, 'https://images.unsplash.com/photo-1525507119028-ed4c629a60a3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1035&q=80', 1),
(18, 'Vero Moda Vmverodona Ls Jacket Noos Femme', 'Vero Moda', 25, 125, 'https://images.unsplash.com/photo-1558769132-92e717d613cd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80', 1),
(19, 'Minetom Femme Doudoune Longue Manteau Zippé épais Chaud Parka Blouson Hiver Coton Doublé avec Capuche Elegant Slim Hoodie Jacket Veste', 'Minetom', 24, 125, 'https://images.unsplash.com/photo-1554568218-0f1715e72254?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80', 1),
(20, 'Orolay Femme Manteau Duvet Doudoune', 'Orolay', 55, 50, 'https://images.unsplash.com/photo-1620799139652-715e4d5b232d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1672&q=80', 1),
(21, 'Pepe Jeans Formby Long Sleeve Homme', 'Pepe Jeans Formby Long Sleeve Homme', 43, 25, 'https://images.unsplash.com/photo-1631041556964-57f2686f1113?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=928&q=80', 1),
(22, 'Hommes noeud papillon pré-noué ensemble Paisley & Floral Bowtie mouchoir boutons de manchette pour la fête de mariage', 'HISDERN ', 5, 2500, 'https://images.unsplash.com/photo-1620799140188-3b2a02fd9a77?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1672&q=80', 1),
(23, 'Blazer Homme Carreaux Veste de Costume Carreaux Coupe Ajustée Business d\'affaire', 'YOUTHUP ', 25, 125, 'https://images.unsplash.com/photo-1516762689617-e1cffcef479d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1011&q=80', 2),
(24, 'Frimley Long Sleeve Homme', 'Pepe Jeans', 55, 50, 'https://images.unsplash.com/photo-1525507119028-ed4c629a60a3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1035&q=80', 2),
(25, 'Fander Long Sleeve Homme', 'Pepe Jeans', 15, 25, 'https://images.unsplash.com/photo-1614676471928-2ed0ad1061a4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1041&q=80', 2),
(26, '\nErondo 10181991 02 Chemise', 'HUGO', 5, 2500, 'https://images.unsplash.com/photo-1544441893-675973e31985?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80', 2),
(28, 'Léger Veste de Costume Casual Couleur Unie Huat de Gamme Veste d’Affaire Bal', 'Blazer Homme ', 25, 125, 'https://images.unsplash.com/photo-1600785670858-21638662e186?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2076&q=80', 2),
(29, 'Homme Pantoufles Mousse À Mémoire Femme Chaussons Douces et Chaudes pour la Maison', 'Mishansha ', 25, 125, 'https://images.unsplash.com/photo-1600785672213-1e4b07462f19?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2076&q=80', 2),
(30, 'Femme Chaussons Peluche Fourrure Mocassin Chaud pour Extérieur', 'Mishansha ', 55, 50, 'https://images.unsplash.com/photo-1520639888713-7851133b1ed0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80', 2),
(31, 'Smash V2 L, Baskets Mixte', 'PUMA', 15, 25, 'https://images.unsplash.com/photo-1605812860427-4024433a70fd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1035&q=80', 2),
(32, 'Anzarun Lite, Baskets Mixte', 'PUMA', 5, 2500, 'https://images.unsplash.com/photo-1582897085656-c636d006a246?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1035&q=80', 2),
(33, 'Basket Mixte', 'PUMA Shuffle', 45, 55, 'https://images.unsplash.com/photo-1608256246200-53e635b5b65f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80', 2),
(34, 'Flex Appeal 3.0-First Insight, Baskets Femme', 'Skechers', 25, 125, 'https://images.unsplash.com/photo-1602250523342-d2212b96a297?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80', 2),
(35, 'Dessus: Toile\nDoublure: Textile\nSemelle intérieure: Textile\nMatériau de semelle: Synthétique\nType de talons: Plat\nHauteur de la tige : low-top\nLargeur de la chaussure: Moyen\nFermeture: Lacets', 'Skechers Flex Appeal 3.0-First Insight, Baskets Femme', 25, 125, 'https://images.unsplash.com/photo-1605733160314-4fc7dac4bb16?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2090&q=80', 2),
(36, 'Dessus: Synthétique\nDoublure: Synthétique\nMatériau de semelle: Synthétique\nType de talons: Plat\nLargeur de la chaussure: Medium\nFermeture: Lacet', 'Esprit 070ek1w301, Basket Femme', 55, 50, 'https://images.unsplash.com/photo-1575425939273-46ecee6d6931?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2069&q=80', 2),
(37, 'Dessus: Cuir\nMatériau de semelle: cuir\nType de talons: Plat\nHauteur de talons: 0.5 pouces\nLargeur de la chaussure: Normal\nFermeture: Enfiler', 'Bruno Marc 3251314 Mocassins Loafers Homme', 15, 25, 'https://images.unsplash.com/photo-1542838776-096d877b5aa2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80', 2),
(38, 'Homme Cuir | Chaussures Mocassins Hommes | Mocassins Loafers | Loafers Homme Cuir | Mocassins Loafers | Couleur: Chameau Taille 43', 'Zerimar Mocassins ', 5, 2500, 'https://images.unsplash.com/photo-1610398752800-146f269dfcc8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80', 2),
(39, 'Mocassins Homme Cuir | Chaussures Mocassins Hommes | Mocassins Loafers | Mocassins Loafers | Loafers Homme Cuir', 'Zerimar Mocassins Homme', 45, 55, 'https://images.unsplash.com/photo-1520809382381-d95e6364bbdb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3087&q=80', 2),
(40, 'Homme Chaussures à Lacets en Cuir Derby Mariage Oxford Business', 'DESAI', 25, 125, 'https://images.unsplash.com/photo-1571508914084-b52234530ceb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80', 2),
(41, 'U Calgary B, Oxford Homme', 'Geox', 25, 125, 'https://images.unsplash.com/photo-1601924638867-3a6de6b7a500?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80', 2),
(42, 'Batcombe Hall, Derbys Homme', 'Clarks', 55, 50, 'https://images.unsplash.com/photo-1599012307605-23a0ebe4d321?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80', 2),
(43, ' Un Aldric Park, Derbys Homme', 'Clarks', 125, 25, 'https://images.unsplash.com/photo-1596140096558-07b3cd0fd99e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80', 2),
(44, 'Kickers\nTyl, Derbys Homme', 'Kickers Tyl', 44, 20, 'https://images.unsplash.com/photo-1583012011009-33cfce9dd535?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1035&q=80', 2),
(45, 'Coffret Cadeau Eau De Parfum Femme\nLANCÔME\nPour Noël, Lancôme fait appel au célèbre artiste contemporain Richard Orlinski pour sublimer', 'LANCÔME', 25, 125, 'https://images.unsplash.com/photo-1613521076081-2820f9746a2d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80', 3),
(46, 'Eau De Toilette + Deodorant\nPACO RABANNE\nEau de Toilette 1 MILLION (100 ml) et son déo spray (150 ml). L\'insolence flamboyante d\'un Cuir épic', 'PACO RABANNE', 55, 50, 'https://images.unsplash.com/photo-1615160460366-2c9a41771b51?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80', 3),
(47, 'Eau De Toilette Format Voyage\nPACO RABANNE\nLe spray de voyage d\'une fragrance iconique. 1Milllion, un cuir-épicé insolent. Captiver d\'abord', 'PACO RABANNE', 15, 25, 'https://images.unsplash.com/photo-1458538977777-0549b2370168?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2074&q=80', 3),
(48, 'Eau De Toilette\nPaco Rabanne 1973 est un parfum oriental épicé pour homme avant-gardiste, né d\'une combinaison', 'PACO RABANNE', 5, 2500, 'https://images.unsplash.com/photo-1587305138714-9675ed5c9415?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1035&q=80', 3),
(49, 'Eau De Toilette Format Voyage\nPACO RABANNE\nLe spray de voyage d\'une fragrance iconique. 1Milllion, un cuir-épicé insolent. Captiver d\'abord,', 'PACO RABANNE', 45, 55, 'https://images.unsplash.com/photo-1587017539504-67cfbddac569?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1035&q=80', 3),
(50, 'Eau De Toilette\nPACO RABANNE\nL\'eau de toilette pour homme One Million de Paco Rabanne défie toutes les règles et bouscule les .', '1 MILLION', 25, 125, 'https://images.unsplash.com/photo-1587304883224-b1b6e004a97a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1674&q=80', 3),
(51, 'Trois petits cochons', 'Livre de 1000 pages', 25, 125, 'https://images.unsplash.com/photo-1582623082006-16d6ac6632ee?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1035&q=80', 3),
(52, 'Java 8', 'Java pour les nuls', 55, 50, 'https://images.unsplash.com/photo-1631722670977-60c8b22dfcaf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80', 3),
(53, 'Les misérable', 'Roman 100 pages', 15, 25, 'https://images.unsplash.com/photo-1635178792420-b90837a4e5d0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=985&q=80', 3),
(54, 'Clavier', 'Clavier Azerty', 5, 2500, 'https://images.unsplash.com/photo-1610540502378-c97e1e391e48?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=654&q=80', 3),
(55, 'Angular 12', 'Livre avec 1000 Exercices corriges', 45, 55, 'https://images.unsplash.com/photo-1623742310401-d8057c3c43c8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80', 3),
(56, 'Trois petits cochons', 'Livre de 1000 pages', 25, 125, 'https://images.unsplash.com/photo-1587304946930-61652a3051a9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1035&q=80', 3),
(57, 'Trois petits cochons', 'Livre de 1000 pages', 25, 125, 'https://images.unsplash.com/photo-1581954725292-be19419dbed8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1035&q=80', 3),
(58, 'Java 8', 'Java pour les nuls', 55, 50, 'https://images.unsplash.com/photo-1617713568047-536146a4678e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2970&q=80', 3),
(59, 'Les misérable', 'Roman 100 pages', 15, 25, 'https://images.unsplash.com/photo-1634055769490-dc0a9f22826a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1510&q=80', 3),
(60, 'Clavier', 'Clavier Azerty', 5, 2500, 'https://images.unsplash.com/photo-1572533177115-5bea803c0f49?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80', 3),
(61, 'Angular 12', 'Livre avec 1000 Exercices corriges', 45, 55, 'https://images.unsplash.com/photo-1520809382381-d95e6364bbdb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3087&q=80', 3),
(62, 'Trois petits cochons', 'Livre de 1000 pages', 25, 125, 'https://images.unsplash.com/photo-1519130350628-9e41ecf50c5e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80', 3),
(63, 'Trois petits cochons', 'Livre de 1000 pages', 25, 125, 'https://images.unsplash.com/photo-1613380832897-6942ddd40a28?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=989&q=80', 3),
(64, 'Java 8', 'Java pour les nuls', 55, 50, 'https://images.unsplash.com/photo-1593105587216-6581c8071e68?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1035&q=80', 3),
(65, 'Les misérable', 'Roman 100 pages', 15, 25, 'https://images.unsplash.com/photo-1587304883108-8bbeaac37125?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3135&q=80', 3),
(66, 'Clavier', 'Clavier Azerty', 5, 2500, 'https://images.unsplash.com/photo-1587304883316-2ce43897de48?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1035&q=80', 3),
(67, 'Extra-Firming Energy Crème Jour Éclat Vitaminé,Fermeté, Anti-Rides', 'CLARINS', 25, 125, 'https://images.unsplash.com/photo-1511943383581-71b476eafb3b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2053&q=80', 4),
(68, 'Crème Contour Des Yeux Et Des Lèvres\nEdition Limitée avec outil de massage pour préparer idéalement la peau avant ', 'SISLEY', 55, 50, 'https://images.unsplash.com/photo-1524638067-feba7e8ed70f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80', 4),
(69, 'Crème Délicate Révélatrice De Jeunesse\nESTÉE LAUDER\nRévélez la jeunesse de votre peau.', 'ESTÉE LAUDER', 15, 25, 'https://images.unsplash.com/photo-1615397349754-cfa2066a298e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80', 4),
(70, 'UNE PEAU REDENSIFEE, FORTIFIEE ET ECLATANTE DE SANTÉ ! QUELLES ACTIONS ?Les laboratoires Lancôme ', 'LANCÔME', 5, 2500, 'https://images.unsplash.com/photo-1615396899839-c99c121888b0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3087&q=80', 4),
(71, 'Crème Polypeptide\nDRUNK ELEPHANT\nPRIX D’EXCELLENCE DE LA BEAUTÉ MARIE CLAIRE 2022 Le produit', 'DRUNK ELEPHANT', 45, 55, 'https://images.unsplash.com/photo-1526429257838-9bf73dd45097?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=986&q=80', 4),
(72, 'Crème Velours Nouvelle Peau\nKENZOKI\nAvec le temps, les mécanismes naturels du renouvellement de l’épiderme sont moins performants.', 'KENZOKI', 25, 125, 'https://images.unsplash.com/photo-1549049950-48d5887197a0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1064&q=80', 4),
(73, 'Le baume nettoyant luxueux de The INKEY List dissout délicatement le maquillage, nettoie et nourrit la peau : la solution idéale pour les peaux sensibles.\n', 'THE INKEY LIST', 25, 125, 'https://images.unsplash.com/photo-1525904097878-94fb15835963?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2970&q=80', 4),
(74, 'la première étape de votre rituel de soin Youth Flow. Sa texture rafraîchissante au parfum relaxant pénètre immédiatement et apporte une sensation de confort. ', 'KENZOKI', 55, 50, 'https://images.unsplash.com/photo-1525904097878-94fb15835963?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2970&q=80', 4),
(75, 'Le nettoyant visage solide Respire est à 95% d\'ingrédients d\'origine naturelle.', 'RESPIRE', 15, 25, 'https://images.unsplash.com/photo-1530914547840-346c183410de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80', 4),
(76, 'Clavier', 'Clavier Azerty', 5, 2500, 'https://images.unsplash.com/photo-1608248543803-ba4f8c70ae0b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1653&q=80', 4),
(77, 'Angular 12', 'Livre avec 1000 Exercices corriges', 45, 55, 'https://images.unsplash.com/photo-1556228578-0d85b1a4d571?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80', 4),
(78, 'Trois petits cochons', 'Livre de 1000 pages', 25, 125, 'https://images.unsplash.com/photo-1492707892479-7bc8d5a4ee93?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1065&q=80', 4),
(79, 'Trois petits cochons', 'Livre de 1000 pages', 25, 125, 'https://images.unsplash.com/photo-1580870069867-74c57ee1bb07?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1035&q=80', 4),
(80, 'Java 8', 'Java pour les nuls', 55, 50, 'https://images.unsplash.com/photo-1567721913486-6585f069b332?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=988&q=80', 4),
(81, 'Les misérable', 'Roman 100 pages', 15, 25, 'https://images.unsplash.com/photo-1567721913486-6585f069b332?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=988&q=80', 4),
(82, 'Clavier', 'Clavier Azerty', 5, 2500, 'https://images.unsplash.com/photo-1597225370127-8183be946864?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80', 4),
(83, 'Angular 12', 'Livre avec 1000 Exercices corriges', 45, 55, 'https://images.unsplash.com/photo-1620531940052-d0d9aff03c32?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1035&q=80', 4),
(84, 'Trois petits cochons', 'Livre de 1000 pages', 25, 125, 'https://images.unsplash.com/photo-1627274419548-116f452d5e47?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=654&q=80', 4),
(85, 'Trois petits cochons', 'Livre de 1000 pages', 25, 125, 'https://images.unsplash.com/photo-1616172890963-a45e7da8de31?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80', 4),
(86, 'Java 8', 'Java pour les nuls', 55, 50, 'https://images.unsplash.com/photo-1618510069246-21f564373621?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=988&q=80', 4),
(87, 'Les misérable', 'Roman 100 pages', 15, 25, 'https://images.unsplash.com/photo-1597354984706-fac992d9306f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=988&q=80', 4),
(88, 'Clavier', 'Clavier Azerty', 5, 2500, 'https://images.unsplash.com/photo-1616680802368-03858af6588a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80', 4),
(89, 'Java 8', 'Spring Security', 15, 400, 'https://images.unsplash.com/photo-1578632292335-df3abbb0d586?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3087&q=80', 1),
(90, 'ddddddddddddd', 'ddddddd', 0, 0, 'https://images.unsplash.com/photo-1578632292335-df3abbb0d586?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3087&q=80', 1),
(91, 'New Produit', 'Parfun selectin', 121, 22, 'https://images.unsplash.com/photo-1578632292335-df3abbb0d586?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3087&q=80', 3),
(92, 'BEEL 1', 'BEEL 1', 1232, 222, 'https://images.unsplash.com/photo-1578632292335-df3abbb0d586?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3087&q=80', 2),
(93, 'SSSSSS', 'ds', 222, 11, 'https://images.unsplash.com/photo-1578632292335-df3abbb0d586?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3087&q=80', 1),
(95, '100 ml ', 'La Vie est Belle', 80, 120, 'https://images.unsplash.com/photo-1620733723429-0025a5c38b1a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80', 3),
(98, 'BD de 1000 pages', 'Trois Petits Cochons', 15, 200, 'https://images.unsplash.com/photo-1545468258-576dbac5faa9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80', 11);

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `role_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id`, `role_name`) VALUES
(1, 'ADMIN'),
(2, 'USER');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `idUser` int(11) NOT NULL,
  `nomUser` varchar(250) NOT NULL,
  `login` varchar(250) NOT NULL,
  `password` text NOT NULL,
  `role` varchar(250) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`idUser`, `nomUser`, `login`, `password`, `role`) VALUES
(1, 'Simpson', 'bart@yahoo.fr', 'Test123456', 'admin'),
(2, 'Simpson Lisa', 'lisa@yahoo.fr', 'azerty', 'admin'),
(6, 'francis', 'francis@yahoo.fr', 'Test1234', 'admin');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `panier`
--
ALTER TABLE `panier`
  ADD PRIMARY KEY (`idPanier`),
  ADD KEY `fk_panier_user` (`idUser`);

--
-- Index pour la table `panier_produit`
--
ALTER TABLE `panier_produit`
  ADD KEY `fk_panier_prod_panier` (`idPanier`),
  ADD KEY `fk_panier_prod_produit` (`idProd`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK52xhp55kbbl6u4rbluxm3g9hw` (`categorie_id`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idUser`),
  ADD UNIQUE KEY `login` (`login`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `panier`
--
ALTER TABLE `panier`
  MODIFY `idPanier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `panier`
--
ALTER TABLE `panier`
  ADD CONSTRAINT `fk_panier_user` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`);

--
-- Contraintes pour la table `panier_produit`
--
ALTER TABLE `panier_produit`
  ADD CONSTRAINT `fk_panier_prod_panier` FOREIGN KEY (`idPanier`) REFERENCES `panier` (`idPanier`),
  ADD CONSTRAINT `fk_panier_prod_produit` FOREIGN KEY (`idProd`) REFERENCES `produit` (`id`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `FK52xhp55kbbl6u4rbluxm3g9hw` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
