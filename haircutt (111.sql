-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2025 at 10:18 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `haircutt`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `customerId` int(11) NOT NULL,
  `employeeId` int(11) DEFAULT NULL,
  `appointmentDate` datetime(3) NOT NULL,
  `status` enum('pending','confirmed','cancelled','in_progress','completed','success') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `totalPrice` decimal(10,2) NOT NULL DEFAULT 0.00,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime(3) DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) DEFAULT NULL,
  `branchId` int(11) NOT NULL,
  `checkInTime` datetime(3) DEFAULT NULL,
  `checkOutTime` datetime(3) DEFAULT NULL,
  `estimatedDuration` int(11) NOT NULL DEFAULT 0,
  `promotionId` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `review` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `customerId`, `employeeId`, `appointmentDate`, `status`, `totalPrice`, `notes`, `createdAt`, `updatedAt`, `branchId`, `checkInTime`, `checkOutTime`, `estimatedDuration`, `promotionId`, `rating`, `review`) VALUES
(1, 1, 13, '2025-05-29 13:20:00.539', 'pending', '80000.00', 'rgsergaerg', '2025-05-29 04:37:28.336', '2025-05-29 04:37:28.336', 1, NULL, NULL, 30, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bookingservice`
--

CREATE TABLE `bookingservice` (
  `id` int(11) NOT NULL,
  `bookingId` int(11) NOT NULL,
  `serviceId` int(11) NOT NULL,
  `servicePrice` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookingservice`
--

INSERT INTO `bookingservice` (`id`, `bookingId`, `serviceId`, `servicePrice`) VALUES
(1, 1, 54, '80000.00');

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imageUrl` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`id`, `name`, `address`, `phone`, `email`, `description`, `imageUrl`, `isActive`, `createdAt`, `updatedAt`) VALUES
(1, 'Anh trai đạp gió ĐÀ Nẵng', 'Khu đô thị công nghệ FPT Đà Nẵng, P. Hoà Hải, Q. Ngũ Hành Sơn, TP. Đà Nẵng', '(0236) 730 0999', 'tuyensinhdanang@fpt.edu.vn', 'Được xây dựng trên lô đất 5.1 ha tại khu đô thị FPT Đà Nẵng với thiết kế thành một không gian xanh, bền vững cho tòa nhà.', 'https://daihoc.fpt.edu.vn/wp-content/uploads/2024/03/dai-hoc-fpt-da-nang-2.jpeg', 1, '2025-05-29 01:58:53.202', '2025-05-29 02:02:05.399'),
(2, 'Anh trai đạp gió HÀ NỘI', 'Khu Giáo dục và Đào tạo – Khu Công nghệ cao Hòa Lạc – Km29 Đại lộ Thăng Long, H. Thạch Thất, TP. Hà Nội', '(024) 7300 5588', 'tuyensinhhanoi@fpt.edu.vn', 'Tọa lạc tại Khu Công nghệ cao Hòa Lạc, Km29 Đại lộ Thăng Long, huyện Thạch Thất, Hà Nội – cách trung tâm thành phố khoảng 30km.', 'https://daihoc.fpt.edu.vn/wp-content/uploads/2023/03/DH_FPT_ha_noi.jpeg', 1, '2025-05-29 02:01:24.759', '2025-05-29 02:01:24.762'),
(3, 'Anh trai đạp gió TP.HỒ CHÍ MINH', 'Lô E2a-7, Đường D1 Khu Công nghệ cao, P. Long Thạnh Mỹ, TP. Thủ Đức, TP. Hồ Chí Minh', '(028) 7300 5588', 'tuyensinhhcm@fpt.edu.vn', 'Tọa lạc tại Khu Công nghệ cao TP.HCM rộng hơn 22 ngàn m2, nổi bật với kiến trúc độc đáo.', 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxMTEhUTExIWFhUXGBcXFxgXGBgWFxcYFhUXFxoYGBYYHSggGB0lHxUVITEhJSkrLi4uGB8zODMtNygtLisBCgoKDg0OGhAQGy8mICUtLS01OC0tLzIvLS0tLS0tLS8tLzUtLy0tLS0tLS0tLy0tLS0tLS0tLS0tLS0tLS0tLf/AABEIALEBHAMBIgACEQEDEQH/xAAbAAACAwEBAQAAAAAAAAAAAAACBAEDBQAGB//EAD8QAAIBAwMBBgQEBAQFBAMAAAECEQADIQQSMUEFEyJRYXEygZGhBkKx8BRSwdEVI3LhM0NigpI0ssLxU3Oz/8QAGQEAAwEBAQAAAAAAAAAAAAAAAQIDAAQF/8QALBEAAgICAgEDAwIHAQAAAAAAAAECEQMhEjFBEzJRImFxBKEUM0KBscHwkf/aAAwDAQACEQMRAD8AZa2Vk', 1, '2025-05-29 02:04:46.034', '2025-05-29 04:33:08.817');

-- --------------------------------------------------------

--
-- Table structure for table `branchemployee`
--

CREATE TABLE `branchemployee` (
  `id` int(11) NOT NULL,
  `branchId` int(11) NOT NULL,
  `employeeId` int(11) NOT NULL,
  `isMainBranch` tinyint(1) NOT NULL DEFAULT 0,
  `startDate` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `endDate` datetime(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branchemployee`
--

INSERT INTO `branchemployee` (`id`, `branchId`, `employeeId`, `isMainBranch`, `startDate`, `endDate`) VALUES
(1, 1, 13, 0, '2025-05-15 11:36:40.000', '2025-05-31 11:36:40.000');

-- --------------------------------------------------------

--
-- Table structure for table `branchinventory`
--

CREATE TABLE `branchinventory` (
  `id` int(11) NOT NULL,
  `branchId` int(11) NOT NULL,
  `productId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `minimumStock` int(11) NOT NULL DEFAULT 5,
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `branchservice`
--

CREATE TABLE `branchservice` (
  `id` int(11) NOT NULL,
  `branchId` int(11) NOT NULL,
  `serviceId` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `userId`, `createdAt`, `updatedAt`) VALUES
('cmb86tqre0001ui60vv04mf6i', 1, '2025-05-28 16:56:50.597', '2025-05-28 16:56:50.597');

-- --------------------------------------------------------

--
-- Table structure for table `cartitem`
--

CREATE TABLE `cartitem` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cartId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `productId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Cắt tóc', '2025-05-29 04:19:37', '2025-05-29 04:19:37'),
(2, 'Uốn tóc', '2025-05-29 04:19:37', '2025-05-29 04:19:37'),
(3, 'Nhuộm tóc', '2025-05-29 04:19:37', '2025-05-29 04:19:37'),
(4, 'Chăm sóc da', '2025-05-29 04:19:37', '2025-05-29 04:19:37'),
(5, 'Khác', '2025-05-29 04:19:37', '2025-05-29 04:19:37');

-- --------------------------------------------------------

--
-- Table structure for table `expense`
--

CREATE TABLE `expense` (
  `id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `expenseDate` datetime(3) NOT NULL,
  `categoryId` int(11) NOT NULL,
  `branchId` int(11) NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receiptImageUrl` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdBy` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expensecategory`
--

CREATE TABLE `expensecategory` (
  `id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expensecategory`
--

INSERT INTO `expensecategory` (`id`, `name`, `description`) VALUES
(1, 'Cắt tóc', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `inventorytransaction`
--

CREATE TABLE `inventorytransaction` (
  `id` int(11) NOT NULL,
  `productId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `branchId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unitPrice` decimal(10,2) NOT NULL,
  `totalPrice` decimal(10,2) NOT NULL,
  `transactionDate` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employeeId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `isRead` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `bookingId` int(11) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `paymentMethod` enum('cash','credit_card','bank_transfer','e_wallet','momo') COLLATE utf8mb4_unicode_ci NOT NULL,
  `paymentStatus` enum('pending','completed','failed','refunded','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `provider` enum('momo','vnpay','zalopay','other') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transactionId` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paymentDate` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extraData` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `signature` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requestId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `responseData` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shortDescription` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brandSlug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categorySlug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subcategory` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subcategorySlug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `listedPrice` decimal(10,2) NOT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  `discountPercent` int(11) NOT NULL DEFAULT 0,
  `isDiscount` tinyint(1) NOT NULL DEFAULT 0,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `minimumStock` int(11) NOT NULL DEFAULT 5,
  `isOutOfStock` tinyint(1) NOT NULL DEFAULT 0,
  `imageUrl` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ingredients` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manual` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ratingScore` double NOT NULL DEFAULT 0,
  `totalSold` int(11) NOT NULL DEFAULT 0,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `slug`, `description`, `shortDescription`, `brand`, `brandSlug`, `category`, `categorySlug`, `subcategory`, `subcategorySlug`, `price`, `listedPrice`, `cost`, `discountPercent`, `isDiscount`, `quantity`, `minimumStock`, `isOutOfStock`, `imageUrl`, `sku`, `tags`, `ingredients`, `manual`, `ratingScore`, `totalSold`, `isActive`, `createdAt`, `updatedAt`) VALUES
('2bd8d381-eb0f-4063-9abb-76cbd857bcd9', 'Ace High Cool Water Pomade', 'ace-high-cool-water-pomade', '\nSản phẩm Ace High Cool Water Pomade - Gel Pomade đầu tiên của Ace High\nAce High Cool Water Pomade là sản phẩm gel pomade đầu tiên của hãng Ace High được ra mắt vào cuối năm 2024. Cool Water Pomade sẽ mang đến cho bạn một kiểu tóc được kiểm soát chắc chắn, độ bóng đẹp mắt cùng với độ phồng như mong muốn. ', ' Sản phẩm Ace High Cool Water Pomade - Gel Pomade đầu tiên của Ace High Ace High Cool Water Pomade là sản phẩm gel pomade đầu tiên của hãng Ace High được ra mắt vào cuối năm 2024. Cool Water Pomade sẽ mang đến cho bạn một kiểu tóc được kiểm soát chắc chắn, độ bóng đẹp mắt cùng với độ phồng như mong muốn. ', 'Ace High', 'ace-high', 'sap', 'sap', 'sapvuottoc', 'sapvuottoc', '589000.00', '780000.00', '580000.00', 10, 1, 0, 1001, 1, 'https://product.hstatic.net/200000362771/product/shopee_1afe398eb9184754af107b32eb3301a6_grande.jpg', '1000', '3,5,4', 'Ưu điểm của sáp vuốt tóc Ace High Original Pomade\n1) Mùi hương\n\nVỏ cam và khuynh diệp.\n2) Thiết kế\n\nVỏ hộp thuỷ tinh tối màu, nắp hộp thiếc màu đen theo nguyên bản của những lọ pomade cổ điển. \n3) Hiệu năng\n\nĐộ giữ nếp: Cao, mềm dẻo, tạo độ phồng tốt.\nĐộ bóng: Trung bình.\nKhả năng gội rửa: Cực kỳ dễ dàng.', 'Ưu điểm của sáp vuốt tóc Ace High Original Pomade\n1) Mùi hương\n\nVỏ cam và khuynh diệp.\n2) Thiết kế\n\nVỏ hộp thuỷ tinh tối màu, nắp hộp thiếc màu đen theo nguyên bản của những lọ pomade cổ điển. \n3) Hiệu năng\n\nĐộ giữ nếp: Cao, mềm dẻo, tạo độ phồng tốt.\nĐộ bóng: Trung bình.\nKhả năng gội rửa: Cực kỳ dễ dàng.', 0, 0, 1, '2025-05-29 07:12:50.454', '2025-05-29 08:10:50.816');

-- --------------------------------------------------------

--
-- Table structure for table `productimage`
--

CREATE TABLE `productimage` (
  `id` int(11) NOT NULL,
  `productId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `productvariant`
--

CREATE TABLE `productvariant` (
  `id` int(11) NOT NULL,
  `productId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `listedPrice` decimal(10,2) NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imageUrl` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isDiscount` tinyint(1) NOT NULL DEFAULT 0,
  `discountPercent` int(11) NOT NULL DEFAULT 0,
  `isOutOfStock` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promotion`
--

CREATE TABLE `promotion` (
  `id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discountType` enum('percentage','fixed_amount','free_service') COLLATE utf8mb4_unicode_ci NOT NULL,
  `discountValue` decimal(10,2) NOT NULL,
  `startDate` datetime(3) NOT NULL,
  `endDate` datetime(3) NOT NULL,
  `minimumPurchase` decimal(10,2) NOT NULL DEFAULT 0.00,
  `maximumDiscount` decimal(10,2) DEFAULT NULL,
  `usageLimit` int(11) DEFAULT NULL,
  `currentUsage` int(11) NOT NULL DEFAULT 0,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `id` int(11) NOT NULL,
  `employeeId` int(11) NOT NULL,
  `branchId` int(11) NOT NULL,
  `dayOfWeek` int(11) NOT NULL,
  `startTime` time NOT NULL,
  `endTime` time NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `id` int(11) NOT NULL,
  `serviceName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estimatedTime` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `createdAt` datetime(3) DEFAULT current_timestamp(3),
  `description` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bannerImageUrl` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categoryId` int(11) NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `updatedAt` datetime(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`id`, `serviceName`, `estimatedTime`, `price`, `createdAt`, `description`, `bannerImageUrl`, `categoryId`, `isActive`, `updatedAt`) VALUES
(54, 'cắt tóc', 30, '80000.00', '2025-05-29 11:25:44.000', 'cắt tóc gội đầu', NULL, 1, 1, '2025-05-29 11:25:44.000'),
(55, 'Cắt tóc 444', 30, '66666.00', '2025-05-29 04:38:24.126', 'gẻhgaserh', '/uploads\\90202f19-2743-4a6c-b565-511241931cd2-917573177.jpg', 1, 1, '2025-05-29 04:38:24.129');

-- --------------------------------------------------------

--
-- Table structure for table `servicecategory`
--

CREATE TABLE `servicecategory` (
  `id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iconUrl` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `displayOrder` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `servicecategory`
--

INSERT INTO `servicecategory` (`id`, `name`, `description`, `iconUrl`, `displayOrder`) VALUES
(1, 'cắt tóc', 'cắt tóc nam', 'okkkk', 0);

-- --------------------------------------------------------

--
-- Table structure for table `servicestep`
--

CREATE TABLE `servicestep` (
  `id` int(11) NOT NULL,
  `serviceId` int(11) NOT NULL,
  `stepOrder` int(11) NOT NULL,
  `stepTitle` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stepDescription` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stepImageUrl` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `servicestep`
--

INSERT INTO `servicestep` (`id`, `serviceId`, `stepOrder`, `stepTitle`, `stepDescription`, `stepImageUrl`) VALUES
(1, 55, 1, 'ẻhearhaerher', 'hẻherh', '/uploads\\2c7285ca-dd8a-4ac7-8869-5790dc6ff9ba-375540966.png');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','receptionist','barber','customer','manager') COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthDate` date DEFAULT NULL,
  `CCCD` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `availabilityStatus` enum('available','unavailable') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime(3) DEFAULT current_timestamp(3),
  `fullName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatarUrl` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastLoginAt` datetime(3) DEFAULT NULL,
  `loyaltyPoints` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `password`, `email`, `phone`, `role`, `gender`, `address`, `birthDate`, `CCCD`, `status`, `availabilityStatus`, `createdAt`, `fullName`, `avatarUrl`, `lastLoginAt`, `loyaltyPoints`) VALUES
(1, '123456', 'sa@gmail.com', '0852217455', 'admin', NULL, NULL, NULL, NULL, 'active', 'available', '2025-05-28 16:56:37.027', 'fdafafaf fwefwefwf', NULL, NULL, 0),
(2, 'HIEUTHUHAI', 'HIEUTHUHAI@gmail.com', '028091999', 'barber', 1, 'Thành phố Hồ Chí Minh, Việt Nam', NULL, '028091999', 'active', 'available', '2025-05-29 01:52:35.989', 'Trần Minh Hiếu', NULL, NULL, 0),
(3, 'HIEUTHUHAI', 'RHYDER@gmail.com', '018032001', 'barber', 1, 'Thanh Hóa, Việt Nam', NULL, '018032001', 'active', 'available', '2025-05-29 01:55:49.786', 'Nguyễn Quang Anh', NULL, NULL, 0),
(4, ' MasterD', 'MasterD@gmail.com', '07101997', 'barber', 1, 'Huế, Việt Nam', NULL, '07101997', 'active', 'available', '2025-05-29 02:05:52.628', 'Lê Quang Hùng ', NULL, NULL, 0),
(5, 'ADMIN123', 'ADMIN@gmail.com', '0123456789', 'admin', 1, '', NULL, '0123456789', 'active', 'available', '2025-05-29 02:07:09.216', 'ADMIN', NULL, NULL, 0),
(6, 'DUCPHUC', 'DUCPHUC@gmail.com', '015101996', 'barber', 1, 'Hà Nội, Việt Nam', NULL, '015101996', 'active', 'available', '2025-05-29 02:10:14.980', 'Nguyễn Đức Phúc', NULL, NULL, 0),
(7, 'DUCPHUC', 'ISAAC@gmail.com', '013061988', 'barber', 1, 'Thành phố Hồ Chí Minh, Việt Nam', NULL, '013061988', 'active', 'available', '2025-05-29 02:12:13.027', 'Phạm Lưu Tuấn Tài', NULL, NULL, 0),
(8, 'ANHTU ATUS', 'ATUS@gmail.com', '03101993', 'barber', 1, 'Hà Nội, Việt Nam', NULL, '03101993', 'active', 'available', '2025-05-29 02:16:44.038', 'Bùi Anh Tú', NULL, NULL, 0),
(9, 'ANHTU ATUS', 'DOMIC@gmail.com', '031082000', 'barber', 1, 'Hải Dương, Việt Nam', NULL, '031082000', 'active', 'available', '2025-05-29 02:18:21.536', 'Trần Đăng Dương', NULL, NULL, 0),
(10, 'NEGAV1', 'NEGAV@gmail.com', '012042001', 'barber', 1, 'Thành phố Hồ Chí Minh, Việt Nam', NULL, '012042001', 'active', 'available', '2025-05-29 02:21:02.022', 'Đặng Thành An', NULL, NULL, 0),
(11, 'HURRYKNG', 'HURRYKNG@gmail.com', '05041999', 'barber', 1, 'Anh trai đạp gió TP.HỒ CHÍ MINH', '2025-04-30', '05041999', 'active', 'available', '2025-05-29 02:23:21.571', 'Phạm Bảo Khang', NULL, NULL, 0),
(12, 'MIE123', 'MIE@gmail.com', '07121995', 'receptionist', 0, 'Đà Nẵng, Việt Nam', NULL, '07121995', 'active', 'available', '2025-05-29 02:25:38.566', 'Trương Tiểu My', NULL, NULL, 0),
(13, ' MISTHY', 'MISTHY@gmail.com', '012111995', 'receptionist', 0, 'Đà Lạt, Việt Nam', NULL, '012111995', 'active', 'available', '2025-05-29 02:26:55.068', 'Lê Thy Ngọc', NULL, NULL, 0),
(14, 'HAUHOANG', 'HAUHOANG@gmail.com', '04071995', 'receptionist', 0, 'Hà Nội, Việt Nam', NULL, '04071995', 'active', 'available', '2025-05-29 02:28:33.100', 'Hoàng Thúy Hậu', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `_prisma_migrations`
--

CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `applied_steps_count` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `_prisma_migrations`
--

INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `started_at`, `applied_steps_count`) VALUES
('0663f363-53db-4129-9203-4e62efb5ee48', 'a155d77a7b1d3fc03170a7722679a825af9fcbb29ed26d8ab3ac263d9fcd8641', '2025-05-28 16:55:33.242', '20250423074921_remove_field', NULL, NULL, '2025-05-28 16:55:33.185', 1),
('06d4862b-cc88-4856-880d-9c96da3c3cca', '41728f4eb7e1b432cf689072fc2979d338600d4e85c6928f4b9d5282a8de200b', '2025-05-28 16:55:33.184', '20250423073541_remove_field', NULL, NULL, '2025-05-28 16:55:33.169', 1),
('2f0ee7fa-3123-46b0-9e8e-cf1d3d63bca5', '29e49234abca837913778b1a06ef650c0bf6da7391edd65c306bc88d54607b00', '2025-05-28 16:55:33.141', '20250420104612_init', NULL, NULL, '2025-05-28 16:55:32.870', 1),
('6775bd1a-ac95-47ab-b479-de0eb90a32e7', '3c8d9a9475c426c33a9e5236cc85b4d0caad87678f7794c328eb0680620aa5c0', '2025-05-28 16:55:34.574', '20250518025233_add_branch_haircut', NULL, NULL, '2025-05-28 16:55:33.287', 1),
('7a972815-6ed8-461d-94ec-4eb79638401b', 'd7303856d11f717c18dee8e53377a5d554948837664d84a69909537f377c7081', '2025-05-28 16:55:33.154', '20250420174855_add_description', NULL, NULL, '2025-05-28 16:55:33.142', 1),
('94fe0af3-2133-4e10-984f-b54bf09c38d9', '488819291ce8b06e17e01c3bd9c188cbcbce0d380d4a371d767f31fe35507655', '2025-05-28 16:55:33.285', '20250428062556_change_field', NULL, NULL, '2025-05-28 16:55:33.243', 1),
('b2623253-f458-4596-93e8-9828305eae25', 'fe1b75a27f141acee2e31957b6f5a66b1c8b2dfe982c0d4d12ae24ef8456a1e2', '2025-05-28 16:55:33.168', '20250420181616_add_banner', NULL, NULL, '2025-05-28 16:55:33.155', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Booking_customerId_idx` (`customerId`),
  ADD KEY `Booking_employeeId_idx` (`employeeId`),
  ADD KEY `Booking_branchId_idx` (`branchId`),
  ADD KEY `Booking_promotionId_idx` (`promotionId`),
  ADD KEY `Booking_appointmentDate_idx` (`appointmentDate`);

--
-- Indexes for table `bookingservice`
--
ALTER TABLE `bookingservice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `BookingService_bookingId_idx` (`bookingId`),
  ADD KEY `BookingService_serviceId_idx` (`serviceId`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branchemployee`
--
ALTER TABLE `branchemployee`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `BranchEmployee_branchId_employeeId_key` (`branchId`,`employeeId`),
  ADD KEY `BranchEmployee_branchId_idx` (`branchId`),
  ADD KEY `BranchEmployee_employeeId_idx` (`employeeId`);

--
-- Indexes for table `branchinventory`
--
ALTER TABLE `branchinventory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `BranchInventory_branchId_productId_key` (`branchId`,`productId`),
  ADD KEY `BranchInventory_branchId_idx` (`branchId`),
  ADD KEY `BranchInventory_productId_idx` (`productId`);

--
-- Indexes for table `branchservice`
--
ALTER TABLE `branchservice`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `BranchService_branchId_serviceId_key` (`branchId`,`serviceId`),
  ADD KEY `BranchService_branchId_idx` (`branchId`),
  ADD KEY `BranchService_serviceId_idx` (`serviceId`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Cart_userId_key` (`userId`),
  ADD KEY `Cart_userId_idx` (`userId`);

--
-- Indexes for table `cartitem`
--
ALTER TABLE `cartitem`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `CartItem_cartId_productId_key` (`cartId`,`productId`),
  ADD KEY `CartItem_productId_idx` (`productId`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense`
--
ALTER TABLE `expense`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Expense_categoryId_idx` (`categoryId`),
  ADD KEY `Expense_branchId_idx` (`branchId`),
  ADD KEY `Expense_createdBy_idx` (`createdBy`);

--
-- Indexes for table `expensecategory`
--
ALTER TABLE `expensecategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventorytransaction`
--
ALTER TABLE `inventorytransaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `InventoryTransaction_productId_idx` (`productId`),
  ADD KEY `InventoryTransaction_branchId_idx` (`branchId`),
  ADD KEY `InventoryTransaction_employeeId_idx` (`employeeId`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Notification_userId_idx` (`userId`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Payment_transactionId_key` (`transactionId`),
  ADD KEY `Payment_bookingId_idx` (`bookingId`),
  ADD KEY `Payment_transactionId_idx` (`transactionId`),
  ADD KEY `Payment_paymentStatus_idx` (`paymentStatus`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Product_slug_key` (`slug`),
  ADD UNIQUE KEY `Product_sku_key` (`sku`),
  ADD KEY `Product_slug_idx` (`slug`),
  ADD KEY `Product_brandSlug_idx` (`brandSlug`),
  ADD KEY `Product_categorySlug_idx` (`categorySlug`),
  ADD KEY `Product_subcategorySlug_idx` (`subcategorySlug`);

--
-- Indexes for table `productimage`
--
ALTER TABLE `productimage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ProductImage_productId_idx` (`productId`);

--
-- Indexes for table `productvariant`
--
ALTER TABLE `productvariant`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ProductVariant_sku_key` (`sku`),
  ADD KEY `ProductVariant_productId_idx` (`productId`);

--
-- Indexes for table `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Promotion_code_key` (`code`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Schedule_employeeId_idx` (`employeeId`),
  ADD KEY `Schedule_branchId_idx` (`branchId`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Service_categoryId_idx` (`categoryId`);

--
-- Indexes for table `servicecategory`
--
ALTER TABLE `servicecategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `servicestep`
--
ALTER TABLE `servicestep`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ServiceStep_serviceId_idx` (`serviceId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `User_CCCD_key` (`CCCD`);

--
-- Indexes for table `_prisma_migrations`
--
ALTER TABLE `_prisma_migrations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bookingservice`
--
ALTER TABLE `bookingservice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `branchemployee`
--
ALTER TABLE `branchemployee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `branchinventory`
--
ALTER TABLE `branchinventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `branchservice`
--
ALTER TABLE `branchservice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `expense`
--
ALTER TABLE `expense`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expensecategory`
--
ALTER TABLE `expensecategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `inventorytransaction`
--
ALTER TABLE `inventorytransaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `productimage`
--
ALTER TABLE `productimage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `productvariant`
--
ALTER TABLE `productvariant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promotion`
--
ALTER TABLE `promotion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `servicecategory`
--
ALTER TABLE `servicecategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `servicestep`
--
ALTER TABLE `servicestep`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `Booking_branchId_fkey` FOREIGN KEY (`branchId`) REFERENCES `branch` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Booking_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Booking_employeeId_fkey` FOREIGN KEY (`employeeId`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Booking_promotionId_fkey` FOREIGN KEY (`promotionId`) REFERENCES `promotion` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `bookingservice`
--
ALTER TABLE `bookingservice`
  ADD CONSTRAINT `BookingService_bookingId_fkey` FOREIGN KEY (`bookingId`) REFERENCES `booking` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `BookingService_serviceId_fkey` FOREIGN KEY (`serviceId`) REFERENCES `service` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `branchemployee`
--
ALTER TABLE `branchemployee`
  ADD CONSTRAINT `BranchEmployee_branchId_fkey` FOREIGN KEY (`branchId`) REFERENCES `branch` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `BranchEmployee_employeeId_fkey` FOREIGN KEY (`employeeId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `branchinventory`
--
ALTER TABLE `branchinventory`
  ADD CONSTRAINT `BranchInventory_branchId_fkey` FOREIGN KEY (`branchId`) REFERENCES `branch` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `BranchInventory_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `branchservice`
--
ALTER TABLE `branchservice`
  ADD CONSTRAINT `BranchService_branchId_fkey` FOREIGN KEY (`branchId`) REFERENCES `branch` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `BranchService_serviceId_fkey` FOREIGN KEY (`serviceId`) REFERENCES `service` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `Cart_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `cartitem`
--
ALTER TABLE `cartitem`
  ADD CONSTRAINT `CartItem_cartId_fkey` FOREIGN KEY (`cartId`) REFERENCES `cart` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `CartItem_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `expense`
--
ALTER TABLE `expense`
  ADD CONSTRAINT `Expense_branchId_fkey` FOREIGN KEY (`branchId`) REFERENCES `branch` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Expense_categoryId_fkey` FOREIGN KEY (`categoryId`) REFERENCES `expensecategory` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Expense_createdBy_fkey` FOREIGN KEY (`createdBy`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `inventorytransaction`
--
ALTER TABLE `inventorytransaction`
  ADD CONSTRAINT `InventoryTransaction_branchId_fkey` FOREIGN KEY (`branchId`) REFERENCES `branch` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `InventoryTransaction_employeeId_fkey` FOREIGN KEY (`employeeId`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `InventoryTransaction_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `Notification_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `Payment_bookingId_fkey` FOREIGN KEY (`bookingId`) REFERENCES `booking` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `productimage`
--
ALTER TABLE `productimage`
  ADD CONSTRAINT `ProductImage_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `productvariant`
--
ALTER TABLE `productvariant`
  ADD CONSTRAINT `ProductVariant_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `Schedule_branchId_fkey` FOREIGN KEY (`branchId`) REFERENCES `branch` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Schedule_employeeId_fkey` FOREIGN KEY (`employeeId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `Service_categoryId_fkey` FOREIGN KEY (`categoryId`) REFERENCES `servicecategory` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `servicestep`
--
ALTER TABLE `servicestep`
  ADD CONSTRAINT `ServiceStep_serviceId_fkey` FOREIGN KEY (`serviceId`) REFERENCES `service` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
