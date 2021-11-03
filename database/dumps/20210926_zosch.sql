# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.6.4-MariaDB)
# Datenbank: zosch
# Erstellt am: 2021-09-25 23:44:05 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Export von Tabelle activations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `activations`;

CREATE TABLE `activations` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `used` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `activations_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Export von Tabelle address
# ------------------------------------------------------------

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `address_category_id` int(10) unsigned NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `info_on_changes` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `address_email_token_unique` (`email`,`token`),
  KEY `address_address_category_id_foreign` (`address_category_id`),
  CONSTRAINT `address_address_category_id_foreign` FOREIGN KEY (`address_category_id`) REFERENCES `address_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Export von Tabelle address_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `address_category`;

CREATE TABLE `address_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` int(10) unsigned NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `address_category_tag_id_index` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `address_category` WRITE;
/*!40000 ALTER TABLE `address_category` DISABLE KEYS */;

INSERT INTO `address_category` (`id`, `tag_id`, `name`)
VALUES
	(1,214601,'Presse'),
	(2,214609,'Fan');

/*!40000 ALTER TABLE `address_category` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle admin_activations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_activations`;

CREATE TABLE `admin_activations` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `used` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `admin_activations_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Export von Tabelle admin_password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_password_resets`;

CREATE TABLE `admin_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `admin_password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Export von Tabelle admin_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_users`;

CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activated` tinyint(1) NOT NULL DEFAULT 0,
  `forbidden` tinyint(1) NOT NULL DEFAULT 0,
  `language` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_email_deleted_at_unique` (`email`,`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;

INSERT INTO `admin_users` (`id`, `first_name`, `last_name`, `email`, `password`, `remember_token`, `activated`, `forbidden`, `language`, `deleted_at`, `created_at`, `updated_at`, `last_login_at`)
VALUES
	(1,'Bernd','Engels','engels@goldenacker.de','$2y$10$9Dy70Nn5jWwCJSLooaI1U.ptCVJoJbsgJ3UxklG8rzVrtn7pbs3ca','OF4AqRcD0Ut7g62eydD8P4YFH7oKldLlBZwO7nAkR7OgZZg3VNzzhbztRVeC',1,0,'de',NULL,'0000-00-00 00:00:00','2021-09-25 23:37:36','2021-09-25 23:36:10'),
	(2,'Hannes','Heinrich','hannes@zosch-berlin.de','$2y$10$nxHuQGz6bPARzOmQirqLuOr7xOIbwqxmS/tAkjIZDK7Z3.miGUk26','ykG3wb4xi7AMBRUvRvQ5AmVauBVIm4LB8AUXZTr7AkMpFCCDKTSWn5GtXINA',1,0,'de',NULL,'2021-09-24 17:44:00','2021-09-25 01:14:03','2021-09-25 01:14:03');

/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle admin_users_music_style
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_users_music_style`;

CREATE TABLE `admin_users_music_style` (
  `admin_user_id` int(10) unsigned NOT NULL,
  `music_style_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`admin_user_id`,`music_style_id`),
  KEY `admin_users_music_style_music_style_id_foreign` (`music_style_id`),
  CONSTRAINT `admin_users_music_style_admin_user_id_foreign` FOREIGN KEY (`admin_user_id`) REFERENCES `admin_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `admin_users_music_style_music_style_id_foreign` FOREIGN KEY (`music_style_id`) REFERENCES `music_style` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Export von Tabelle category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;

INSERT INTO `category` (`id`, `name`, `slug`, `icon`)
VALUES
	(1,'Musik','musik','md-musical-notes'),
	(2,'DJ','dj','md-headset'),
	(3,'Lesung','lesung','md-book'),
	(4,'Film','film','md-film'),
	(5,'Ausstellung','ausstellung','md-eye'),
	(6,'Party','party','md-happy'),
	(7,'Spezial','spezial','md-star');

/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle event
# ------------------------------------------------------------

DROP TABLE IF EXISTS `event`;

CREATE TABLE `event` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `theme_id` int(10) unsigned DEFAULT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `links` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event_date` date NOT NULL,
  `event_time` time DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT 0,
  `is_periodic` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_theme_id_foreign` (`theme_id`),
  KEY `event_category_id_foreign` (`category_id`),
  KEY `event_created_by_foreign` (`created_by`),
  KEY `event_updated_by_foreign` (`updated_by`),
  CONSTRAINT `event_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `event_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admin_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `event_theme_id_foreign` FOREIGN KEY (`theme_id`) REFERENCES `theme` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `event_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admin_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;

INSERT INTO `event` (`id`, `theme_id`, `category_id`, `created_by`, `updated_by`, `title`, `subtitle`, `description`, `links`, `event_date`, `event_time`, `price`, `is_published`, `is_periodic`, `created_at`, `updated_at`)
VALUES
	(1,NULL,1,1,1,'Test Gruppe spielt','hier der Untertitel','<p>Summus dolor plures dies manere non potest? Quis Aristidem non mortuum diligit? Itaque hic ipse iam pridem est reiectus; Illa videamus, quae a te de amicitia dicta sunt. Iam in altera philosophiae parte. Putabam equidem satis, inquit, me dixisse. Quid ad utilitatem tantae pecuniae? <br><br>Quid ad utilitatem tantae pecuniae? Duo Reges: constructio interrete. Cur post Tarentum ad Archytam? Aperiendum est igitur, quid sit voluptas; <br><br>Frater et T. Qui est in parvis malis. Tamen a proposito, inquam, aberramus. Prodest, inquit, mihi eo esse animo. Aliter enim nosmet ipsos nosse non possumus. Nunc de hominis summo bono quaeritur; <br><br><br></p>',NULL,'2021-10-28','20:00:00',NULL,1,0,'2021-09-24 18:35:08','2021-09-25 00:48:20'),
	(2,1,1,1,NULL,'Attacktion',NULL,NULL,NULL,'2022-02-25','20:00:00',NULL,1,0,'2021-09-25 11:31:53','2021-09-25 11:31:53');

/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle event_periodic
# ------------------------------------------------------------

DROP TABLE IF EXISTS `event_periodic`;

CREATE TABLE `event_periodic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `theme_id` int(10) unsigned DEFAULT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `periodic_position` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `periodic_weekday` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `links` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event_date` date DEFAULT NULL,
  `event_time` time NOT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_periodic_theme_id_foreign` (`theme_id`),
  KEY `event_periodic_category_id_foreign` (`category_id`),
  KEY `event_periodic_created_by_foreign` (`created_by`),
  KEY `event_periodic_updated_by_foreign` (`updated_by`),
  CONSTRAINT `event_periodic_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `event_periodic_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admin_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `event_periodic_theme_id_foreign` FOREIGN KEY (`theme_id`) REFERENCES `theme` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `event_periodic_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admin_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `event_periodic` WRITE;
/*!40000 ALTER TABLE `event_periodic` DISABLE KEYS */;

INSERT INTO `event_periodic` (`id`, `theme_id`, `category_id`, `periodic_position`, `periodic_weekday`, `created_by`, `updated_by`, `title`, `subtitle`, `description`, `links`, `event_date`, `event_time`, `price`, `is_published`, `created_at`, `updated_at`)
VALUES
	(11,1,1,'1','thursday',1,NULL,'Just Friends','Jazzformation',NULL,NULL,'2021-09-25','20:00:00',NULL,1,'2021-09-25 11:28:00','2021-09-25 11:28:00'),
	(12,1,1,'1','wednesday',1,NULL,'la foot creole','new orleans jazz',NULL,NULL,'2021-09-25','20:00:00',NULL,1,'2021-09-25 11:29:55','2021-09-25 11:29:55');

/*!40000 ALTER TABLE `event_periodic` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle event_template
# ------------------------------------------------------------

DROP TABLE IF EXISTS `event_template`;

CREATE TABLE `event_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `theme_id` int(10) unsigned DEFAULT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `links` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_template_theme_id_foreign` (`theme_id`),
  KEY `event_template_category_id_foreign` (`category_id`),
  KEY `event_template_created_by_foreign` (`created_by`),
  KEY `event_template_updated_by_foreign` (`updated_by`),
  CONSTRAINT `event_template_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `event_template_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admin_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `event_template_theme_id_foreign` FOREIGN KEY (`theme_id`) REFERENCES `theme` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `event_template_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admin_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Export von Tabelle failed_jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Export von Tabelle jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `jobs`;

CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Export von Tabelle links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `links`;

CREATE TABLE `links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Export von Tabelle media
# ------------------------------------------------------------

DROP TABLE IF EXISTS `media`;

CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint(20) unsigned NOT NULL,
  `manipulations` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_properties` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `responsive_images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_column` int(10) unsigned DEFAULT NULL,
  `generated_conversions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_model_type_model_id_index` (`model_type`,`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;

INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `responsive_images`, `order_column`, `generated_conversions`, `created_at`, `updated_at`)
VALUES
	(4,'App\\Models\\Event',1,'38adf81d-44af-4f97-ab86-4a6f24f293e0','images','elg6IqteAzqIyj1H3Q92QbyhwIUUopZp0ohoFqYj','elg6IqteAzqIyj1H3Q92QbyhwIUUopZp0ohoFqYj.jpg','image/jpeg','images','images',252373,'[]','{\"name\":\"hooge_parking.jpg\",\"file_name\":\"hooge_parking.jpg\",\"width\":1200,\"height\":900}','[]',1,'{\"thumb_200\":true,\"detail_hd\":true}','2021-09-25 00:48:19','2021-09-25 00:48:19'),
	(5,'App\\Models\\Event',1,'08c5d22f-04ee-4400-9cd8-e3dc55543e70','images','6NHv9ZiGMrx3cRuXXKcQgr3v9ksgudW5KIkUl64H','6NHv9ZiGMrx3cRuXXKcQgr3v9ksgudW5KIkUl64H.jpg','image/jpeg','images','images',54152,'[]','{\"name\":\"nebel_steg.jpg\",\"file_name\":\"nebel_steg.jpg\",\"width\":640,\"height\":480}','[]',2,'{\"thumb_200\":true,\"detail_hd\":true}','2021-09-25 00:48:19','2021-09-25 00:48:19'),
	(6,'App\\Models\\Event',1,'cef9eb66-65b9-4adb-b04f-f96db8fb3f31','images','Cimtq8Lw8qCb8BEglKc1exnchfuWMG0TfZorZHRx','Cimtq8Lw8qCb8BEglKc1exnchfuWMG0TfZorZHRx.jpg','image/jpeg','images','images',331579,'[]','{\"name\":\"pamina_sunset.jpg\",\"file_name\":\"pamina_sunset.jpg\",\"width\":1632,\"height\":916}','[]',3,'{\"thumb_200\":true,\"detail_hd\":true}','2021-09-25 00:48:19','2021-09-25 00:48:20');

/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `menu_item_type_id` int(10) unsigned DEFAULT NULL,
  `name` blob NOT NULL,
  `css_class` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fa_icon` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `lvl` int(11) NOT NULL,
  `api_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `is_published` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `menu_parent_id_foreign` (`parent_id`),
  KEY `menu_menu_item_type_id_foreign` (`menu_item_type_id`),
  CONSTRAINT `menu_menu_item_type_id_foreign` FOREIGN KEY (`menu_item_type_id`) REFERENCES `menu_item_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `menu_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;

INSERT INTO `menu` (`id`, `parent_id`, `menu_item_type_id`, `name`, `css_class`, `icon`, `fa_icon`, `url`, `lft`, `rgt`, `lvl`, `api_enabled`, `is_published`)
VALUES
	(1,NULL,4,X'544F50',NULL,NULL,NULL,NULL,1,32,0,1,1),
	(2,NULL,5,X'424F54544F4D',NULL,NULL,NULL,NULL,33,48,0,1,1),
	(3,1,1,X'4576656E7473',NULL,NULL,NULL,NULL,2,9,1,1,1),
	(4,3,3,X'4D7573696B',NULL,NULL,NULL,'/category/musik',3,4,2,1,1),
	(5,3,3,X'4C6573756E67',NULL,NULL,NULL,'/category/lesung',5,6,2,1,1),
	(6,3,3,X'5061727479',NULL,NULL,NULL,'/category/party',7,8,2,1,1),
	(7,2,3,X'496D7072657373756D',NULL,NULL,NULL,'/page/impressum',34,35,1,1,1),
	(8,2,3,X'446174656E73636875747A',NULL,NULL,NULL,'/page/datenschutz',36,37,1,1,1),
	(12,1,1,X'4B6F6E74616B74',NULL,NULL,NULL,NULL,10,17,1,1,1),
	(19,2,3,X'525353',NULL,'logo-rss',NULL,'/feed',46,47,1,0,0),
	(20,12,3,X'4C616765706C616E',NULL,NULL,NULL,'/static/map',15,16,2,0,1),
	(22,12,3,X'42616E6420416E6672616765',NULL,NULL,NULL,'/contact/bands',13,14,2,0,1),
	(24,2,3,X'4E75747A756E6773626564696E67756E67656E',NULL,NULL,NULL,'/page/nutzungsbedingungen',38,39,1,1,1),
	(26,1,4,X'556E7365726520416E6765626F7465',NULL,NULL,NULL,NULL,26,31,1,1,1),
	(27,26,3,X'5370656973656E',NULL,NULL,NULL,'/page/speisekarte',27,28,2,1,1),
	(28,26,3,X'47657472C3A46E6B65',NULL,NULL,NULL,'/page/getraenkekarte',29,30,2,1,1);

/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle menu_item_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `menu_item_type`;

CREATE TABLE `menu_item_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `menu_item_type` WRITE;
/*!40000 ALTER TABLE `menu_item_type` DISABLE KEYS */;

INSERT INTO `menu_item_type` (`id`, `type`, `label`)
VALUES
	(1,'label','Label'),
	(2,'link','externer Link'),
	(3,'route','interne Route'),
	(4,'topMenuRoot','Top Menu Root'),
	(5,'bottomMenuRoot','Bottom Menu Root');

/*!40000 ALTER TABLE `menu_item_type` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle message
# ------------------------------------------------------------

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `music_style_id` int(10) unsigned DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `message_music_style_id_foreign` (`music_style_id`),
  KEY `message_email_name_index` (`email`,`name`),
  CONSTRAINT `message_music_style_id_foreign` FOREIGN KEY (`music_style_id`) REFERENCES `music_style` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;

INSERT INTO `message` (`id`, `music_style_id`, `email`, `name`, `message`, `created_at`)
VALUES
	(1,NULL,'engels@f50.de','Bernd Engels','sfasfS','2021-09-25 20:37:41');

/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle message_subject
# ------------------------------------------------------------

DROP TABLE IF EXISTS `message_subject`;

CREATE TABLE `message_subject` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Export von Tabelle migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2021_09_25_105726_create_activations_table',0),
	(2,'2021_09_25_105726_create_address_table',0),
	(3,'2021_09_25_105726_create_address_category_table',0),
	(4,'2021_09_25_105726_create_admin_activations_table',0),
	(5,'2021_09_25_105726_create_admin_password_resets_table',0),
	(6,'2021_09_25_105726_create_admin_users_table',0),
	(7,'2021_09_25_105726_create_admin_users_music_style_table',0),
	(8,'2021_09_25_105726_create_category_table',0),
	(9,'2021_09_25_105726_create_countries_table',0),
	(10,'2021_09_25_105726_create_customer_mail_table',0),
	(11,'2021_09_25_105726_create_customers_table',0),
	(12,'2021_09_25_105726_create_download_table',0),
	(13,'2021_09_25_105726_create_event_table',0),
	(14,'2021_09_25_105726_create_event_periodic_table',0),
	(15,'2021_09_25_105726_create_event_template_table',0),
	(16,'2021_09_25_105726_create_failed_jobs_table',0),
	(17,'2021_09_25_105726_create_jobs_table',0),
	(18,'2021_09_25_105726_create_links_table',0),
	(19,'2021_09_25_105726_create_media_table',0),
	(20,'2021_09_25_105726_create_menu_table',0),
	(21,'2021_09_25_105726_create_menu_item_type_table',0),
	(22,'2021_09_25_105726_create_message_table',0),
	(23,'2021_09_25_105726_create_message_subject_table',0),
	(24,'2021_09_25_105726_create_model_has_permissions_table',0),
	(25,'2021_09_25_105726_create_model_has_roles_table',0),
	(26,'2021_09_25_105726_create_music_style_table',0),
	(27,'2021_09_25_105726_create_news_table',0),
	(28,'2021_09_25_105726_create_newsletter_table',0),
	(29,'2021_09_25_105726_create_newsletter_status_table',0),
	(30,'2021_09_25_105726_create_order_table',0),
	(31,'2021_09_25_105726_create_order_item_table',0),
	(32,'2021_09_25_105726_create_page_table',0),
	(33,'2021_09_25_105726_create_password_resets_table',0),
	(34,'2021_09_25_105726_create_permissions_table',0),
	(35,'2021_09_25_105726_create_product_table',0),
	(36,'2021_09_25_105726_create_product_by_size_table',0),
	(37,'2021_09_25_105726_create_product_size_table',0),
	(38,'2021_09_25_105726_create_product_stock_table',0),
	(39,'2021_09_25_105726_create_role_has_permissions_table',0),
	(40,'2021_09_25_105726_create_roles_table',0),
	(41,'2021_09_25_105726_create_shipping_table',0),
	(42,'2021_09_25_105726_create_shoppingcart_table',0),
	(43,'2021_09_25_105726_create_subscription_items_table',0),
	(44,'2021_09_25_105726_create_subscriptions_table',0),
	(45,'2021_09_25_105726_create_telescope_entries_table',0),
	(46,'2021_09_25_105726_create_telescope_entries_tags_table',0),
	(47,'2021_09_25_105726_create_telescope_monitoring_table',0),
	(48,'2021_09_25_105726_create_theme_table',0),
	(49,'2021_09_25_105726_create_webhook_calls_table',0),
	(50,'2021_09_25_105726_create_wysiwyg_media_table',0),
	(51,'2021_09_25_105729_add_foreign_keys_to_address_table',0),
	(52,'2021_09_25_105729_add_foreign_keys_to_admin_users_music_style_table',0),
	(53,'2021_09_25_105729_add_foreign_keys_to_customer_mail_table',0),
	(54,'2021_09_25_105729_add_foreign_keys_to_download_table',0),
	(55,'2021_09_25_105729_add_foreign_keys_to_event_table',0),
	(56,'2021_09_25_105729_add_foreign_keys_to_event_periodic_table',0),
	(57,'2021_09_25_105729_add_foreign_keys_to_event_template_table',0),
	(58,'2021_09_25_105729_add_foreign_keys_to_menu_table',0),
	(59,'2021_09_25_105729_add_foreign_keys_to_message_table',0),
	(60,'2021_09_25_105729_add_foreign_keys_to_model_has_permissions_table',0),
	(61,'2021_09_25_105729_add_foreign_keys_to_model_has_roles_table',0),
	(62,'2021_09_25_105729_add_foreign_keys_to_news_table',0),
	(63,'2021_09_25_105729_add_foreign_keys_to_newsletter_table',0),
	(64,'2021_09_25_105729_add_foreign_keys_to_order_table',0),
	(65,'2021_09_25_105729_add_foreign_keys_to_order_item_table',0),
	(66,'2021_09_25_105729_add_foreign_keys_to_page_table',0),
	(67,'2021_09_25_105729_add_foreign_keys_to_product_table',0),
	(68,'2021_09_25_105729_add_foreign_keys_to_product_by_size_table',0),
	(69,'2021_09_25_105729_add_foreign_keys_to_product_stock_table',0),
	(70,'2021_09_25_105729_add_foreign_keys_to_role_has_permissions_table',0),
	(71,'2021_09_25_105729_add_foreign_keys_to_shipping_table',0),
	(72,'2021_09_25_105729_add_foreign_keys_to_telescope_entries_tags_table',0);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle model_has_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `model_has_permissions`;

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Export von Tabelle model_has_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `model_has_roles`;

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`)
VALUES
	(1,'App\\Models\\AdminUser',1),
	(2,'App\\Models\\AdminUser',1),
	(2,'App\\Models\\AdminUser',2),
	(2,'App\\Models\\AdminUser',12),
	(2,'App\\Models\\AdminUser',20),
	(2,'App\\Models\\AdminUser',45),
	(2,'App\\Models\\AdminUser',47),
	(2,'App\\Models\\AdminUser',55),
	(2,'App\\Models\\AdminUser',60),
	(2,'App\\Models\\AdminUser',90),
	(2,'App\\Models\\AdminUser',91),
	(2,'App\\Models\\AdminUser',94),
	(2,'App\\Models\\AdminUser',97),
	(2,'App\\Models\\AdminUser',101),
	(2,'App\\Models\\AdminUser',104),
	(2,'App\\Models\\AdminUser',105),
	(2,'App\\Models\\AdminUser',106),
	(3,'App\\Models\\AdminUser',12),
	(3,'App\\Models\\AdminUser',20),
	(3,'App\\Models\\AdminUser',47),
	(3,'App\\Models\\AdminUser',55),
	(3,'App\\Models\\AdminUser',60),
	(3,'App\\Models\\AdminUser',91),
	(3,'App\\Models\\AdminUser',94),
	(3,'App\\Models\\AdminUser',97),
	(3,'App\\Models\\AdminUser',101),
	(3,'App\\Models\\AdminUser',106);

/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle music_style
# ------------------------------------------------------------

DROP TABLE IF EXISTS `music_style`;

CREATE TABLE `music_style` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `music_style` WRITE;
/*!40000 ALTER TABLE `music_style` DISABLE KEYS */;

INSERT INTO `music_style` (`id`, `name`, `slug`)
VALUES
	(1,'Rock','rock'),
	(2,'Punk','punk'),
	(4,'Ska','ska'),
	(6,'Punk (Post Hardcore)','punk-post-hardcore'),
	(7,'Punk (Post Punk)','punk-post-punk'),
	(8,'Rock (Noise Rock)','rock-noise-rock'),
	(10,'Rock (Alternative Rock)','rock-alternative-rock'),
	(11,'Rock (Indie-Rock)','rock-indie-rock'),
	(12,'Grunge','grunge'),
	(13,'Rock (Post Rock)','rock-post-rock'),
	(14,'Rock (Industrial Rock)','rock-industrial-rock'),
	(15,'Rock (Dark Rock)','rock-dark-rock'),
	(16,'Rock (Hard Rock)','rock-hard-rock'),
	(17,'Rock (Psychedelic Rock)','rock-psychedelic-rock'),
	(18,'Rock (Rock ’n’ Roll)','rock-rock-n-roll'),
	(19,'Rock (Rockabilly)','rock-rockabilly'),
	(20,'Rock (Surf Rock)','rock-surf-rock'),
	(21,'Punk (Anarcho)','punk-anarcho'),
	(22,'Punk (Ska Punk)','punk-ska-punk'),
	(23,'Punk (Hardcore)','punk-hardcore'),
	(24,'Metal','metal'),
	(25,'Metal (Heavy Metal)','metal-heavy-metal'),
	(26,'Metal (Alternative Metal)','metal-alternative-metal'),
	(27,'Metal (Metalcore)','metal-metalcore'),
	(28,'Metal (Nu Metal)','metal-nu-metal'),
	(29,'House','house'),
	(30,'Jazz','jazz'),
	(31,'Blues','blues'),
	(32,'Funk','funk'),
	(33,'Beat','beat'),
	(35,'Pop','pop'),
	(36,'New Wave','new-wave'),
	(39,'Rock (Deutschrock)','rock-deutschrock'),
	(40,'Rock (Art Rock)','rock-art-rock'),
	(42,'Elektro','elektro'),
	(43,'Singer/Songwriter','singer-songwriter'),
	(44,'Acoustic','acoustic'),
	(45,'Punk (60ies)','punk-60ies'),
	(46,'Beat (60ies)','beat-60ies'),
	(47,'Reggae (Rocksteady)','reggae-rocksteady'),
	(48,'Mod','mod'),
	(49,'Hip Hop','hip-hop'),
	(50,'Punk (Desert)','punk-desert'),
	(51,'Rock (Stonerrock)','rock-stonerrock'),
	(52,'Folk','folk'),
	(53,'Folk (Folkrock)','folk-folkrock'),
	(54,'Rock (Folkrock)','rock-folkrock'),
	(55,'Rock (Countryrock)','rock-countryrock'),
	(56,'Rock (Pop Rock)','rock-pop-rock'),
	(57,'Pop (Pop Rock)','pop-pop-rock'),
	(58,'Indie','indie'),
	(59,'DJ','dj'),
	(60,'Sonstiges','sonstiges'),
	(61,'Pop (Rock Pop)','pop-rock-pop'),
	(62,'Punk (Post Punk)','punk-post-punk'),
	(63,'Reggae','reggae'),
	(64,'Open Stage','open-stage'),
	(67,'Drone/ Ambient','drone-ambient'),
	(69,'Shoegazing','shoegazing'),
	(73,'Screamo/Emo','screamo-emo'),
	(75,'Metal (Blackmetal/ Blackened)','metal-blackmetal-blackened'),
	(76,'Metal (Doom/ Sludge)','metal-doom-sludge'),
	(77,'Metal (Postmetal)','metal-postmetal');

/*!40000 ALTER TABLE `music_style` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle news
# ------------------------------------------------------------

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `end_date` date DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `show_item` tinyint(1) NOT NULL DEFAULT 0,
  `is_published` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `news_created_by_foreign` (`created_by`),
  KEY `news_updated_by_foreign` (`updated_by`),
  CONSTRAINT `news_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admin_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `news_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admin_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Export von Tabelle page
# ------------------------------------------------------------

DROP TABLE IF EXISTS `page`;

CREATE TABLE `page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_by` int(10) unsigned NOT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `page_created_by_foreign` (`created_by`),
  KEY `page_updated_by_foreign` (`updated_by`),
  CONSTRAINT `page_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admin_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `page_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admin_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;

INSERT INTO `page` (`id`, `created_by`, `updated_by`, `title`, `slug`, `body`, `is_published`, `created_at`, `updated_at`)
VALUES
	(1,1,1,'Impressum','impressum','<h2><strong>ZOSCH - Veranstaltungskneipe GbR</strong></h2><p>Betreiber: Mohamed-Abdul-Razzak, Johannes Heinrich</p><p>Tocholskystr. 30<br>\n10117 Berlin<br>\nFon: 030 2807664<br>\nEmail: <a href=\"mailto:info@zosch-berlin.de\">info@zosch-berlin.de</a><br>\n<br>\nFür den Inhalt der Links und Pressetexte sind ausschliesslich die<br>\nBands und Musikgruppen verantworlich.</p>',1,'2012-06-09 01:10:21','2021-09-24 17:48:53'),
	(2,1,1,'Band Infos','band-infos','<p>\r\n	&nbsp;</p>\r\n<div class=\"pageContent\">\r\n	<h3 style=\"color:red;\">\r\n		Bitte keine Tontr&auml;ger (CD etc) mehr an uns schicken!</h3>\r\n	<p>\r\n		Schickt uns einfach (per Email oder unserem <a href=\"http://schoki.loc/messageBand/new\" title=\"Kontak-Formular\">Kontak-Formular</a>) Links von Euren Songs (Youtube, Soundcloud etc).</p>\r\n</div>\r\n<p>\r\n	&nbsp;</p>',0,'2012-06-24 19:06:39','2013-02-24 02:15:38'),
	(3,1,1,'Datenschutz','datenschutz','<p>Diese Datenschutzerklärung soll die Nutzer dieser Website über die Art, den Umfang und den Zweck der Erhebung und Verwendung personenbezogener Daten durch den Websitebetreiber \"Goldenacker e.V\" informieren. Der Websitebetreiber nimmt Ihren Datenschutz sehr ernst und behandelt Ihre personenbezogenen Daten vertraulich und entsprechend der gesetzlichen Vorschriften. Da durch neue Technologien und die ständige Weiterentwicklung dieser Webseite Änderungen an dieser Datenschutzerklärung vorgenommen werden können, empfehlen wir Ihnen sich die Datenschutzerklärung in regelmäßigen Abständen wieder durchzulesen. Definitionen der verwendeten Begriffe (z.B. “personenbezogene Daten” oder “Verarbeitung”) finden Sie in Art. 4 DSGVO.</p>\n<p>\n	<br>\n	<strong>Zugriffsdaten</strong></p>\n<p>\n	Wir, der Websitebetreiber bzw. Seitenprovider, erheben aufgrund unseres berechtigten Interesses (s. Art. 6 Abs. 1 lit. f. DSGVO) Daten über Zugriffe auf die Website und speichern diese als \"Server-Logfiles\" auf dem Server der Website ab. Folgende Daten werden so protokolliert:<br>\n	<br>\n	- Besuchte Website<br>\n	- Uhrzeit zum Zeitpunkt des Zugriffes<br>\n	- Menge der gesendeten Daten in Byte<br>\n	- Quelle/Verweis, von welchem Sie auf die Seite gelangten<br>\n	- Verwendeter Browser<br>\n	- Verwendetes Betriebssystem<br>\n	- Verwendete IP-Adresse<br>\n	<br>\n	Die Server-Logfiles werden für maximal 7 Tage gespeichert und anschließend gelöscht.<br>\n	Die Speicherung der Daten erfolgt aus Sicherheitsgründen, um z. B. Missbrauchsfälle aufklären zu können.&nbsp; Müssen Daten aus Beweisgründen aufgehoben werden, sind sie solange von der Löschung ausgenommen bis der Vorfall endgültig geklärt ist.</p>\n<p>\n	<br>\n	<strong>Cookies, Session-Daten</strong><br>\n	<br>\n	Diese Website verwendet einzig und allein Sitzungs-Cookies, die nicht an Dritte übertragen werden. Bei Cookies handelt es sich um kleine Dateien, welche auf Ihrem Endgerät gespeichert werden. Ihr Browser greift auf diese Dateien zu. Durch den Einsatz von Cookies erhöht sich die Benutzerfreundlichkeit und Sicherheit dieser Website. Falls Sie nicht möchten, dass Cookies&nbsp; auf Ihrem Endgerät gespeichert werden, können Sie dem Einsatz dieser Dateien hier widersprechen:<br>\n	<br>\n	- Cookie-Deaktivierungsseite der Netzwerkwerbeinitiative: http://optout.networkadvertising.org/?c=1#!/<br>\n	- Cookie-Deaktivierungsseite der US-amerikanischen Website: http://optout.aboutads.info/?c=2#!/<br>\n	- Cookie-Deaktivierungsseite der europäischen Website: http://optout.networkadvertising.org/?c=1#!/<br>\n	<br>\n	Gängige Browser bieten die Einstellungsoption, Cookies nicht zuzulassen. Hinweis: Es ist nicht gewährleistet, dass Sie auf alle Funktionen dieser Website ohne Einschränkungen zugreifen können, wenn Sie entsprechende Einstellungen vornehmen.</p>\n<p>\n	<br>\n	<strong>Erfassung und Verarbeitung personenbezogener Daten</strong><br>\n	<br>\n	Der Websitebetreiber erhebt, nutzt und gibt Ihre personenbezogenen Daten nur dann weiter, wenn dies im gesetzlichen Rahmen erlaubt ist oder Sie in die Datenerhebung einwilligen. Als personenbezogene Daten gelten sämtliche Informationen, welche dazu dienen, Ihre Person zu bestimmen und welche zu Ihnen zurückverfolgt werden können – also beispielsweise Ihr Name, Ihre E-Mail-Adresse und Telefonnummer. Diese Website können Sie auch besuchen, ohne Angaben zu Ihrer Person zu machen. Zur Verbesserung unseres Online-Angebotes speichern wir jedoch (ohne Personenbezug) Ihre Zugriffsdaten auf diese Website.<br>\n	Zu diesen Zugriffsdaten gehören z. B. die von Ihnen angeforderte Datei oder der Name Ihres Internet-Providers. Durch die Anonymisierung der Daten sind Rückschlüsse auf Ihre Person nicht möglich.</p>\n<p>\n	<br>\n	<strong>Umgang mit Kontaktdaten</strong><br>\n	<br>\n	Nehmen Sie mit uns als Websitebetreiber durch die angebotenen Kontaktmöglichkeiten Verbindung auf, werden Ihre Angaben gespeichert, damit auf diese zur Bearbeitung und Beantwortung Ihrer Anfrage zurückgegriffen werden kann. Ohne Ihre Einwilligung werden diese Daten nicht an Dritte weitergegeben.</p>\n<p>\n	<br>\n	<strong>Google Analytics, Facebook Social-Media-Plugins</strong><br>\n	Beides wird von uns derzeit nicht verwendet.</p>\n<p>\n	<br>\n	<strong>Newsletter-Abonnement</strong><br>\n	<br>\n	Der Websitebetreiber bietet Ihnen einen Newsletter an, in welchem er Sie über aktuelle Veranstaltungen informiert. Möchten Sie den Newsletter abonnieren, müssen Sie eine valide E-Mail-Adresse angeben. Wenn Sie den Newsletter abonnieren, erklären Sie sich mit dem Newsletter-Empfang und den erläuterten Verfahren einverstanden. Der Newsletterversand erfolgt durch unsere eigenen Redakteure unserer Webseite www.schokoladen-mitte.de. Die Newsletter enthalten einzig und allein unsren jeweils aktuellen Veranstaltungsplan. Sie enthalten keinerlei sonstige Werbung. Sie werden in der Regel monatlich versand.</p>\n<p>\n	<br>\n	<strong>Widerruf und Kündigung:</strong><br>\n	<br>\n	Ihre Einwilligung zum Erhalt des Newsletter können Sie jederzeit widerrufen und somit das Newsletter-Abonnement kündigen. Nach Ihrer Kündigung erfolgt die Löschung Ihre personenbezogenen Daten. Ihre Einwilligung in den Newsletterversand erlischt gleichzeitig. Am Ende jedes Newsletters finden Sie den Link zur Kündigung.<br>\n	<br>\n	<br>\n	<strong>Rechte des Nutzers</strong><br>\n	<br>\n	Sie haben als Nutzer das Recht, auf Antrag eine kostenlose Auskunft darüber zu erhalten, welche personenbezogenen Daten über Sie gespeichert wurden. Sie haben außerdem das Recht auf Berichtigung falscher Daten und auf die Verarbeitungseinschränkung oder Löschung Ihrer personenbezogenen Daten. Falls zutreffend, können Sie auch Ihr Recht auf Datenportabilität geltend machen. Sollten Sie annehmen, dass Ihre Daten unrechtmäßig verarbeitet wurden, können Sie eine Beschwerde bei der zuständigen Aufsichtsbehörde einreichen.<br>\n	<br>\n	<br>\n	<strong>Löschung von Daten</strong><br>\n	<br>\n	Sofern Ihr Wunsch nicht mit einer gesetzlichen Pflicht zur Aufbewahrung von Daten (z. B. Vorratsdatenspeicherung) kollidiert, haben Sie ein Anrecht auf Löschung Ihrer Daten. Von uns gespeicherte Daten werden, sollten sie für ihre Zweckbestimmung nicht mehr vonnöten sein und es keine gesetzlichen Aufbewahrungsfristen geben, gelöscht. Falls eine Löschung nicht durchgeführt werden kann, da die Daten für zulässige gesetzliche Zwecke erforderlich sind, erfolgt eine Einschränkung der Datenverarbeitung. In diesem Fall werden die Daten gesperrt und nicht für andere Zwecke verarbeitet.<br>\n	<br>\n	<br>\n	<strong>Widerspruchsrecht</strong><br>\n	<br>\n	Nutzer dieser Webseite können von ihrem Widerspruchsrecht Gebrauch machen und der Verarbeitung ihrer personenbezogenen Daten zu jeder Zeit widersprechen. Wenn Sie eine Berichtigung, Sperrung, Löschung oder Auskunft über die zu Ihrer Person gespeicherten personenbezogenen Daten wünschen oder Fragen bzgl. der Erhebung, Verarbeitung oder Verwendung Ihrer personenbezogenen Daten haben oder erteilte Einwilligungen widerrufen möchten, wenden Sie sich bitte an folgende E-Mail-Adresse: info@schokoladen-mitte.de</p>\n<p>\n	&nbsp;</p>',1,'2018-12-06 23:05:41','2020-12-17 16:18:51'),
	(4,1,1,'Nutzungsbedingungen','nutzungsbedingungen','<p>Diese Erklärung soll die Nutzer dieser Website über die Art, den Umfang und den Zweck der Erhebung und Verwendung personenbezogener Daten durch den Websitebetreiber \"Goldenacker e.V\" informieren. Der Websitebetreiber nimmt Ihren Datenschutz sehr ernst und behandelt Ihre personenbezogenen Daten vertraulich und entsprechend der gesetzlichen Vorschriften. Da durch neue Technologien und die ständige Weiterentwicklung dieser Webseite Änderungen an dieser Datenschutzerklärung vorgenommen werden können, empfehlen wir Ihnen sich die Datenschutzerklärung in regelmäßigen Abständen wieder durchzulesen. Definitionen der verwendeten Begriffe (z.B. “personenbezogene Daten” oder “Verarbeitung”) finden Sie in Art. 4 DSGVO.</p>\n<p>\n	<br>\n	<strong>Zugriffsdaten</strong></p>\n<p>\n	Wir, der Websitebetreiber bzw. Seitenprovider, erheben aufgrund unseres berechtigten Interesses (s. Art. 6 Abs. 1 lit. f. DSGVO) Daten über Zugriffe auf die Website und speichern diese als \"Server-Logfiles\" auf dem Server der Website ab. Folgende Daten werden so protokolliert:<br>\n	<br>\n	- Besuchte Website<br>\n	- Uhrzeit zum Zeitpunkt des Zugriffes<br>\n	- Menge der gesendeten Daten in Byte<br>\n	- Quelle/Verweis, von welchem Sie auf die Seite gelangten<br>\n	- Verwendeter Browser<br>\n	- Verwendetes Betriebssystem<br>\n	- Verwendete IP-Adresse<br>\n	<br>\n	Die Server-Logfiles werden für maximal 7 Tage gespeichert und anschließend gelöscht.<br>\n	Die Speicherung der Daten erfolgt aus Sicherheitsgründen, um z. B. Missbrauchsfälle aufklären zu können.&nbsp; Müssen Daten aus Beweisgründen aufgehoben werden, sind sie solange von der Löschung ausgenommen bis der Vorfall endgültig geklärt ist.</p>\n<p>\n	<br>\n	<strong>Cookies, Session-Daten</strong><br>\n	<br>\n	Diese Website verwendet einzig und allein Sitzungs-Cookies, die nicht an Dritte übertragen werden. Bei Cookies handelt es sich um kleine Dateien, welche auf Ihrem Endgerät gespeichert werden. Ihr Browser greift auf diese Dateien zu. Durch den Einsatz von Cookies erhöht sich die Benutzerfreundlichkeit und Sicherheit dieser Website. Falls Sie nicht möchten, dass Cookies&nbsp; auf Ihrem Endgerät gespeichert werden, können Sie dem Einsatz dieser Dateien hier widersprechen:<br>\n	<br>\n	- Cookie-Deaktivierungsseite der Netzwerkwerbeinitiative: http://optout.networkadvertising.org/?c=1#!/<br>\n	- Cookie-Deaktivierungsseite der US-amerikanischen Website: http://optout.aboutads.info/?c=2#!/<br>\n	- Cookie-Deaktivierungsseite der europäischen Website: http://optout.networkadvertising.org/?c=1#!/<br>\n	<br>\n	Gängige Browser bieten die Einstellungsoption, Cookies nicht zuzulassen. Hinweis: Es ist nicht gewährleistet, dass Sie auf alle Funktionen dieser Website ohne Einschränkungen zugreifen können, wenn Sie entsprechende Einstellungen vornehmen.</p>\n<p>\n	<br>\n	<strong>Erfassung und Verarbeitung personenbezogener Daten</strong><br>\n	<br>\n	Der Websitebetreiber erhebt, nutzt und gibt Ihre personenbezogenen Daten nur dann weiter, wenn dies im gesetzlichen Rahmen erlaubt ist oder Sie in die Datenerhebung einwilligen. Als personenbezogene Daten gelten sämtliche Informationen, welche dazu dienen, Ihre Person zu bestimmen und welche zu Ihnen zurückverfolgt werden können – also beispielsweise Ihr Name, Ihre E-Mail-Adresse und Telefonnummer. Diese Website können Sie auch besuchen, ohne Angaben zu Ihrer Person zu machen. Zur Verbesserung unseres Online-Angebotes speichern wir jedoch (ohne Personenbezug) Ihre Zugriffsdaten auf diese Website.<br>\n	Zu diesen Zugriffsdaten gehören z. B. die von Ihnen angeforderte Datei oder der Name Ihres Internet-Providers. Durch die Anonymisierung der Daten sind Rückschlüsse auf Ihre Person nicht möglich.</p>\n<p>\n	<br>\n	<strong>Umgang mit Kontaktdaten</strong><br>\n	<br>\n	Nehmen Sie mit uns als Websitebetreiber durch die angebotenen Kontaktmöglichkeiten Verbindung auf, werden Ihre Angaben gespeichert, damit auf diese zur Bearbeitung und Beantwortung Ihrer Anfrage zurückgegriffen werden kann. Ohne Ihre Einwilligung werden diese Daten nicht an Dritte weitergegeben.</p>\n<p>\n	<br>\n	<strong>Google Analytics, Facebook Social-Media-Plugins</strong><br>\n	Beides wird von uns derzeit nicht verwendet.</p>\n<p>\n	<br>\n	<strong>Newsletter-Abonnement</strong><br>\n	<br>\n	Der Websitebetreiber bietet Ihnen einen Newsletter an, in welchem er Sie über aktuelle Veranstaltungen informiert. Möchten Sie den Newsletter abonnieren, müssen Sie eine valide E-Mail-Adresse angeben. Wenn Sie den Newsletter abonnieren, erklären Sie sich mit dem Newsletter-Empfang und den erläuterten Verfahren einverstanden. Der Newsletterversand erfolgt durch unsere eigenen Redakteure unserer Webseite www.schokoladen-mitte.de. Die Newsletter enthalten einzig und allein unsren jeweils aktuellen Veranstaltungsplan. Sie enthalten keinerlei sonstige Werbung. Sie werden in der Regel monatlich versand.</p>\n<p>\n	<br>\n	<strong>Widerruf und Kündigung:</strong><br>\n	<br>\n	Ihre Einwilligung zum Erhalt des Newsletter können Sie jederzeit widerrufen und somit das Newsletter-Abonnement kündigen. Nach Ihrer Kündigung erfolgt die Löschung Ihre personenbezogenen Daten. Ihre Einwilligung in den Newsletterversand erlischt gleichzeitig. Am Ende jedes Newsletters finden Sie den Link zur Kündigung.<br>\n	<br>\n	<br>\n	<strong>Rechte des Nutzers</strong><br>\n	<br>\n	Sie haben als Nutzer das Recht, auf Antrag eine kostenlose Auskunft darüber zu erhalten, welche personenbezogenen Daten über Sie gespeichert wurden. Sie haben außerdem das Recht auf Berichtigung falscher Daten und auf die Verarbeitungseinschränkung oder Löschung Ihrer personenbezogenen Daten. Falls zutreffend, können Sie auch Ihr Recht auf Datenportabilität geltend machen. Sollten Sie annehmen, dass Ihre Daten unrechtmäßig verarbeitet wurden, können Sie eine Beschwerde bei der zuständigen Aufsichtsbehörde einreichen.<br>\n	<br>\n	<br>\n	<strong>Löschung von Daten</strong><br>\n	<br>\n	Sofern Ihr Wunsch nicht mit einer gesetzlichen Pflicht zur Aufbewahrung von Daten (z. B. Vorratsdatenspeicherung) kollidiert, haben Sie ein Anrecht auf Löschung Ihrer Daten. Von uns gespeicherte Daten werden, sollten sie für ihre Zweckbestimmung nicht mehr vonnöten sein und es keine gesetzlichen Aufbewahrungsfristen geben, gelöscht. Falls eine Löschung nicht durchgeführt werden kann, da die Daten für zulässige gesetzliche Zwecke erforderlich sind, erfolgt eine Einschränkung der Datenverarbeitung. In diesem Fall werden die Daten gesperrt und nicht für andere Zwecke verarbeitet.<br>\n	<br>\n	<br>\n	<strong>Widerspruchsrecht</strong><br>\n	<br>\n	Nutzer dieser Webseite können von ihrem Widerspruchsrecht Gebrauch machen und der Verarbeitung ihrer personenbezogenen Daten zu jeder Zeit widersprechen. Wenn Sie eine Berichtigung, Sperrung, Löschung oder Auskunft über die zu Ihrer Person gespeicherten personenbezogenen Daten wünschen oder Fragen bzgl. der Erhebung, Verarbeitung oder Verwendung Ihrer personenbezogenen Daten haben oder erteilte Einwilligungen widerrufen möchten, wenden Sie sich bitte an folgende E-Mail-Adresse: info@schokoladen-mitte.de</p>\n<p>\n	&nbsp;</p>',1,'2020-12-17 16:21:00','2020-12-17 16:22:35'),
	(5,1,1,'Speisekarte','speisekarte','<table class=\"table\">\n<tbody>\n<tr><td><strong>Rühreier mit Speck</strong></td><td>5 €</td></tr>\n<tr><td><strong>3 Kartoffelpuffer</strong></td><td>7 €</td></tr>\n<tr><td><strong>Fisch mit Gräten</strong></td><td>10 €</td></tr>\n<tr><td><strong>Bockwurst mit Brot</strong><br></td><td>2,50 €</td></tr>\n<tr><td><strong>Currywurst mit Schrippe</strong></td><td>3,50 €</td></tr>\n<tr><td><strong>Schniedelwutz mit Senf</strong></td><td>umsonst</td></tr>\n<tr><td><strong>1 Paar Weisswürste</strong></td><td>4 €</td></tr>\n<tr><td><strong>Hannes in Aspik</strong></td><td>100 €</td></tr>\n</tbody>\n</table>',1,'2021-09-25 01:25:33','2021-09-25 01:44:14'),
	(6,1,NULL,'Getränkekarte','getraenkekarte','<p><br><table class=\"table\"><tbody><tr><td><strong>Bier 0.5 L </strong><br></td><td>5 €<br></td></tr><tr><td><strong>Cola 0.3 L</strong><br></td><td>4 €<br></td></tr><tr><td><strong>Wasser </strong><br></td><td>umsonst</td></tr></tbody></table></p>',1,'2021-09-25 01:27:50','2021-09-25 01:27:50');

/*!40000 ALTER TABLE `page` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Export von Tabelle permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`)
VALUES
	(1,'admin','admin','2020-12-02 00:41:45','2020-12-02 00:41:45'),
	(2,'translation.index','admin','2020-12-02 00:41:45','2020-12-02 00:41:45'),
	(3,'translation.edit','admin','2020-12-02 00:41:45','2020-12-02 00:41:45'),
	(4,'translation.rescan','admin','2020-12-02 00:41:45','2020-12-02 00:41:45'),
	(5,'admin-user.index','admin','2020-12-02 00:41:45','2020-12-02 00:41:45'),
	(6,'admin-user.create','admin','2020-12-02 00:41:45','2020-12-02 00:41:45'),
	(7,'admin-user.edit','admin','2020-12-02 00:41:45','2020-12-02 00:41:45'),
	(8,'admin-user.delete','admin','2020-12-02 00:41:45','2020-12-02 00:41:45'),
	(9,'upload','admin','2020-12-02 00:41:45','2020-12-02 00:41:45'),
	(10,'admin-user.impersonal-login','admin','2020-12-02 00:41:45','2020-12-02 00:41:45'),
	(11,'category','admin','2020-12-02 00:41:45','2020-12-02 00:41:45'),
	(12,'category.index','admin','2020-12-02 00:41:45','2020-12-02 00:41:45'),
	(13,'category.create','admin','2020-12-02 00:41:45','2020-12-02 00:41:45'),
	(14,'category.show','admin','2020-12-02 00:41:45','2020-12-02 00:41:45'),
	(15,'category.edit','admin','2020-12-02 00:41:45','2020-12-02 00:41:45'),
	(16,'category.delete','admin','2020-12-02 00:41:45','2020-12-02 00:41:45'),
	(17,'category.bulk-delete','admin','2020-12-02 00:41:45','2020-12-02 00:41:45'),
	(18,'theme','admin','2020-12-02 00:41:45','2020-12-02 00:41:45'),
	(19,'theme.index','admin','2020-12-02 00:41:45','2020-12-02 00:41:45'),
	(20,'theme.create','admin','2020-12-02 00:41:45','2020-12-02 00:41:45'),
	(21,'theme.show','admin','2020-12-02 00:41:45','2020-12-02 00:41:45'),
	(22,'theme.edit','admin','2020-12-02 00:41:45','2020-12-02 00:41:45'),
	(23,'theme.delete','admin','2020-12-02 00:41:45','2020-12-02 00:41:45'),
	(24,'theme.bulk-delete','admin','2020-12-02 00:41:45','2020-12-02 00:41:45'),
	(25,'event-template','admin','2020-12-02 00:41:45','2020-12-02 00:41:45'),
	(26,'event-template.index','admin','2020-12-02 00:41:45','2020-12-02 00:41:45'),
	(27,'event-template.create','admin','2020-12-02 00:41:45','2020-12-02 00:41:45'),
	(28,'event-template.show','admin','2020-12-02 00:41:45','2020-12-02 00:41:45'),
	(29,'event-template.edit','admin','2020-12-02 00:41:45','2020-12-02 00:41:45'),
	(30,'event-template.delete','admin','2020-12-02 00:41:45','2020-12-02 00:41:45'),
	(31,'event-template.bulk-delete','admin','2020-12-02 00:41:45','2020-12-02 00:41:45'),
	(32,'event-periodic','admin','2020-12-02 00:41:45','2020-12-02 00:41:45'),
	(33,'event-periodic.index','admin','2020-12-02 00:41:45','2020-12-02 00:41:45'),
	(34,'event-periodic.create','admin','2020-12-02 00:41:45','2020-12-02 00:41:45'),
	(35,'event-periodic.show','admin','2020-12-02 00:41:45','2020-12-02 00:41:45'),
	(36,'event-periodic.edit','admin','2020-12-02 00:41:45','2020-12-02 00:41:45'),
	(37,'event-periodic.delete','admin','2020-12-02 00:41:45','2020-12-02 00:41:45'),
	(38,'event-periodic.bulk-delete','admin','2020-12-02 00:41:45','2020-12-02 00:41:45'),
	(39,'page','admin','2020-12-02 00:41:45','2020-12-02 00:41:45'),
	(40,'page.index','admin','2020-12-02 00:41:45','2020-12-02 00:41:45'),
	(41,'page.create','admin','2020-12-02 00:41:45','2020-12-02 00:41:45'),
	(42,'page.show','admin','2020-12-02 00:41:45','2020-12-02 00:41:45'),
	(43,'page.edit','admin','2020-12-02 00:41:45','2020-12-02 00:41:45'),
	(44,'page.delete','admin','2020-12-02 00:41:45','2020-12-02 00:41:45'),
	(45,'page.bulk-delete','admin','2020-12-02 00:41:45','2020-12-02 00:41:45'),
	(46,'event','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(47,'event.index','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(48,'event.create','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(49,'event.show','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(50,'event.edit','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(51,'event.delete','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(52,'event.bulk-delete','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(53,'role','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(54,'role.index','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(55,'role.create','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(56,'role.show','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(57,'role.edit','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(58,'role.delete','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(59,'role.bulk-delete','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(60,'permission','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(61,'permission.index','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(62,'permission.create','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(63,'permission.show','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(64,'permission.edit','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(65,'permission.delete','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(66,'permission.bulk-delete','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(74,'address-category','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(75,'address-category.index','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(76,'address-category.create','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(77,'address-category.show','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(78,'address-category.edit','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(79,'address-category.delete','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(80,'address-category.bulk-delete','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(81,'address','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(82,'address.index','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(83,'address.create','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(84,'address.show','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(85,'address.edit','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(86,'address.delete','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(87,'address.bulk-delete','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(88,'music-style','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(89,'music-style.index','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(90,'music-style.create','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(91,'music-style.show','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(92,'music-style.edit','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(93,'music-style.delete','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(94,'music-style.bulk-delete','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(95,'message','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(96,'message.index','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(97,'message.create','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(98,'message.show','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(99,'message.edit','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(100,'message.delete','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(101,'message.bulk-delete','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(102,'news','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(103,'news.index','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(104,'news.create','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(105,'news.show','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(106,'news.edit','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(107,'news.delete','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(108,'news.bulk-delete','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(109,'menu','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(110,'menu.index','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(111,'menu.create','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(112,'menu.show','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(113,'menu.edit','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(114,'menu.delete','admin','2020-12-02 00:41:46','2020-12-02 00:41:46'),
	(115,'menu.bulk-delete','admin','2020-12-02 00:41:46','2020-12-02 00:41:46');

/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle role_has_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role_has_permissions`;

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`)
VALUES
	(1,2),
	(2,2),
	(3,2),
	(4,2),
	(5,2),
	(6,1),
	(7,1),
	(7,2),
	(8,1),
	(9,1),
	(9,2),
	(11,2),
	(12,2),
	(13,2),
	(14,2),
	(15,2),
	(16,2),
	(17,2),
	(18,2),
	(19,2),
	(20,2),
	(21,2),
	(22,2),
	(23,2),
	(24,2),
	(25,2),
	(26,2),
	(27,2),
	(28,2),
	(29,2),
	(30,2),
	(31,2),
	(32,2),
	(33,2),
	(34,2),
	(35,2),
	(36,2),
	(37,2),
	(38,2),
	(39,2),
	(40,2),
	(41,2),
	(42,2),
	(43,2),
	(44,2),
	(45,2),
	(46,2),
	(47,2),
	(48,2),
	(49,2),
	(50,2),
	(51,2),
	(52,2),
	(53,1),
	(54,1),
	(55,1),
	(56,1),
	(57,1),
	(58,1),
	(59,1),
	(60,1),
	(61,1),
	(62,1),
	(63,1),
	(64,1),
	(65,1),
	(66,1),
	(74,2),
	(75,2),
	(76,2),
	(77,2),
	(78,2),
	(79,2),
	(80,2),
	(81,2),
	(82,2),
	(83,2),
	(84,2),
	(85,2),
	(86,2),
	(87,2),
	(88,2),
	(89,2),
	(90,2),
	(91,2),
	(92,2),
	(93,2),
	(94,2),
	(95,2),
	(96,2),
	(97,2),
	(98,2),
	(99,2),
	(100,2),
	(101,2),
	(102,2),
	(103,2),
	(104,2),
	(105,2),
	(106,2),
	(107,2),
	(108,2),
	(109,2),
	(110,2),
	(111,2),
	(112,2),
	(113,2),
	(114,2),
	(115,2);

/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`)
VALUES
	(1,'Administrator','admin','2020-12-02 00:41:45','2020-12-02 00:41:45'),
	(2,'Booker','admin','2020-12-02 22:10:03','2020-12-02 22:10:03'),
	(3,'Customer','web','2020-12-02 22:13:13','2020-12-02 22:13:13');

/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle theme
# ------------------------------------------------------------

DROP TABLE IF EXISTS `theme`;

CREATE TABLE `theme` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `theme` WRITE;
/*!40000 ALTER TABLE `theme` DISABLE KEYS */;

INSERT INTO `theme` (`id`, `name`, `slug`, `icon`)
VALUES
	(1,'Jazz','jazz',NULL);

/*!40000 ALTER TABLE `theme` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `translations`;

CREATE TABLE `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `namespace` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '*',
  `group` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `translations_namespace_index` (`namespace`),
  KEY `translations_group_index` (`group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;

INSERT INTO `translations` (`id`, `namespace`, `group`, `key`, `text`, `metadata`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'*','admin','address.columns.id','{\"en\":\"ID\",\"de\":\"ID\"}',NULL,'2021-05-27 13:12:56','2021-09-24 23:15:45',NULL),
	(2,'*','admin','address.columns.address_category_id','{\"en\":\"Address category\",\"de\":\"Adresskategorie\"}',NULL,'2021-05-27 13:12:56','2021-09-24 23:15:45',NULL),
	(3,'*','admin','address.columns.email','[]',NULL,'2021-05-27 13:12:56','2021-09-24 23:15:45',NULL),
	(4,'*','admin','address.columns.token','[]',NULL,'2021-05-27 13:12:56','2021-09-24 23:15:45',NULL),
	(5,'*','admin','address.columns.info_on_changes','[]',NULL,'2021-05-27 13:12:56','2021-09-24 23:15:45',NULL),
	(6,'*','admin','category.columns.id','[]',NULL,'2021-05-27 13:12:56','2021-09-24 23:15:45',NULL),
	(7,'*','admin','category.columns.name','{\"en\":\"Name\",\"de\":\"Name\"}',NULL,'2021-05-27 13:12:56','2021-09-24 23:15:45',NULL),
	(8,'*','admin','category.columns.slug','[]',NULL,'2021-05-27 13:12:56','2021-09-24 23:15:45',NULL),
	(9,'*','admin','category.columns.icon','[]',NULL,'2021-05-27 13:12:56','2021-09-24 23:15:45',NULL),
	(10,'*','admin','event.columns.id','[]',NULL,'2021-05-27 13:12:56','2021-09-24 23:15:45',NULL),
	(11,'*','admin','event.columns.theme_id','[]',NULL,'2021-05-27 13:12:56','2021-09-24 23:15:45',NULL),
	(12,'*','admin','event.columns.category_id','[]',NULL,'2021-05-27 13:12:56','2021-09-24 23:15:45',NULL),
	(13,'*','admin','event.columns.created_by','[]',NULL,'2021-05-27 13:12:56','2021-09-24 23:15:45',NULL),
	(14,'*','admin','event.columns.updated_by','[]',NULL,'2021-05-27 13:12:56','2021-09-24 23:15:45',NULL),
	(15,'*','admin','event.columns.title','[]',NULL,'2021-05-27 13:12:56','2021-09-24 23:15:45',NULL),
	(16,'*','admin','event.columns.subtitle','[]',NULL,'2021-05-27 13:12:56','2021-09-24 23:15:45',NULL),
	(17,'*','admin','event.columns.description','[]',NULL,'2021-05-27 13:12:56','2021-09-24 23:15:45',NULL),
	(18,'*','admin','event.columns.links','[]',NULL,'2021-05-27 13:12:56','2021-09-24 23:15:45',NULL),
	(19,'*','admin','event.columns.event_date','[]',NULL,'2021-05-27 13:12:56','2021-09-24 23:15:45',NULL),
	(20,'*','admin','event.columns.event_time','[]',NULL,'2021-05-27 13:12:56','2021-09-24 23:15:45',NULL),
	(21,'*','admin','event.columns.price','[]',NULL,'2021-05-27 13:12:56','2021-09-24 23:15:45',NULL),
	(22,'*','admin','event.columns.is_published','[]',NULL,'2021-05-27 13:12:56','2021-09-24 23:15:45',NULL),
	(23,'*','admin','event-periodic.columns.id','[]',NULL,'2021-05-27 13:12:56','2021-09-24 23:15:45',NULL),
	(24,'*','admin','event-periodic.columns.theme_id','[]',NULL,'2021-05-27 13:12:56','2021-09-24 23:15:45',NULL),
	(25,'*','admin','event-periodic.columns.category_id','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(26,'*','admin','event-periodic.columns.periodic_position','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(27,'*','admin','event-periodic.columns.periodic_weekday','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(28,'*','admin','event-periodic.columns.created_by','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(29,'*','admin','event-periodic.columns.updated_by','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(30,'*','admin','event-periodic.columns.title','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(31,'*','admin','event-periodic.columns.subtitle','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(32,'*','admin','event-periodic.columns.description','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(33,'*','admin','event-periodic.columns.links','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(34,'*','admin','event-periodic.columns.event_date','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(35,'*','admin','event-periodic.columns.event_time','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(36,'*','admin','event-periodic.columns.price','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(37,'*','admin','event-periodic.columns.is_published','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(38,'*','admin','event-template.columns.id','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(39,'*','admin','event-template.columns.theme_id','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(40,'*','admin','event-template.columns.category_id','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(41,'*','admin','event-template.columns.created_by','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(42,'*','admin','event-template.columns.updated_by','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(43,'*','admin','event-template.columns.title','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(44,'*','admin','event-template.columns.subtitle','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(45,'*','admin','event-template.columns.description','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(46,'*','admin','event-template.columns.links','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(47,'*','admin','message.columns.id','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(48,'*','admin','message.columns.music_style_id','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(49,'*','admin','message.columns.email','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(50,'*','admin','message.columns.name','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(51,'*','admin','message.columns.message','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(52,'*','admin','music-style.columns.id','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(53,'*','admin','music-style.columns.name','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(54,'*','admin','music-style.columns.slug','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(55,'*','admin','order.columns.id','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(56,'*','admin','order.columns.shoppingcart_id','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(57,'*','admin','order.columns.instance','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(58,'*','admin','order.columns.content','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(59,'*','admin','order.columns.price_total','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(60,'*','admin','order.columns.created_by','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(61,'*','admin','order.columns.updated_by','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(62,'*','admin','order.columns.delivered','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(63,'*','admin','page.columns.id','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(64,'*','admin','page.columns.created_by','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(65,'*','admin','page.columns.updated_by','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(66,'*','admin','page.columns.title','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(67,'*','admin','page.columns.slug','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(68,'*','admin','page.columns.body','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(69,'*','admin','page.columns.is_published','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(70,'*','admin','product.columns.id','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(71,'*','admin','product.columns.name','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(72,'*','admin','product.columns.description','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(73,'*','admin','product.columns.price','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(74,'*','admin','product.columns.is_published','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(75,'*','admin','product.columns.is_available','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(76,'*','admin','product.columns.created_by','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(77,'*','admin','product.columns.updated_by','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(78,'*','admin','theme.columns.id','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(79,'*','admin','theme.columns.name','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(80,'*','admin','theme.columns.slug','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(81,'*','admin','theme.columns.icon','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(82,'brackets/admin-ui','admin','operation.succeeded','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(83,'brackets/admin-ui','admin','operation.failed','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(84,'brackets/admin-ui','admin','operation.not_allowed','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(85,'*','admin','address-category.columns.tag_id','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(86,'*','admin','address-category.columns.name','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(87,'*','admin','address-category.actions.create','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(88,'brackets/admin-ui','admin','btn.save','{\"en\":\"Save\",\"de\":\"Speichen\"}',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(89,'*','admin','address-category.actions.edit','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(90,'*','admin','address-category.actions.index','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(91,'brackets/admin-ui','admin','placeholder.search','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(92,'brackets/admin-ui','admin','btn.search','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(93,'*','admin','address-category.columns.id','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(94,'brackets/admin-ui','admin','listing.selected_items','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(95,'brackets/admin-ui','admin','listing.check_all_items','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(96,'brackets/admin-ui','admin','listing.uncheck_all_items','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(97,'brackets/admin-ui','admin','btn.delete','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(98,'brackets/admin-ui','admin','btn.edit','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(99,'brackets/admin-ui','admin','pagination.overview','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(100,'brackets/admin-ui','admin','index.no_items','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(101,'brackets/admin-ui','admin','index.try_changing_items','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(102,'*','admin','address.actions.create','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(103,'*','admin','address.actions.edit','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(104,'*','admin','address.actions.index','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(105,'*','admin','address.actions.export','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(106,'*','admin','admin-user.columns.first_name','{\"en\":\"firstname\",\"de\":\"Vorname\"}',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(107,'*','admin','admin-user.columns.last_name','{\"en\":\"lastname\",\"de\":\"Nachname\"}',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(108,'*','admin','admin-user.columns.email','{\"en\":\"email\",\"de\":\"Email\"}',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(109,'*','admin','admin-user.columns.password','{\"en\":\"password\",\"de\":\"Passwort\"}',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(110,'brackets/admin-ui','admin','btn.new','{\"en\":\"New\",\"de\":\"Neu\"}',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(111,'*','admin','category.actions.create','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(112,'*','admin','category.actions.edit','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(113,'*','admin','category.actions.index','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(114,'*','admin','category.actions.export','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(115,'*','admin','country.columns.code','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(116,'*','admin','country.columns.en','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(117,'*','admin','country.columns.de','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(118,'*','admin','country.columns.es','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(119,'*','admin','country.columns.fr','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(120,'*','admin','country.columns.it','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(121,'*','admin','country.columns.ru','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(122,'*','admin','country.actions.create','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(123,'*','admin','country.actions.edit','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(124,'*','admin','country.actions.index','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(125,'*','admin','country.columns.id','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(126,'*','admin','customer.columns.name','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(127,'*','admin','customer.columns.email','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(128,'*','admin','customer.columns.password','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(129,'*','admin','customer.columns.password_repeat','{\"en\":\"repeat password\",\"de\":\"Passwort wiederholen\"}',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(130,'brackets/admin-ui','admin','forms.select_options','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(131,'*','admin','customer.actions.create','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(132,'*','admin','customer.actions.edit','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(133,'*','admin','customer.actions.index','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(134,'brackets/admin-ui','admin','forms.select_a_date','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(135,'brackets/admin-ui','admin','forms.select_a_time','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(136,'*','admin','event-periodic.actions.create','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(137,'*','admin','event-periodic.actions.edit','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(138,'*','admin','event-periodic.actions.index','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(139,'*','admin','event-periodic.actions.export','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(140,'*','admin','event-template.actions.create','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(141,'*','admin','event-template.actions.edit','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(142,'*','admin','event-template.actions.index','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(143,'*','admin','event-template.actions.export','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(144,'*','admin','event.actions.index','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(145,'*','admin','event.actions.export','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(146,'*','admin','event.actions.create','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(147,'*','admin','event.actions.edit','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(148,'brackets/admin-ui','admin','page_title_suffix','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(149,'brackets/admin-ui','admin','profile_dropdown.account','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(150,'brackets/admin-auth','admin','profile_dropdown.profile','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(151,'brackets/admin-auth','admin','profile_dropdown.password','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(152,'brackets/admin-auth','admin','profile_dropdown.logout','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(153,'brackets/admin-ui','admin','sidebar.content','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(154,'*','admin','event.title','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(155,'*','admin','event-periodic.title','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(156,'*','admin','category.title','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(157,'*','admin','theme.title','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(158,'*','admin','page.title','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(159,'*','admin','news.title','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(160,'*','admin','music-style.title','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(161,'*','admin','menu.title','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(162,'*','admin','message.title','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(163,'*','admin','address-category.title','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(164,'*','admin','address.title','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(165,'*','admin','newsletter-status.title','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(166,'*','admin','newsletter.title','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(167,'*','admin','product.title','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(168,'*','admin','order.title','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(169,'*','admin','country.title','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(170,'*','admin','role.title','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(171,'*','admin','permission.title','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(172,'*','admin','menu.columns.parent_id','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(173,'*','admin','menu.columns.menu_item_type_id','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(174,'*','admin','menu.columns.name','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(175,'*','admin','menu.columns.icon','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(176,'*','admin','menu.columns.fa_icon','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(177,'*','admin','menu.columns.url','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(178,'*','admin','menu.columns.lft','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(179,'*','admin','menu.columns.rgt','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(180,'*','admin','menu.columns.lvl','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(181,'*','admin','menu.columns.api_enabled','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(182,'*','admin','menu.columns.is_published','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(183,'*','admin','menu.actions.create','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(184,'*','admin','menu.actions.edit','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(185,'*','admin','menu.actions.index','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(186,'*','admin','menu.columns.id','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(187,'*','admin','message.actions.create','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(188,'*','admin','message.actions.edit','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(189,'*','admin','message.actions.index','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(190,'*','admin','message.actions.export','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(191,'*','admin','message.actions.show','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(192,'*','admin','music-style.actions.create','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(193,'*','admin','music-style.actions.edit','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(194,'*','admin','music-style.actions.index','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(195,'*','admin','music-style.actions.export','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(196,'*','admin','news.columns.end_date','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(197,'*','admin','news.columns.title','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(198,'*','admin','news.columns.text','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(199,'*','admin','news.columns.created_by','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(200,'*','admin','news.columns.updated_by','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(201,'*','admin','news.columns.show_item','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(202,'*','admin','news.columns.is_published','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(203,'*','admin','news.actions.create','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(204,'*','admin','news.actions.edit','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(205,'*','admin','news.actions.index','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(206,'*','admin','news.columns.id','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(207,'*','admin','newsletter-status.columns.name','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(208,'*','admin','newsletter-status.actions.create','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(209,'*','admin','newsletter-status.actions.edit','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(210,'*','admin','newsletter-status.actions.index','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(211,'*','admin','newsletter-status.columns.id','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(212,'*','admin','newsletter.columns.tag_id','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(213,'*','admin','newsletter.columns.created_by','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(214,'*','admin','newsletter.columns.updated_by','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(215,'*','admin','newsletter.actions.create','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(216,'*','admin','newsletter.actions.edit','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(217,'*','admin','newsletter.actions.index','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(218,'*','admin','newsletter.columns.id','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(219,'*','admin','order.columns.amount_received','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(220,'*','admin','order.actions.create','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(221,'*','admin','order.actions.edit','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(222,'*','admin','order.actions.index','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(223,'*','admin','order.actions.export','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(224,'*','admin','page.actions.create','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(225,'*','admin','page.actions.edit','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(226,'*','admin','page.actions.index','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(227,'*','admin','page.actions.export','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(228,'brackets/admin-ui','admin','footer.powered_by','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(229,'*','admin','permission.columns.name','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(230,'*','admin','permission.columns.guard_name','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(231,'*','admin','permission.actions.create','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(232,'*','admin','permission.actions.edit','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(233,'*','admin','permission.actions.index','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(234,'*','admin','permission.columns.id','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(235,'*','admin','product-stock.columns.stock','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(236,'*','admin','product-stock.actions.create','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(237,'*','admin','product-stock.actions.edit','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(238,'*','admin','product-stock.actions.index','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(239,'*','admin','product.actions.create','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(240,'*','admin','product.actions.edit','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(241,'*','admin','product.actions.index','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(242,'*','admin','product.actions.export','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(243,'*','admin','admin-user.actions.edit_password','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(244,'*','admin','admin-user.columns.password_repeat','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(245,'*','admin','admin-user.actions.edit_profile','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(246,'*','admin','admin-user.columns.language','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(247,'brackets/admin-ui','admin','forms.select_an_option','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(248,'*','admin','role.columns.name','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(249,'*','admin','role.columns.guard_name','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(250,'*','admin','role.actions.create','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(251,'*','admin','role.actions.edit','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(252,'*','admin','role.actions.index','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(253,'*','admin','role.columns.id','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(254,'*','admin','shipping.columns.customer_id','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(255,'*','admin','shipping.columns.postcode','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(256,'*','admin','shipping.columns.city','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(257,'*','admin','shipping.columns.street','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(258,'*','admin','shipping.columns.is_default','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(259,'*','admin','shipping.actions.create','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(260,'*','admin','shipping.actions.edit','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(261,'*','admin','shipping.actions.index','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(262,'*','admin','shipping.columns.id','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(263,'*','admin','theme.actions.create','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(264,'*','admin','theme.actions.edit','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(265,'*','admin','theme.actions.index','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(266,'*','admin','theme.actions.export','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(267,'maintenancemode','defaults','title','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(268,'*','pagination','previous','{\"en\":\"&laquo; Previous\",\"de\":\"&laquo; zur\\u00fcck\"}',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(269,'*','pagination','next','{\"en\":\"Next &raquo;\",\"de\":\"Vor &raquo;\"}',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(270,'brackets/admin-auth','admin','activation_form.title','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(271,'brackets/admin-auth','admin','activation_form.note','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(272,'brackets/admin-auth','admin','auth_global.email','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(273,'brackets/admin-auth','admin','activation_form.button','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(274,'brackets/admin-auth','admin','login.title','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(275,'brackets/admin-auth','admin','login.sign_in_text','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(276,'brackets/admin-auth','admin','auth_global.password','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(277,'brackets/admin-auth','admin','login.button','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(278,'brackets/admin-auth','admin','login.forgot_password','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(279,'brackets/admin-auth','admin','forgot_password.title','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(280,'brackets/admin-auth','admin','forgot_password.note','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(281,'brackets/admin-auth','admin','forgot_password.button','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(282,'brackets/admin-auth','admin','password_reset.title','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(283,'brackets/admin-auth','admin','password_reset.note','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(284,'brackets/admin-auth','admin','auth_global.password_confirm','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(285,'brackets/admin-auth','admin','password_reset.button','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(286,'brackets/admin-auth','activations','email.line','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(287,'brackets/admin-auth','activations','email.action','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(288,'brackets/admin-auth','activations','email.notRequested','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(289,'brackets/admin-auth','admin','activations.activated','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(290,'brackets/admin-auth','admin','activations.invalid_request','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(291,'brackets/admin-auth','admin','activations.disabled','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(292,'brackets/admin-auth','admin','activations.sent','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(293,'brackets/admin-auth','admin','passwords.sent','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(294,'brackets/admin-auth','admin','passwords.reset','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(295,'brackets/admin-auth','admin','passwords.invalid_token','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(296,'brackets/admin-auth','admin','passwords.invalid_user','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(297,'brackets/admin-auth','admin','passwords.invalid_password','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(298,'brackets/admin-auth','resets','email.line','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(299,'brackets/admin-auth','resets','email.action','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(300,'brackets/admin-auth','resets','email.notRequested','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(301,'*','auth','failed','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(302,'*','auth','throttle','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(303,'brackets/admin-translations','admin','title','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(304,'brackets/admin-translations','admin','index.all_groups','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(305,'brackets/admin-translations','admin','index.edit','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(306,'brackets/admin-translations','admin','index.default_text','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(307,'brackets/admin-translations','admin','index.translation','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(308,'brackets/admin-translations','admin','index.translation_for_language','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(309,'brackets/admin-translations','admin','import.title','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(310,'brackets/admin-translations','admin','import.notice','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(311,'brackets/admin-translations','admin','import.upload_file','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(312,'brackets/admin-translations','admin','import.choose_file','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(313,'brackets/admin-translations','admin','import.language_to_import','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(314,'brackets/admin-translations','admin','fields.select_language','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(315,'brackets/admin-translations','admin','import.do_not_override','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(316,'brackets/admin-translations','admin','import.conflict_notice_we_have_found','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(317,'brackets/admin-translations','admin','import.conflict_notice_translations_to_be_imported','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(318,'brackets/admin-translations','admin','import.conflict_notice_differ','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(319,'brackets/admin-translations','admin','fields.group','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(320,'brackets/admin-translations','admin','fields.default','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(321,'brackets/admin-translations','admin','fields.current_value','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(322,'brackets/admin-translations','admin','fields.imported_value','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(323,'brackets/admin-translations','admin','import.sucesfully_notice','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(324,'brackets/admin-translations','admin','import.sucesfully_notice_update','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(325,'brackets/admin-translations','admin','index.export','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(326,'brackets/admin-translations','admin','export.notice','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(327,'brackets/admin-translations','admin','export.language_to_export','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(328,'brackets/admin-translations','admin','btn.export','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(329,'brackets/admin-translations','admin','index.title','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(330,'brackets/admin-translations','admin','btn.import','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(331,'brackets/admin-translations','admin','btn.re_scan','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(332,'brackets/admin-translations','admin','fields.created_at','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(333,'brackets/admin-translations','admin','index.no_items','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(334,'brackets/admin-translations','admin','index.try_changing_items','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(335,'brackets/admin-ui','admin','media_uploader.max_number_of_files','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(336,'brackets/admin-ui','admin','media_uploader.max_size_pre_file','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(337,'brackets/admin-ui','admin','media_uploader.private_title','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(338,'*','*','Address Category','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(339,'*','*','Select Address Category','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(340,'*','*','Theme','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(341,'*','*','Select Theme','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(342,'*','*','Category','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(343,'*','*','Select Category','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(344,'*','*','Periodic Position','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(345,'*','*','Select Periodic Position','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(346,'*','*','Periodic Weekday','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(347,'*','*','Select Periodic Weekday','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(348,'*','*','Type to search a category','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(349,'*','*','Type to search a theme','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(350,'*','*','Customers','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(351,'*','*','Manage access','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(352,'*','*','Translations','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(353,'*','*','Configuration','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(354,'*','*','Type to search a Music Style','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(355,'*','*','Permissions','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(356,'*','*','Login','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(357,'*','*','E-Mail Address','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(358,'*','*','Password','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(359,'*','*','Remember Me','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(360,'*','*','Forgot Your Password?','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(361,'*','*','Confirm Password','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(362,'*','*','Please confirm your password before continuing.','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(363,'*','*','Reset Password','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(364,'*','*','Send Password Reset Link','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(365,'*','*','Register','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(366,'*','*','Name','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(367,'*','*','Verify Your Email Address','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(368,'*','*','A fresh verification link has been sent to your email address.','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(369,'*','*','Before proceeding, please check your email for a verification link.','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(370,'*','*','If you did not receive the email','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(371,'*','*','click here to request another','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(372,'*','*','Unauthorized','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(373,'*','*','Forbidden','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(374,'*','*','Not Found','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(375,'*','*','Page Expired','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(376,'*','*','Too Many Requests','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(377,'*','*','Server Error','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(378,'*','*','Service Unavailable','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(379,'*','*','Oh no','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(380,'*','*','Go Home','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(381,'*','*','Profil','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45','2021-09-24 23:15:45'),
	(382,'*','*','Adressen','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45','2021-09-24 23:15:45'),
	(383,'*','*','Rechnungen','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45','2021-09-24 23:15:45'),
	(384,'*','*','Logout','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45','2021-09-24 23:15:45'),
	(385,'*','*','Payment Confirmation','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(386,'*','*','Payment Successful','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(387,'*','*','This payment was already successfully confirmed.','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(388,'*','*','Payment Cancelled','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(389,'*','*','This payment was cancelled.','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(390,'*','*','Extra confirmation is needed to process your payment. Please confirm your payment by filling out your payment details below.','[]',NULL,'2021-05-27 13:12:57','2021-09-24 23:15:45',NULL),
	(391,'*','*','Full name','[]',NULL,'2021-05-27 13:12:58','2021-09-24 23:15:45',NULL),
	(392,'*','*','Jane Doe','[]',NULL,'2021-05-27 13:12:58','2021-09-24 23:15:45',NULL),
	(393,'*','*','Card','[]',NULL,'2021-05-27 13:12:58','2021-09-24 23:15:45',NULL),
	(394,'*','*','Go back','[]',NULL,'2021-05-27 13:12:58','2021-09-24 23:15:45',NULL),
	(395,'*','*','All rights reserved.','[]',NULL,'2021-05-27 13:12:58','2021-09-24 23:15:45',NULL),
	(396,'*','*','Please provide your name.','[]',NULL,'2021-05-27 13:12:58','2021-09-24 23:15:45',NULL),
	(397,'*','*','The payment was successful.','[]',NULL,'2021-05-27 13:12:58','2021-09-24 23:15:45',NULL),
	(398,'*','*','pagination.previous','[]',NULL,'2021-05-27 13:12:58','2021-09-24 23:15:45',NULL),
	(399,'*','*','pagination.next','[]',NULL,'2021-05-27 13:12:58','2021-09-24 23:15:45',NULL),
	(400,'*','*','Pagination Navigation','[]',NULL,'2021-05-27 13:12:58','2021-09-24 23:15:45',NULL),
	(401,'*','*','Showing','[]',NULL,'2021-05-27 13:12:58','2021-09-24 23:15:45',NULL),
	(402,'*','*','to','[]',NULL,'2021-05-27 13:12:58','2021-09-24 23:15:45',NULL),
	(403,'*','*','of','[]',NULL,'2021-05-27 13:12:58','2021-09-24 23:15:45',NULL),
	(404,'*','*','results','[]',NULL,'2021-05-27 13:12:58','2021-09-24 23:15:45',NULL),
	(405,'*','*','Close','[]',NULL,'2021-05-27 13:12:58','2021-09-24 23:15:45',NULL),
	(406,'*','*','Wir haben geschlossen','[]',NULL,'2021-09-24 23:15:45','2021-09-24 23:15:45',NULL);

/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle wysiwyg_media
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wysiwyg_media`;

CREATE TABLE `wysiwyg_media` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wysiwygable_id` int(10) unsigned DEFAULT NULL,
  `wysiwygable_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wysiwyg_media_wysiwygable_id_index` (`wysiwygable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
