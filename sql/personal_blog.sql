-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 14 mai 2022 à 01:50
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `personal_blog`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creationdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationdate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`id`, `username`, `email`, `password`, `creationdate`, `updationdate`) VALUES
(1, 'ghada', 'admin@gmail.com', 'admin', '2022-05-01 17:36:19', '2022-05-08 17:40:45');

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catname` varchar(255) NOT NULL,
  `creationdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationdate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `catname`, `creationdate`, `updationdate`) VALUES
(1, 'Hair Care', '2022-05-02 12:32:54', '2022-05-08 17:42:08'),
(2, 'Face Care', '2022-05-02 12:32:56', '2022-05-08 17:42:26'),
(3, 'Hands Care', '2022-05-02 12:32:55', '2022-05-08 17:42:31');

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `postid` int(100) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `comment` mediumtext NOT NULL,
  `postingdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(1) NOT NULL,
  `creationdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationdate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `comments`
--

INSERT INTO `comments` (`id`, `postid`, `name`, `email`, `comment`, `postingdate`, `status`, `creationdate`, `updationdate`) VALUES
(3, 5, 'Ghada Soltani', 'ghada@gmail.com', 'Thanks', '2022-05-05 07:21:42', 1, '2022-05-05 07:21:42', '2022-05-08 17:43:46'),
(4, 8, 'Ghada Soltani', 'ghada@gmail.com', 'Interesting', '2022-05-05 07:21:42', 1, '2022-05-05 07:21:42', '2022-05-08 17:43:48');

-- --------------------------------------------------------

--
-- Structure de la table `contactusquery`
--

DROP TABLE IF EXISTS `contactusquery`;
CREATE TABLE IF NOT EXISTS `contactusquery` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `message` longtext NOT NULL,
  `postingdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(10) NOT NULL,
  `creationdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationdate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `contactusquery`
--

INSERT INTO `contactusquery` (`id`, `uname`, `email`, `contact`, `message`, `postingdate`, `status`, `creationdate`, `updationdate`) VALUES
(1, 'test', 'test@gmail.com', '01751336666', 'Something important', '2022-05-05 12:12:19', 0, '2022-05-05 12:12:19', '2022-05-08 17:44:27');

-- --------------------------------------------------------

--
-- Structure de la table `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pagename` varchar(30) NOT NULL,
  `pagetype` varchar(10) NOT NULL,
  `description` longtext NOT NULL,
  `creationdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationdate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `pages`
--

INSERT INTO `pages` (`id`, `pagename`, `pagetype`, `description`, `creationdate`, `updationdate`) VALUES
(1, 'About Us', 'aboutus', 'Your skin deserves a routine as unique as you are. That’s why we’re always chatting with skin care experts and looking into the latest products, treatments and tips to help you create your perfect skin care routine. Whether your skin is sensitive, dry or acne-prone, you’ll find tips for all your concerns.\nYour skin deserves a routine as unique as you are. That’s why we’re always chatting with skin care experts and looking into the latest products, treatments and tips to help you create your perfect skin care routine. Whether your skin is sensitive, dry or acne-prone, you’ll find tips for all your concerns.\n', '2019-11-14 17:34:09', '2022-05-08 17:47:54'),
(2, 'Contact Us', 'contactus', '', '2019-11-14 17:34:09', '2022-05-08 17:45:44');

-- --------------------------------------------------------

--
-- Structure de la table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `grabber` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `username` varchar(255) NOT NULL,
  `image1` varchar(120) NOT NULL,
  `userid` bigint(255) DEFAULT NULL,
  `creationdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationdate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `posts`
--

INSERT INTO `posts` (`id`, `title`, `grabber`, `category`, `description`, `username`, `image1`, `userid`, `creationdate`, `updationdate`, `status`) VALUES
(1, 'What Is Lactic Acid?', '', '2', '“Lactic acid is an alpha-hydroxy acid that gently exfoliates the top layer of the skin,” says Dr. Elyse Love, MD, a board-certified dermatologist based in NYC. In addition to buffing away dead skin cells and flakes, which can prevent both white and blackheads, it can increase cell turnover and collagen production in clinical doses. It also draws moisture into the skin, which reduces the appearance of fine lines. The result? “Smooth, hydrated, and glowing skin,” Dr. Love says.\n\nWhile you might think such an effective ingredient would do a real number on sensitive skin, it’s actually fairly gentle, she adds, proclaiming it suitable for most skin types when used properly. That includes melanin-rich skin, since lactic acid helps normalize pigment production leading to more even skin tone, according to Dr. Love.\n\nAlthough it shouldn’t be fair for one ingredient to do so much for so many, lactic acid is also pregnancy-safe—a good thing for mamas-to-be who really want to glow.', 'user 12345', '', 0, '2022-05-04 13:27:45', '2022-05-08 18:23:01', 1),
(2, 'How to Choose a Lactic Acid Product\n', '', '2', 'You can find lactic acid in almost any skincare category, from cleansers and serums to moisturizers and masks. Some good rules of thumb, according to Dr. Love: Serums tend to be the most potent while daily cleansers tend to be gentler. Meanwhile, the strength of masks can vary since they’re not meant to be used more than a couple times a week.\n\nConcentrations tend to range between 2 and 11%, so mind product labels when you’re just starting out. Got sensitive skin? A concentration of 2 to 5% should do the trick. “Higher percentages will give deeper exfoliation but potentially more irritation,” Dr. Love warns.\n\n', 'Ghada', '', 2, '2022-05-04 13:27:45', '2022-05-08 18:23:04', 1),
(3, 'Best Purple Shampoos for Brassy Blonde Hair', '', '1', 'Blondes might have more fun, but they often have to work harder to keep their hair healthy. One secret all lighter hair tones should know about is purple shampoo. Whether you are a bottle blonde or have naturally lighter locks, incorporating this toning shampoo into your hair care routine can help you maintain and tone your current hue in between salon visits. \n\nWhile purple shampoos will not make your hair lighter (or turn your hair purple), they will neutralize brassiness and make dull locks shine brighter than ever. \n\nbrassy blonde hair\n\nThe reason that taking your hair to a brighter, blonder hair tone typically requires more upkeep is because it lifts your hair’s base color. In comparison to dyeing your hair a darker shade, bleach requires more processing and chemicals. This leaves the hair more vulnerable to breakage by opening the cuticle and allowing UV rays, pollution, and other pollutants to enter. It also prevents hair from retaining moisture, which in turn makes color appear dull and brassy. The good news is purple shampoos will help you say bye bye to brassiness. \n\nWhether you’ve gone platinum blonde, silver, or just want to add vibrancy to your natural blonde locks, you should consider keeping a purple shampoo on hand. Here’s everything you need to know about these violet-based alternatives, along with 10 of the best purple shampoos on the market.', 'Ghada', '', 2, '2022-05-04 13:27:45', '2022-05-08 18:23:07', 1),
(16, '5 HAND CARE TIPS FOR AUTUMN/WINTER\r\n', '', '3', 'DON’T OVER-WASH\r\nWe’re all taught that thorough hand washing is our best defense against Winter viruses and bacteria, but constant washing of hands can strip the skin of natural oils, drying weather-worn skin out even further in the process. Don’t over-wash hands and always opt for a non-aggressive liquid soap or waterless hand sanitising gel. Another thing to note is the water temperature; keep it warm as opposed to hot to prevent additional skin dryness. Always re-apply hand cream after washing your hands to nourish and protect.\r\n\r\nHEAL & EXFOLIATE\r\nJust as you exfoliate the skin on your face and body, it’s beneficial to do the same on your hands. Exfoliate with a gentle scrub to remove the top layer of dead skin cells to reveal fresh skin underneath – coconut oil and sugar should do the trick for a handmade, natural alternative! Note: do not exfoliate sore, cracked and burning skin – always heal the skin beforehand (Sudocrem is your BFF for this).\r\nDIG OUT YOUR GLOVES\r\nWhen the temperatures really plummet, it’s time to bring out the big guns; a reliable, comfortable pair of gloves. There are many different ways you can protect your hands from the harsh weather conditions, whether that’s with traditional gloves, mittens or fingerless and touch pad styles for those of us who are constantly glued to our phones (guilty!)\r\n\r\nBUILD A BARRIER\r\nReward hardworking hands with indulgent, nourishing creams. If you make sure you’ve got one thing in your handbag, let it be hand cream. Travel-friendly creams will enable you to moisturise your hands anywhere and at any time they need a hit of hydration. Hand cream forms a barrier against the drying effects of Winter weather, and when reapplied throughout the day, will guarantee soft and nourished skin. Gently massaging into the skin each time can also help with circulation while warming up your hands. Our tip? Also apply just before bed to allow overnight repair and hydration.\r\n\r\nMASK IT\r\nJust like our face, our hands need some extra attention from time to time. Treating yourself to a hand mask once a week can help to amp up hydration, ensuring your hands are in tip-top condition for the duration of Winter. Also, don’t forget about nourishing those nails and cuticles!\r\n\r\n', 'Ghada', '', 2, '2022-05-04 13:27:45', '2022-05-08 18:31:12', 1);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `fname` varchar(15) NOT NULL,
  `lname` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `status` int(2) DEFAULT NULL,
  `creationdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationdate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `fname`, `lname`, `email`, `password`, `phone`, `status`, `creationdate`, `updationdate`) VALUES
(1, 'ghada', 'soltani', 'ghada@gmail.com', 'Test123', '203656498', 1, '2022-05-08 18:32:34', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
