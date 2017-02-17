-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 14, 2016 at 02:32 PM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 7.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `psv`
--

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `bus_id` int(10) UNSIGNED NOT NULL,
  `opening_balance` double(8,2) NOT NULL,
  `running_balance` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `buses`
--

CREATE TABLE `buses` (
  `id` int(10) UNSIGNED NOT NULL,
  `number_plate` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `owner_id` int(10) UNSIGNED NOT NULL,
  `alias_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `buses`
--

INSERT INTO `buses` (`id`, `number_plate`, `status`, `created_at`, `updated_at`, `owner_id`, `alias_name`) VALUES
(1, 'KBT190D', 1, '2016-11-11 13:12:13', '2016-11-11 13:12:13', 3, 'Tribeca');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `postal_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `physical_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `masterfile_id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `city`, `postal_address`, `physical_address`, `website`, `masterfile_id`, `email`, `mobile_number`, `phone_number`, `created_at`, `updated_at`) VALUES
(1, 'Nirobi', '98789 kangemi', 'Kinoo', NULL, 2, 'willy@will.com', NULL, '072309873', '2016-11-11 13:08:35', '2016-11-11 13:08:35'),
(2, 'ds', '78ygh', 'fdg', NULL, 3, 'kariuki@george', NULL, '4534', '2016-11-11 13:11:38', '2016-11-11 13:11:38'),
(3, 'kisii', 'fgdff', '76867xcv', NULL, 4, 'hghs@sdf', NULL, '656756', '2016-11-11 13:29:05', '2016-11-11 13:29:05'),
(4, 'fsdfg', 'fgdsfsd', 'dgfsd', NULL, 5, 'sdds@gv', NULL, '654643', '2016-11-11 15:15:08', '2016-11-11 15:15:08'),
(5, 'jhfkjsejbfkj', 'fdefed', 'ghigu', NULL, 6, 'gjj@uigui', NULL, '78688', '2016-11-12 03:26:26', '2016-11-12 03:26:26');

-- --------------------------------------------------------

--
-- Table structure for table `customer_accounts`
--

CREATE TABLE `customer_accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `vehicle_id` int(10) UNSIGNED NOT NULL,
  `opening_balance` double NOT NULL,
  `running_ballance` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_bills`
--

CREATE TABLE `customer_bills` (
  `id` int(10) UNSIGNED NOT NULL,
  `bill_amount` double(8,2) NOT NULL,
  `bill_date` datetime NOT NULL,
  `bill_amount_paid` double(8,2) NOT NULL,
  `bill_balance` double(8,2) NOT NULL,
  `bus_id` int(11) NOT NULL,
  `total_cash_received` double(8,2) DEFAULT NULL,
  `bill_due_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `daily_bank_accumulations`
--

CREATE TABLE `daily_bank_accumulations` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `total_amount_collected` double NOT NULL,
  `actual_banked` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `daily_bank_accumulations`
--

INSERT INTO `daily_bank_accumulations` (`id`, `transaction_id`, `total_amount_collected`, `actual_banked`, `created_at`, `updated_at`) VALUES
(1, 2, 15600, 6000, '2016-11-11 13:38:48', '2016-11-11 13:38:48'),
(2, 3, 17000, 6550, '2016-11-11 14:46:04', '2016-11-11 14:46:04'),
(5, 6, 14700, 5350, '2016-11-12 03:43:06', '2016-11-12 03:43:06');

-- --------------------------------------------------------

--
-- Table structure for table `daily_expenses`
--

CREATE TABLE `daily_expenses` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `expense_id` int(10) UNSIGNED NOT NULL,
  `amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `daily_expenses`
--

INSERT INTO `daily_expenses` (`id`, `transaction_id`, `expense_id`, `amount`, `created_at`, `updated_at`) VALUES
(14, 2, 3, 300, '2016-11-11 13:38:48', '2016-11-11 13:38:48'),
(15, 2, 4, 200, '2016-11-11 13:38:48', '2016-11-11 13:38:48'),
(16, 2, 6, 100, '2016-11-11 13:38:48', '2016-11-11 13:38:48'),
(17, 2, 7, 100, '2016-11-11 13:38:48', '2016-11-11 13:38:48'),
(18, 2, 8, 100, '2016-11-11 13:38:48', '2016-11-11 13:38:48'),
(19, 2, 9, 1000, '2016-11-11 13:38:48', '2016-11-11 13:38:48'),
(20, 2, 11, 200, '2016-11-11 13:38:48', '2016-11-11 13:38:48'),
(21, 2, 12, 70, '2016-11-11 13:38:48', '2016-11-11 13:38:48'),
(22, 2, 1, 3240, '2016-11-11 13:38:48', '2016-11-11 13:38:48'),
(23, 2, 2, 2800, '2016-11-11 13:38:48', '2016-11-11 13:38:48'),
(24, 2, 5, 0, '2016-11-11 13:38:48', '2016-11-11 13:38:48'),
(25, 2, 10, 900, '2016-11-11 13:38:48', '2016-11-11 13:38:48'),
(26, 2, 13, 600, '2016-11-11 13:38:48', '2016-11-11 13:38:48'),
(27, 3, 3, 300, '2016-11-11 14:46:04', '2016-11-11 14:46:04'),
(28, 3, 4, 200, '2016-11-11 14:46:04', '2016-11-11 14:46:04'),
(29, 3, 6, 100, '2016-11-11 14:46:04', '2016-11-11 14:46:04'),
(30, 3, 7, 100, '2016-11-11 14:46:04', '2016-11-11 14:46:04'),
(31, 3, 8, 100, '2016-11-11 14:46:04', '2016-11-11 14:46:04'),
(32, 3, 9, 1000, '2016-11-11 14:46:04', '2016-11-11 14:46:04'),
(33, 3, 11, 200, '2016-11-11 14:46:04', '2016-11-11 14:46:04'),
(34, 3, 12, 70, '2016-11-11 14:46:04', '2016-11-11 14:46:04'),
(35, 3, 1, 5090, '2016-11-11 14:46:04', '2016-11-11 14:46:04'),
(36, 3, 2, 2500, '2016-11-11 14:46:04', '2016-11-11 14:46:04'),
(37, 3, 5, 0, '2016-11-11 14:46:04', '2016-11-11 14:46:04'),
(38, 3, 10, 0, '2016-11-11 14:46:04', '2016-11-11 14:46:04'),
(39, 3, 13, 800, '2016-11-11 14:46:04', '2016-11-11 14:46:04'),
(66, 6, 3, 300, '2016-11-12 03:43:06', '2016-11-12 03:43:06'),
(67, 6, 4, 200, '2016-11-12 03:43:06', '2016-11-12 03:43:06'),
(68, 6, 6, 100, '2016-11-12 03:43:06', '2016-11-12 03:43:06'),
(69, 6, 7, 100, '2016-11-12 03:43:06', '2016-11-12 03:43:06'),
(70, 6, 8, 100, '2016-11-12 03:43:06', '2016-11-12 03:43:06'),
(71, 6, 9, 1000, '2016-11-12 03:43:06', '2016-11-12 03:43:06'),
(72, 6, 11, 200, '2016-11-12 03:43:06', '2016-11-12 03:43:06'),
(73, 6, 12, 70, '2016-11-12 03:43:06', '2016-11-12 03:43:06'),
(74, 6, 1, 3770, '2016-11-12 03:43:06', '2016-11-12 03:43:06'),
(75, 6, 2, 2500, '2016-11-12 03:43:06', '2016-11-12 03:43:06'),
(76, 6, 5, 0, '2016-11-12 03:43:06', '2016-11-12 03:43:06'),
(77, 6, 10, 200, '2016-11-12 03:43:06', '2016-11-12 03:43:06'),
(78, 6, 13, 800, '2016-11-12 03:43:06', '2016-11-12 03:43:06');

-- --------------------------------------------------------

--
-- Stand-in structure for view `daily_report_view`
--
CREATE TABLE `daily_report_view` (
`id` int(10) unsigned
,`transaction_date` bigint(20)
,`bus_id` int(10) unsigned
,`driver_id` int(10) unsigned
,`conductor_id` int(10) unsigned
,`total_amount_collected` double
,`total_trips` double
,`expense_id` int(10) unsigned
,`amount` double
,`actual_banked` double
);

-- --------------------------------------------------------

--
-- Table structure for table `daily_transactions`
--

CREATE TABLE `daily_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_date` bigint(20) NOT NULL,
  `bus_id` int(10) UNSIGNED NOT NULL,
  `driver_id` int(10) UNSIGNED NOT NULL,
  `conductor_id` int(10) UNSIGNED NOT NULL,
  `total_amount_collected` double NOT NULL,
  `total_trips` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `daily_transactions`
--

INSERT INTO `daily_transactions` (`id`, `transaction_date`, `bus_id`, `driver_id`, `conductor_id`, `total_amount_collected`, `total_trips`, `created_at`, `updated_at`) VALUES
(2, 1472688000, 1, 2, 4, 15600, 8, '2016-11-11 13:38:48', '2016-11-11 13:38:48'),
(3, 1478044800, 1, 2, 4, 17000, 9, '2016-11-11 14:46:04', '2016-11-11 14:46:04'),
(6, 1478908800, 1, 6, 4, 14700, 8, '2016-11-12 03:43:06', '2016-11-12 03:43:06');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(10) UNSIGNED NOT NULL,
  `expense_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` double NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `expense_name`, `code`, `amount_type`, `amount`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Fuel', 'FUEL', 'Custom', 0, 1, '2016-11-11 13:02:49', '2016-11-11 13:02:49'),
(2, 'Salary', 'SALARY', 'Custom', 0, 1, '2016-11-11 13:13:17', '2016-11-11 13:13:17'),
(3, 'Carwash', 'CARWASH', 'Fixed', 300, 1, '2016-11-11 13:18:09', '2016-11-11 13:18:09'),
(4, 'Line', 'LINE', 'Fixed', 200, 1, '2016-11-11 13:18:35', '2016-11-11 13:18:35'),
(5, 'Releiver', 'RELEIVER', 'Custom', 0, 1, '2016-11-11 13:19:11', '2016-11-11 13:19:11'),
(6, 'Legal', 'LEGAL', 'Fixed', 100, 1, '2016-11-11 13:19:52', '2016-11-11 13:19:52'),
(7, 'Security', 'SECURITY', 'Fixed', 100, 1, '2016-11-11 13:20:12', '2016-11-11 13:20:12'),
(8, 'Parking', 'PARKING', 'Fixed', 100, 1, '2016-11-11 13:20:39', '2016-11-11 13:20:39'),
(9, 'SACCO', 'SACCO', 'Fixed', 1000, 1, '2016-11-11 13:20:56', '2016-11-11 13:20:56'),
(10, 'Garage', 'GARAGE', 'Custom', 0, 1, '2016-11-11 13:21:24', '2016-11-11 13:21:24'),
(11, 'Lunch', 'LUNCH', 'Fixed', 200, 1, '2016-11-11 13:21:43', '2016-11-11 13:21:43'),
(12, 'I.T', 'I.T', 'Fixed', 70, 1, '2016-11-11 13:22:03', '2016-11-11 13:22:03'),
(13, 'Road exe', 'ROAD-EXE', 'Custom', 0, 1, '2016-11-11 13:23:00', '2016-11-11 13:23:00');

-- --------------------------------------------------------

--
-- Table structure for table `fa_icons`
--

CREATE TABLE `fa_icons` (
  `id` int(10) UNSIGNED NOT NULL,
  `icon_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `icon_status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_transactions`
--

CREATE TABLE `invoice_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `vehicle_id` int(10) UNSIGNED NOT NULL,
  `transaction_date` date NOT NULL,
  `supplier_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `invoice_transactions`
--

INSERT INTO `invoice_transactions` (`id`, `vehicle_id`, `transaction_date`, `supplier_id`, `created_at`, `updated_at`) VALUES
(2, 1, '2016-11-01', 3, '2016-11-12 03:36:16', '2016-11-12 03:36:16');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_transaction_details`
--

CREATE TABLE `invoice_transaction_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `invoice_transaction_id` int(10) UNSIGNED NOT NULL,
  `item_id` int(10) UNSIGNED NOT NULL,
  `amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `invoice_transaction_details`
--

INSERT INTO `invoice_transaction_details` (`id`, `invoice_transaction_id`, `item_id`, `amount`, `created_at`, `updated_at`) VALUES
(2, 2, 2, 600, '2016-11-12 03:36:17', '2016-11-12 03:36:17'),
(3, 2, 3, 766, '2016-11-12 03:36:17', '2016-11-12 03:36:17'),
(4, 2, 4, 500, '2016-11-12 03:36:17', '2016-11-12 03:36:17');

-- --------------------------------------------------------

--
-- Table structure for table `journals`
--

CREATE TABLE `journals` (
  `id` int(10) UNSIGNED NOT NULL,
  `bus_id` int(11) NOT NULL,
  `dr_cr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_account` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `particulars` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transacted_by` int(11) NOT NULL,
  `transaction_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` double(8,2) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `masterfiles`
--

CREATE TABLE `masterfiles` (
  `id` int(10) UNSIGNED NOT NULL,
  `surname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `middlename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_path` text COLLATE utf8_unicode_ci,
  `user_role` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_no` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `registration_date` date DEFAULT NULL,
  `b_role` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `masterfiles`
--

INSERT INTO `masterfiles` (`id`, `surname`, `firstname`, `middlename`, `image_path`, `user_role`, `id_no`, `registration_date`, `b_role`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Admin', 'Admin', 'Admin', NULL, NULL, '12345678', '2016-11-11', 'Staff', '2016-11-11 11:46:34', '2016-11-11 11:46:34', 1),
(2, 'Kamau', 'Willis', 'Nyamai', NULL, 'Driver', '30067543', NULL, 'Driver', '2016-11-11 13:08:35', '2016-11-11 13:08:35', 1),
(3, 'Kariuki', 'George', 'Waweru', NULL, 'Ma3 owner', '893785', NULL, 'Ma3 owner', '2016-11-11 13:11:38', '2016-11-11 13:11:38', 1),
(4, 'Njuguna', 'Albert', 'Kamau', NULL, 'Conductor', '4567885', NULL, 'Conductor', '2016-11-11 13:29:05', '2016-11-11 13:29:05', 1),
(5, 'Kamau', 'Sternely', 'Kamotho', NULL, 'Driver', '843889', NULL, 'Driver', '2016-11-11 15:15:08', '2016-11-11 15:15:08', 1),
(6, 'william', 'kamau', 'mureithi', NULL, 'Driver', '93837884', NULL, 'Driver', '2016-11-12 03:26:26', '2016-11-12 03:26:26', 1);

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `route_id` int(10) UNSIGNED NOT NULL,
  `parent_menu` int(10) UNSIGNED DEFAULT NULL,
  `menu_status` tinyint(1) NOT NULL DEFAULT '1',
  `sequence` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `fa_icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `menu_name`, `icon`, `route_id`, `parent_menu`, `menu_status`, `sequence`, `created_at`, `updated_at`, `fa_icon`) VALUES
(51, NULL, NULL, 26, NULL, 1, 1, '2016-11-11 19:00:18', '2016-11-11 19:00:18', NULL),
(52, NULL, NULL, 27, 51, 1, 1, '2016-11-11 19:00:18', '2016-11-11 19:00:18', NULL),
(53, NULL, NULL, 28, NULL, 1, 2, '2016-11-11 19:00:18', '2016-11-11 19:00:18', NULL),
(54, NULL, NULL, 29, 53, 1, 1, '2016-11-11 19:00:18', '2016-11-11 19:00:18', NULL),
(55, NULL, NULL, 30, 53, 1, 2, '2016-11-11 19:00:18', '2016-11-11 19:00:18', NULL),
(56, NULL, NULL, 31, NULL, 1, 3, '2016-11-11 19:00:18', '2016-11-11 19:00:18', NULL),
(57, NULL, NULL, 32, 56, 1, 1, '2016-11-11 19:00:18', '2016-11-11 19:00:18', NULL),
(58, NULL, NULL, 33, 56, 1, 2, '2016-11-11 19:00:18', '2016-11-11 19:00:18', NULL),
(59, NULL, NULL, 34, 56, 1, 3, '2016-11-11 19:00:18', '2016-11-11 19:00:18', NULL),
(60, NULL, NULL, 35, NULL, 1, 4, '2016-11-11 19:00:18', '2016-11-11 19:00:18', NULL),
(61, NULL, NULL, 36, 60, 1, 1, '2016-11-11 19:00:18', '2016-11-11 19:00:18', NULL),
(62, NULL, NULL, 37, 60, 1, 2, '2016-11-11 19:00:18', '2016-11-11 19:00:18', NULL),
(63, NULL, NULL, 38, 60, 1, 4, '2016-11-11 19:00:18', '2016-11-11 19:00:18', NULL),
(64, NULL, NULL, 39, NULL, 1, 5, '2016-11-11 19:00:18', '2016-11-11 19:00:18', NULL),
(65, NULL, NULL, 40, 64, 1, 1, '2016-11-11 19:00:18', '2016-11-11 19:00:18', NULL),
(66, NULL, NULL, 41, 64, 1, 3, '2016-11-11 19:00:18', '2016-11-11 19:00:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_09_27_114253_create_roles_table', 1),
(4, '2016_10_12_085709_add_fa_icons_table', 1),
(5, '2016_10_17_114557_create_routes_table', 1),
(6, '2016_10_17_220838_create_menus_table', 1),
(7, '2016_10_17_223158_nullify_menu_name', 1),
(8, '2016_10_31_120036_create_role_routes', 1),
(9, '2016_11_01_092857_create_masterfile_table', 1),
(10, '2016_11_01_154740_create_user_roles_table', 1),
(11, '2016_11_01_193801_create_skins_table', 1),
(12, '2016_11_02_183215_create_buses_table', 1),
(13, '2016_11_02_191731_create_expenses_table', 1),
(14, '2016_11_03_172512_create_daily_transactions_table', 1),
(15, '2016_11_03_185419_addcolumnstoexpenses', 1),
(16, '2016_11_03_212422_create_daily_expenses_table', 1),
(17, '2016_11_03_212509_create_daily_bank_accumulations_table', 1),
(18, '2016_11_06_075012_add_fk_to_userstable', 1),
(19, '2016_11_06_164649_addUserRoleColumnInUsersT', 1),
(20, '2016_11_06_181608_addStatusColumn_on_masterfiles', 1),
(21, '2016_11_07_082115_create_customer_accounts_table', 1),
(22, '2016_11_07_104941_addStatus_column_on_userroles', 1),
(23, '2016_11_07_113321_users___add_role_name_to_users', 1),
(24, '2016_11_07_122709_create_all_masterfile_view', 2),
(25, '2016_11_08_050349_buses__add_owner_column_to_busses_tale', 2),
(26, '2016_11_08_050852_create_suppliers_table', 2),
(27, '2016_11_08_061746_create_supplier_entities_table', 2),
(28, '2016_11_08_081404_buses__add_alias_column_to_buses_tablee', 2),
(29, '2016_11_08_144349_create_invoice_transactions_table', 2),
(30, '2016_11_08_145027_create_invoice_transaction_details_table', 2),
(31, '2016_11_09_123008_create_daily_report_view', 2),
(32, '2016_11_09_123829_on_demand_daily_report', 2),
(33, '2016_11_10_083811_supplier_report_view', 2),
(34, '2016_11_5_093918_add_faicon_column', 2),
(35, '2016_11_5_114536_create_contacts_table', 2),
(36, '2016_11_12_055430_add_consta', 3),
(38, '2016_11_12_102416_create_bank_accounts_table', 4),
(39, '2016_11_12_084734_create_journals_table', 5),
(40, '2016_11_14_131005_create_customer_bills_table', 6);

-- --------------------------------------------------------

--
-- Stand-in structure for view `on_demand_daily_report`
--
CREATE TABLE `on_demand_daily_report` (
`id` int(10) unsigned
,`transaction_date` bigint(20)
,`bus_id` int(10) unsigned
,`driver_id` int(10) unsigned
,`conductor_id` int(10) unsigned
,`total_amount_collected` double
,`total_trips` double
,`actual_banked` double
);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `role_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role_status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_code`, `role_name`, `role_status`, `created_at`, `updated_at`) VALUES
(1, 'SYS_ADMIN', 'System Admin', 1, '2016-11-11 11:46:34', '2016-11-11 11:46:34');

-- --------------------------------------------------------

--
-- Table structure for table `role_route`
--

CREATE TABLE `role_route` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `route_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role_route`
--

INSERT INTO `role_route` (`id`, `role_id`, `route_id`, `created_at`, `updated_at`) VALUES
(17, 1, 27, NULL, NULL),
(18, 1, 29, NULL, NULL),
(19, 1, 30, NULL, NULL),
(20, 1, 32, NULL, NULL),
(21, 1, 33, NULL, NULL),
(22, 1, 34, NULL, NULL),
(23, 1, 36, NULL, NULL),
(24, 1, 37, NULL, NULL),
(25, 1, 38, NULL, NULL),
(26, 1, 43, NULL, NULL),
(27, 1, 44, NULL, NULL),
(28, 1, 45, NULL, NULL),
(29, 1, 46, NULL, NULL),
(30, 1, 48, NULL, NULL),
(31, 1, 49, NULL, NULL),
(32, 1, 50, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `routes`
--

CREATE TABLE `routes` (
  `id` int(10) UNSIGNED NOT NULL,
  `route_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent_route` int(10) UNSIGNED DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `route_status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `routes`
--

INSERT INTO `routes` (`id`, `route_name`, `parent_route`, `url`, `route_status`, `created_at`, `updated_at`) VALUES
(26, 'Dashboard', NULL, NULL, 1, '2016-11-11 13:02:49', '2016-11-11 13:02:49'),
(27, 'Analytics Dashboard', 26, 'dashboard', 1, '2016-11-11 13:02:49', '2016-11-11 13:02:49'),
(28, 'MasterFiles', NULL, NULL, 1, '2016-11-11 13:02:49', '2016-11-11 13:02:49'),
(29, 'Create MasterFile', 28, 'new-mf', 1, '2016-11-11 13:02:49', '2016-11-11 13:02:49'),
(30, 'All MasterFiles', 28, 'all-masterfiles', 1, '2016-11-11 13:02:49', '2016-11-11 13:02:49'),
(31, 'Suppliers', NULL, NULL, 1, '2016-11-11 13:02:49', '2016-11-11 13:02:49'),
(32, 'Manage Suppliers', 31, 'suppliers', 1, '2016-11-11 13:02:49', '2016-11-11 13:02:49'),
(33, 'Manage Supplier Items', 31, 'supplier-items', 1, '2016-11-11 13:02:49', '2016-11-11 13:02:49'),
(34, 'Manage Invoices', 31, 'invoices', 1, '2016-11-11 13:02:49', '2016-11-11 13:02:49'),
(35, 'System Configurations', NULL, NULL, 1, '2016-11-11 13:02:49', '2016-11-11 13:02:49'),
(36, 'Manage Vehicles', 35, 'all-buses', 1, '2016-11-11 13:02:49', '2016-11-11 13:02:49'),
(37, 'Manage Expenses', 35, 'expenses', 1, '2016-11-11 13:02:49', '2016-11-11 13:02:49'),
(38, 'Create Transaction', 35, 'accounts', 1, '2016-11-11 13:02:49', '2016-11-11 13:02:49'),
(39, 'Reports', NULL, NULL, 1, '2016-11-11 13:02:49', '2016-11-11 13:02:49'),
(40, 'Daily Report', 39, 'daily-report', 1, '2016-11-11 13:02:49', '2016-11-11 13:02:49'),
(41, 'On-Demand Report', 39, 'all-transactions', 1, '2016-11-11 13:02:49', '2016-11-11 13:02:49'),
(42, 'System Management', NULL, NULL, 1, '2016-11-11 13:02:49', '2016-11-11 13:02:49'),
(43, 'System Routes', 42, 'routes', 1, '2016-11-11 13:02:49', '2016-11-11 13:02:49'),
(44, 'System Menu', 42, 'menu', 1, '2016-11-11 13:02:49', '2016-11-11 13:02:49'),
(45, 'System Config', 42, 'system_config', 1, '2016-11-11 13:02:49', '2016-11-11 13:02:49'),
(46, 'Database Backup', 42, 'backups', 1, '2016-11-11 13:02:49', '2016-11-11 13:02:49'),
(47, 'User Management', NULL, NULL, 1, '2016-11-11 13:02:49', '2016-11-11 13:02:49'),
(48, 'All Users', 47, 'routes', 1, '2016-11-11 13:02:49', '2016-11-11 13:02:49'),
(49, 'User Roles', 47, 'user_roles', 1, '2016-11-11 13:02:49', '2016-11-11 13:02:49'),
(50, 'Audit Trail', 47, 'audit_trail', 1, '2016-11-11 13:02:49', '2016-11-11 13:02:49');

-- --------------------------------------------------------

--
-- Table structure for table `skins`
--

CREATE TABLE `skins` (
  `id` int(10) UNSIGNED NOT NULL,
  `theme` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `done_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(10) UNSIGNED NOT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `supplier_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` int(11) NOT NULL,
  `registration_number` int(11) DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `physical_location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `role`, `supplier_name`, `code`, `phone_number`, `registration_number`, `city`, `physical_location`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(2, 'Garage', 'Mash auto', 'MS', 90989089, 9800, 'nairobi', 'westlands', 1, 1, '2016-11-12 02:04:36', '2016-11-12 02:04:36'),
(3, 'Garage', 'Ramroad', 'JHHGK', 8789, 4095, 'jkbkj', 'jkbkk', 1, 1, '2016-11-12 03:32:15', '2016-11-12 03:32:15');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_entities`
--

CREATE TABLE `supplier_entities` (
  `id` int(10) UNSIGNED NOT NULL,
  `supplier_id` int(10) UNSIGNED NOT NULL,
  `item_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `item_code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `supplier_entities`
--

INSERT INTO `supplier_entities` (`id`, `supplier_id`, `item_name`, `item_code`, `amount`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(2, 2, 'Front seal', 'FS', 600, 1, 1, '2016-11-12 02:28:30', '2016-11-12 02:28:30'),
(3, 3, 'Oil filter', 'hjhk', 150, 1, 1, '2016-11-12 03:35:10', '2016-11-12 03:35:10'),
(4, 3, 'Grease', 'jhf', 500, 1, 1, '2016-11-12 03:35:40', '2016-11-12 03:35:40');

-- --------------------------------------------------------

--
-- Stand-in structure for view `supplier_report_view`
--
CREATE TABLE `supplier_report_view` (
`id` int(10) unsigned
,`vehicle_id` int(10) unsigned
,`transaction_date` date
,`supplier_id` int(10) unsigned
,`item_id` int(10) unsigned
,`amount` double
);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` int(11) DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `mf_id` int(10) UNSIGNED DEFAULT NULL,
  `user_role` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone_number`, `password`, `remember_token`, `created_at`, `updated_at`, `mf_id`, `user_role`) VALUES
(1, 'Admin', 'admin@admin.com', NULL, '$2y$10$UiJiSmkyGbL3G3.u/8E/zeutDgLEBOqepRkiopG.sRrNxyVTqP/Ya', '7YFeTVrVy2Mu267jUiEFoCe1u6MWsDoQBTr5HWePGI4fpR0eVUklRx99dZOp', '2016-11-11 11:46:35', '2016-11-12 07:12:15', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure for view `daily_report_view`
--
DROP TABLE IF EXISTS `daily_report_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `daily_report_view`  AS  select `dt`.`id` AS `id`,`dt`.`transaction_date` AS `transaction_date`,`dt`.`bus_id` AS `bus_id`,`dt`.`driver_id` AS `driver_id`,`dt`.`conductor_id` AS `conductor_id`,`dt`.`total_amount_collected` AS `total_amount_collected`,`dt`.`total_trips` AS `total_trips`,`de`.`expense_id` AS `expense_id`,`de`.`amount` AS `amount`,`dba`.`actual_banked` AS `actual_banked` from ((`daily_transactions` `dt` left join `daily_expenses` `de` on((`de`.`transaction_id` = `dt`.`id`))) left join `daily_bank_accumulations` `dba` on((`dba`.`transaction_id` = `dt`.`id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `on_demand_daily_report`
--
DROP TABLE IF EXISTS `on_demand_daily_report`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `on_demand_daily_report`  AS  select `dt`.`id` AS `id`,`dt`.`transaction_date` AS `transaction_date`,`dt`.`bus_id` AS `bus_id`,`dt`.`driver_id` AS `driver_id`,`dt`.`conductor_id` AS `conductor_id`,`dt`.`total_amount_collected` AS `total_amount_collected`,`dt`.`total_trips` AS `total_trips`,`dba`.`actual_banked` AS `actual_banked` from (`daily_transactions` `dt` left join `daily_bank_accumulations` `dba` on((`dba`.`transaction_id` = `dt`.`id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `supplier_report_view`
--
DROP TABLE IF EXISTS `supplier_report_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `supplier_report_view`  AS  select `it`.`id` AS `id`,`it`.`vehicle_id` AS `vehicle_id`,`it`.`transaction_date` AS `transaction_date`,`it`.`supplier_id` AS `supplier_id`,`itd`.`item_id` AS `item_id`,`itd`.`amount` AS `amount` from (`invoice_transactions` `it` left join `invoice_transaction_details` `itd` on((`itd`.`invoice_transaction_id` = `it`.`id`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bank_accounts_bus_id_index` (`bus_id`);

--
-- Indexes for table `buses`
--
ALTER TABLE `buses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `buses_number_plate_unique` (`number_plate`),
  ADD KEY `buses_id_index` (`id`),
  ADD KEY `buses_owner_id_index` (`owner_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_masterfile_id_index` (`masterfile_id`);

--
-- Indexes for table `customer_accounts`
--
ALTER TABLE `customer_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_accounts_vehicle_id_index` (`vehicle_id`);

--
-- Indexes for table `customer_bills`
--
ALTER TABLE `customer_bills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `daily_bank_accumulations`
--
ALTER TABLE `daily_bank_accumulations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `daily_bank_accumulations_id_unique` (`id`),
  ADD KEY `daily_bank_accumulations_transaction_id_index` (`transaction_id`);

--
-- Indexes for table `daily_expenses`
--
ALTER TABLE `daily_expenses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `daily_expenses_id_unique` (`id`),
  ADD KEY `daily_expenses_transaction_id_index` (`transaction_id`),
  ADD KEY `daily_expenses_expense_id_index` (`expense_id`);

--
-- Indexes for table `daily_transactions`
--
ALTER TABLE `daily_transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `daily_transactions_id_unique` (`id`),
  ADD KEY `daily_transactions_bus_id_index` (`bus_id`),
  ADD KEY `daily_transactions_driver_id_index` (`driver_id`),
  ADD KEY `daily_transactions_conductor_id_index` (`conductor_id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `expenses_id_unique` (`id`);

--
-- Indexes for table `fa_icons`
--
ALTER TABLE `fa_icons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_transactions`
--
ALTER TABLE `invoice_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_transactions_vehicle_id_index` (`vehicle_id`),
  ADD KEY `invoice_transactions_supplier_id_index` (`supplier_id`);

--
-- Indexes for table `invoice_transaction_details`
--
ALTER TABLE `invoice_transaction_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_transaction_details_invoice_transaction_id_index` (`invoice_transaction_id`),
  ADD KEY `invoice_transaction_details_item_id_index` (`item_id`);

--
-- Indexes for table `journals`
--
ALTER TABLE `journals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `masterfiles`
--
ALTER TABLE `masterfiles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `masterfiles_id_unique` (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menus_route_id_index` (`route_id`),
  ADD KEY `menus_parent_menu_index` (`parent_menu`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roles_id_index` (`id`);

--
-- Indexes for table `role_route`
--
ALTER TABLE `role_route`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_route_role_id_foreign` (`role_id`),
  ADD KEY `role_route_route_id_foreign` (`route_id`);

--
-- Indexes for table `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `routes_id_unique` (`id`),
  ADD KEY `routes_parent_route_index` (`parent_route`);

--
-- Indexes for table `skins`
--
ALTER TABLE `skins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `suppliers_id_index` (`id`);

--
-- Indexes for table `supplier_entities`
--
ALTER TABLE `supplier_entities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_entities_supplier_id_index` (`supplier_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_mf_id_index` (`mf_id`),
  ADD KEY `users_user_role_index` (`user_role`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_roles_id_index` (`id`),
  ADD KEY `user_roles_created_by_index` (`created_by`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `buses`
--
ALTER TABLE `buses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `customer_accounts`
--
ALTER TABLE `customer_accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `customer_bills`
--
ALTER TABLE `customer_bills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `daily_bank_accumulations`
--
ALTER TABLE `daily_bank_accumulations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `daily_expenses`
--
ALTER TABLE `daily_expenses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;
--
-- AUTO_INCREMENT for table `daily_transactions`
--
ALTER TABLE `daily_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `fa_icons`
--
ALTER TABLE `fa_icons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `invoice_transactions`
--
ALTER TABLE `invoice_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `invoice_transaction_details`
--
ALTER TABLE `invoice_transaction_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `journals`
--
ALTER TABLE `journals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `masterfiles`
--
ALTER TABLE `masterfiles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `role_route`
--
ALTER TABLE `role_route`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `routes`
--
ALTER TABLE `routes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `skins`
--
ALTER TABLE `skins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `supplier_entities`
--
ALTER TABLE `supplier_entities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD CONSTRAINT `bank_accounts_bus_id_foreign` FOREIGN KEY (`bus_id`) REFERENCES `buses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `buses`
--
ALTER TABLE `buses`
  ADD CONSTRAINT `buses_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `masterfiles` (`id`);

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_masterfile_id_foreign` FOREIGN KEY (`masterfile_id`) REFERENCES `masterfiles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_accounts`
--
ALTER TABLE `customer_accounts`
  ADD CONSTRAINT `customer_accounts_vehicle_id_foreign` FOREIGN KEY (`vehicle_id`) REFERENCES `buses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `daily_bank_accumulations`
--
ALTER TABLE `daily_bank_accumulations`
  ADD CONSTRAINT `daily_bank_accumulations_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `daily_transactions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `daily_expenses`
--
ALTER TABLE `daily_expenses`
  ADD CONSTRAINT `daily_expenses_expense_id_foreign` FOREIGN KEY (`expense_id`) REFERENCES `expenses` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `daily_expenses_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `daily_transactions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `daily_transactions`
--
ALTER TABLE `daily_transactions`
  ADD CONSTRAINT `daily_transactions_bus_id_foreign` FOREIGN KEY (`bus_id`) REFERENCES `buses` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `daily_transactions_conductor_id_foreign` FOREIGN KEY (`conductor_id`) REFERENCES `masterfiles` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `daily_transactions_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `masterfiles` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `invoice_transactions`
--
ALTER TABLE `invoice_transactions`
  ADD CONSTRAINT `invoice_transactions_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_transactions_vehicle_id_foreign` FOREIGN KEY (`vehicle_id`) REFERENCES `buses` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `invoice_transaction_details`
--
ALTER TABLE `invoice_transaction_details`
  ADD CONSTRAINT `invoice_transaction_details_invoice_transaction_id_foreign` FOREIGN KEY (`invoice_transaction_id`) REFERENCES `invoice_transactions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_transaction_details_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `supplier_entities` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `menus_parent_menu_foreign` FOREIGN KEY (`parent_menu`) REFERENCES `menus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `menus_route_id_foreign` FOREIGN KEY (`route_id`) REFERENCES `routes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_route`
--
ALTER TABLE `role_route`
  ADD CONSTRAINT `role_route_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_route_route_id_foreign` FOREIGN KEY (`route_id`) REFERENCES `routes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `routes`
--
ALTER TABLE `routes`
  ADD CONSTRAINT `routes_parent_route_foreign` FOREIGN KEY (`parent_route`) REFERENCES `routes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `supplier_entities`
--
ALTER TABLE `supplier_entities`
  ADD CONSTRAINT `supplier_entities_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_mf_id_foreign` FOREIGN KEY (`mf_id`) REFERENCES `masterfiles` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `users_user_role_foreign` FOREIGN KEY (`user_role`) REFERENCES `roles` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `masterfiles` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
