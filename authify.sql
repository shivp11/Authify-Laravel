/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 8.0.32 : Database - authify
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`authify` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `authify`;

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2016_06_01_000001_create_oauth_auth_codes_table',1),
(4,'2016_06_01_000002_create_oauth_access_tokens_table',1),
(5,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),
(6,'2016_06_01_000004_create_oauth_clients_table',1),
(7,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),
(8,'2019_08_19_000000_create_failed_jobs_table',1),
(9,'2019_12_14_000001_create_personal_access_tokens_table',1);

/*Table structure for table `oauth_access_tokens` */

DROP TABLE IF EXISTS `oauth_access_tokens`;

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `client_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `oauth_access_tokens` */

insert  into `oauth_access_tokens`(`id`,`user_id`,`client_id`,`name`,`scopes`,`revoked`,`created_at`,`updated_at`,`expires_at`) values 
('2b9678fa74d158a0a0d1515955a5e4124970c200826eeb1f932d2c8744e3f449399e219b4605192e',2,1,'Shiv Patel','[]',0,'2023-03-23 10:39:30','2023-03-23 10:39:30','2023-03-30 10:39:30'),
('6501597ef97d7b648e677dc7893933b138518f585af09221584ff52a9ae05f5234331dba262c15d9',2,1,'Shiv Patel','[]',0,'2023-03-23 11:21:08','2023-03-23 11:21:08','2023-03-30 11:21:08'),
('6f77a94f0747d5952bfad2db946693865e3b3a6dd2fbbd852c528f1eba254a0f29015e7144972284',2,1,'Shiv Patel','[]',0,'2023-03-23 11:17:59','2023-03-23 11:17:59','2023-03-30 11:17:59'),
('a80d67f87e4e2cf22227a9d99712da9fb9eb8a04adc9ca686b486ba479975563991eaff3961ad7a4',2,1,'Shiv Patel','[]',0,'2023-03-23 06:03:30','2023-03-23 06:03:30','2023-03-30 06:03:30');

/*Table structure for table `oauth_auth_codes` */

DROP TABLE IF EXISTS `oauth_auth_codes`;

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `client_id` bigint unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `oauth_auth_codes` */

/*Table structure for table `oauth_clients` */

DROP TABLE IF EXISTS `oauth_clients`;

CREATE TABLE `oauth_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `oauth_clients` */

insert  into `oauth_clients`(`id`,`user_id`,`name`,`secret`,`provider`,`redirect`,`personal_access_client`,`password_client`,`revoked`,`created_at`,`updated_at`) values 
(1,NULL,'Laravel Personal Access Client','PAcOKS5H7C5TU9wHttriOkE2YtdOT3gRAlvGaxqz',NULL,'http://localhost',1,0,0,'2023-03-14 09:01:30','2023-03-14 09:01:30'),
(2,NULL,'Laravel Password Grant Client','AFAmrgYaPDPQxh2ab7E4TB7OtJ6XEHwDTTNR2Gcx','users','http://localhost',0,1,0,'2023-03-14 09:01:30','2023-03-14 09:01:30');

/*Table structure for table `oauth_personal_access_clients` */

DROP TABLE IF EXISTS `oauth_personal_access_clients`;

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `oauth_personal_access_clients` */

insert  into `oauth_personal_access_clients`(`id`,`client_id`,`created_at`,`updated_at`) values 
(1,1,'2023-03-14 09:01:30','2023-03-14 09:01:30');

/*Table structure for table `oauth_refresh_tokens` */

DROP TABLE IF EXISTS `oauth_refresh_tokens`;

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `oauth_refresh_tokens` */

insert  into `oauth_refresh_tokens`(`id`,`access_token_id`,`revoked`,`expires_at`) values 
('14317e5c3d12febe33228e7d51751fc9f98c80b20f0d77c98364ece90ca4211ab92ae76eed8d3fd9','9d618ce6f982b83e81dfe05087e96a2847e58520f24a21170d6cd33d9850c512cb8d899c751fd56a',0,'2024-03-14 09:23:27'),
('2bc4571f5d0d3d9eff2c1da7bbc25866c14f4a60af44ac121f8459a36b05290f835ce07fa83f9255','46895ec3d8daf8a5736b492718683bc1b2022feba50fca877e91df760e5b3e77221a17dd491b7438',0,'2024-03-14 09:23:34'),
('6fe5fad219a8495b71089d08dffc60856741297696ab7a4cc05df8b7cab6f727e02b80cdbc3fe83d','d4529721e09e435096c5288f94763aa277d614824a2f8fb2001754d6e78d2446529a7f657f093a43',0,'2024-03-14 09:23:30'),
('888d54c4b8ca75a9f6b6eddf938978700a62b65bdca3822a8ac21062fbbea05816523a7143a48196','1c200d5554ad8b72a456e7813ee9cd52fc0b24b48e89178e56e662a37773b4a31d4f220386ccb648',0,'2024-03-14 09:23:33'),
('8b5c1fc6b7db322b5bc75a59f0b0ba3d6dbac318b4998f84bebc15cb1aa371683f16f934fb1fafff','a68e8d80da7bb252669282c0791a5042a277ef780159ab1298bbd75e73b16f8e9b51dc774a2cfaad',0,'2024-03-14 09:23:48'),
('d6b37ee9da84a8fcf8ef1dbc865d5e9260a061a2c109d72e80f2c26ba063f4c66a3ec0793dea9ffb','1d3b8fb52c8892403965fb2b97ec16f4124fd5cc604f8b6ef603fd40be9fd69fdb4fa7355d18a0ac',0,'2024-03-14 09:18:31');

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `personal_access_tokens` */

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `personal_access_tokens` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`) values 
(1,'Amos Will','carey.okuneva@example.net','2023-03-14 09:12:36','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','ykNjq6HFZZ','2023-03-14 09:12:36','2023-03-14 09:12:36'),
(2,'Shiv Patel','shivp311@gmail.com','2023-03-14 09:12:36','$2y$10$PPO2cr9aVhtOjPHYlAJBAubwVirmQfSdgEUjN0tbtZYsKvEbXwLjm','fHUzciUi6E','2023-03-14 09:12:36','2023-03-23 06:28:40'),
(3,'Calista Hettinger','alarkin@example.com','2023-03-14 09:12:36','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','zxhZNDe8un','2023-03-14 09:12:36','2023-03-14 09:12:36'),
(4,'Arlene Bins','darrin33@example.com','2023-03-14 09:12:36','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','VUo0Ct7DNm','2023-03-14 09:12:36','2023-03-14 09:12:36'),
(5,'Dr. Asa Satterfield','anderson.cicero@example.org','2023-03-14 09:12:36','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','5Mz9LyE1gS','2023-03-14 09:12:36','2023-03-14 09:12:36'),
(6,'Willard VonRueden MD','qreynolds@example.org','2023-03-14 09:12:36','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Xys6wFPXqd','2023-03-14 09:12:36','2023-03-14 09:12:36'),
(7,'Mr. Ronny Carroll PhD','vcorwin@example.net','2023-03-14 09:12:36','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Tol3MwzPna','2023-03-14 09:12:36','2023-03-14 09:12:36'),
(8,'Adrien Schmitt','steuber.ena@example.com','2023-03-14 09:12:36','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','PvEMShd3Eb','2023-03-14 09:12:36','2023-03-14 09:12:36'),
(9,'Keshaun Harber','mgreenholt@example.net','2023-03-14 09:12:36','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','ohS2rZpT0J','2023-03-14 09:12:36','2023-03-14 09:12:36'),
(10,'Alessandro Turcotte','ellis39@example.com','2023-03-14 09:12:36','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','vfuY3yYKF7','2023-03-14 09:12:36','2023-03-14 09:12:36'),
(11,'Shiv Patelsc','shivpatel19@gnu.ac.in',NULL,'$2y$10$whD5URLqbMHiiKIUse36L.IBkBbq2MNcRA6hNHXjyih8kv8rzOLTa',NULL,'2023-03-15 12:18:44','2023-03-23 09:30:40');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
