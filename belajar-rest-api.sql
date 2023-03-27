-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 26, 2023 at 10:41 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `belajar-rest-api`
--

-- --------------------------------------------------------

--
-- Table structure for table `alat`
--

CREATE TABLE `alat` (
  `idalat` bigint(20) UNSIGNED NOT NULL,
  `nama_alat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resep_idresep` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bahan`
--

CREATE TABLE `bahan` (
  `idbahan` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `satuan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `banyak` decimal(8,2) NOT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resep_idresep` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `idlog` bigint(20) UNSIGNED NOT NULL,
  `module` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `useraccess` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`idlog`, `module`, `action`, `useraccess`, `created_at`, `updated_at`) VALUES
(1, 'User', 'Create', 'if21.m.faqih@mhs.ubpkarawang.ac.id', '2023-03-07 04:45:25', '2023-03-07 04:45:25'),
(2, 'User', 'Create', 'if21.m.faqih@mhs.ubpkarawang.ac.id', '2023-03-07 04:48:09', '2023-03-07 04:48:09'),
(3, 'Auth', 'Register', 'M. Naufal Faqih', '2023-03-07 04:48:09', '2023-03-07 04:48:09'),
(4, 'Auth', 'Login', 'M. Naufal Faqih', '2023-03-07 04:58:15', '2023-03-07 04:58:15'),
(5, 'Auth', 'Login', 'M. Naufal Faqih', '2023-03-13 03:27:22', '2023-03-13 03:27:22'),
(6, 'Auth', 'Login', 'M. Naufal Faqih', '2023-03-13 03:35:15', '2023-03-13 03:35:15'),
(7, 'User', 'Create', 'kato@mail.com', '2023-03-13 03:36:20', '2023-03-13 03:36:20'),
(8, 'Auth', 'Register', 'naufal', '2023-03-13 03:36:20', '2023-03-13 03:36:20'),
(9, 'User', 'Delete', 'rahmi55@example.org', '2023-03-13 04:00:38', '2023-03-13 04:00:38'),
(10, 'User', 'Create', 'kato@gmail.com', '2023-03-14 02:04:18', '2023-03-14 02:04:18'),
(11, 'Auth', 'Register', 'kato', '2023-03-14 02:04:18', '2023-03-14 02:04:18'),
(12, 'Auth', 'Login', 'kato', '2023-03-14 02:13:21', '2023-03-14 02:13:21'),
(13, 'User', 'Create', 'anime@gmail.com', '2023-03-14 02:17:04', '2023-03-14 02:17:04'),
(14, 'Auth', 'Register', 'katow', '2023-03-14 02:17:04', '2023-03-14 02:17:04'),
(15, 'Auth', 'Login', 'kato', '2023-03-14 02:22:11', '2023-03-14 02:22:11'),
(16, 'Auth', 'Login', 'kato', '2023-03-14 02:23:22', '2023-03-14 02:23:22'),
(17, 'User', 'Delete', 'admin@admin.com', '2023-03-14 02:28:45', '2023-03-14 02:28:45'),
(18, 'Auth', 'Login', 'kato', '2023-03-21 01:44:05', '2023-03-21 01:44:05');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(10, '2014_10_12_000000_create_users_table', 1),
(11, '2014_10_12_100000_create_password_resets_table', 1),
(12, '2019_08_19_000000_create_failed_jobs_table', 1),
(13, '2023_03_06_235340_create_products_table', 1),
(14, '2023_03_07_014542_create_resep_table', 1),
(15, '2023_03_07_015045_create_alat_table', 1),
(16, '2023_03_07_015312_create_resep_view_table', 1),
(17, '2023_03_07_015519_create_rating_table', 1),
(18, '2023_03_07_015825_create_log_table', 1),
(19, '2023_03_21_083153_create_bahan_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `idrating` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL,
  `review` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resep_idresep` bigint(20) UNSIGNED NOT NULL,
  `email_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resep`
--

CREATE TABLE `resep` (
  `idresep` bigint(20) UNSIGNED NOT NULL,
  `judul` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cara_pembuatan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_resep` enum('draft','submit','publish','unpublished') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resep_view`
--

CREATE TABLE `resep_view` (
  `idresep_view` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date NOT NULL,
  `resep_idresep` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_validate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('aktif','nonaktif') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'nonaktif',
  `last_login` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `role`, `password`, `email_validate`, `status`, `last_login`, `created_at`, `updated_at`) VALUES
(6, 'Malik Prabowo', 'anita.maryati@example.net', 'user', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'nonaktif', '2023-03-07 10:48:33', '2023-03-07 03:48:33', '2023-03-07 03:48:33'),
(7, 'Rudi Teddy Irawan S.I.Kom', 'aoktaviani@example.com', 'user', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'nonaktif', '2023-03-07 10:48:33', '2023-03-07 03:48:33', '2023-03-07 03:48:33'),
(8, 'Okto Darmaji Hidayanto', 'mkusmawati@example.org', 'user', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'nonaktif', '2023-03-07 10:48:33', '2023-03-07 03:48:33', '2023-03-07 03:48:33'),
(9, 'Pia Lestari', 'ywijayanti@example.net', 'user', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'nonaktif', '2023-03-07 10:48:33', '2023-03-07 03:48:33', '2023-03-07 03:48:33'),
(11, 'Tiara Anggraini S.E.I', 'wpratiwi@example.org', 'user', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'nonaktif', '2023-03-07 10:48:33', '2023-03-07 03:48:33', '2023-03-07 03:48:33'),
(12, 'Surya Wahyudin M.Pd', 'osuwarno@example.com', 'user', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'nonaktif', '2023-03-07 10:48:33', '2023-03-07 03:48:33', '2023-03-07 03:48:33'),
(13, 'Karja Napitupulu', 'bhasanah@example.net', 'user', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'nonaktif', '2023-03-07 10:48:33', '2023-03-07 03:48:33', '2023-03-07 03:48:33'),
(14, 'Prayogo Sirait', 'rahayu80@example.org', 'user', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'nonaktif', '2023-03-07 10:48:33', '2023-03-07 03:48:33', '2023-03-07 03:48:33'),
(15, 'Vicky Astuti', 'gsirait@example.org', 'user', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'nonaktif', '2023-03-07 10:48:33', '2023-03-07 03:48:33', '2023-03-07 03:48:33'),
(16, 'Jaeman Mahendra', 'dyulianti@example.org', 'user', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'nonaktif', '2023-03-07 10:48:33', '2023-03-07 03:48:33', '2023-03-07 03:48:33'),
(17, 'Ellis Nabila Padmasari M.TI.', 'qnashiruddin@example.org', 'user', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'nonaktif', '2023-03-07 10:48:33', '2023-03-07 03:48:33', '2023-03-07 03:48:33'),
(18, 'Asman Narpati', 'iwibowo@example.org', 'user', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'nonaktif', '2023-03-07 10:48:33', '2023-03-07 03:48:33', '2023-03-07 03:48:33'),
(19, 'Kasiyah Novitasari', 'oskar01@example.net', 'user', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'nonaktif', '2023-03-07 10:48:33', '2023-03-07 03:48:33', '2023-03-07 03:48:33'),
(20, 'Humaira Usada', 'padmasari.malika@example.org', 'user', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'nonaktif', '2023-03-07 10:48:33', '2023-03-07 03:48:33', '2023-03-07 03:48:33'),
(21, 'Oman Narpati S.Pd', 'yuniar.najib@example.com', 'user', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'nonaktif', '2023-03-07 10:48:33', '2023-03-07 03:48:33', '2023-03-07 03:48:33'),
(22, 'Makara Kurniawan', 'mzulaika@example.org', 'user', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'nonaktif', '2023-03-07 10:48:33', '2023-03-07 03:48:33', '2023-03-07 03:48:33'),
(23, 'Umaya Harsanto Waskita S.Ked', 'eman99@example.org', 'user', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'nonaktif', '2023-03-07 10:48:33', '2023-03-07 03:48:33', '2023-03-07 03:48:33'),
(24, 'Faizah Uyainah S.Kom', 'gatot91@example.org', 'user', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'nonaktif', '2023-03-07 10:48:33', '2023-03-07 03:48:33', '2023-03-07 03:48:33'),
(25, 'Adika Malik Hakim', 'calista.puspasari@example.org', 'user', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'nonaktif', '2023-03-07 10:48:33', '2023-03-07 03:48:33', '2023-03-07 03:48:33'),
(26, 'Umi Lintang Mardhiyah', 'fzulkarnain@example.org', 'user', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'nonaktif', '2023-03-07 10:48:33', '2023-03-07 03:48:33', '2023-03-07 03:48:33'),
(27, 'Irnanto Mahendra', 'mila.nuraini@example.org', 'user', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'nonaktif', '2023-03-07 10:48:33', '2023-03-07 03:48:33', '2023-03-07 03:48:33'),
(28, 'Paulin Permata', 'sidiq.hastuti@example.com', 'user', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'nonaktif', '2023-03-07 10:48:33', '2023-03-07 03:48:33', '2023-03-07 03:48:33'),
(29, 'Kuncara Salahudin', 'hutagalung.cornelia@example.net', 'user', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'nonaktif', '2023-03-07 10:48:33', '2023-03-07 03:48:33', '2023-03-07 03:48:33'),
(30, 'Tami Suryatmi', 'artanto.iswahyudi@example.com', 'user', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'nonaktif', '2023-03-07 10:48:33', '2023-03-07 03:48:33', '2023-03-07 03:48:33'),
(31, 'Rachel Rahimah M.TI.', 'samiah76@example.net', 'user', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'nonaktif', '2023-03-07 10:48:33', '2023-03-07 03:48:33', '2023-03-07 03:48:33'),
(32, 'Pranata Daryani Irawan S.H.', 'bakijan07@example.net', 'user', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'nonaktif', '2023-03-07 10:48:33', '2023-03-07 03:48:33', '2023-03-07 03:48:33'),
(33, 'Novi Safitri S.Farm', 'amalia.simbolon@example.net', 'user', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'nonaktif', '2023-03-07 10:48:33', '2023-03-07 03:48:33', '2023-03-07 03:48:33'),
(34, 'Halima Uyainah', 'diah.suartini@example.org', 'user', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'nonaktif', '2023-03-07 10:48:33', '2023-03-07 03:48:33', '2023-03-07 03:48:33'),
(35, 'Balamantri Wasita', 'narpati.adiarja@example.net', 'user', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'nonaktif', '2023-03-07 10:48:33', '2023-03-07 03:48:33', '2023-03-07 03:48:33'),
(36, 'Kacung Raharja Hutagalung S.E.', 'rama47@example.net', 'user', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'nonaktif', '2023-03-07 10:48:33', '2023-03-07 03:48:33', '2023-03-07 03:48:33'),
(37, 'Tiara Fujiati', 'padmasari.bala@example.com', 'user', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'nonaktif', '2023-03-07 10:48:33', '2023-03-07 03:48:33', '2023-03-07 03:48:33'),
(38, 'Karna Najmudin S.Ked', 'zulaika.zulfa@example.org', 'user', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'nonaktif', '2023-03-07 10:48:33', '2023-03-07 03:48:33', '2023-03-07 03:48:33'),
(39, 'Wirda Wijayanti S.Psi', 'luhung81@example.org', 'user', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'nonaktif', '2023-03-07 10:48:33', '2023-03-07 03:48:33', '2023-03-07 03:48:33'),
(40, 'Galiono Waskita', 'gambira.santoso@example.net', 'user', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'nonaktif', '2023-03-07 10:48:33', '2023-03-07 03:48:33', '2023-03-07 03:48:33'),
(41, 'Hamima Rahmawati', 'nasyidah.kayla@example.org', 'user', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'nonaktif', '2023-03-07 10:48:33', '2023-03-07 03:48:33', '2023-03-07 03:48:33'),
(42, 'Cakrabirawa Prabowo', 'owibisono@example.com', 'user', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'nonaktif', '2023-03-07 10:48:33', '2023-03-07 03:48:33', '2023-03-07 03:48:33'),
(43, 'Lidya Uyainah', 'tmulyani@example.net', 'user', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'nonaktif', '2023-03-07 10:48:33', '2023-03-07 03:48:33', '2023-03-07 03:48:33'),
(44, 'Fathonah Andriani S.Sos', 'warta.usada@example.net', 'user', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'nonaktif', '2023-03-07 10:48:33', '2023-03-07 03:48:33', '2023-03-07 03:48:33'),
(45, 'Yessi Wijayanti', 'hana.marbun@example.com', 'user', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'nonaktif', '2023-03-07 10:48:33', '2023-03-07 03:48:33', '2023-03-07 03:48:33'),
(46, 'Jono Megantara M.TI.', 'jono44@example.com', 'user', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'nonaktif', '2023-03-07 10:48:33', '2023-03-07 03:48:33', '2023-03-07 03:48:33'),
(47, 'Yunita Nasyiah', 'nasrullah.pradana@example.net', 'user', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'nonaktif', '2023-03-07 10:48:33', '2023-03-07 03:48:33', '2023-03-07 03:48:33'),
(48, 'Cemani Megantara M.M.', 'yoga00@example.com', 'user', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'nonaktif', '2023-03-07 10:48:33', '2023-03-07 03:48:33', '2023-03-07 03:48:33'),
(49, 'Zalindra Pratiwi S.I.Kom', 'iriana.sinaga@example.net', 'user', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'nonaktif', '2023-03-07 10:48:33', '2023-03-07 03:48:33', '2023-03-07 03:48:33'),
(50, 'Lurhur Budiyanto', 'wijaya.gamanto@example.com', 'user', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'nonaktif', '2023-03-07 10:48:33', '2023-03-07 03:48:33', '2023-03-07 03:48:33'),
(51, 'Eko Saiful Sihombing', 'zmarbun@example.com', 'user', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'nonaktif', '2023-03-07 10:48:33', '2023-03-07 03:48:33', '2023-03-07 03:48:33'),
(52, 'Widya Aryani', 'murti.nababan@example.org', 'user', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'nonaktif', '2023-03-07 10:48:33', '2023-03-07 03:48:33', '2023-03-07 03:48:33'),
(53, 'Gandi Heru Prayoga S.Farm', 'kmaryadi@example.com', 'user', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'nonaktif', '2023-03-07 10:48:33', '2023-03-07 03:48:33', '2023-03-07 03:48:33'),
(54, 'Prima Kurniawan', 'bsaefullah@example.com', 'user', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'nonaktif', '2023-03-07 10:48:33', '2023-03-07 03:48:33', '2023-03-07 03:48:33'),
(55, 'Laila Dina Rahimah', 'gangsa02@example.org', 'user', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'nonaktif', '2023-03-07 10:48:33', '2023-03-07 03:48:33', '2023-03-21 01:45:04'),
(57, 'M. Naufal Faqih', 'if21.m.faqih@mhs.ubpkarawang.ac.id', 'admin', '$2y$10$B0HvbslqwwdNcUYqkFm04.A9v0QoTk2zoF8j6Nv1JNUFrvzOfjhH6', NULL, 'nonaktif', '2023-03-07 11:48:09', '2023-03-07 04:48:09', '2023-03-07 04:48:09'),
(58, 'naufal', 'kato@mail.com', 'user', '$2y$10$gY8DIhjkuPffkSRGri0yhOMmClWyScO2g2JcSvpDD1ehJZI2R9A0i', NULL, 'nonaktif', '2023-03-13 10:36:20', '2023-03-13 03:36:20', '2023-03-13 03:36:20'),
(59, 'kato', 'kato@gmail.com', 'admin', '$2y$10$SVYIn9ktYHQDIhIoF/1p3ebK97Xw2BKWF6g7adc7MF.Os7G.7h4D6', NULL, 'nonaktif', '2023-03-14 09:04:18', '2023-03-14 02:04:18', '2023-03-14 02:04:18'),
(60, 'katow anime', 'anime@gmail.com', 'admin', '$2y$10$rUcxP5jLotucxwvpgYhy..U93O.oXKa8jCjRpFm1BB02jjK7PYnPO', 'kato@mail.com', 'aktif', '2023-03-14 09:17:04', '2023-03-14 02:17:04', '2023-03-14 02:27:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alat`
--
ALTER TABLE `alat`
  ADD PRIMARY KEY (`idalat`),
  ADD KEY `alat_resep_idresep_foreign` (`resep_idresep`);

--
-- Indexes for table `bahan`
--
ALTER TABLE `bahan`
  ADD PRIMARY KEY (`idbahan`),
  ADD KEY `bahan_resep_idresep_foreign` (`resep_idresep`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`idlog`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`idrating`),
  ADD KEY `rating_resep_idresep_foreign` (`resep_idresep`),
  ADD KEY `rating_email_user_foreign` (`email_user`);

--
-- Indexes for table `resep`
--
ALTER TABLE `resep`
  ADD PRIMARY KEY (`idresep`),
  ADD KEY `resep_user_email_foreign` (`user_email`);

--
-- Indexes for table `resep_view`
--
ALTER TABLE `resep_view`
  ADD PRIMARY KEY (`idresep_view`),
  ADD KEY `resep_view_resep_idresep_foreign` (`resep_idresep`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alat`
--
ALTER TABLE `alat`
  MODIFY `idalat` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bahan`
--
ALTER TABLE `bahan`
  MODIFY `idbahan` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `idlog` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `idrating` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `resep`
--
ALTER TABLE `resep`
  MODIFY `idresep` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `resep_view`
--
ALTER TABLE `resep_view`
  MODIFY `idresep_view` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alat`
--
ALTER TABLE `alat`
  ADD CONSTRAINT `alat_resep_idresep_foreign` FOREIGN KEY (`resep_idresep`) REFERENCES `resep` (`idresep`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bahan`
--
ALTER TABLE `bahan`
  ADD CONSTRAINT `bahan_resep_idresep_foreign` FOREIGN KEY (`resep_idresep`) REFERENCES `resep` (`idresep`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_email_user_foreign` FOREIGN KEY (`email_user`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rating_resep_idresep_foreign` FOREIGN KEY (`resep_idresep`) REFERENCES `resep` (`idresep`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `resep`
--
ALTER TABLE `resep`
  ADD CONSTRAINT `resep_user_email_foreign` FOREIGN KEY (`user_email`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `resep_view`
--
ALTER TABLE `resep_view`
  ADD CONSTRAINT `resep_view_resep_idresep_foreign` FOREIGN KEY (`resep_idresep`) REFERENCES `resep` (`idresep`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
