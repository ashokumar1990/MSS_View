-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 22, 2019 at 02:47 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `marks_salon_solution`
--

-- --------------------------------------------------------

--
-- Table structure for table `mss_business_admin`
--

CREATE TABLE `mss_business_admin` (
  `business_admin_id` int(10) UNSIGNED NOT NULL,
  `business_admin_first_name` varchar(50) NOT NULL,
  `business_admin_last_name` varchar(50) NOT NULL,
  `business_admin_email` varchar(100) NOT NULL,
  `business_admin_address` text NOT NULL,
  `business_admin_mobile` varchar(15) NOT NULL,
  `business_admin_password` text NOT NULL,
  `business_admin_firm_name` varchar(100) NOT NULL,
  `business_admin_logo_path` text NOT NULL,
  `business_admin_account_expiry_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mss_business_admin`
--

INSERT INTO `mss_business_admin` (`business_admin_id`, `business_admin_first_name`, `business_admin_last_name`, `business_admin_email`, `business_admin_address`, `business_admin_mobile`, `business_admin_password`, `business_admin_firm_name`, `business_admin_logo_path`, `business_admin_account_expiry_date`) VALUES
(1, 'Pranshu', 'Gupta', 'pranshu.vl@gmail.com', 'B1222 Street No. 10, Nathucolony, Nathupura, Delhi - 110084', '9990906406', '$2y$10$PYOM.MSuv5i8oTNZ.fIgOu7paqTFC7Vvu9plFx74GHHb3hApQkM1.', 'TamarindMarks', 'http://localhost/MSS/public/images/default.png', '2030-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `mss_business_admin_packages`
--

CREATE TABLE `mss_business_admin_packages` (
  `business_admin_package_id` int(10) UNSIGNED NOT NULL,
  `business_admin_id` int(10) UNSIGNED NOT NULL,
  `package_id` int(10) UNSIGNED NOT NULL,
  `package_expiry_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mss_business_admin_packages`
--

INSERT INTO `mss_business_admin_packages` (`business_admin_package_id`, `business_admin_id`, `package_id`, `package_expiry_date`) VALUES
(1, 1, 1, '2030-01-01'),
(2, 1, 2, '2030-01-01'),
(3, 1, 3, '2030-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `mss_business_outlets`
--

CREATE TABLE `mss_business_outlets` (
  `business_outlet_id` int(10) UNSIGNED NOT NULL,
  `business_outlet_name` varchar(100) NOT NULL,
  `business_outlet_business_admin` int(10) UNSIGNED NOT NULL,
  `business_outlet_gst_in` varchar(15) DEFAULT NULL,
  `business_outlet_mobile` varchar(15) DEFAULT NULL,
  `business_outlet_landline` varchar(15) DEFAULT NULL,
  `business_outlet_address` text NOT NULL,
  `business_outlet_pincode` varchar(10) NOT NULL,
  `business_outlet_state` varchar(100) NOT NULL,
  `business_outlet_city` varchar(100) NOT NULL,
  `business_outlet_country` varchar(100) NOT NULL DEFAULT 'India',
  `business_outlet_email` varchar(100) DEFAULT NULL,
  `business_outlet_bill_header_msg` text DEFAULT NULL,
  `business_outlet_bill_footer_msg` text DEFAULT NULL,
  `business_outlet_facebook_url` text DEFAULT NULL,
  `business_outlet_instagram_url` text DEFAULT NULL,
  `business_outlet_latitude` float(10,6) DEFAULT NULL,
  `business_outlet_longitude` float(10,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mss_business_outlets`
--

INSERT INTO `mss_business_outlets` (`business_outlet_id`, `business_outlet_name`, `business_outlet_business_admin`, `business_outlet_gst_in`, `business_outlet_mobile`, `business_outlet_landline`, `business_outlet_address`, `business_outlet_pincode`, `business_outlet_state`, `business_outlet_city`, `business_outlet_country`, `business_outlet_email`, `business_outlet_bill_header_msg`, `business_outlet_bill_footer_msg`, `business_outlet_facebook_url`, `business_outlet_instagram_url`, `business_outlet_latitude`, `business_outlet_longitude`) VALUES
(3, 'TMS01', 1, '', '9009003880', '', 'A-6,S.PACE Co-working', '452010', 'Madhya Pradesh', 'Indore', 'India', 'pranshu.g@tamarindmarks.in', 'Tamarind MarkS', 'Thanks for visiting.', '', '', 0.000000, 0.000000),
(4, 'Nayi Dukan', 1, '', '', '', 'Kholi no.420', '452010', 'Madhya Pradesh', 'Indore', 'India', 'new@dukan.com', '', '', '', '', 0.000000, 0.000000);

-- --------------------------------------------------------

--
-- Table structure for table `mss_categories`
--

CREATE TABLE `mss_categories` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `category_business_admin_id` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `category_is_active` tinyint(1) NOT NULL DEFAULT 1,
  `category_description` text DEFAULT NULL,
  `category_business_outlet_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mss_categories`
--

INSERT INTO `mss_categories` (`category_id`, `category_business_admin_id`, `category_name`, `category_is_active`, `category_description`, `category_business_outlet_id`) VALUES
(7, 1, 'Care', 1, 'General Physiotherapeutics', 3),
(8, 1, 'Facial', 1, '', 3),
(9, 1, 'Hair Services', 1, '', 3),
(10, 1, 'Hair Removal', 1, '', 3),
(11, 1, 'OTC Products', 1, 'These are Over The Counter Products', 3);

-- --------------------------------------------------------

--
-- Table structure for table `mss_customers`
--

CREATE TABLE `mss_customers` (
  `customer_id` int(10) UNSIGNED NOT NULL,
  `customer_business_admin_id` int(10) UNSIGNED NOT NULL,
  `customer_business_outlet_id` int(10) UNSIGNED NOT NULL,
  `customer_title` varchar(10) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `customer_mobile` varchar(15) NOT NULL,
  `customer_dob` date NOT NULL,
  `customer_doa` datetime NOT NULL DEFAULT current_timestamp(),
  `customer_virtual_wallet` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `customer_next_appointment_date` date DEFAULT NULL,
  `customer_next_appointment_time` time DEFAULT NULL,
  `customer_preferred_day` varchar(10) DEFAULT NULL,
  `customer_preferred_service` int(10) UNSIGNED DEFAULT NULL,
  `customer_recommended_service` int(10) UNSIGNED DEFAULT NULL,
  `customer_avg_feedback_rating` decimal(1,1) DEFAULT NULL,
  `customer_last_updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `customer_media_path` text DEFAULT NULL,
  `customer_rewards` int(10) UNSIGNED DEFAULT NULL,
  `customer_segment` varchar(50) NOT NULL DEFAULT 'New',
  `customer_email` varchar(100) DEFAULT NULL,
  `customer_pending_amount` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mss_customers`
--

INSERT INTO `mss_customers` (`customer_id`, `customer_business_admin_id`, `customer_business_outlet_id`, `customer_title`, `customer_name`, `customer_mobile`, `customer_dob`, `customer_doa`, `customer_virtual_wallet`, `customer_next_appointment_date`, `customer_next_appointment_time`, `customer_preferred_day`, `customer_preferred_service`, `customer_recommended_service`, `customer_avg_feedback_rating`, `customer_last_updated`, `customer_media_path`, `customer_rewards`, `customer_segment`, `customer_email`, `customer_pending_amount`) VALUES
(12, 1, 3, 'Mr.', 'Pranshu   Gupta', '7000710898', '1984-01-17', '2019-06-30 07:18:45', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-02 12:25:45', NULL, NULL, 'Repeating', NULL, 0),
(13, 1, 3, 'Ms.', 'Akanksha', '7440893756', '1985-10-20', '2019-06-30 07:24:33', 0, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 'New', NULL, 0),
(14, 1, 3, 'Mr.', 'Vipul', '9009005419', '1996-11-21', '2019-07-05 12:05:19', 0, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 'New', NULL, 0),
(15, 1, 3, 'Mr.', 'New customer', '9716299569', '2000-06-30', '2019-07-07 18:53:25', 0, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 'New', NULL, 0),
(16, 1, 3, 'Ms.', 'second', '1234567891', '1997-07-16', '2019-07-07 18:53:49', 0, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 'New', NULL, 0),
(17, 1, 3, 'Mr.', 'ashok', '8454801188', '1990-07-17', '2019-07-12 06:04:49', 0, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, NULL, 'New', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mss_employees`
--

CREATE TABLE `mss_employees` (
  `employee_id` int(10) UNSIGNED NOT NULL,
  `employee_first_name` varchar(50) NOT NULL,
  `employee_last_name` varchar(50) NOT NULL,
  `employee_mobile` varchar(15) NOT NULL,
  `employee_email` varchar(100) NOT NULL,
  `employee_address` text NOT NULL,
  `employee_business_outlet` int(10) UNSIGNED NOT NULL,
  `employee_password` text DEFAULT NULL,
  `employee_expertise` text DEFAULT NULL,
  `employee_role` varchar(50) NOT NULL COMMENT 'Expert/Supervisor/Cashier',
  `employee_feedback_rating` decimal(1,1) DEFAULT NULL,
  `employee_media_path` text DEFAULT NULL,
  `employee_date_of_joining` date NOT NULL,
  `employee_is_active` tinyint(1) DEFAULT 1,
  `employee_business_admin` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mss_employees`
--

INSERT INTO `mss_employees` (`employee_id`, `employee_first_name`, `employee_last_name`, `employee_mobile`, `employee_email`, `employee_address`, `employee_business_outlet`, `employee_password`, `employee_expertise`, `employee_role`, `employee_feedback_rating`, `employee_media_path`, `employee_date_of_joining`, `employee_is_active`, `employee_business_admin`) VALUES
(5, 'Pranshu', 'Gupta', '9009003880', 'tms01@tms.in', 'Space', 3, '$2y$10$XBYc1VVNF5UiM/527SOf9OX9Pp7sstmNzu2M9hlzX2NRrhIF5ngYm', 'Super Specialist', 'Cashier', NULL, NULL, '2019-06-30', 1, 1),
(6, 'Balesh', 'Kumar', '9009005224', 'ballu@comedian.com', 'Villain Corner', 3, '$2y$10$n.hhVQERoSBDJfySqU0mbOaUiCnxbPEGxXLE66.VMxv6FD18HAW6C', '', 'Cashier', NULL, NULL, '2018-06-01', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mss_expenses`
--

CREATE TABLE `mss_expenses` (
  `expense_date` date NOT NULL,
  `expense_type` varchar(50) NOT NULL,
  `item_name` varchar(50) NOT NULL,
  `employee_name` varchar(50) NOT NULL,
  `amount` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `unit` int(10) NOT NULL,
  `payment_mode` varchar(50) NOT NULL,
  `expense_status` varchar(50) NOT NULL,
  `business_admin_id` int(10) NOT NULL,
  `business_outlet_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mss_expenses`
--

INSERT INTO `mss_expenses` (`expense_date`, `expense_type`, `item_name`, `employee_name`, `amount`, `quantity`, `unit`, `payment_mode`, `expense_status`, `business_admin_id`, `business_outlet_id`) VALUES
('2019-07-19', 'daily snack & tea', 'tea', 'Naman', 10, 3, 1, 'cash', '1', 1, 3),
('2019-07-20', '5', 'Tea', '', 24, 4, 0, 'cash', 'paid', 0, 0),
('2019-07-20', 'Wifi', 'Router', '', 1000, 1, 0, 'cash', 'paid', 0, 0),
('2019-07-20', 'Wifi', 'Router', '', 1000, 1, 0, 'cash', 'paid', 0, 0),
('2019-07-20', 'Daily', 'Coffee', '', 2, 2, 0, 'card', 'paid', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mss_expense_tracker`
--

CREATE TABLE `mss_expense_tracker` (
  `expense_tracker_id` int(10) UNSIGNED NOT NULL,
  `expense_tracker_date` date NOT NULL,
  `expense_tracker_expense_type_id` int(10) UNSIGNED NOT NULL,
  `expense_tracker_cashier_id` int(10) UNSIGNED NOT NULL,
  `expense_tracker_item_name` varchar(100) NOT NULL,
  `expense_tracker_amount` int(10) UNSIGNED NOT NULL,
  `expense_tracker_quantity` int(10) UNSIGNED NOT NULL,
  `expense_tracker_unit` varchar(10) NOT NULL COMMENT 'EA/KG/GM/ML',
  `expense_tracker_payment_mode` varchar(10) NOT NULL COMMENT 'Cash/Card/Wallet',
  `expense_tracker_expense_type_mode` varchar(10) NOT NULL COMMENT 'Paid/Unpaid/Advance',
  `business_admin_id` int(10) NOT NULL,
  `business_outlet_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mss_expense_tracker`
--

INSERT INTO `mss_expense_tracker` (`expense_tracker_id`, `expense_tracker_date`, `expense_tracker_expense_type_id`, `expense_tracker_cashier_id`, `expense_tracker_item_name`, `expense_tracker_amount`, `expense_tracker_quantity`, `expense_tracker_unit`, `expense_tracker_payment_mode`, `expense_tracker_expense_type_mode`, `business_admin_id`, `business_outlet_id`) VALUES
(10, '2019-07-16', 1, 5, 'tea', 10, 2, 'ml', 'cash', 'cash', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `mss_expense_types`
--

CREATE TABLE `mss_expense_types` (
  `expense_type_id` int(10) UNSIGNED NOT NULL,
  `expense_type_business_admin_id` int(10) UNSIGNED NOT NULL,
  `expense_type` varchar(100) NOT NULL,
  `expense_type_business_outlet_id` int(10) UNSIGNED NOT NULL,
  `expense_type_description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mss_expense_types`
--

INSERT INTO `mss_expense_types` (`expense_type_id`, `expense_type_business_admin_id`, `expense_type`, `expense_type_business_outlet_id`, `expense_type_description`) VALUES
(3, 1, 'Wifi Bill', 3, 'Monthly Internet WiFi Bill'),
(4, 1, 'Monthly Rent', 3, ''),
(5, 1, 'Daily Snacks and Tea', 3, ''),
(6, 1, 'Consumables- like Cotton etc', 3, ''),
(7, 1, 'dvsdvd', 3, 'vdvdbdsbsd');

-- --------------------------------------------------------

--
-- Table structure for table `mss_expert_service`
--

CREATE TABLE `mss_expert_service` (
  `expert_service_id` int(10) UNSIGNED NOT NULL,
  `expert_service_expert_id` int(10) UNSIGNED NOT NULL,
  `expert_service_service_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mss_inventory`
--

CREATE TABLE `mss_inventory` (
  `inventory_id` int(10) UNSIGNED NOT NULL,
  `inventory_business_admin_id` int(10) UNSIGNED NOT NULL,
  `inventory_business_outlet_id` int(10) UNSIGNED NOT NULL,
  `inventory_item_name` varchar(100) NOT NULL,
  `inventory_item_category` varchar(50) NOT NULL,
  `inventory_item_entry_date` date NOT NULL,
  `inventory_quantity` int(10) UNSIGNED NOT NULL,
  `inventory_unit` varchar(50) NOT NULL,
  `inventory_expiry_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mss_otc_categories`
--

CREATE TABLE `mss_otc_categories` (
  `otc_category_id` int(10) UNSIGNED NOT NULL,
  `otc_sub_category_id` int(10) UNSIGNED NOT NULL,
  `otc_item_name` varchar(100) NOT NULL,
  `otc_unit` varchar(50) NOT NULL COMMENT 'Kg/gms/Ltr/mL',
  `otc_brand` varchar(100) NOT NULL,
  `otc_type` varchar(50) NOT NULL DEFAULT 'OTC',
  `otc_is_active` tinyint(1) NOT NULL DEFAULT 1,
  `otc_price_inr` int(10) UNSIGNED NOT NULL,
  `otc_gst_percentage` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mss_otc_categories`
--

INSERT INTO `mss_otc_categories` (`otc_category_id`, `otc_sub_category_id`, `otc_item_name`, `otc_unit`, `otc_brand`, `otc_type`, `otc_is_active`, `otc_price_inr`, `otc_gst_percentage`) VALUES
(5, 7, 'Lotus Hair Gel', 'mL', 'Lotus', 'OTC', 1, 125, 5);

-- --------------------------------------------------------

--
-- Table structure for table `mss_packages`
--

CREATE TABLE `mss_packages` (
  `package_id` int(10) UNSIGNED NOT NULL,
  `package_name` varchar(100) NOT NULL,
  `package_type` varchar(15) NOT NULL COMMENT 'add_on_package/base_package',
  `creation_date` date NOT NULL,
  `status` int(2) NOT NULL,
  `upfront_amount` int(10) NOT NULL,
  `validity` int(5) NOT NULL,
  `discount_rs` int(5) NOT NULL,
  `discount_percent` int(3) NOT NULL,
  `service_count` int(2) NOT NULL,
  `wallet_multiplier` float NOT NULL,
  `virtual_amount` int(5) NOT NULL,
  `business_outlet_id` int(10) NOT NULL,
  `business_admin_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mss_packages`
--

INSERT INTO `mss_packages` (`package_id`, `package_name`, `package_type`, `creation_date`, `status`, `upfront_amount`, `validity`, `discount_rs`, `discount_percent`, `service_count`, `wallet_multiplier`, `virtual_amount`, `business_outlet_id`, `business_admin_id`) VALUES
(1, 'POS System', 'base_package', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 'Customer Analytics', 'base_package', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 'Appointments', 'add_on_package', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 'Feedback Management System', 'add_on_package', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 'Cross Coupons', 'add_on_package', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, 'Prepaid Card Management', 'add_on_package', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 'Customer Referral Program', 'add_on_package', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8, 'Recommendation Engine', 'add_on_package', '0000-00-00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9, 'Dhamaka', 'A-one', '2019-07-18', 1, 10000, 12, 100, 10, 6, 1.5, 12000, 3, 1),
(10, 'Dhamaka-2', 'VIP', '2019-07-18', 1, 12000, 24, 200, 20, 12, 2, 24000, 3, 1),
(11, 'A', 'virtual_wallet', '0000-00-00', 0, 1200, 8, 0, 0, 0, 0, 0, 4, 1),
(12, 'Dhamaka-3', 'VIP', '2019-07-18', 1, 12000, 24, 200, 20, 12, 2, 24000, 3, 1),
(13, 'test', 'services', '0000-00-00', 0, 12000, 8, 0, 0, 0, 0, 0, 3, 1),
(14, 'Test2', 'virtual_wallet', '0000-00-00', 0, 678, 18, 0, 0, 0, 0, 0, 3, 1),
(15, 'Test3', 'b-type', '2019-07-09', 0, 686, 7, 7, 7, 5, 5, 6, 3, 1),
(16, 'Test3', 'b-type', '2019-07-09', 0, 686, 7, 7, 7, 5, 5, 6, 3, 1),
(17, 'Test3', 'b-type', '2019-07-09', 0, 686, 7, 7, 7, 5, 5, 6, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mss_raw_composition`
--

CREATE TABLE `mss_raw_composition` (
  `raw_composition_id` int(10) UNSIGNED NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL,
  `consumption_quantity` int(10) UNSIGNED NOT NULL,
  `rmc_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mss_raw_composition`
--

INSERT INTO `mss_raw_composition` (`raw_composition_id`, `service_id`, `consumption_quantity`, `rmc_id`) VALUES
(7, 7, 10, 4),
(8, 7, 20, 5);

-- --------------------------------------------------------

--
-- Table structure for table `mss_raw_material_categories`
--

CREATE TABLE `mss_raw_material_categories` (
  `raw_material_category_id` int(10) UNSIGNED NOT NULL,
  `raw_material_name` varchar(100) NOT NULL,
  `raw_material_unit` varchar(50) NOT NULL,
  `raw_material_brand` varchar(100) NOT NULL,
  `raw_material_type` varchar(100) NOT NULL DEFAULT 'Raw Material',
  `raw_material_is_active` tinyint(1) NOT NULL DEFAULT 1,
  `raw_material_business_outlet_id` int(10) UNSIGNED NOT NULL,
  `raw_material_business_admin_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mss_raw_material_categories`
--

INSERT INTO `mss_raw_material_categories` (`raw_material_category_id`, `raw_material_name`, `raw_material_unit`, `raw_material_brand`, `raw_material_type`, `raw_material_is_active`, `raw_material_business_outlet_id`, `raw_material_business_admin_id`) VALUES
(4, 'Aloeweed Gel', 'mL', 'Lotus', 'Raw Material', 1, 3, 1),
(5, 'Series Pure Shampoo', 'mL', 'Amazon', 'Raw Material', 1, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mss_services`
--

CREATE TABLE `mss_services` (
  `service_id` int(10) UNSIGNED NOT NULL,
  `service_sub_category_id` int(10) UNSIGNED NOT NULL,
  `service_name` varchar(200) NOT NULL,
  `service_price_inr` int(10) UNSIGNED NOT NULL,
  `service_is_active` tinyint(1) NOT NULL DEFAULT 1,
  `service_est_time` varchar(50) NOT NULL,
  `service_description` text DEFAULT NULL,
  `service_gst_percentage` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mss_services`
--

INSERT INTO `mss_services` (`service_id`, `service_sub_category_id`, `service_name`, `service_price_inr`, `service_is_active`, `service_est_time`, `service_description`, `service_gst_percentage`) VALUES
(7, 7, 'Back Massage', 400, 1, '30', '', 18),
(8, 8, 'LUXURIOUS MANICURE WITH D-TAN', 800, 1, '45', '', 18),
(9, 10, 'AROMA MAGIC SILVER/GOLD', 500, 1, '60', '', 18),
(10, 7, 'Head Massage', 120, 1, '10', 'for cool mind', 12),
(11, 7, 'A', 1, 1, '3', 'jjdlf', 2),
(12, 7, 'A', 120, 1, '10', 'asdas', 2),
(13, 7, 'Back Massage', 120, 1, '10', 'ddqwd', 2);

-- --------------------------------------------------------

--
-- Table structure for table `mss_sub_categories`
--

CREATE TABLE `mss_sub_categories` (
  `sub_category_id` int(10) UNSIGNED NOT NULL,
  `sub_category_category_id` int(10) UNSIGNED NOT NULL,
  `sub_category_name` varchar(100) NOT NULL,
  `sub_category_is_active` tinyint(1) NOT NULL DEFAULT 1,
  `sub_category_description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mss_sub_categories`
--

INSERT INTO `mss_sub_categories` (`sub_category_id`, `sub_category_category_id`, `sub_category_name`, `sub_category_is_active`, `sub_category_description`) VALUES
(7, 7, 'Body Treatment', 1, 'Body Care treatments'),
(8, 7, 'Manicure', 1, ''),
(9, 7, 'Pedicure', 1, ''),
(10, 8, 'All Time Fav.', 1, ''),
(11, 8, 'Lotus', 1, ''),
(12, 8, 'Treatment Facial', 1, ''),
(13, 9, 'Hair Color', 1, ''),
(14, 9, 'Hair Cut', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `mss_transactions`
--

CREATE TABLE `mss_transactions` (
  `txn_id` int(10) UNSIGNED NOT NULL,
  `txn_customer_id` int(10) UNSIGNED NOT NULL,
  `txn_discount` int(10) UNSIGNED NOT NULL,
  `txn_value` int(10) UNSIGNED NOT NULL,
  `txn_datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mss_transactions`
--

INSERT INTO `mss_transactions` (`txn_id`, `txn_customer_id`, `txn_discount`, `txn_value`, `txn_datetime`) VALUES
(1, 13, 100, 962, '2019-07-07 18:35:15'),
(2, 12, 100, 1434, '2019-07-07 18:47:33');

-- --------------------------------------------------------

--
-- Table structure for table `mss_transaction_services`
--

CREATE TABLE `mss_transaction_services` (
  `txn_service_id` int(10) UNSIGNED NOT NULL,
  `txn_service_service_id` int(10) UNSIGNED NOT NULL,
  `txn_service_expert_id` int(10) UNSIGNED NOT NULL,
  `txn_service_txn_id` int(10) UNSIGNED NOT NULL,
  `txn_service_quantity` int(10) UNSIGNED NOT NULL,
  `txn_service_discount_percentage` int(10) UNSIGNED DEFAULT NULL,
  `txn_service_discount_absolute` int(10) UNSIGNED DEFAULT NULL,
  `txn_service_discounted_price` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mss_transaction_services`
--

INSERT INTO `mss_transaction_services` (`txn_service_id`, `txn_service_service_id`, `txn_service_expert_id`, `txn_service_txn_id`, `txn_service_quantity`, `txn_service_discount_percentage`, `txn_service_discount_absolute`, `txn_service_discounted_price`) VALUES
(1, 7, 5, 1, 1, 0, 0, 472),
(2, 9, 6, 1, 1, 0, 0, 590),
(3, 8, 6, 2, 1, 0, 0, 944),
(4, 9, 5, 2, 1, 0, 0, 590);

-- --------------------------------------------------------

--
-- Table structure for table `mss_transaction_settlements`
--

CREATE TABLE `mss_transaction_settlements` (
  `txn_settlement_id` int(10) UNSIGNED NOT NULL,
  `txn_settlement_txn_id` int(10) UNSIGNED NOT NULL,
  `txn_settlement_way` varchar(10) NOT NULL,
  `txn_settlement_payment_mode` varchar(50) NOT NULL,
  `txn_settlement_amount_received` int(10) UNSIGNED NOT NULL,
  `txn_settlement_balance_paid` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mss_transaction_settlements`
--

INSERT INTO `mss_transaction_settlements` (`txn_settlement_id`, `txn_settlement_txn_id`, `txn_settlement_way`, `txn_settlement_payment_mode`, `txn_settlement_amount_received`, `txn_settlement_balance_paid`) VALUES
(1, 1, 'Full Payme', 'Cash', 962, 0),
(2, 2, 'Split Paym', 'Split', 1434, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mss_business_admin`
--
ALTER TABLE `mss_business_admin`
  ADD PRIMARY KEY (`business_admin_id`);

--
-- Indexes for table `mss_business_admin_packages`
--
ALTER TABLE `mss_business_admin_packages`
  ADD PRIMARY KEY (`business_admin_package_id`),
  ADD KEY `business_admin_id` (`business_admin_id`),
  ADD KEY `package_id` (`package_id`);

--
-- Indexes for table `mss_business_outlets`
--
ALTER TABLE `mss_business_outlets`
  ADD PRIMARY KEY (`business_outlet_id`),
  ADD KEY `business_outlet_business_admin` (`business_outlet_business_admin`);

--
-- Indexes for table `mss_categories`
--
ALTER TABLE `mss_categories`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `category_business_admin_id` (`category_business_admin_id`),
  ADD KEY `category_business_outlet_id` (`category_business_outlet_id`);

--
-- Indexes for table `mss_customers`
--
ALTER TABLE `mss_customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `customer_business_admin_id` (`customer_business_admin_id`),
  ADD KEY `customer_business_outlet_id` (`customer_business_outlet_id`);

--
-- Indexes for table `mss_employees`
--
ALTER TABLE `mss_employees`
  ADD PRIMARY KEY (`employee_id`),
  ADD UNIQUE KEY `employee_email` (`employee_email`),
  ADD KEY `employee_business_admin` (`employee_business_admin`),
  ADD KEY `employee_business_outlet` (`employee_business_outlet`);

--
-- Indexes for table `mss_expense_tracker`
--
ALTER TABLE `mss_expense_tracker`
  ADD PRIMARY KEY (`expense_tracker_id`),
  ADD KEY `expense_tracker_expense_type_id` (`expense_tracker_expense_type_id`),
  ADD KEY `expense_tracker_cashier_id` (`expense_tracker_cashier_id`);

--
-- Indexes for table `mss_expense_types`
--
ALTER TABLE `mss_expense_types`
  ADD PRIMARY KEY (`expense_type_id`),
  ADD KEY `expense_type_business_admin_id` (`expense_type_business_admin_id`),
  ADD KEY `expense_type_business_outlet_id` (`expense_type_business_outlet_id`);

--
-- Indexes for table `mss_expert_service`
--
ALTER TABLE `mss_expert_service`
  ADD PRIMARY KEY (`expert_service_id`),
  ADD KEY `expert_service_expert_id` (`expert_service_expert_id`),
  ADD KEY `expert_service_service_id` (`expert_service_service_id`);

--
-- Indexes for table `mss_inventory`
--
ALTER TABLE `mss_inventory`
  ADD PRIMARY KEY (`inventory_id`),
  ADD KEY `inventory_business_admin_id` (`inventory_business_admin_id`),
  ADD KEY `inventory_business_outlet_id` (`inventory_business_outlet_id`);

--
-- Indexes for table `mss_otc_categories`
--
ALTER TABLE `mss_otc_categories`
  ADD PRIMARY KEY (`otc_category_id`),
  ADD KEY `otc_sub_category_id` (`otc_sub_category_id`);

--
-- Indexes for table `mss_packages`
--
ALTER TABLE `mss_packages`
  ADD PRIMARY KEY (`package_id`);

--
-- Indexes for table `mss_raw_composition`
--
ALTER TABLE `mss_raw_composition`
  ADD PRIMARY KEY (`raw_composition_id`),
  ADD KEY `rmc_id` (`rmc_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `mss_raw_material_categories`
--
ALTER TABLE `mss_raw_material_categories`
  ADD PRIMARY KEY (`raw_material_category_id`),
  ADD KEY `raw_material_business_outlet_id` (`raw_material_business_outlet_id`),
  ADD KEY `raw_material_business_admin_id` (`raw_material_business_admin_id`);

--
-- Indexes for table `mss_services`
--
ALTER TABLE `mss_services`
  ADD PRIMARY KEY (`service_id`),
  ADD KEY `service_sub_category_id` (`service_sub_category_id`);

--
-- Indexes for table `mss_sub_categories`
--
ALTER TABLE `mss_sub_categories`
  ADD PRIMARY KEY (`sub_category_id`),
  ADD KEY `sub_category_category_id` (`sub_category_category_id`);

--
-- Indexes for table `mss_transactions`
--
ALTER TABLE `mss_transactions`
  ADD PRIMARY KEY (`txn_id`),
  ADD KEY `txn_customer_id` (`txn_customer_id`);

--
-- Indexes for table `mss_transaction_services`
--
ALTER TABLE `mss_transaction_services`
  ADD PRIMARY KEY (`txn_service_id`),
  ADD KEY `txn_service_service_id` (`txn_service_service_id`),
  ADD KEY `txn_service_expert_id` (`txn_service_expert_id`),
  ADD KEY `txn_service_txn_id` (`txn_service_txn_id`);

--
-- Indexes for table `mss_transaction_settlements`
--
ALTER TABLE `mss_transaction_settlements`
  ADD PRIMARY KEY (`txn_settlement_id`),
  ADD KEY `txn_settlement_txn_id` (`txn_settlement_txn_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mss_business_admin`
--
ALTER TABLE `mss_business_admin`
  MODIFY `business_admin_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mss_business_admin_packages`
--
ALTER TABLE `mss_business_admin_packages`
  MODIFY `business_admin_package_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mss_business_outlets`
--
ALTER TABLE `mss_business_outlets`
  MODIFY `business_outlet_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mss_categories`
--
ALTER TABLE `mss_categories`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `mss_customers`
--
ALTER TABLE `mss_customers`
  MODIFY `customer_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `mss_employees`
--
ALTER TABLE `mss_employees`
  MODIFY `employee_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `mss_expense_tracker`
--
ALTER TABLE `mss_expense_tracker`
  MODIFY `expense_tracker_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `mss_expense_types`
--
ALTER TABLE `mss_expense_types`
  MODIFY `expense_type_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `mss_expert_service`
--
ALTER TABLE `mss_expert_service`
  MODIFY `expert_service_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mss_inventory`
--
ALTER TABLE `mss_inventory`
  MODIFY `inventory_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mss_otc_categories`
--
ALTER TABLE `mss_otc_categories`
  MODIFY `otc_category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `mss_packages`
--
ALTER TABLE `mss_packages`
  MODIFY `package_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `mss_raw_composition`
--
ALTER TABLE `mss_raw_composition`
  MODIFY `raw_composition_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `mss_raw_material_categories`
--
ALTER TABLE `mss_raw_material_categories`
  MODIFY `raw_material_category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `mss_services`
--
ALTER TABLE `mss_services`
  MODIFY `service_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `mss_sub_categories`
--
ALTER TABLE `mss_sub_categories`
  MODIFY `sub_category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `mss_transactions`
--
ALTER TABLE `mss_transactions`
  MODIFY `txn_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mss_transaction_services`
--
ALTER TABLE `mss_transaction_services`
  MODIFY `txn_service_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mss_transaction_settlements`
--
ALTER TABLE `mss_transaction_settlements`
  MODIFY `txn_settlement_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `mss_business_admin_packages`
--
ALTER TABLE `mss_business_admin_packages`
  ADD CONSTRAINT `mss_business_admin_packages_ibfk_1` FOREIGN KEY (`business_admin_id`) REFERENCES `mss_business_admin` (`business_admin_id`),
  ADD CONSTRAINT `mss_business_admin_packages_ibfk_2` FOREIGN KEY (`package_id`) REFERENCES `mss_packages` (`package_id`);

--
-- Constraints for table `mss_business_outlets`
--
ALTER TABLE `mss_business_outlets`
  ADD CONSTRAINT `mss_business_outlets_ibfk_1` FOREIGN KEY (`business_outlet_business_admin`) REFERENCES `mss_business_admin` (`business_admin_id`);

--
-- Constraints for table `mss_categories`
--
ALTER TABLE `mss_categories`
  ADD CONSTRAINT `mss_categories_ibfk_1` FOREIGN KEY (`category_business_admin_id`) REFERENCES `mss_business_admin` (`business_admin_id`),
  ADD CONSTRAINT `mss_categories_ibfk_2` FOREIGN KEY (`category_business_outlet_id`) REFERENCES `mss_business_outlets` (`business_outlet_id`);

--
-- Constraints for table `mss_customers`
--
ALTER TABLE `mss_customers`
  ADD CONSTRAINT `mss_customers_ibfk_1` FOREIGN KEY (`customer_business_admin_id`) REFERENCES `mss_business_admin` (`business_admin_id`),
  ADD CONSTRAINT `mss_customers_ibfk_2` FOREIGN KEY (`customer_business_outlet_id`) REFERENCES `mss_business_outlets` (`business_outlet_id`);

--
-- Constraints for table `mss_employees`
--
ALTER TABLE `mss_employees`
  ADD CONSTRAINT `mss_employees_ibfk_1` FOREIGN KEY (`employee_business_admin`) REFERENCES `mss_business_admin` (`business_admin_id`),
  ADD CONSTRAINT `mss_employees_ibfk_2` FOREIGN KEY (`employee_business_outlet`) REFERENCES `mss_business_outlets` (`business_outlet_id`);

--
-- Constraints for table `mss_expense_tracker`
--
ALTER TABLE `mss_expense_tracker`
  ADD CONSTRAINT `mss_expense_tracker_ibfk_1` FOREIGN KEY (`expense_tracker_cashier_id`) REFERENCES `mss_employees` (`employee_id`);

--
-- Constraints for table `mss_expense_types`
--
ALTER TABLE `mss_expense_types`
  ADD CONSTRAINT `mss_expense_types_ibfk_1` FOREIGN KEY (`expense_type_business_admin_id`) REFERENCES `mss_business_admin` (`business_admin_id`),
  ADD CONSTRAINT `mss_expense_types_ibfk_2` FOREIGN KEY (`expense_type_business_outlet_id`) REFERENCES `mss_business_outlets` (`business_outlet_id`);

--
-- Constraints for table `mss_expert_service`
--
ALTER TABLE `mss_expert_service`
  ADD CONSTRAINT `mss_expert_service_ibfk_1` FOREIGN KEY (`expert_service_expert_id`) REFERENCES `mss_employees` (`employee_id`),
  ADD CONSTRAINT `mss_expert_service_ibfk_2` FOREIGN KEY (`expert_service_service_id`) REFERENCES `mss_services` (`service_id`);

--
-- Constraints for table `mss_inventory`
--
ALTER TABLE `mss_inventory`
  ADD CONSTRAINT `mss_inventory_ibfk_1` FOREIGN KEY (`inventory_business_admin_id`) REFERENCES `mss_business_admin` (`business_admin_id`),
  ADD CONSTRAINT `mss_inventory_ibfk_2` FOREIGN KEY (`inventory_business_outlet_id`) REFERENCES `mss_business_outlets` (`business_outlet_id`);

--
-- Constraints for table `mss_otc_categories`
--
ALTER TABLE `mss_otc_categories`
  ADD CONSTRAINT `mss_otc_categories_ibfk_1` FOREIGN KEY (`otc_sub_category_id`) REFERENCES `mss_sub_categories` (`sub_category_id`);

--
-- Constraints for table `mss_raw_composition`
--
ALTER TABLE `mss_raw_composition`
  ADD CONSTRAINT `mss_raw_composition_ibfk_2` FOREIGN KEY (`rmc_id`) REFERENCES `mss_raw_material_categories` (`raw_material_category_id`),
  ADD CONSTRAINT `mss_raw_composition_ibfk_3` FOREIGN KEY (`service_id`) REFERENCES `mss_services` (`service_id`);

--
-- Constraints for table `mss_raw_material_categories`
--
ALTER TABLE `mss_raw_material_categories`
  ADD CONSTRAINT `mss_raw_material_categories_ibfk_1` FOREIGN KEY (`raw_material_business_admin_id`) REFERENCES `mss_business_admin` (`business_admin_id`),
  ADD CONSTRAINT `mss_raw_material_categories_ibfk_2` FOREIGN KEY (`raw_material_business_outlet_id`) REFERENCES `mss_business_outlets` (`business_outlet_id`);

--
-- Constraints for table `mss_services`
--
ALTER TABLE `mss_services`
  ADD CONSTRAINT `mss_services_ibfk_1` FOREIGN KEY (`service_sub_category_id`) REFERENCES `mss_sub_categories` (`sub_category_id`);

--
-- Constraints for table `mss_sub_categories`
--
ALTER TABLE `mss_sub_categories`
  ADD CONSTRAINT `mss_sub_categories_ibfk_1` FOREIGN KEY (`sub_category_category_id`) REFERENCES `mss_categories` (`category_id`);

--
-- Constraints for table `mss_transactions`
--
ALTER TABLE `mss_transactions`
  ADD CONSTRAINT `mss_transactions_ibfk_1` FOREIGN KEY (`txn_customer_id`) REFERENCES `mss_customers` (`customer_id`);

--
-- Constraints for table `mss_transaction_services`
--
ALTER TABLE `mss_transaction_services`
  ADD CONSTRAINT `mss_transaction_services_ibfk_1` FOREIGN KEY (`txn_service_service_id`) REFERENCES `mss_services` (`service_id`),
  ADD CONSTRAINT `mss_transaction_services_ibfk_2` FOREIGN KEY (`txn_service_txn_id`) REFERENCES `mss_transactions` (`txn_id`),
  ADD CONSTRAINT `mss_transaction_services_ibfk_3` FOREIGN KEY (`txn_service_expert_id`) REFERENCES `mss_employees` (`employee_id`);

--
-- Constraints for table `mss_transaction_settlements`
--
ALTER TABLE `mss_transaction_settlements`
  ADD CONSTRAINT `mss_transaction_settlements_ibfk_1` FOREIGN KEY (`txn_settlement_txn_id`) REFERENCES `mss_transactions` (`txn_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
