-- -------------------------------------------------------------
-- TablePlus 6.2.1(578)
--
-- https://tableplus.com/
--
-- Database: ecommerce_test
-- Generation Time: 2025-01-28 5:03:00.8090 p.m.
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `order_details`;
CREATE TABLE `order_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  `status` enum('pendiente','enviado','completado','cancelado') NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `payment_method` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_01_28_145053_create_personal_access_tokens_table', 1);

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, 100.00, '2025-01-28 16:44:33', '2025-01-28 16:44:33'),
(2, 1, 2, 1, 150.00, '2025-01-28 16:44:33', '2025-01-28 16:44:33'),
(3, 2, 3, 1, 200.00, '2025-01-28 16:44:33', '2025-01-28 16:44:33'),
(4, 2, 4, 1, 250.00, '2025-01-28 16:44:33', '2025-01-28 16:44:33'),
(5, 3, 1, 1, 100.00, '2025-01-28 16:44:33', '2025-01-28 16:44:33'),
(6, 4, 1, 2, 50.00, '2025-01-28 19:09:20', '2025-01-28 19:09:20'),
(7, 4, 2, 1, 100.75, '2025-01-28 19:09:20', '2025-01-28 19:09:20'),
(8, 5, 3, 1, 200.50, '2025-01-28 19:09:20', '2025-01-28 19:09:20'),
(9, 6, 1, 1, 75.25, '2025-01-28 19:09:20', '2025-01-28 19:09:20'),
(10, 7, 4, 3, 60.00, '2025-01-28 19:09:20', '2025-01-28 19:09:20'),
(11, 7, 3, 2, 120.00, '2025-01-28 19:09:20', '2025-01-28 19:09:20'),
(12, 8, 2, 1, 95.00, '2025-01-28 19:09:20', '2025-01-28 19:09:20'),
(13, 9, 4, 1, 120.00, '2025-01-28 19:09:20', '2025-01-28 19:09:20'),
(14, 10, 3, 2, 125.00, '2025-01-28 19:09:20', '2025-01-28 19:09:20');

INSERT INTO `orders` (`id`, `user_id`, `total`, `status`, `created_at`, `updated_at`, `payment_method`) VALUES
(1, 1, 350.00, 'pendiente', '2025-01-28 16:41:04', '2025-01-28 19:08:54', '{\"name\": \"Jane Smith\", \"type\": \"MasterCard\", \"number\": \"5105105105105100\", \"expirationDate\": \"03/26\"}'),
(2, 2, 500.00, 'completado', '2025-01-28 16:41:04', '2025-01-28 19:08:54', '{\"name\": \"Eve White\", \"type\": \"Discover\", \"number\": \"6011000990139424\", \"expirationDate\": \"06/27\"}'),
(3, 3, 200.00, 'cancelado', '2025-01-28 16:41:04', '2025-01-28 19:08:54', '{\"name\": \"Jane Smith\", \"type\": \"MasterCard\", \"number\": \"5105105105105100\", \"expirationDate\": \"03/26\"}'),
(4, 4, 50.00, 'pendiente', '2025-01-28 19:03:26', '2025-01-28 19:21:49', '{\"name\": \"Oliver Red\", \"type\": \"Visa\", \"number\": \"4111111111111111\", \"expirationDate\": \"11/24\"}'),
(5, 1, 150.75, 'enviado', '2025-01-28 19:08:04', '2025-01-28 19:08:54', '{\"name\": \"John Doe\", \"type\": \"Visa\", \"number\": \"4111111111111111\", \"expirationDate\": \"12/25\"}'),
(6, 2, 200.50, 'completado', '2025-01-28 19:08:04', '2025-01-28 19:08:54', '{\"name\": \"Jane Smith\", \"type\": \"MasterCard\", \"number\": \"5105105105105100\", \"expirationDate\": \"03/26\"}'),
(7, 1, 75.25, 'completado', '2025-01-28 19:08:04', '2025-01-28 19:08:54', '{\"name\": \"Alice Johnson\", \"type\": \"Amex\", \"number\": \"378282246310005\", \"expirationDate\": \"07/24\"}'),
(8, 3, 180.00, 'cancelado', '2025-01-28 19:08:04', '2025-01-28 19:08:54', '{\"name\": \"Eve White\", \"type\": \"Discover\", \"number\": \"6011000990139424\", \"expirationDate\": \"06/27\"}'),
(9, 1, 95.00, 'enviado', '2025-01-28 19:08:04', '2025-01-28 19:08:54', '{\"name\": \"John Doe\", \"type\": \"Visa\", \"number\": \"4111111111111111\", \"expirationDate\": \"05/25\"}'),
(10, 2, 120.00, 'pendiente', '2025-01-28 19:08:04', '2025-01-28 19:08:54', '{\"name\": \"Jane Smith\", \"type\": \"MasterCard\", \"number\": \"5500000000000004\", \"expirationDate\": \"08/26\"}'),
(11, 4, 250.00, 'pendiente', '2025-01-28 19:08:04', '2025-01-28 19:08:54', '{\"name\": \"Oliver Red\", \"type\": \"Visa\", \"number\": \"4111111111111111\", \"expirationDate\": \"11/24\"}');

INSERT INTO `products` (`id`, `name`, `description`, `price`, `stock`, `created_at`, `updated_at`, `image`) VALUES
(1, 'Producto A', 'Descripción del producto A', 100.00, 50, '2025-01-28 16:41:04', '2025-01-28 17:47:39', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJAnJt4eSM71oMzrjDhFkAf9dKRHvCM9Ne_g&s'),
(2, 'Producto B', 'Descripción del producto B', 150.00, 30, '2025-01-28 16:41:04', '2025-01-28 17:47:39', 'https://www.officedepot.com.mx/medias/85507.jpg-515ftw?context=bWFzdGVyfHJvb3R8Njk3Mzh8aW1hZ2UvanBlZ3xhR05sTDJobFpDODVOamsxT0RZMU9EazJPVGt3TG1wd1p3fDkyNjdjNTc2ZGU1MWE0NDY4Mjk1ZmI5ODcyMmRjZDY0ODdiZDk2ODc2MjE4M2JhZjY5ZmNjM2ViNmViMTk0YmI'),
(3, 'Producto C', 'Descripción del producto C', 200.00, 20, '2025-01-28 16:41:04', '2025-01-28 17:47:39', 'https://chedrauimx.vtexassets.com/arquivos/ids/38468891-800-auto?v=638660884215800000&width=800&height=auto&aspect=true'),
(4, 'Producto D', 'Descripción del producto D', 250.00, 10, '2025-01-28 16:41:04', '2025-01-28 17:47:39', 'https://www.radioshack.com.mx/store/medias/100159895-2.jpg-515ftw?context=bWFzdGVyfHJvb3R8MTIwMjA5fGltYWdlL2pwZWd8YURGa0wyZzVaaTg1TVRZMU5EazJNalUwTkRrMEx6RXdNREUxT1RnNU5TMHlMbXB3WjE4MU1UVm1kSGN8NDFkYmJlNjI2ZjNiNDMwZjM4YzQxZjkyZmI2ZGNlMzA3NzQxNWVkOGYxNzg5O');

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('xYtHFbEpJkFA475TtLgR20kNCnLGvFyevRU6vjtP', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic0x4R1RHQmxpYTZqSHFWa1gzYkoyRHk0MVN6NE96NFVtNUhoZVNGZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9vcmRlcnMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738105144);

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `address`, `phone`) VALUES
(1, 'Test User', 'test@example.com', '2025-01-28 15:30:03', '$2y$12$nud.5DruiiwOHKVJzAYGHeTSvKcKaKIm/3uZXRuS7N/diiwPbAhh6', 'q4QEJ2wBYw', '2025-01-28 15:30:04', '2025-01-28 15:30:04', 'Hageneshaven, TX 59353-6207', '+1-575-323-2213'),
(2, 'Kathlyn Bergstrom', 'giovanni.emard@example.com', '2025-01-28 16:39:32', '$2y$12$RFagZiaJtvAg.fd3IuhA2u3sFHBBz2c1kqqnkS/pEtYp3e3vuDeK.', 'XRghFx0Y23', '2025-01-28 16:39:33', '2025-01-28 16:39:33', '8129 Emard Estate Apt. 113\nPort Lorentown, VA 75580-8008', '(813) 964-6451'),
(3, 'Miss Corrine Rolfson', 'fstokes@example.org', '2025-01-28 16:39:33', '$2y$12$RFagZiaJtvAg.fd3IuhA2u3sFHBBz2c1kqqnkS/pEtYp3e3vuDeK.', '4MotlvICee', '2025-01-28 16:39:33', '2025-01-28 16:39:33', '855 Streich Manor Suite 591\nReggieview, PA 53628-4526', '+1-575-323-2213'),
(4, 'Dr. Gabriel Waters DVM', 'iritchie@example.com', '2025-01-28 16:39:33', '$2y$12$RFagZiaJtvAg.fd3IuhA2u3sFHBBz2c1kqqnkS/pEtYp3e3vuDeK.', 'Auq7HzBIkG', '2025-01-28 16:39:34', '2025-01-28 16:39:34', '76992 Roman Pike Apt. 469\nHageneshaven, TX 59353-6207', '938-421-7291'),
(5, 'Serena Abbott', 'desmond21@example.net', '2025-01-28 16:39:33', '$2y$12$RFagZiaJtvAg.fd3IuhA2u3sFHBBz2c1kqqnkS/pEtYp3e3vuDeK.', 'LiKMwucFpV', '2025-01-28 16:39:34', '2025-01-28 16:39:34', '645 Margarett Islands\nNorth Davidfort, VT 28480-8183', '+1.878.314.4469'),
(6, 'Ms. Helene Jaskolski', 'oconner.triston@example.com', '2025-01-28 16:39:33', '$2y$12$RFagZiaJtvAg.fd3IuhA2u3sFHBBz2c1kqqnkS/pEtYp3e3vuDeK.', 'fztlcdrtpd', '2025-01-28 16:39:34', '2025-01-28 16:39:34', '59555 Will Islands Suite 579\nMaynardfurt, LA 46168', '830-456-1617'),
(7, 'Florencio Stracke III', 'lexi.stark@example.net', '2025-01-28 16:39:33', '$2y$12$RFagZiaJtvAg.fd3IuhA2u3sFHBBz2c1kqqnkS/pEtYp3e3vuDeK.', 'x6ibIaM1Wt', '2025-01-28 16:39:34', '2025-01-28 16:39:34', '5998 Schuppe Place\nNew Myrtie, NJ 42186', '+18725128261'),
(8, 'Javon Nolan Jr.', 'keagan67@example.com', '2025-01-28 16:39:33', '$2y$12$RFagZiaJtvAg.fd3IuhA2u3sFHBBz2c1kqqnkS/pEtYp3e3vuDeK.', 'wXCRul3Z2z', '2025-01-28 16:39:34', '2025-01-28 16:39:34', '188 Graham Mountains\nEast Kamrynchester, AL 66901', '+1-380-915-4631'),
(9, 'Shanon Kulas', 'elna.mann@example.org', '2025-01-28 16:39:33', '$2y$12$RFagZiaJtvAg.fd3IuhA2u3sFHBBz2c1kqqnkS/pEtYp3e3vuDeK.', 'kIt3n7Ll4X', '2025-01-28 16:39:34', '2025-01-28 16:39:34', '7299 Leffler Ferry\nOsinskishire, KS 29199', '+1.680.333.1700'),
(10, 'Dr. Scarlett Schulist', 'wava46@example.org', '2025-01-28 16:39:33', '$2y$12$RFagZiaJtvAg.fd3IuhA2u3sFHBBz2c1kqqnkS/pEtYp3e3vuDeK.', 'lI8pphLaOx', '2025-01-28 16:39:35', '2025-01-28 16:39:35', '431 Emile Isle Suite 451\nGerholdberg, MN 49526-3128', '678-923-1945'),
(11, 'Mr. Torrey Brown', 'yharvey@example.net', '2025-01-28 16:39:33', '$2y$12$RFagZiaJtvAg.fd3IuhA2u3sFHBBz2c1kqqnkS/pEtYp3e3vuDeK.', 'iTYiOGHJ2U', '2025-01-28 16:39:35', '2025-01-28 16:39:35', '9683 Towne Valley Suite 172\nLake Patsyside, WI 18273', '+1-937-229-3501');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;