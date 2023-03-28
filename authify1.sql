/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 8.0.31 : Database - authify
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
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(9,'2019_12_14_000001_create_personal_access_tokens_table',1),
(10,'2023_03_03_062120_create_posts_table',2);

/*Table structure for table `oauth_access_tokens` */

DROP TABLE IF EXISTS `oauth_access_tokens`;

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `client_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `oauth_access_tokens` */

insert  into `oauth_access_tokens`(`id`,`user_id`,`client_id`,`name`,`scopes`,`revoked`,`created_at`,`updated_at`,`expires_at`) values 
('00246ed41fa6978e5ff86679ab7db2b425dac4f7e60fe366adf08086ddebe65989511a9009894cfb',2,1,'Shiv Patel','[]',0,'2023-03-27 10:26:31','2023-03-27 10:26:31','2023-04-03 10:26:31'),
('011301134f969655ed6b3f13ee6d3f697dd7334eea538f2adf1912ad34770ba637e9bc18200dceb2',2,1,'Shiv Patel','[]',0,'2023-03-27 09:59:48','2023-03-27 09:59:48','2023-04-03 09:59:48'),
('02908c9345a53e4fa2873146db19f9fe2f6860f247f37dcb9929487e278254843b8df22ac4b4bbef',2,1,'Shiv Patel','[]',0,'2023-03-27 10:15:34','2023-03-27 10:15:34','2023-04-03 10:15:34'),
('09b27330ca1efab2d2ef70484e6c12dfef0587cc185ce7050939e632ff5ef8ba2985daaf460007a4',2,1,'Shiv Patel','[]',0,'2023-03-27 10:07:02','2023-03-27 10:07:02','2023-04-03 10:07:02'),
('0a9ae1f5143394dc72d8bc463f4c67997100e946a91518c3ded34aaaf956461bf08732e91fd1ddfe',2,1,'Shiv Patel','[]',0,'2023-03-27 10:36:59','2023-03-27 10:36:59','2023-04-03 10:36:59'),
('0f1d039f50eeeeb77b94a2a2de92ef0ec95f8917b5770b4de7bee9e07505aea9ce963a84a20d1173',2,1,'Shiv Patel','[]',0,'2023-03-27 09:43:36','2023-03-27 09:43:36','2023-04-03 09:43:36'),
('14016161ecf5f399fefb2e025ebab80793304227ce3b2eb3f8c3aaa7d507716b8d4ed2051ec92e01',2,1,'Shiv Patel','[]',0,'2023-03-27 10:20:27','2023-03-27 10:20:27','2023-04-03 10:20:27'),
('1551193cfe1520d1a1accb2b1c0e2ebc887227a80c52131d9abf0e930b44d2b92d70b095d5f5654a',2,1,'Shiv Patel','[]',0,'2023-03-27 10:50:52','2023-03-27 10:50:52','2023-04-03 10:50:52'),
('1f8abedb648086e51839829d844dd567f60f33263ff62865ed1f72660ce26d9417aa5ad9c8b32145',2,1,'Shiv Patel','[]',0,'2023-03-27 10:59:35','2023-03-27 10:59:35','2023-04-03 10:59:35'),
('209f6dbb3f80014e3a20064df9c25130df8e76c16fbc5d46d3517174fec499836e5fea7cf2b7a807',2,1,'Shiv Patel','[]',0,'2023-03-27 09:41:14','2023-03-27 09:41:14','2023-04-03 09:41:14'),
('24d06dc872b746b7df6974d9f6c1366e80a6341b1b2994bae43fc1e72f8bd0722d7f3366acea6eb6',2,1,'Shiv Patel','[]',0,'2023-03-27 08:48:04','2023-03-27 08:48:04','2023-04-03 08:48:04'),
('27fae17c298253dcbe034e3f77d1927e03c1507839e925395d3a9f22b20a2c4d0632ec7633c920b9',2,1,'Shiv Patel','[]',0,'2023-03-27 11:02:18','2023-03-27 11:02:18','2023-04-03 11:02:18'),
('3211896de39d2576568a378a3e8f30693faa613265a6962c602b30a14c0b194c31f9ba66d71e7115',2,1,'Shiv Patel','[]',0,'2023-03-27 10:14:00','2023-03-27 10:14:00','2023-04-03 10:14:00'),
('3c0bb1d8df753ce71c81168cc14081fe0b13735acdb2cd565cca97b9323583602e7153e93cb49ea2',2,1,'Shiv Patel','[]',0,'2023-03-27 10:12:59','2023-03-27 10:12:59','2023-04-03 10:12:59'),
('3dcafab5560f645459bd5b381b2340d87f8e5beaa4c30a674a6e7c27becf85c75be3459546da3f9f',2,1,'Shiv Patel','[]',0,'2023-03-27 10:25:18','2023-03-27 10:25:18','2023-04-03 10:25:18'),
('3ea8dfcedd8374a1e0c8baefa4c99973cc77f896817b24f0615e4e18eb78704d7e02c3330bc47a62',2,1,'Shiv Patel','[]',0,'2023-03-27 10:59:19','2023-03-27 10:59:19','2023-04-03 10:59:19'),
('40885a9d54ad5ab6575e2d0f1489c0ad06eae84f9b503efbacb301f58ea1e0957941b21ba9760080',2,1,'Shiv Patel','[]',0,'2023-03-27 10:23:40','2023-03-27 10:23:40','2023-04-03 10:23:40'),
('42ad4e7da8765d3881285217c6f4d039ca9105fad637629481a76aa168a32b34b6311473552361bf',2,1,'Shiv Patel','[]',0,'2023-03-27 09:38:15','2023-03-27 09:38:15','2023-04-03 09:38:15'),
('50e041180a84dbd02c743d6b52ef7c2809dce25d0a7203405c8cc42de66c74abf77004508255f012',2,1,'Shiv Patel','[]',0,'2023-03-27 09:43:52','2023-03-27 09:43:52','2023-04-03 09:43:52'),
('51712c9503bb6cba7f2bdf6445501b3206a7aa39f2bff2055986d368986142330721a593ea9ed8a9',2,1,'Shiv Patel','[]',0,'2023-03-27 11:03:01','2023-03-27 11:03:01','2023-04-03 11:03:01'),
('58ebbf080307eef1c1cd3e1807c1b4b683d44a0eb52d74079e1aa65d74909b18f1ad3380a8943657',2,1,'Shiv Patel','[]',0,'2023-03-27 09:30:34','2023-03-27 09:30:34','2023-04-03 09:30:34'),
('5c371751adb5c96f81185c3d483e650a6c8b9d37ba2661d0f206c6932207e8fba3391213a77c15d2',2,1,'Shiv Patel','[]',0,'2023-03-27 10:08:06','2023-03-27 10:08:06','2023-04-03 10:08:06'),
('638fbe34373811c70b8b70cbd84ae72fadb5e0e2bb3f2dbc2bcfc5b9ff51b0742f1360e488684337',2,1,'Shiv Patel','[]',0,'2023-03-27 10:21:56','2023-03-27 10:21:56','2023-04-03 10:21:56'),
('642a511b4b146bbb4196b2d55904f0b8b486d363a9c639eca9faf40ef783db77721e1b3858e847b5',2,1,'Shiv Patel','[]',0,'2023-03-27 09:44:01','2023-03-27 09:44:01','2023-04-03 09:44:01'),
('774aa2a8c39c8f77ac891d2f54f282958af46327520113b952cf1c72a96c044c5bec1a52e83f9d91',2,1,'Shiv Patel','[]',0,'2023-03-27 10:13:21','2023-03-27 10:13:21','2023-04-03 10:13:21'),
('7a495c120278cfd84aead0ac1dcdfe17ff7715b28f899f27fa9de63aefc268cbabeaf8357d969a18',2,1,'Shiv Patel','[]',0,'2023-03-27 10:16:29','2023-03-27 10:16:29','2023-04-03 10:16:29'),
('7ab6203d804b6b7125d4d3b4b3383eeefbaf0c494c6125d2f719aec3b19e77d0387ea243626c26f4',2,1,'Shiv Patel','[]',0,'2023-03-27 11:09:17','2023-03-27 11:09:17','2023-04-03 11:09:17'),
('7ba88362b46ca28ad0cf59d15b3d7ce4e2884cf131d5533fb597edd5ee1e37e7144add119d463ab7',2,1,'Shiv Patelll','[]',0,'2023-03-28 06:00:07','2023-03-28 06:00:07','2023-04-04 06:00:07'),
('7e0a196196f8ddd47c7e4a0231b0a816595218e887bb8537101487fb8843ddc2e71d82b58dc78db9',2,1,'Shiv Patel','[]',0,'2023-03-27 10:18:55','2023-03-27 10:18:55','2023-04-03 10:18:55'),
('7e4e0a423ca9fcd623e7837657bc017887ee4b8d9a2fba6cacc97ef130cb07b8b8811fe58c833bf3',2,1,'Shiv Patel','[]',0,'2023-03-27 10:25:37','2023-03-27 10:25:37','2023-04-03 10:25:37'),
('811a7a0a109dcc0ad0ca232d2f3f073e8bd9b58e31b4a34d3905508ab8c168d5d54561204e2b6d6a',2,1,'Shiv Patel','[]',0,'2023-03-27 09:15:02','2023-03-27 09:15:02','2023-04-03 09:15:02'),
('9e492d8c3b4520bbd8fb961987a809b5e03322f192407a45bcff95f7f1cda9e6283470ac73f9b12a',2,1,'Shiv Patel','[]',0,'2023-03-27 10:00:26','2023-03-27 10:00:26','2023-04-03 10:00:26'),
('a15754c3d55b74665fce30f1fb9f1ee27fe38c408241b53267ac0cd66d2e83d84b28099ecad7f732',2,1,'Shiv Patel','[]',0,'2023-03-27 11:03:22','2023-03-27 11:03:22','2023-04-03 11:03:22'),
('a70798ea5c923325af99880d6646d315b9a867b87d7eb5418a43f179bfc8f096fc668f8e7f116bfa',2,1,'Shiv Patel','[]',0,'2023-03-27 09:58:28','2023-03-27 09:58:28','2023-04-03 09:58:28'),
('ab7185a29eb99045e4c04f041b9f7a5d6a0af98032acb1a76feb356e011f908570c6f5ca33c20cca',2,1,'Shiv Patel','[]',0,'2023-03-27 09:37:14','2023-03-27 09:37:14','2023-04-03 09:37:14'),
('ae9d5289ff53d086d449b15da9a126e9552074d7aa68eaa23ec2dd9081f3fb796fa8e63d45201e42',2,1,'Shiv Patel','[]',0,'2023-03-27 10:14:38','2023-03-27 10:14:38','2023-04-03 10:14:38'),
('cb5401b0158397da62532a767ec62d14827697c88ba6d011f15b898cbe5223b979c2c1fe24d3ba1a',2,1,'Shiv Patel','[]',0,'2023-03-27 10:16:05','2023-03-27 10:16:05','2023-04-03 10:16:05'),
('cc15371afe2bf89f342894b25c74edd29b6b052dc275089d5557b272aae974adbc1c87b04aec1bc0',2,1,'Shiv Patel','[]',0,'2023-03-27 10:37:35','2023-03-27 10:37:35','2023-04-03 10:37:35'),
('cfbe918cd125a92cad3503925952449eb4f26faf658683f0166c30c6239295e0132aa9dc9ad4eebe',2,1,'Shiv Patel','[]',0,'2023-03-27 10:24:47','2023-03-27 10:24:47','2023-04-03 10:24:47'),
('d592c4da7cd7663b417e0320711fb2c940c90fffcac9ee6618d7a2de6410fbf5d7846c5f532291fd',2,1,'Shiv Patel','[]',0,'2023-03-27 11:04:08','2023-03-27 11:04:08','2023-04-03 11:04:08'),
('d7310fd366b1759847a1a232d9f2a35e70b06f9aa9e2ecf27b9e5bfccdd31e73fddb54f989d46745',2,1,'Shiv Patel','[]',0,'2023-03-27 10:43:33','2023-03-27 10:43:33','2023-04-03 10:43:33'),
('dc436e30b02021e9dcbbbdaac08f337b77fa8f7ad2bc6566319acc14465e855d7459ce6c5e47c38e',2,1,'Shiv Patel','[]',0,'2023-03-27 09:15:18','2023-03-27 09:15:18','2023-04-03 09:15:18'),
('e00d944327d13e28cf171db8b760b19443e4d0f191a3c0f8b0e51e52ff8bf7aec42d31d4e9b00125',2,1,'Shiv Patel','[]',0,'2023-03-27 08:46:18','2023-03-27 08:46:18','2023-04-03 08:46:18'),
('e22832fd46e458a6c3d7aa519b231ae933ff0f1f1a3fc16469f73a9af260c9443ad5952a4812823f',2,1,'Shiv Patel','[]',0,'2023-03-27 10:51:42','2023-03-27 10:51:42','2023-04-03 10:51:42'),
('e4358ff57b659675b4f0acb3e17c9dffabe14b6cfbf87aa57f4d0fe2cfee40b99245455d25a42f8c',2,1,'Shiv Patel','[]',0,'2023-03-27 10:57:02','2023-03-27 10:57:02','2023-04-03 10:57:02'),
('e9f26f521b0cca2bff61c186617fbc227b1adb7f781bbf26efe2b6311efc4175494c80658a28fc26',2,1,'Shiv Patel','[]',0,'2023-03-27 09:37:18','2023-03-27 09:37:18','2023-04-03 09:37:18'),
('ed5e0f6a0977f3e21c9def3fdacb26623eef9b8057430f12f5ccb1f8796bea6229dde1df79d6749b',2,1,'Shiv Patel','[]',0,'2023-03-27 10:42:31','2023-03-27 10:42:31','2023-04-03 10:42:31'),
('f1ccde21947ae3c2bfb6cb95a26a28760b1173996cb8403cd17ad4abd7de3d2262307630f9c219cd',2,1,'Shiv Patelll','[]',0,'2023-03-28 06:28:13','2023-03-28 06:28:13','2023-04-04 06:28:13'),
('f7d5952c2a90727efb7f0cc384c908af289999755f0c6bd5b36e99eaf8510e00ed5a9d2aea78c6e5',2,1,'Shiv Patel','[]',0,'2023-03-27 10:26:09','2023-03-27 10:26:09','2023-04-03 10:26:09');

/*Table structure for table `oauth_auth_codes` */

DROP TABLE IF EXISTS `oauth_auth_codes`;

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `client_id` bigint unsigned NOT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
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
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

insert  into `password_resets`(`email`,`token`,`created_at`) values 
('shivp311@gmail.com','DD5PkzVyWA','2023-03-28 10:42:54');

/*Table structure for table `personal_access_tokens` */

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `personal_access_tokens` */

/*Table structure for table `posts` */

DROP TABLE IF EXISTS `posts`;

CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `post_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_date` date DEFAULT NULL,
  `post_image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `post_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_comment_count` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_views_count` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `posts` */

insert  into `posts`(`id`,`user_id`,`post_title`,`post_author`,`post_date`,`post_image`,`post_content`,`post_comment_count`,`post_status`,`post_views_count`,`created_at`,`updated_at`) values 
(1,1,'Acer ebii AI-powered e-bike for city commuters announced','Shiv Patel','2023-03-28','Airtel-5G-Plus.jpg','Acer ebii AI-powered e-bike for city commuters announced Test Post','','Pending',0,NULL,NULL),
(2,1,'Samsung Galaxy A24 with 6.5″ FHD+ AMOLED display surfaces','Shiv Patel','2023-03-27','Samsung-Galaxy-A24.jpg','Samsung introduced the Galaxy A34 and A54 5G smartphones last week, and the Galaxy A14 4G was also introduced in some countries alongside the phones. The company confirmed in that it will launch the Galaxy A24 in Turkey in coming months.','','Approved',0,NULL,NULL),
(3,1,'TECNO, IIT-D collaborate for Avatar Making competition','Shiv Patel','2023-03-27','TECNO-Avatar.png','TECNO is organizing the TECNO Avatar Making Competition, a nationwide graphic design-centric contest between March 17th and 27th, in collaboration with IIT-Delhi, to identify and recognize creative and innovative talents in India. This is an expansion of IIT Delhi’s annual cultural festival, Rendezvous 2023','','Approved',0,NULL,'2023-03-27 10:56:15'),
(4,1,'Garmin Venu Sq 2 Music Edition Review','Shiv Patel','2023-03-20','Garmin-Venu.jpg','Garmin launched the Venu Sq 2 series as the successor to Venu Sq series a few months back. The new model brings a bigger 1.41-inch AMOLED display, an all-new 4th Generation Optical Heart Rate Sensor, a new GPS sensor, improved health and fitness features, and a better battery life. We have the Venu Sq 2 Music Edition. Is it worth the price? Let us dive into the review to find out.','','Approved',0,NULL,NULL),
(5,1,'Google Photos could get video unblur tool soon','Shiv Patel','2023-03-20','default-post.jpg','Google Photos is getting Video Unblur, which may be released for the upcoming Pixel 8, according to a recent report by 9to5Google from its APK teardown.','','Pending',0,NULL,NULL),
(6,2,'Snapdragon 7+ Gen 2 confirmed to power Redmi Note 12 Turbo and realme GT Neo5 SE','Mukesh Patel','2023-03-20','Qualcomm-Snapdragon-7.jpg','Qualcomm introduced the Snapdragon 7+ Gen 2 Mobile platform today that promises 50% improved CPU performance, 2x improved GPU performance and 13% improved power efficiency. Qualcomm’s release already revealed Redmi and realme phones will be the first to use the chip.','','Approved',0,NULL,NULL),
(7,2,'Sony WH-CH720N ANC headphones launched in India','Mukesh Patel','2023-03-26','Sonycs.jpeg','Today, Sony announced the WH-CH720N wireless noise-canceling headphones in India. The new headphones feature superior noise-canceling, a Digital Sound Enhancement Engine (DSEE), Dual Noise Sensor technology, Sony’s Integrated Processor V1 chip, and other features.','','Pending',0,NULL,'2023-03-26 17:53:27'),
(9,NULL,'10 Best Free Blogging Sites to Build Your Blog for Free in 2023: Tested','Shiv Patel','2023-03-26','default-post.jpg','Looking for some free blog sites to help you start sharing your writing with the world? Whether you just want to share updates with your family and friends or you want to start a blog and build a broader audience, we’ve put together ten great sites where you can start a blog for free.',NULL,'Pending',NULL,'2023-03-26 17:46:36','2023-03-26 18:16:20'),
(17,NULL,'Consequatur eos velit quis.','Et vel.',NULL,'default-post.jpg','Ducimus qui tempore et et optio. Tempore quidem nisi neque et nostrum. Et recusandae esse voluptas. Dolores qui quod corrupti quisquam sequi itaque.',NULL,'Pending',NULL,NULL,NULL),
(18,NULL,'Architecto ut est delectus quia.','Modi esse.',NULL,'default-post.jpg','Dolor soluta sit repellendus neque earum. Iure omnis unde error. Modi molestiae eaque eum omnis. Quisquam qui quisquam ut sed ut.',NULL,'Pending',NULL,NULL,NULL),
(19,NULL,'Rerum magni vel omnis rem ratione.','Aut autem.',NULL,'default-post.jpg','Magni alias dicta expedita consequatur. Necessitatibus perspiciatis soluta reprehenderit itaque. Minus dolor atque in consectetur.',NULL,'Pending',NULL,NULL,NULL),
(20,NULL,'Et eos voluptas aut quaerat.','Corporis.',NULL,'default-post.jpg','Ipsam optio voluptate repellat aspernatur aut eaque. Vel aut odio provident quam aut omnis libero. Vel at odio quia et et est.',NULL,'Pending',NULL,NULL,NULL),
(21,NULL,'Rerum ad natus dicta.','Doloribus.',NULL,'default-post.jpg','Nam accusantium nobis vel eos aut. Eum quis autem praesentium ipsa optio. Omnis alias in et natus.',NULL,'Pending',NULL,NULL,NULL),
(22,NULL,'Non voluptas dolorum officiis.','Ex saepe.',NULL,'default-post.jpg','Quae dignissimos unde eius dolorum porro eum. Quasi et eum expedita omnis.',NULL,'Pending',NULL,NULL,NULL),
(23,NULL,'Sit optio fuga dolores quas.','Aliquam.',NULL,'default-post.jpg','Doloremque hic officia rerum ea reiciendis. Quia vitae repellat ex.',NULL,'Pending',NULL,NULL,NULL),
(24,NULL,'Corrupti quia et beatae fugit.','Excepturi.',NULL,'default-post.jpg','Fuga mollitia et provident ducimus voluptas. Omnis qui voluptates non. Illo libero sint quos nam est.',NULL,'Pending',NULL,NULL,NULL),
(25,NULL,'Reiciendis molestiae vero dolorem.','At.',NULL,'default-post.jpg','Error aut aut optio ut. Quia debitis ipsam ipsam est qui. Voluptatem aut assumenda necessitatibus quia. Beatae omnis corrupti sapiente odit.',NULL,'Pending',NULL,NULL,NULL),
(26,NULL,'Vel sapiente iure veritatis quia.','Ad sint.',NULL,'default-post.jpg','Deserunt eaque adipisci possimus praesentium quo veniam. Quae repudiandae est minus maxime. Maxime necessitatibus earum quos ut necessitatibus.',NULL,'Pending',NULL,NULL,NULL),
(27,NULL,'Aut incidunt quo aliquid nobis.','Aliquid.',NULL,'default-post.jpg','Id corporis vel et sunt. Placeat asperiores sint architecto sed ullam debitis. Rerum ex nisi veritatis cupiditate ratione. Cumque enim hic id quia.',NULL,'Pending',NULL,NULL,NULL),
(28,NULL,'Ipsum et tenetur dolor iure sint.','Minima.',NULL,'default-post.jpg','Distinctio veritatis sequi placeat ad ex cupiditate. Ab alias dolores beatae excepturi rem voluptatibus enim. Ut fuga sint et aut sequi.',NULL,'Pending',NULL,NULL,NULL),
(29,NULL,'Nobis facere omnis dolores sit.','Eum a.',NULL,'default-post.jpg','Omnis voluptatem fugit ut architecto quidem et ab. Adipisci quia qui maxime et ipsum.',NULL,'Pending',NULL,NULL,NULL),
(30,NULL,'Veniam eum labore aut.','Itaque.',NULL,'default-post.jpg','Quas nulla perferendis aliquam quia veniam. Debitis perferendis sit corrupti omnis aut commodi cumque. Aliquam delectus perferendis alias id.',NULL,'Pending',NULL,NULL,NULL),
(31,NULL,'Et ea quo ullam soluta.','Quidem.',NULL,'default-post.jpg','Est nobis rerum quod officia similique omnis natus. Et praesentium accusamus quas suscipit aut.',NULL,'Pending',NULL,NULL,NULL),
(32,NULL,'Ipsa ipsa iusto error aperiam.','Ex natus.',NULL,'default-post.jpg','Optio tempore perferendis error et ea. Neque et nostrum consequatur tenetur.',NULL,'Pending',NULL,NULL,NULL),
(33,NULL,'Quis alias quas corrupti ea.','Illum.',NULL,'default-post.jpg','Ratione sapiente odio aut sint asperiores qui. Minima nobis delectus eveniet sed nesciunt iste. Rerum consectetur voluptatem aliquid maxime.',NULL,'Pending',NULL,NULL,NULL),
(34,NULL,'Consequuntur maxime dolor odio.','Delectus.',NULL,'default-post.jpg','Consequatur recusandae sequi aut ut voluptas quibusdam laboriosam molestias. Illum voluptas et quo earum et. Sit magni enim et et modi iste.',NULL,'Pending',NULL,NULL,NULL),
(35,NULL,'Facilis id aut totam maxime.','Iure.',NULL,'default-post.jpg','Eum illum possimus eius. Eveniet qui illo qui rerum nesciunt. Voluptates quia iusto nostrum et vel aliquid. Dolores esse eos asperiores corrupti.',NULL,'Pending',NULL,NULL,NULL),
(36,NULL,'Sint velit qui dicta vitae.','Officiis.',NULL,'default-post.jpg','Culpa fugit reprehenderit est consequuntur qui et illum. Deleniti id facilis quidem totam. Facilis recusandae voluptas placeat eaque sed veniam.',NULL,'Pending',NULL,NULL,NULL),
(37,NULL,'Ut quia et alias enim magnam.','Vel.',NULL,'default-post.jpg','Neque esse fugiat adipisci fuga ut ad. Et voluptas dicta eaque adipisci voluptatibus ut eligendi. Quae aut reiciendis voluptatum qui voluptate.',NULL,'Pending',NULL,NULL,NULL),
(38,NULL,'Ex sunt consequuntur ipsam est.','Maxime.',NULL,'default-post.jpg','Ut labore molestias sed et. Nulla ullam aliquid eum. Sunt omnis qui delectus aut eum qui.',NULL,'Pending',NULL,NULL,NULL),
(39,NULL,'Quo doloremque veritatis adipisci.','Sunt.',NULL,'default-post.jpg','Quis officiis odio vero quod quo repudiandae natus. Aut corporis vero qui facere minus ex ducimus aut.',NULL,'Pending',NULL,NULL,NULL),
(40,NULL,'Et tempore non velit.','Molestiae.',NULL,'default-post.jpg','Doloribus aut autem quas iure aut totam. Aliquid ut nulla voluptatem. Quis vel odit porro repellat doloribus. Non tenetur sit sit eum temporibus.',NULL,'Pending',NULL,NULL,NULL),
(41,NULL,'In pariatur veniam illo vero.','Ullam.',NULL,'default-post.jpg','Ut aut velit vitae explicabo adipisci eveniet autem. Fuga aliquam voluptatum deleniti veritatis. Et id dolores nisi vitae eius incidunt dolore.',NULL,'Pending',NULL,NULL,NULL),
(42,NULL,'Cupiditate ut non aut animi.','Dolor.',NULL,'default-post.jpg','Placeat illum et placeat nisi aut pariatur sunt. Quam inventore molestias animi. Nihil quasi iure aut voluptatum mollitia sapiente dolorem.',NULL,'Pending',NULL,NULL,NULL),
(43,NULL,'Non minima omnis labore neque.','Excepturi.',NULL,'default-post.jpg','Quos ipsa voluptatem harum eligendi rerum libero. Est velit quis quod in. Vel nam illo quo accusantium ducimus.',NULL,'Pending',NULL,NULL,NULL),
(44,NULL,'Enim quisquam et est soluta.','Libero.',NULL,'default-post.jpg','Totam officiis voluptas occaecati error vel. Nobis et commodi aspernatur laborum aliquam. Esse vero voluptas dolores labore et.',NULL,'Pending',NULL,NULL,NULL),
(45,NULL,'Accusamus et iusto et ut.','Accusamus.',NULL,'default-post.jpg','Sequi exercitationem distinctio nostrum. Officiis qui ab maxime atque et. Provident quia suscipit ea est.',NULL,'Pending',NULL,NULL,NULL),
(46,NULL,'Aut ab perspiciatis vel facilis.','Quaerat.',NULL,'default-post.jpg','Sed beatae ut fugit beatae et voluptas repellendus. Animi voluptatem distinctio est delectus sequi dolorum.',NULL,'Pending',NULL,NULL,NULL),
(47,NULL,'Aut aut officia aut eum vel.','Qui.',NULL,'default-post.jpg','Sed in a rerum officiis. Voluptate corporis itaque provident quo facere aut. Nesciunt ducimus eos ipsum necessitatibus.',NULL,'Pending',NULL,NULL,NULL),
(48,NULL,'Qui consequatur nemo eum quos.','Est magni.',NULL,'default-post.jpg','Quis ut dolore inventore pariatur. Rem est dolorem eligendi cum. Dolor aut explicabo qui.',NULL,'Pending',NULL,NULL,NULL),
(49,NULL,'Repellat modi maxime est.','Ipsa.',NULL,'default-post.jpg','Qui et quasi deserunt dicta nostrum nihil molestias. Perferendis voluptate dicta qui consectetur provident. Incidunt quibusdam maxime ea.',NULL,'Pending',NULL,NULL,NULL),
(50,NULL,'Amet sed culpa omnis.','Tempore.',NULL,'default-post.jpg','Est rerum placeat quo quisquam. Esse placeat culpa odio tempore. Vitae fuga nesciunt neque ab nam optio nostrum.',NULL,'Pending',NULL,NULL,NULL),
(51,NULL,'Quibusdam corporis soluta sit.','Qui.',NULL,'default-post.jpg','Possimus eos molestiae quo rerum. Iste et est non atque veniam at. Aut eligendi voluptatem omnis mollitia. Ullam asperiores amet sequi cumque.',NULL,'Pending',NULL,NULL,NULL),
(52,NULL,'Nam eaque sed ut quasi omnis.','Optio.',NULL,'default-post.jpg','Eum sunt dolores voluptas amet optio. Dolorum doloribus nihil voluptatum aut. Omnis soluta laboriosam repellat.',NULL,'Pending',NULL,NULL,NULL),
(53,NULL,'Enim et ut aut.','Voluptas.',NULL,'default-post.jpg','Perferendis porro et doloribus blanditiis nisi nisi ut. Sit qui eius illum qui. Et natus aperiam commodi quam aut eligendi.',NULL,'Pending',NULL,NULL,NULL),
(54,NULL,'Enim id provident et.','Nisi.',NULL,'default-post.jpg','Tempore accusamus dolores vero neque est. Aut facere velit autem ratione labore quae cumque. Omnis sunt est vitae et vero nisi culpa.',NULL,'Pending',NULL,NULL,NULL),
(55,NULL,'Ea quod et quibusdam aut est.','Non illum.',NULL,'default-post.jpg','Qui quas voluptas voluptatem voluptas quia quidem dignissimos qui. Voluptatum sint veniam velit aspernatur harum. Hic et aut assumenda delectus.',NULL,'Pending',NULL,NULL,NULL),
(56,NULL,'Neque sint a aut et tenetur eum.','Maxime.',NULL,'default-post.jpg','Eos consectetur quia omnis placeat qui. Inventore libero vel nam nemo et. Molestiae odit ea necessitatibus.',NULL,'Pending',NULL,NULL,NULL),
(57,NULL,'Illo et porro id.','Provident.',NULL,'default-post.jpg','Est in adipisci recusandae voluptatem earum omnis. Quo reiciendis debitis id nobis accusantium.',NULL,'Pending',NULL,NULL,NULL),
(58,NULL,'Sint est a quisquam quas.','Officia.',NULL,'default-post.jpg','Et quam nam asperiores et et quas. Numquam dolore eius quia sint debitis et nihil.',NULL,'Pending',NULL,NULL,NULL),
(59,NULL,'Quo sit ut omnis ut quia.','Pariatur.',NULL,'default-post.jpg','Sed quo fugiat molestias molestiae consequuntur. Odio ipsa iure autem quo aut. Assumenda sit nemo soluta corrupti. Perferendis quia quia amet.',NULL,'Pending',NULL,NULL,NULL),
(60,NULL,'Deserunt dolor vitae veniam iste.','Fugit.',NULL,'default-post.jpg','Id est sed quas. Maxime qui magnam quos. Quis non voluptatibus ea distinctio.',NULL,'Pending',NULL,NULL,NULL),
(61,NULL,'Itaque nulla qui quia.','Alias.',NULL,'default-post.jpg','Nihil velit velit ipsum velit. Ut quae et nulla voluptate iste quo. Sit veniam ab est. Sint consectetur quos modi eum eius fugit voluptatem quaerat.',NULL,'Pending',NULL,NULL,NULL),
(62,NULL,'Quidem ut dolores culpa.','Et et.',NULL,'default-post.jpg','Sed suscipit hic delectus nulla eum eaque consequuntur. Quaerat quasi qui commodi incidunt nisi. Accusantium et suscipit quia cupiditate ea.',NULL,'Pending',NULL,NULL,NULL),
(63,NULL,'Sunt rem et aspernatur tempora.','Quas.',NULL,'default-post.jpg','Eum id facilis est voluptas quod tenetur nemo. Labore aut commodi qui ipsam repellendus nobis neque.',NULL,'Pending',NULL,NULL,NULL),
(64,NULL,'Ex dignissimos eius quis quo.','Velit.',NULL,'default-post.jpg','Similique quia dolorem et consequatur in quaerat sed. Odit consequatur rerum autem in quis. Quidem voluptatem quibusdam facere rem.',NULL,'Pending',NULL,NULL,NULL),
(65,NULL,'Qui ut est quam eos illo ipsam.','Qui.',NULL,'default-post.jpg','Molestiae nostrum recusandae facere voluptas temporibus. Consequatur qui voluptatem dolores sed cupiditate ut. Laborum aut modi iste rerum voluptate.',NULL,'Pending',NULL,NULL,NULL),
(66,NULL,'Et velit qui voluptate.','Voluptas.',NULL,'default-post.jpg','Qui architecto cum sit suscipit sit. Atque soluta facilis distinctio sit odio. Minima sunt voluptates autem consequuntur molestiae voluptatem.',NULL,'Pending',NULL,NULL,NULL),
(67,NULL,'Officiis rem aut est esse.','Aut.',NULL,'default-post.jpg','Enim id et perferendis sunt dolore adipisci eius. Expedita beatae voluptatem laboriosam fugiat odit rerum consequatur.',NULL,'Pending',NULL,NULL,NULL),
(68,NULL,'Voluptates id et tempora possimus.','Aut.',NULL,'default-post.jpg','Molestiae aut consequatur sunt et ipsum. Et omnis sit consequatur maxime fugiat voluptas. Adipisci ut qui occaecati autem.',NULL,'Pending',NULL,NULL,NULL),
(69,NULL,'Aperiam et officiis esse nisi.','Dolores.',NULL,'default-post.jpg','Sint et earum illo rerum aut. Ipsam nisi sed quia officia mollitia voluptatum minima. Molestiae sint iste sunt est ut.',NULL,'Pending',NULL,NULL,NULL),
(70,NULL,'Debitis sunt ea excepturi cumque.','Modi.',NULL,'default-post.jpg','Dolorem totam ea atque est tempora. Officiis non quaerat suscipit et adipisci asperiores.',NULL,'Pending',NULL,NULL,NULL),
(71,NULL,'Ea est et asperiores veritatis.','Dolores.',NULL,'default-post.jpg','Eaque et et debitis magnam. Error et velit voluptas excepturi. Quisquam sunt sapiente eum. Dicta nam aliquam architecto quas.',NULL,'Pending',NULL,NULL,NULL);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`profile`,`role`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`) values 
(1,'Amos Willefje','carey.okuneva@example.netv','DSC_0010.jpg','Subscriber','2023-03-14 09:12:36','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','ykNjq6HFZZ','2023-03-14 09:12:36','2023-03-28 05:37:15'),
(2,'Shiv Patel','shivp311@gmail.com','profile-img.jpg','Admin','2023-03-14 09:12:36','$2y$10$PPO2cr9aVhtOjPHYlAJBAubwVirmQfSdgEUjN0tbtZYsKvEbXwLjm','fHUzciUi6E','2023-03-14 09:12:36','2023-03-28 08:14:45'),
(3,'Calista Hettinger','alarkin@example.com','IMG_0010.jpg','Admin','2023-03-14 09:12:36','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','zxhZNDe8un','2023-03-14 09:12:36','2023-03-28 04:46:51'),
(4,'Arlene Bins','darrin33@example.com','Profile.jpeg','Subscriber','2023-03-14 09:12:36','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','VUo0Ct7DNm','2023-03-14 09:12:36','2023-03-14 09:12:36'),
(5,'Dr. Asa Satterfield','anderson.cicero@example.org','Profile.jpeg','Subscriber','2023-03-14 09:12:36','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','5Mz9LyE1gS','2023-03-14 09:12:36','2023-03-14 09:12:36'),
(6,'Willard VonRueden MD','qreynolds@example.org','Profile.jpeg','Subscriber','2023-03-14 09:12:36','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Xys6wFPXqd','2023-03-14 09:12:36','2023-03-14 09:12:36'),
(7,'Mr. Ronny Carroll PhD','vcorwin@example.net','Profile.jpeg','Subscriber','2023-03-14 09:12:36','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Tol3MwzPna','2023-03-14 09:12:36','2023-03-14 09:12:36'),
(9,'Keshaun Harber','mgreenholt@example.net','Profile.jpeg','Subscriber','2023-03-14 09:12:36','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','ohS2rZpT0J','2023-03-14 09:12:36','2023-03-14 09:12:36'),
(14,'Shiv Patel','shivpatel19@gnu.ac.in','Profile.jpeg','Subscriber',NULL,'$2y$10$XO6KCIt5GHT/5EFzcu9vceeXhET8/uLfU1rfxu5TQMhQaloXoymy6',NULL,'2023-03-26 06:26:15','2023-03-26 06:26:15'),
(22,'Jenis Gohil','jenisg456@gmail.com','Profile.jpeg','Admin',NULL,'$2y$10$A2T45ek0kF5j2SOmlPU..uvLOvoBhcoHnPKAmTLAPGOoRnJD31fZC',NULL,'2023-03-27 10:52:07','2023-03-27 10:52:07'),
(23,'Bryon Schumm','thad84@example.com','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','vFrq41OjZS','2023-03-27 11:57:11','2023-03-27 11:57:11'),
(24,'Montana Predovic','selina.ullrich@example.org','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','McXV1TDeP2','2023-03-27 11:57:11','2023-03-27 11:57:11'),
(25,'Prof. Erin Halvorson','isai69@example.org','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','y24wAGqUrH','2023-03-27 11:57:11','2023-03-27 11:57:11'),
(26,'Tierra Kuphal','isaias59@example.net','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','wf42G9CTP2','2023-03-27 11:57:11','2023-03-27 11:57:11'),
(27,'Holden Pfannerstill','cturcotte@example.org','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','2tvpkAmshj','2023-03-27 11:57:11','2023-03-27 11:57:11'),
(28,'Roxanne Gerlach','reichel.matilda@example.com','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','OGz52cCvyt','2023-03-27 11:57:11','2023-03-27 11:57:11'),
(29,'Ivy Schamberger','tillman.randy@example.org','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','EUEETtUXYv','2023-03-27 11:57:11','2023-03-27 11:57:11'),
(30,'Destini Pagac','ukrajcik@example.org','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Sbpb7B4ZCb','2023-03-27 11:57:11','2023-03-27 11:57:11'),
(31,'Warren King','annette29@example.org','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','1EU6ludxFz','2023-03-27 11:57:11','2023-03-27 11:57:11'),
(32,'Lilian Bergstrom','sheila.denesik@example.com','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','9YUN6TDwOu','2023-03-27 11:57:11','2023-03-27 11:57:11'),
(33,'Dario Wolf','arvilla.feest@example.org','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','XEdzDcHtvt','2023-03-27 11:57:11','2023-03-27 11:57:11'),
(34,'Paxton Ondricka III','lakin.gertrude@example.com','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','9douo3aP4X','2023-03-27 11:57:11','2023-03-27 11:57:11'),
(35,'Nova Lehner','benedict76@example.net','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','CUy26JsNWA','2023-03-27 11:57:11','2023-03-27 11:57:11'),
(36,'Jacquelyn Reichert II','deron17@example.com','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','qH4SPCMM66','2023-03-27 11:57:11','2023-03-27 11:57:11'),
(37,'Luciano Hilpert','vcrona@example.com','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','UrgkTTSruY','2023-03-27 11:57:11','2023-03-27 11:57:11'),
(38,'Charley Schumm','doyle.sigurd@example.com','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','i3IMMpDVqE','2023-03-27 11:57:11','2023-03-27 11:57:11'),
(39,'Wyatt Walker DDS','xdenesik@example.com','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','u1nSEpkFEJ','2023-03-27 11:57:11','2023-03-27 11:57:11'),
(40,'Josephine Grant','franecki.tomas@example.org','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','OEuSG0SiaQ','2023-03-27 11:57:11','2023-03-27 11:57:11'),
(41,'Benedict Hirthe','nhowell@example.com','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','mFo7QUy32P','2023-03-27 11:57:11','2023-03-27 11:57:11'),
(42,'Ms. Arlene Moen','juwan80@example.org','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','WfxKho4ttu','2023-03-27 11:57:11','2023-03-27 11:57:11'),
(43,'Coralie Dickens','qdaniel@example.org','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','9zMe1JeEjc','2023-03-27 11:57:11','2023-03-27 11:57:11'),
(44,'Loraine Leannon','janice.carroll@example.net','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Yyoeg3RX16','2023-03-27 11:57:11','2023-03-27 11:57:11'),
(45,'Mr. Alessandro Thompson DVM','bernhard.ima@example.com','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','c8bK5Fw7cT','2023-03-27 11:57:11','2023-03-27 11:57:11'),
(46,'Kenneth Runte','xnitzsche@example.com','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','dkwvBUcpdE','2023-03-27 11:57:11','2023-03-27 11:57:11'),
(47,'Kaitlyn Schaefer','rahsaan.strosin@example.com','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','xOGNNSJscg','2023-03-27 11:57:11','2023-03-27 11:57:11'),
(48,'Zoe Jerde','eberge@example.com','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','xkkZoCUkEt','2023-03-27 11:57:11','2023-03-27 11:57:11'),
(49,'Dr. Chandler McClure III','celestino32@example.net','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','9CiF7qoTPh','2023-03-27 11:57:11','2023-03-27 11:57:11'),
(50,'Silas Parker DDS','nferry@example.net','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','DKqpmDHbY3','2023-03-27 11:57:11','2023-03-27 11:57:11'),
(51,'Anika Halvorson II','shields.llewellyn@example.com','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','jOi1NJvFy1','2023-03-27 11:57:11','2023-03-27 11:57:11'),
(52,'Prof. Javier Lemke PhD','ithompson@example.org','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','lHdAvbyAlW','2023-03-27 11:57:11','2023-03-27 11:57:11'),
(53,'Amara Wiegand MD','hoeger.zane@example.org','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','0wjEFDtwQQ','2023-03-27 11:57:11','2023-03-27 11:57:11'),
(54,'Mr. Ian Lehner','froberts@example.org','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','MnRhjTy0Py','2023-03-27 11:57:11','2023-03-27 11:57:11'),
(55,'Ms. Josefa Stiedemann IV','mertz.isadore@example.org','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','bdOPbfi1cX','2023-03-27 11:57:11','2023-03-27 11:57:11'),
(56,'Rozella Brakus II','marta.fadel@example.com','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','BRvtTLH4Hn','2023-03-27 11:57:11','2023-03-27 11:57:11'),
(57,'Zena Runolfsdottir','valentina.wolf@example.com','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','CAEJQPMSwf','2023-03-27 11:57:11','2023-03-27 11:57:11'),
(58,'Kacey Barrows','angus.thompson@example.org','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','T6dxEhvov3','2023-03-27 11:57:11','2023-03-27 11:57:11'),
(59,'Darby Swift PhD','delia54@example.org','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','pSqFlL6OXr','2023-03-27 11:57:11','2023-03-27 11:57:11'),
(60,'Damon Durgan','uhills@example.net','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','HmXImmNrtd','2023-03-27 11:57:11','2023-03-27 11:57:11'),
(61,'Norma Pouros','blick.cleveland@example.net','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','7rhazLyhQR','2023-03-27 11:57:11','2023-03-27 11:57:11'),
(62,'Carrie Daniel','hessel.tommie@example.net','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Xv6EAFjoI2','2023-03-27 11:57:11','2023-03-27 11:57:11'),
(63,'Prof. Lilly Mertz','keeling.sienna@example.com','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','rpc2HLAvOq','2023-03-27 11:57:11','2023-03-27 11:57:11'),
(64,'Dr. Junior O\'Connell MD','joan.swift@example.com','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','6AUAxudqO6','2023-03-27 11:57:11','2023-03-27 11:57:11'),
(65,'Prof. Hildegard Weber PhD','kuhic.cade@example.com','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','7CIom914KQ','2023-03-27 11:57:11','2023-03-27 11:57:11'),
(66,'Jerrod Dooley','jenifer.cartwright@example.org','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Kxsh1KvGts','2023-03-27 11:57:11','2023-03-27 11:57:11'),
(67,'Prof. Piper Hane','johanna79@example.com','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','lMSC7KHwU7','2023-03-27 11:57:11','2023-03-27 11:57:11'),
(68,'Dr. Cody Schuppe','augusta98@example.org','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','BOxNOaWqzw','2023-03-27 11:57:11','2023-03-27 11:57:11'),
(69,'Laurine Durgan','alia83@example.net','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','RP6gGz3Tt4','2023-03-27 11:57:11','2023-03-27 11:57:11'),
(70,'Julius McDermott','marlene06@example.net','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Uhm6Lc24MB','2023-03-27 11:57:11','2023-03-27 11:57:11'),
(71,'Janie Bruen','wmurazik@example.org','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','yo7XNZbT9J','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(72,'Kamryn Collins Sr.','kiera.keeling@example.net','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','dPKbb2rnt4','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(73,'Talon Murazik','zola37@example.com','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','mbBVmQuhyQ','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(74,'Ken D\'Amore','heaney.foster@example.net','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Vwq2M99SsJ','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(75,'Ms. Adriana Kreiger','mauricio.frami@example.org','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','1gQxtreiwR','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(76,'Ms. Janice Schamberger','gmurazik@example.org','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','WurelsZKSF','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(77,'Bernhard Parisian','lewis.heaney@example.com','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Tqo9bPfwzq','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(78,'Teagan Crona','zhermann@example.com','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','GvuyLZpbEv','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(79,'Prof. Jerrold Pacocha','bryce58@example.com','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','elaGF9UMfG','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(80,'Ebony Franecki DDS','aliyah04@example.com','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','311Nq9vwfp','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(81,'Margarett Kreiger','umante@example.com','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','VM1QaAdrrF','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(82,'Dr. Camryn Mraz','desmond.tromp@example.net','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','2nGCrAjg7X','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(83,'Ms. Micaela Hoeger','fmurray@example.org','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','VN5K2JjhtX','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(84,'Kasandra Kiehn','katrine.collier@example.com','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','fNj5UgfjZK','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(85,'Willow Rau','corkery.mona@example.org','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','46vM0sOKep','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(86,'Syble Yundt','jazmyne06@example.org','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','CS6TmAHpen','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(87,'Archibald Murphy','annie60@example.org','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','KeiZBipraM','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(88,'Jazmyn Medhurst','dianna29@example.net','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','usxjJpx2zQ','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(89,'Roy Kub','joelle.gaylord@example.net','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','BqhVs7JMNq','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(90,'Mr. German Green','mlindgren@example.org','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','rLhm7nPiSw','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(91,'Rocio Dare','anais.renner@example.net','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','wo8gtI7zUk','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(92,'Rachel Rowe','earnestine.smith@example.net','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','msYvMfWu31','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(93,'Rhett Shields','eveline.kshlerin@example.com','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','TvMkogeGON','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(94,'Tessie Ratke','xbauch@example.net','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','qwN2RWNhef','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(95,'Miss Katarina Friesen IV','urohan@example.com','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','2Za5SciaN7','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(96,'Prof. Maynard Corkery Sr.','antonetta15@example.org','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','5N37a2X2at','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(97,'Abelardo Dare DVM','beier.samara@example.net','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','ekH0blWd93','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(98,'Prof. Octavia Orn Jr.','adoyle@example.org','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','MELnAqblkH','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(99,'Prof. Ruthie Nitzsche MD','nichole31@example.org','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','GUJ6IFhQNW','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(100,'Ms. Alvera Schumm Sr.','beichmann@example.com','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','cPxafbcR7e','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(101,'Hillary Harris DDS','june32@example.com','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','OXXfckwmyj','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(102,'Dwight Simonis','fmurray@example.net','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','fv8IgtWGuR','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(103,'Ms. Rose Collier Jr.','alize.lakin@example.net','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','0yOSY7Jy3S','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(104,'Shanel Grant','jeanie.cole@example.com','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','zXtrfG7kOp','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(105,'Noemi Hodkiewicz','harry37@example.com','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','p8E2qihTTc','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(106,'Nick Schneider','kris.okuneva@example.com','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','JpwmM5jJSf','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(107,'Miss Marilou Olson','maybell10@example.com','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','AxHZUzZerc','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(108,'Mr. Lamar Streich Jr.','kreichert@example.org','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','25J3ZvygCZ','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(109,'Rosetta Rath','america77@example.com','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','M60fp7oR2N','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(110,'Mrs. Rosalyn Cremin Jr.','evie02@example.org','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','v6RQ8pabol','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(111,'Caterina Kris','tillman.manley@example.com','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','DToTzzfkX4','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(112,'Schuyler Dibbert','phuels@example.com','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','rz5SMaTZVY','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(113,'Sadie Armstrong','marcella.hauck@example.com','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','OfSTkKeQuF','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(114,'Cayla Mante','spowlowski@example.com','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','mUsdfDnrSg','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(115,'Ralph Rice','ortiz.alvis@example.org','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','svfuRJDDI4','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(116,'Mrs. Fannie Batz','zbahringer@example.org','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','N3nEEaNrdI','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(117,'Devon Stroman','rgusikowski@example.org','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','BcgRTqxk8b','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(118,'Tyson Mraz','vsanford@example.net','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','xsVNsCrTmm','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(119,'Ms. Josianne Reichert PhD','welch.brice@example.com','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Dm45rxgG07','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(120,'Delphia Dietrich V','kennedi.toy@example.com','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','frJDJMPZXC','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(121,'Cordelia Turcotte','bednar.janiya@example.com','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','TCasJWjLz6','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(122,'Mikel Emmerich','skessler@example.com','Profile.jpeg','Subscriber','2023-03-27 11:57:11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','IInioBHRq7','2023-03-27 11:57:12','2023-03-27 11:57:12'),
(125,'Shiv Patel','shivp311+21@gmail.com','DSC_0045.jpg','Admin',NULL,'$2y$10$C98x.1QuFS7pJ2u2r1syJOlA/x0Gj55mavN4N273wxl8Ruwuyj292',NULL,'2023-03-28 04:48:04','2023-03-28 04:48:33'),
(129,'Jenis Rashmikant Gohil','j@gmail.com',NULL,NULL,NULL,'$2y$10$LGD4TKb5kIJ6nv.X.46af.vTYMhY4LeIotDygnmFYCMmuDqNWcGoS',NULL,'2023-03-28 05:35:50','2023-03-28 05:35:50');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
