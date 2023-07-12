-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 06, 2023 at 04:59 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `final`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` int(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `allcategories`
--

CREATE TABLE `allcategories` (
  `ID` int(100) NOT NULL,
  `Category` varchar(1000) NOT NULL,
  `productTitle` varchar(1000) NOT NULL,
  `Price` int(100) NOT NULL,
  `ProductRate` int(100) NOT NULL,
  `countryOfOrigin` varchar(1000) NOT NULL,
  `Manufacturer` varchar(1000) NOT NULL,
  `ReviewsNumber` int(100) NOT NULL,
  `Neutral` varchar(100) DEFAULT NULL,
  `Negative` varchar(100) NOT NULL,
  `Positive` varchar(100) NOT NULL,
  `cat_id` int(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `image` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `allcategories`
--

INSERT INTO `allcategories` (`ID`, `Category`, `productTitle`, `Price`, `ProductRate`, `countryOfOrigin`, `Manufacturer`, `ReviewsNumber`, `Neutral`, `Negative`, `Positive`, `cat_id`, `created_at`, `updated_at`, `image`) VALUES
(1, 'Jtool', 'iBayam Journal Planner Pens Colored Pens Fine Point Markers Fine Tip Drawing Pens Porous Fineliner Pen for Journaling Writing Note Taking Calendar Coloring Art Office Back to School Supplies, 18 Color', 8, 5, 'China', 'B0772XSNXY', 200, '50', '6', '144', 3, '2023-04-05 10:35:18', '2023-07-06 13:11:42', 'https://th.bing.com/th/id/OIP.A7kTy4Ua5s10Hb_3EOpKEQAAAA?pid=ImgDet&rs=1'),
(2, 'Jtool', 'Shuttle Art Drawing Kit, 103 Pack Drawing Pencils Set, Sketching and Drawing Art Set with Colored Pencils, Sketch and Graphite Pencils in Portable Case, Drawing Supplies for Kids, Adults and Artists', 36, 5, 'China', 'Shuttle Art', 38, '6', '0', '32', 3, '2023-04-05 10:35:18', '2023-07-06 13:11:48', 'https://i5.walmartimages.com/asr/03df00a5-efc2-46f1-9887-d4616615cbec.6028f3c0a0de6d2ee176da746cc07399.jpeg?odnWidth=612&odnHeight=612&odnBg=ffffff'),
(3, 'Heads', 'RORSOU R10 On-Ear Headphones with Microphone, Lightweight Folding Stereo Bass Headphones with 1.5M No-Tangle Cord Portable Wired Headphones for Smartphone Tablet Computer MP3  4 (Black)', 16, 5, 'China', 'RORSOU', 451, '152', '53', '246', 2, '2023-04-05 10:35:36', '2023-07-06 13:11:14', 'https://th.bing.com/th/id/R.1cac708195043c4077f53ff267d320ad?rik=Q5zJz%2ftHUfhOUg&pid=ImgRaw&r=0'),
(4, 'headphone', 'Tuitager Bluetooth Headphones Over-Ear 60 Hours Playtime Foldable Lightweight Wireless Headphones Hi-Fi Stereo with 6 EQ Modes Bass Adjustable Headset with Built-in HD Mic FM SDTF for PCHome', 20, 4, 'China', 'Tuitager', 903, '287', '138', '478', 1, '2023-04-05 10:35:36', '2023-07-06 15:01:01', 'https://www.a.ubuy.com.kw/productimg/?image=aHR0cHM6Ly9tLm1lZGlhLWFtYXpvbi5jb20vaW1hZ2VzL0kvNzEtKzBVOHotWkwuX0FDX1NMMTUwMF8uanBn.jpg'),
(5, 'headphone', 'JBL Live 460NC - Wireless On-Ear Noise Cancelling Headphones with Long Battery Life and Voice Assistant Control - Black', 109, 5, 'China', 'JBL', 268, '85', '53', '130', 1, '2023-04-05 10:35:36', '2023-07-06 15:01:22', 'https://i5.walmartimages.com/asr/2da18cb4-3dc1-4243-a0f6-e0790dce2b07_1.f0946aac20397c23d9fec1a5c1eed5cc.jpeg?odnWidth=612&odnHeight=612&odnBg=ffffff'),
(6, 'Laptops', 'HP Chromebook Laptop 14a-na1043cl 14 Diagonal FHD IPS Display 1920 x 1080 Intel Celeron N4500 4 GB Memory 64 GB eMMC Storage Chrome OS Mineral Silver Renewed', 149, 4, 'China', 'B09RD2JX4P', 46, '13', '8', '25', 4, '2023-04-05 10:36:08', '2023-07-06 13:11:28', 'https://www.tejar.pk/media/catalog/product/cache/3/image/500x/9df78eab33525d08d6e5fb8d27136e95/h/p/hp_14_chromebook_14a_g52_-_tejar_2.jpg'),
(7, 'Laptops', 'Dell 2022 Newest Inspiron 15 3511 Laptop 15-6 FHD Touchscreen Intel Core i5-1035G1 16GB RAM 512GB PCIe NVMe M.2 SSD SD Card Reader Webcam HDMI WiFi Windows 11 Home Black', 552, 4, 'China', 'B09Z372YMT', 15, '7', '3', '5', 4, '2023-04-05 10:36:08', '2023-07-06 13:12:01', 'https://th.bing.com/th/id/OIP.Akv3-C-zLaTPDRdjF8TR4QHaEr?pid=ImgDet&rs=1'),
(8, 'jtool', 'TANJIN 8pcs Jewelry Tools With Pliers Tweezers Beading Tool Kit Jewelry Making DIY Tools', 13, 5, 'China', 'B07F13796F', 43, '18', '20', '5', 2, '2023-04-05 10:35:48', '2023-07-06 15:03:45', 'https://www.exit15.com/image/cache/catalog/tanjin/tanjin-8pc-jewelry-tools-with-pliers-tweezers-beading-tool-k-B07F13796F-600x600.jpg'),
(9, 'jtool', 'Mr. Pen- Jewelry Pliers, 3 Pack, Jewelry Making kit, Pliers for Jewelry Making, Mini Pliers, Wire Cutters for Jewelry Making, Chain Nose Pliers, Craft Pliers, Earring Pliers, Christmas Gifts', 6, 5, 'China', 'B08BJBY96R', 199, '73', '46', '80', 2, '2023-04-05 10:35:48', '2023-07-06 15:04:02', 'https://th.bing.com/th/id/OIP.mBoHO4uwgflltm-FxefX6wAAAA?pid=ImgDet&rs=1'),
(10, 'jtool', 'Jewelry Pliers, Shynek 3pcs Jewelry Making Pliers Tools with Needle Nose Pliers/Chain Nose Pliers, Round Nose Pliers and Wire Cutter for Jewelry Repair, Wire Wrapping, Crafts, Jewelry Making Supplies', 8, 5, 'Vitnam', 'B07ZGFK411', 199, '92', '25', '82', 2, '2023-04-05 10:35:48', '2023-07-06 15:04:36', 'https://m.media-amazon.com/images/I/41IjCXJZr9L._SL500_.jpg'),
(11, 'jtool', '2 Pieces Jewelry Pliers, AHIER Jewelry Making Pliers Tools Including 6 in 1 Bail Making Pliers Jewelry Bail Pliers, Round Nose Pliers for Jewelry Repair, Wire Wrapping, Crafts, Jewelry Making', 13, 5, 'China', 'B0B1D9MCKV', 7, '4', '0', '3', 2, '2023-04-05 10:35:48', '2023-07-06 15:04:57', 'https://ae01.alicdn.com/kf/HTB1WXfMtY5YBuNjSspoq6zeNFXaO/Stainless-Steel-Jewelry-Pliers-Kit-Set-Needle-Nose-Plier-Wire-Draw-Plier.jpg'),
(12, 'jtool', 'KOUGU Super Precision Long Needle Nose Pliers - 6 Inch Steel Mini Long Nose Pliers With Non Serrated Edge & Non Slip Handles - Great For Jewelers, Fine Crafting, & Other High Precision Projects', 25, 5, 'China', 'B08V14PG4R', 10, '3', '6', '1', 2, '2023-04-05 10:35:48', '2023-07-06 15:05:15', 'https://images-na.ssl-images-amazon.com/images/I/41lWuXMiD0L._AC_SX679_.jpg'),
(13, 'Laptops', '2022 Newest HP Pavilion 15-6 HD Laptop Intel Quad-core Pentium Processor 16GB RAM 1TB SSD 11 Hr Battry Life  Intel UHD Graphics HD Webcam Bluetooth HDMI USB Type-C Scarlet Red Win 11', 499, 4, 'China', 'Pavilion', 23, '15', '2', '6', 4, '2023-04-05 10:36:08', '2023-07-06 13:12:33', 'https://th.bing.com/th/id/R.c4aacfa2b26367bdad7d6784864ba73c?rik=z7BbsOkKfJxqMg&pid=ImgRaw&r=0'),
(14, 'Laptops', 'Acer Aspire 5 A515-56-32DK Slim Laptop - 15-6 Full HD IPS Display - 11th Gen Intel i3-1115G4 Dual Core Processor - 4GB DDR4 - 128GB NVMe SSD - WiFi 6?- Amazon Alexa - Windows 11 Home in S mode.', 269, 4, 'China', 'B09R5VYRVN', 99, '51', '11', '37', 4, '2023-04-05 10:36:08', '2023-07-06 13:12:08', 'https://th.bing.com/th/id/R.9139924027e04ba926ac58d5c51c4aea?rik=X2S1s3qa8CIYpQ&pid=ImgRaw&r=0'),
(15, 'Laptops', 'Lenovo 2022 Newest Ideapad 3 Laptop 15-6 HD Touchscreen 11th Gen Intel Core i3-1115G4 Processor 8GB DDR4 RAM 256GB PCIe NVMe SSD HDMI Webcam Wi-Fi 5 Bluetooth Windows 11 Home Almond', 389, 4, 'Hours', 'B08B6F1NNR', 203, '86', '39', '78', 4, '2023-04-05 10:36:08', '2023-07-06 13:12:57', 'https://m.media-amazon.com/images/I/61amuRGU60L._AC_SS450_.jpg'),
(16, 'Laptops', 'HP Chromebook Laptop 14a-na1043cl 14 Diagonal FHD IPS Display 1920 x 1080 Intel Celeron N4500 4 GB Memory 64 GB eMMC Storage Chrome OS Mineral Silver Renewed', 149, 4, 'China', 'B09RD2JX4P', 46, '13', '8', '25', 4, '2023-04-05 10:36:08', '2023-07-06 13:12:49', 'https://images-na.ssl-images-amazon.com/images/I/91pl8ZpDAXL._AC_SL1500_.jpg'),
(17, 'Laptops', 'Dell 2022 Newest Inspiron 15 3511 Laptop 15-6 FHD Touchscreen Intel Core i5-1035G1 16GB RAM 512GB PCIe NVMe M.2 SSD SD Card Reader Webcam HDMI WiFi Windows 11 Home Black', 552, 4, 'China', 'B09Z372YMT', 15, '7', '3', '5', 4, '2023-04-05 10:36:08', '2023-07-06 13:12:42', 'https://th.bing.com/th/id/R.a0113c510ab455576da9cd0f43146fa4?rik=QUF%2bJaeMCNhOAw&pid=ImgRaw&r=0'),
(18, 'notebook', 'Oxford Stone Paper Notebook, 5-1/2 x 8-1/2, Blue Cover, 60 Sheets, 2 Pack (161641)', 9, 4, 'vitnam', 'B07C32J5TM', 549, '214', '96', '239', 2, '2023-04-05 10:37:21', '2023-07-06 15:08:16', 'https://images-na.ssl-images-amazon.com/images/I/71LdhjARFLL.jpg'),
(19, 'notebook', 'Amazon Basics Professional Journal, 10.5X7.5 inches, Black, 2-Pack', 13, 5, 'China', 'B07YLTJHH4', 108, '35', '6', '66', 2, '2023-04-05 10:37:21', '2023-07-06 15:08:32', 'https://th.bing.com/th/id/OIP.AN409C94E-0Q69rxVig79wAAAA?pid=ImgDet&rs=1'),
(20, 'phone', 'SAMSUNG Galaxy S22 Cell Phone, Factory Unlocked Android Smartphone, 128GB, 8K Camera And Video, Night Mode, Brightest Display Screen, 50MP Photo Resolution, Long Battery Life, US Version, Pink Gold', 699, 4, 'Vietnam', 'Samsung Electronincs', 42, '10', '11', '21', 0, '2023-04-05 10:37:36', '2023-07-06 15:08:50', 'https://th.bing.com/th/id/OIP.Biv8pN_eNrTvrQypNrpS4AAAAA?pid=ImgDet&rs=1'),
(21, 'phone', 'Huawei P30 Pro 128GB+8GB RAM (VOG-L29) 40MP LTE Factory Unlocked GSM Smartphone (International Version, No Warranty in the US) (Aurora)', 534, 5, 'China', 'Huawei', 130, '49', '11', '70', 0, '2023-04-05 10:37:36', '2023-05-17 20:16:27', '');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'copen', '2023-04-05 12:34:53', '2023-05-20 12:26:36'),
(2, 'headphones', '2023-04-05 12:34:53', '2023-05-20 12:27:05'),
(3, 'jtool', '2023-05-20 09:27:32', '2023-05-20 12:27:32'),
(4, 'laptops', '2023-05-20 09:28:30', '2023-05-20 12:28:30'),
(5, 'notebook', '2023-05-20 09:28:49', '2023-05-20 12:28:49'),
(6, 'phones', '2023-05-20 09:28:59', '2023-05-20 12:28:59'),
(7, 'mo', '2023-05-20 10:02:38', '2023-05-20 13:22:47');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(28, '2014_10_12_000000_create_users_table', 1),
(29, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(30, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(31, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(32, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(33, '2016_06_01_000004_create_oauth_clients_table', 1),
(34, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(35, '2019_08_19_000000_create_failed_jobs_table', 1),
(36, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('08ab112cc3e7359ea85d7e51e64a5105839f4551935011165e1ced0d002f4b1192ee22ed6a80a7be', 11, '9991236c-0a54-49d5-b8d7-b8f80c13a455', 'Laravel Password Grant Client', '[]', 0, '2023-07-06 11:16:35', '2023-07-06 11:16:35', '2024-07-06 13:16:35'),
('0926fb48423bbe4be557832ecd28bbba166f3ea177b970780d67c66e98edeefa19a2690de5eac95b', 1, '9991236c-0a54-49d5-b8d7-b8f80c13a455', 'Laravel Password Grant Client', '[]', 0, '2023-07-04 15:12:12', '2023-07-04 15:12:13', '2024-07-04 17:12:12'),
('0988c8855be95b2e17f904058217320320f3cbcd34342cf8fef4e221dc8e80d2a7e8a4f4b28452a9', 9, '9991236c-0a54-49d5-b8d7-b8f80c13a455', 'Laravel Password Grant Client', '[]', 0, '2023-07-04 15:02:46', '2023-07-04 15:02:46', '2024-07-04 17:02:46'),
('1655d922c72569b9aaadd048ef80f97d5bfd3c776a5b20bb01fe49114eba570559258d23bee094eb', 1, '9991236c-0a54-49d5-b8d7-b8f80c13a455', 'Laravel Password Grant Client', '[]', 0, '2023-07-06 11:27:11', '2023-07-06 11:27:11', '2024-07-06 13:27:11'),
('18ce67bd96bbf7d357ee9316468cdc18e49cf14e7a688e7f632da89812b99a6b96ba5ad96f365305', 9, '9991236c-0a54-49d5-b8d7-b8f80c13a455', 'Laravel Password Grant Client', '[]', 0, '2023-07-04 14:50:26', '2023-07-04 14:50:26', '2024-07-04 16:50:26'),
('19c4497e82950b8af33719dec046346b99ccf748a559c2dc01dd7fa085c768f4a0faad092818bc0d', 1, '9991236c-0a54-49d5-b8d7-b8f80c13a455', 'Laravel Password Grant Client', '[]', 0, '2023-07-04 14:21:53', '2023-07-04 14:21:53', '2024-07-04 16:21:53'),
('285c7b7c0661200dff975311c36e76cc75537a529e7d2d4ff2062cd7c109c2c3bb78ba35b036e2dd', 9, '9991236c-0a54-49d5-b8d7-b8f80c13a455', 'Laravel Password Grant Client', '[]', 0, '2023-07-04 14:49:40', '2023-07-04 14:49:40', '2024-07-04 16:49:40'),
('5b0ed598705c40e6c983e252df8e75f44b7cf00daf30770a710c37546761d47b3164674f2363a805', 1, '9991236c-0a54-49d5-b8d7-b8f80c13a455', 'Laravel Password Grant Client', '[]', 0, '2023-07-06 11:10:36', '2023-07-06 11:10:36', '2024-07-06 13:10:36'),
('686a6805bfd3e9d1f20a3f365a12dc149eab9352bd504b007d87aaadd0aa36aedcec79dd5f7de309', 1, '9991236c-0a54-49d5-b8d7-b8f80c13a455', 'Laravel Password Grant Client', '[]', 0, '2023-07-04 14:37:43', '2023-07-04 14:37:43', '2024-07-04 16:37:43'),
('8139d6df284a9934f108c79c94910257394ff3094518126259dc7347f627b81d940dfdcdceb72efb', 9, '9991236c-0a54-49d5-b8d7-b8f80c13a455', 'Laravel Password Grant Client', '[]', 0, '2023-07-04 15:08:00', '2023-07-04 15:08:00', '2024-07-04 17:08:00'),
('829fe75cdac33dcb1ef4b87eacc396ff698286408a0b3b916c0b84f9b82d19e446b2a00907ae8e1d', 9, '9991236c-0a54-49d5-b8d7-b8f80c13a455', 'Laravel Password Grant Client', '[]', 0, '2023-07-04 15:02:06', '2023-07-04 15:02:06', '2024-07-04 17:02:06'),
('9a093ef988a7fce922d4fad728503abdc5bcb19ee97c1f4ba615f00b65c83553a96dee048390642c', 1, '9991236c-0a54-49d5-b8d7-b8f80c13a455', 'Laravel Password Grant Client', '[]', 0, '2023-07-06 10:51:08', '2023-07-06 10:51:08', '2024-07-06 12:51:08'),
('9b8194b3dd7bee6318092af35af5727b63c38e575962f7cbd4aeec95604bfa4510cec217e4fb168b', 1, '9991236c-0a54-49d5-b8d7-b8f80c13a455', 'Laravel Password Grant Client', '[]', 0, '2023-07-04 14:55:36', '2023-07-04 14:55:36', '2024-07-04 16:55:36'),
('a3beced58a1e51b41c1d438efb68e00b356a732177a4c7031c3827d8e9500a2842933074b6a72ecf', 7, '9991236c-0a54-49d5-b8d7-b8f80c13a455', 'Laravel Password Grant Client', '[]', 0, '2023-07-04 14:26:54', '2023-07-04 14:26:54', '2024-07-04 16:26:54'),
('acd93b4644b12c09550261c131b846138ec15b0efe2a1f1730cb9f9a457005ddbc5dc3a094142b3a', 11, '9991236c-0a54-49d5-b8d7-b8f80c13a455', 'Laravel Password Grant Client', '[]', 0, '2023-07-06 10:19:17', '2023-07-06 10:19:17', '2024-07-06 12:19:17'),
('b0c078b8b988712328748d83e246623d2f151a7f87684cf970741b3cbfa81c753d870d81cfce845a', 1, '9991236c-0a54-49d5-b8d7-b8f80c13a455', 'Laravel Password Grant Client', '[]', 0, '2023-07-04 14:17:37', '2023-07-04 14:17:37', '2024-07-04 16:17:37'),
('c23b465c4642f59c716d6b57d20caa5787cc0a179599e43e56e76955d8adfc2d78e08caecb8fa82a', 1, '9991236c-0a54-49d5-b8d7-b8f80c13a455', 'Laravel Password Grant Client', '[]', 0, '2023-07-06 11:09:26', '2023-07-06 11:09:26', '2024-07-06 13:09:26'),
('c6d45c84757b7a181a60b54204ef2679e0b5bd75ae123e717db928df325bc7f35f82ff555756d6e7', 9, '9991236c-0a54-49d5-b8d7-b8f80c13a455', 'Laravel Password Grant Client', '[]', 0, '2023-07-04 14:36:50', '2023-07-04 14:36:50', '2024-07-04 16:36:50'),
('d1a8f42935a0da020df6aa554cc1ccc0f8158ebe4ad9a305d89b11945bc621b2ea1f4b379566662e', 1, '9991236c-0a54-49d5-b8d7-b8f80c13a455', 'Laravel Password Grant Client', '[]', 0, '2023-07-04 14:01:51', '2023-07-04 14:01:51', '2024-07-04 16:01:51');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` char(36) NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` char(36) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
('9991236c-0a54-49d5-b8d7-b8f80c13a455', NULL, 'Laravel Personal Access Client', 'dGsuHz20WOZZcgBQn5foolrKKIsUx3oDg8N1G3ys', NULL, 'http://localhost', 1, 0, 0, '2023-07-04 14:00:35', '2023-07-04 14:00:35'),
('9991236c-2ceb-4a71-9e5a-032525dbff09', NULL, 'Laravel Password Grant Client', '6hHrHNSInFDhw57A2GtVi5JrzunHpf8JqyVi7QY1', 'users', 'http://localhost', 0, 1, 0, '2023-07-04 14:00:35', '2023-07-04 14:00:35');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` char(36) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, '9991236c-0a54-49d5-b8d7-b8f80c13a455', '2023-07-04 14:00:35', '2023-07-04 14:00:35');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `userType` enum('user','admin') NOT NULL DEFAULT 'user',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `userType`, `remember_token`, `created_at`, `updated_at`, `image`) VALUES
(1, 'osama', 'admin@a.com', NULL, '$2y$10$h3A2dcImjlYD90UM/NcJw.6lCgRTAJ8vJTatjIi0qkt9QPnjWKT0W', 'admin', NULL, '2023-07-04 14:01:45', '2023-07-04 14:01:45', NULL),
(2, 'meroz fayez', 'meroz123@gmail.com', NULL, '$2y$10$2NyhjJkLVNVNUULbCALLiu8tpLasOGQ0.ka7w.U0JbNWuu2oekRg.', 'user', NULL, '2023-07-04 14:21:03', '2023-07-04 14:21:03', NULL),
(6, 'aa', 'aa@w.com', NULL, '$2y$10$He88us2ojjdrfNmjTkEZtufN6uLsMHLDC2F1pz3k5CYabdONnN1Ja', 'user', NULL, '2023-07-04 14:24:47', '2023-07-04 14:24:47', NULL),
(7, 'meroz fayez', 'meroz12345@gmail.com', NULL, '$2y$10$AICjef.H10E8CVMfhDF6oOfb/F6rUZJNAjpJCpiH.zLzvl45STIKC', 'user', NULL, '2023-07-04 14:26:24', '2023-07-04 14:26:24', NULL),
(8, 'osama', 'admin@a.coma', NULL, '$2y$10$R3WwHx2CM4HL5qUZAmRugeY3t1gB/vUvMws.zLO7eQj8g6/k1YeCe', 'admin', NULL, '2023-07-04 14:28:18', '2023-07-04 14:28:18', NULL),
(9, 'meroz', 'merna123@gmail.com', NULL, '$2y$10$spL8dyarlphaA23DlouGM.lnNfdsAZiBY1uoq5NJeXL5STW3q1Qym', 'user', NULL, '2023-07-04 14:29:15', '2023-07-04 14:29:15', NULL),
(10, 'meroz', 'merna123@gmail.comjhhjj', NULL, '$2y$10$QfAobV8xprFrRHQddi2oZO0AmDF/VbX4brYF1RFQQtQVHfYYmoLKa', 'user', NULL, '2023-07-04 14:36:14', '2023-07-04 14:36:14', NULL),
(11, 'jjj', 'b@b.com', NULL, '$2y$10$qltSWne3EqYA5Fny/SHI7u94vvIEIBCJnyAIVpNrnUqpwZvfXh9mi', 'user', NULL, '2023-07-06 10:19:01', '2023-07-06 10:19:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `user-id` int(100) NOT NULL,
  `cat-id` int(100) NOT NULL,
  `product-id` int(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`user-id`, `cat-id`, `product-id`, `created_at`, `updated_at`) VALUES
(1, 2, 3, '2023-07-03 15:10:45', '2023-07-03 17:10:45'),
(2, 2, 0, '2023-07-03 15:11:37', '2023-07-03 17:11:37'),
(7000, 0, 1, '2023-07-04 10:59:02', '2023-07-04 12:59:02'),
(7000, 0, 8200, '2023-07-04 12:03:31', '2023-07-04 14:03:31'),
(7000, 0, 50053, '2023-07-04 12:15:01', '2023-07-04 14:15:01'),
(7000, 0, 28486, '2023-07-04 12:31:45', '2023-07-04 14:31:45'),
(7000, 0, 89138, '2023-07-04 12:35:33', '2023-07-04 14:35:33'),
(7000, 0, 2, '2023-07-04 12:41:19', '2023-07-04 14:41:19'),
(1, 0, 56385, '2023-07-04 14:46:45', '2023-07-04 16:46:45'),
(1, 0, 15784, '2023-07-04 14:48:16', '2023-07-04 16:48:16'),
(1, 0, 2, '2023-07-06 11:13:25', '2023-07-06 13:13:25'),
(1, 0, 1, '2023-07-06 11:13:28', '2023-07-06 13:13:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `allcategories`
--
ALTER TABLE `allcategories`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD KEY `cat-id` (`cat-id`),
  ADD KEY `product-id` (`product-id`),
  ADD KEY `user-id` (`user-id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
