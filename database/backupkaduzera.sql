-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.28-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para kaduzera
CREATE DATABASE IF NOT EXISTS `kaduzera` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `kaduzera`;

-- Copiando estrutura para tabela kaduzera.accounts
CREATE TABLE IF NOT EXISTS `accounts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `whitelist` tinyint(1) NOT NULL DEFAULT 0,
  `chars` int(10) NOT NULL DEFAULT 1,
  `gems` int(20) NOT NULL DEFAULT 0,
  `rolepass` int(20) NOT NULL DEFAULT 0,
  `premium` int(20) NOT NULL DEFAULT 0,
  `discord` varchar(50) NOT NULL DEFAULT '0',
  `license` varchar(50) NOT NULL DEFAULT '0',
  `initial` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `license` (`license`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaduzera.accounts: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaduzera.banneds
CREATE TABLE IF NOT EXISTS `banneds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(50) NOT NULL,
  `time` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaduzera.banneds: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaduzera.characters
CREATE TABLE IF NOT EXISTS `characters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(50) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `name` varchar(50) DEFAULT 'Individuo',
  `name2` varchar(50) DEFAULT 'Indigente',
  `sex` varchar(1) NOT NULL DEFAULT 'M',
  `bank` int(20) NOT NULL DEFAULT 0,
  `blood` int(1) NOT NULL DEFAULT 1,
  `fines` int(20) NOT NULL DEFAULT 0,
  `prison` int(11) NOT NULL DEFAULT 0,
  `tracking` int(30) NOT NULL DEFAULT 0,
  `spending` int(20) NOT NULL DEFAULT 0,
  `cardlimit` int(20) NOT NULL DEFAULT 0,
  `deleted` int(1) NOT NULL DEFAULT 0,
  `paypal` int(11) DEFAULT 0,
  `discord` varchar(50) DEFAULT '0',
  `released` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `license` (`license`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaduzera.characters: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaduzera.chests
CREATE TABLE IF NOT EXISTS `chests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `weight` int(10) NOT NULL DEFAULT 0,
  `perm` varchar(50) NOT NULL,
  `logs` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaduzera.chests: ~30 rows (aproximadamente)
INSERT INTO `chests` (`id`, `name`, `weight`, `perm`, `logs`) VALUES
	(1, 'Police', 500, 'Police', 1),
	(2, 'Paramedico', 500, 'Paramedico', 1),
	(3, 'BurgerShot', 250, 'BurgerShot', 1),
	(4, 'PizzaThis', 250, 'PizzaThis', 1),
	(5, 'UwuCoffee', 250, 'UwuCoffee', 1),
	(6, 'BeanMachine', 250, 'BeanMachine', 1),
	(7, 'Ballas', 250, 'Ballas', 1),
	(8, 'Families', 250, 'Families', 1),
	(9, 'Vagos', 250, 'Vagos', 1),
	(10, 'Aztecas', 250, 'Aztecas', 1),
	(11, 'Bloods', 250, 'Bloods', 1),
	(12, 'Triads', 250, 'Triads', 1),
	(13, 'Razors', 250, 'Razors', 1),
	(14, 'Mechanic', 500, 'Mechanic', 1),
	(17, 'Chiliad', 500, 'Chiliad', 1),
	(18, 'Families', 500, 'Families', 1),
	(19, 'Highways', 500, 'Highways', 1),
	(20, 'Vagos', 500, 'Vagos', 1),
	(21, 'Barragem', 500, 'Barragem', 1),
	(22, 'Farol', 500, 'Farol', 1),
	(23, 'Parque', 500, 'Parque', 1),
	(24, 'Sandy', 500, 'Sandy', 1),
	(25, 'Petroleo', 500, 'Petroleo', 1),
	(26, 'Praia-1', 500, 'Praia-1', 1),
	(27, 'Praia-2', 500, 'Praia-2', 1),
	(28, 'Zancudo', 500, 'Zancudo', 1),
	(29, 'Madrazzo', 500, 'Madrazzo', 1),
	(30, 'Playboy', 500, 'Playboy', 1),
	(31, 'TheSouth', 500, 'TheSouth', 1),
	(32, 'Vineyard', 500, 'Vineyard', 1);

-- Copiando estrutura para tabela kaduzera.dependents
CREATE TABLE IF NOT EXISTS `dependents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Passport` int(10) NOT NULL DEFAULT 0,
  `Dependent` int(10) NOT NULL DEFAULT 0,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaduzera.dependents: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaduzera.entitydata
CREATE TABLE IF NOT EXISTS `entitydata` (
  `dkey` varchar(100) NOT NULL,
  `dvalue` longtext DEFAULT NULL,
  PRIMARY KEY (`dkey`),
  KEY `dkey` (`dkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaduzera.entitydata: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaduzera.fidentity
CREATE TABLE IF NOT EXISTS `fidentity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `name2` varchar(50) NOT NULL DEFAULT '',
  `port` int(1) NOT NULL DEFAULT 1,
  `blood` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaduzera.fidentity: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaduzera.fines
CREATE TABLE IF NOT EXISTS `fines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Passport` int(10) NOT NULL DEFAULT 0,
  `Name` varchar(50) NOT NULL,
  `Date` varchar(50) NOT NULL,
  `Hour` varchar(50) NOT NULL,
  `Value` int(11) NOT NULL,
  `Message` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaduzera.fines: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaduzera.investments
CREATE TABLE IF NOT EXISTS `investments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Passport` int(10) NOT NULL DEFAULT 0,
  `Liquid` int(20) NOT NULL DEFAULT 0,
  `Monthly` int(20) NOT NULL DEFAULT 0,
  `Deposit` int(20) NOT NULL DEFAULT 0,
  `Last` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaduzera.investments: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaduzera.invoices
CREATE TABLE IF NOT EXISTS `invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Passport` int(10) NOT NULL DEFAULT 0,
  `Received` int(10) NOT NULL DEFAULT 0,
  `Type` varchar(50) NOT NULL,
  `Reason` longtext NOT NULL,
  `Holder` varchar(50) NOT NULL,
  `Value` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaduzera.invoices: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaduzera.organizations
CREATE TABLE IF NOT EXISTS `organizations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `bank` int(20) NOT NULL DEFAULT 0,
  `premium` int(20) NOT NULL DEFAULT 0,
  `buff` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaduzera.organizations: ~16 rows (aproximadamente)
INSERT INTO `organizations` (`id`, `name`, `bank`, `premium`, `buff`) VALUES
	(1, 'Police', 0, 0, 0),
	(2, 'Paramedic', 0, 0, 0),
	(3, 'BurgerShot', 0, 0, 0),
	(4, 'PizzaThis', 0, 0, 0),
	(5, 'UwuCoffee', 0, 0, 0),
	(6, 'BeanMachine', 0, 0, 0),
	(7, 'Ballas', 0, 0, 0),
	(8, 'Families', 0, 0, 0),
	(9, 'Vagos', 0, 0, 0),
	(10, 'Aztecas', 0, 0, 0),
	(11, 'Bloods', 0, 0, 0),
	(12, 'Triads', 0, 0, 0),
	(13, 'Razors', 0, 0, 0),
	(14, 'Mechanic', 0, 0, 0),
	(15, 'Barragem', 0, 0, 0),
	(16, 'Farol', 0, 0, 0);

-- Copiando estrutura para tabela kaduzera.org_transactions
CREATE TABLE IF NOT EXISTS `org_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `Type` varchar(50) NOT NULL,
  `Value` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaduzera.org_transactions: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaduzera.playerdata
CREATE TABLE IF NOT EXISTS `playerdata` (
  `Passport` int(11) NOT NULL,
  `dkey` varchar(100) NOT NULL,
  `dvalue` longtext DEFAULT NULL,
  PRIMARY KEY (`Passport`,`dkey`),
  KEY `Passport` (`Passport`),
  KEY `dkey` (`dkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaduzera.playerdata: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaduzera.port
CREATE TABLE IF NOT EXISTS `port` (
  `portId` int(11) NOT NULL AUTO_INCREMENT,
  `identity` longtext DEFAULT NULL,
  `user_id` text DEFAULT NULL,
  `portType` longtext DEFAULT NULL,
  `serial` longtext DEFAULT NULL,
  `nidentity` longtext DEFAULT NULL,
  `exam` longtext DEFAULT NULL,
  `date` text DEFAULT NULL,
  PRIMARY KEY (`portId`),
  KEY `portId` (`portId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Copiando dados para a tabela kaduzera.port: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaduzera.prison
CREATE TABLE IF NOT EXISTS `prison` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `police` varchar(255) DEFAULT '0',
  `nuser_id` int(11) NOT NULL DEFAULT 0,
  `services` int(11) NOT NULL DEFAULT 0,
  `fines` int(20) NOT NULL DEFAULT 0,
  `text` longtext DEFAULT NULL,
  `date` text DEFAULT NULL,
  `cops` varchar(100) DEFAULT NULL,
  `association` varchar(100) DEFAULT NULL,
  `residual` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Copiando dados para a tabela kaduzera.prison: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaduzera.propertys
CREATE TABLE IF NOT EXISTS `propertys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) NOT NULL DEFAULT 'Homes0001',
  `Interior` varchar(20) NOT NULL DEFAULT 'Middle',
  `Keys` int(3) NOT NULL DEFAULT 3,
  `Tax` int(20) NOT NULL DEFAULT 0,
  `Passport` int(6) NOT NULL DEFAULT 0,
  `Serial` varchar(10) NOT NULL,
  `Vault` int(6) NOT NULL DEFAULT 1,
  `Fridge` int(6) NOT NULL DEFAULT 1,
  `Garage` longtext NOT NULL DEFAULT '{}',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `Passport` (`Passport`),
  KEY `Name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaduzera.propertys: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaduzera.races
CREATE TABLE IF NOT EXISTS `races` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Race` int(3) NOT NULL DEFAULT 0,
  `Passport` int(5) NOT NULL DEFAULT 0,
  `Name` varchar(100) NOT NULL DEFAULT 'Individuo Indigente',
  `Vehicle` varchar(50) NOT NULL DEFAULT 'Sultan RS',
  `Points` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `Race` (`Race`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaduzera.races: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaduzera.smartphone_bank_invoices
CREATE TABLE IF NOT EXISTS `smartphone_bank_invoices` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `payee_id` int(11) NOT NULL,
  `payer_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL DEFAULT '',
  `value` int(11) NOT NULL,
  `paid` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaduzera.smartphone_bank_invoices: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaduzera.smartphone_blocks
CREATE TABLE IF NOT EXISTS `smartphone_blocks` (
  `user_id` int(11) NOT NULL,
  `phone` varchar(32) NOT NULL,
  PRIMARY KEY (`user_id`,`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaduzera.smartphone_blocks: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaduzera.smartphone_calls
CREATE TABLE IF NOT EXISTS `smartphone_calls` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `initiator` varchar(50) NOT NULL,
  `target` varchar(50) NOT NULL,
  `duration` int(11) NOT NULL DEFAULT 0,
  `status` varchar(255) NOT NULL,
  `video` tinyint(4) NOT NULL DEFAULT 0,
  `anonymous` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `initiator_index` (`initiator`),
  KEY `target_index` (`target`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaduzera.smartphone_calls: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaduzera.smartphone_casino
CREATE TABLE IF NOT EXISTS `smartphone_casino` (
  `user_id` int(11) NOT NULL,
  `balance` bigint(20) NOT NULL DEFAULT 0,
  `double` bigint(20) NOT NULL DEFAULT 0,
  `crash` bigint(20) NOT NULL DEFAULT 0,
  `mine` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaduzera.smartphone_casino: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaduzera.smartphone_contacts
CREATE TABLE IF NOT EXISTS `smartphone_contacts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `owner` varchar(50) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `owner_index` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaduzera.smartphone_contacts: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaduzera.smartphone_gallery
CREATE TABLE IF NOT EXISTS `smartphone_gallery` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `folder` varchar(255) NOT NULL DEFAULT '/',
  `url` varchar(255) NOT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaduzera.smartphone_gallery: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaduzera.smartphone_instagram
CREATE TABLE IF NOT EXISTS `smartphone_instagram` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `bio` varchar(255) NOT NULL,
  `avatarURL` varchar(255) DEFAULT NULL,
  `verified` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaduzera.smartphone_instagram: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaduzera.smartphone_instagram_followers
CREATE TABLE IF NOT EXISTS `smartphone_instagram_followers` (
  `follower_id` bigint(20) NOT NULL,
  `profile_id` bigint(20) NOT NULL,
  PRIMARY KEY (`follower_id`,`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaduzera.smartphone_instagram_followers: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaduzera.smartphone_instagram_likes
CREATE TABLE IF NOT EXISTS `smartphone_instagram_likes` (
  `post_id` bigint(20) NOT NULL,
  `profile_id` bigint(20) NOT NULL,
  PRIMARY KEY (`post_id`,`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaduzera.smartphone_instagram_likes: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaduzera.smartphone_instagram_notifications
CREATE TABLE IF NOT EXISTS `smartphone_instagram_notifications` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `content` varchar(512) NOT NULL,
  `saw` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `profile_id_index` (`profile_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaduzera.smartphone_instagram_notifications: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaduzera.smartphone_instagram_posts
CREATE TABLE IF NOT EXISTS `smartphone_instagram_posts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `profile_id` bigint(20) NOT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `created_at` bigint(20) NOT NULL,
  `comments` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `profile_id_index` (`profile_id`),
  KEY `post_id_index` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaduzera.smartphone_instagram_posts: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaduzera.smartphone_olx
CREATE TABLE IF NOT EXISTS `smartphone_olx` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `description` varchar(1024) NOT NULL,
  `images` varchar(1024) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaduzera.smartphone_olx: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaduzera.smartphone_paypal_transactions
CREATE TABLE IF NOT EXISTS `smartphone_paypal_transactions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `target` bigint(20) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'payment',
  `description` varchar(255) DEFAULT NULL,
  `value` bigint(20) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`),
  KEY `target_index` (`target`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaduzera.smartphone_paypal_transactions: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaduzera.smartphone_tinder
CREATE TABLE IF NOT EXISTS `smartphone_tinder` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `bio` varchar(1024) NOT NULL,
  `age` tinyint(4) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `show_gender` tinyint(4) NOT NULL,
  `tags` varchar(255) NOT NULL,
  `show_tags` tinyint(4) NOT NULL,
  `target` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`),
  KEY `gender_index` (`gender`),
  KEY `target_index` (`target`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaduzera.smartphone_tinder: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaduzera.smartphone_tinder_messages
CREATE TABLE IF NOT EXISTS `smartphone_tinder_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sender` int(11) NOT NULL,
  `target` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `liked` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sender_index` (`sender`),
  KEY `target_index` (`target`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaduzera.smartphone_tinder_messages: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaduzera.smartphone_tinder_rating
CREATE TABLE IF NOT EXISTS `smartphone_tinder_rating` (
  `profile_id` int(11) NOT NULL,
  `rated_id` int(11) NOT NULL,
  `rating` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`profile_id`,`rated_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaduzera.smartphone_tinder_rating: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaduzera.smartphone_tor_messages
CREATE TABLE IF NOT EXISTS `smartphone_tor_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `channel` varchar(24) NOT NULL DEFAULT 'geral',
  `sender` varchar(50) NOT NULL,
  `image` varchar(512) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `channel_index` (`channel`),
  KEY `sender_index` (`sender`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaduzera.smartphone_tor_messages: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaduzera.smartphone_tor_payments
CREATE TABLE IF NOT EXISTS `smartphone_tor_payments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sender` bigint(20) NOT NULL,
  `target` bigint(20) NOT NULL,
  `amount` int(11) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sender_index` (`sender`),
  KEY `target_index` (`target`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaduzera.smartphone_tor_payments: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaduzera.smartphone_twitter_followers
CREATE TABLE IF NOT EXISTS `smartphone_twitter_followers` (
  `follower_id` bigint(20) NOT NULL,
  `profile_id` bigint(20) NOT NULL,
  KEY `profile_id_index` (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaduzera.smartphone_twitter_followers: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaduzera.smartphone_twitter_likes
CREATE TABLE IF NOT EXISTS `smartphone_twitter_likes` (
  `tweet_id` bigint(20) NOT NULL,
  `profile_id` bigint(20) NOT NULL,
  KEY `tweet_id_index` (`tweet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaduzera.smartphone_twitter_likes: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaduzera.smartphone_twitter_profiles
CREATE TABLE IF NOT EXISTS `smartphone_twitter_profiles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `avatarURL` varchar(255) NOT NULL,
  `bannerURL` varchar(255) NOT NULL,
  `bio` varchar(255) DEFAULT NULL,
  `verified` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaduzera.smartphone_twitter_profiles: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaduzera.smartphone_twitter_tweets
CREATE TABLE IF NOT EXISTS `smartphone_twitter_tweets` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `tweet_id` bigint(20) DEFAULT NULL,
  `content` varchar(280) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `profile_id_index` (`profile_id`),
  KEY `tweet_id_index` (`tweet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaduzera.smartphone_twitter_tweets: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaduzera.smartphone_weazel
CREATE TABLE IF NOT EXISTS `smartphone_weazel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `author` varchar(255) NOT NULL,
  `tag` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(4096) NOT NULL,
  `imageURL` varchar(255) DEFAULT NULL,
  `videoURL` varchar(255) DEFAULT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaduzera.smartphone_weazel: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaduzera.smartphone_whatsapp
CREATE TABLE IF NOT EXISTS `smartphone_whatsapp` (
  `owner` varchar(32) NOT NULL,
  `avatarURL` varchar(255) DEFAULT NULL,
  `read_receipts` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaduzera.smartphone_whatsapp: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaduzera.smartphone_whatsapp_channels
CREATE TABLE IF NOT EXISTS `smartphone_whatsapp_channels` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sender` varchar(50) NOT NULL,
  `target` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sender_index` (`sender`),
  KEY `target_index` (`target`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaduzera.smartphone_whatsapp_channels: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaduzera.smartphone_whatsapp_groups
CREATE TABLE IF NOT EXISTS `smartphone_whatsapp_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `avatarURL` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `members` varchar(2048) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaduzera.smartphone_whatsapp_groups: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaduzera.smartphone_whatsapp_messages
CREATE TABLE IF NOT EXISTS `smartphone_whatsapp_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `channel_id` bigint(20) unsigned NOT NULL,
  `sender` varchar(50) NOT NULL,
  `image` varchar(512) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `deleted_by` varchar(255) DEFAULT NULL,
  `readed` tinyint(4) NOT NULL DEFAULT 0,
  `saw_at` bigint(20) NOT NULL DEFAULT 0,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sender_index` (`sender`),
  KEY `channel_id_index` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaduzera.smartphone_whatsapp_messages: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaduzera.taxs
CREATE TABLE IF NOT EXISTS `taxs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Passport` int(10) NOT NULL DEFAULT 0,
  `Name` varchar(50) NOT NULL,
  `Date` varchar(50) NOT NULL,
  `Hour` varchar(50) NOT NULL,
  `Value` int(11) NOT NULL,
  `Message` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaduzera.taxs: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaduzera.transactions
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Passport` int(10) NOT NULL DEFAULT 0,
  `Type` varchar(50) NOT NULL,
  `Date` varchar(50) NOT NULL,
  `Value` int(11) NOT NULL,
  `Balance` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaduzera.transactions: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaduzera.vehicles
CREATE TABLE IF NOT EXISTS `vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Passport` int(11) NOT NULL,
  `vehicle` varchar(100) NOT NULL,
  `tax` int(20) NOT NULL DEFAULT 0,
  `plate` varchar(10) DEFAULT NULL,
  `rental` int(20) NOT NULL DEFAULT 0,
  `arrest` int(20) NOT NULL DEFAULT 0,
  `engine` int(4) NOT NULL DEFAULT 1000,
  `body` int(4) NOT NULL DEFAULT 1000,
  `health` int(4) NOT NULL DEFAULT 1000,
  `fuel` int(3) NOT NULL DEFAULT 100,
  `nitro` int(5) NOT NULL DEFAULT 0,
  `work` varchar(5) NOT NULL DEFAULT 'false',
  `doors` longtext NOT NULL,
  `windows` longtext NOT NULL,
  `tyres` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `vehicle` (`vehicle`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaduzera.vehicles: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaduzera.warehouse
CREATE TABLE IF NOT EXISTS `warehouse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `weight` int(10) NOT NULL DEFAULT 200,
  `password` varchar(50) NOT NULL,
  `Passport` int(10) NOT NULL DEFAULT 0,
  `tax` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela kaduzera.warehouse: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela kaduzera.warrants
CREATE TABLE IF NOT EXISTS `warrants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` text DEFAULT NULL,
  `identity` text DEFAULT NULL,
  `status` text DEFAULT NULL,
  `nidentity` text DEFAULT NULL,
  `timeStamp` text DEFAULT NULL,
  `reason` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `portId` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Copiando dados para a tabela kaduzera.warrants: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
