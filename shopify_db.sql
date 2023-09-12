-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql-83872-db.mysql-83872:11935
-- Generation Time: Aug 02, 2022 at 07:46 PM
-- Server version: 8.0.26
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopify`
--

-- --------------------------------------------------------

--
-- Table structure for table `Category`
--

CREATE TABLE `Category` (
  `id` int NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `isDeleted` tinyint(1) DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `Category`
--

INSERT INTO `Category` (`id`, `title`, `description`, `icon`, `isDeleted`, `createdAt`, `updatedAt`) VALUES
(1, 'Pizza', 'All types of pizza', NULL, 1, '2022-07-26 11:52:21', '2022-08-02 12:12:23'),
(2, 'Pizaa', 'pizaa', NULL, 0, '2022-08-02 12:45:44', '2022-08-02 12:45:44'),
(3, 'coffe', 'coffee', NULL, 0, '2022-08-02 12:45:58', '2022-08-02 12:45:58'),
(4, 'laundry', 'laundry', NULL, 0, '2022-08-02 12:46:15', '2022-08-02 12:46:15'),
(5, 'daily', 'daily', NULL, 0, '2022-08-02 12:46:23', '2022-08-02 12:46:23'),
(6, 'Rice', 'Rice', NULL, 0, '2022-08-02 13:13:12', '2022-08-02 13:13:12'),
(7, 'Masaly', 'Masaly', NULL, 0, '2022-08-02 13:13:29', '2022-08-02 13:13:29'),
(8, 'Vegetable', 'Vegi', NULL, 0, '2022-08-02 13:14:06', '2022-08-02 13:14:06'),
(9, 'Fruits', 'fruits', NULL, 0, '2022-08-02 13:14:15', '2022-08-02 13:14:15');

-- --------------------------------------------------------

--
-- Table structure for table `Client`
--

CREATE TABLE `Client` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `hashedPassword` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `passwordResetToken` varchar(255) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `photoURL` varchar(300) DEFAULT NULL,
  `otp` varchar(20) DEFAULT NULL,
  `otpValidTill` datetime DEFAULT NULL,
  `verified` tinyint(1) DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `Client`
--

INSERT INTO `Client` (`id`, `name`, `email`, `hashedPassword`, `salt`, `passwordResetToken`, `address`, `phone`, `photoURL`, `otp`, `otpValidTill`, `verified`, `createdAt`, `updatedAt`) VALUES
(1, 'Uzair Saeed', 'uzairsaeed2015@gmail.com', '+dMWPAzk192PsetypVbmfg1NvdbUkvEhgyGm4ZAoITUgHJB8ZSfiGpKdOq9ujvxXeqXg7LWnM0qjkB/qQPbrkg==', 'zv1yAILGce+0cno/HDVZIw==', 'proas1', NULL, NULL, NULL, 'kb114i', '2022-03-17 11:19:05', 1, '2022-03-16 05:52:00', '2022-03-17 11:14:05'),
(2, 'moiz', 'moizisah1@gmail.com', NULL, NULL, NULL, NULL, '023422444333', NULL, NULL, NULL, 0, '2022-07-29 10:33:38', '2022-07-29 10:33:38'),
(3, 'moiz', 'moizishaq@gmail.com', NULL, NULL, NULL, NULL, '023422444333', 'abc.jpg', NULL, NULL, 0, '2022-07-29 10:35:59', '2022-07-29 10:35:59'),
(4, 'Adil Ahsan', 'adilahsan@gmail.com', NULL, NULL, NULL, NULL, '023422444333', 'abc.jpg', NULL, NULL, 0, '2022-07-29 10:42:47', '2022-07-29 10:42:47'),
(5, 'Uzair Saeed', 'uzairsaeed@gmail.com', NULL, NULL, NULL, NULL, '023422444333', 'abc.jpg', NULL, NULL, 0, '2022-07-29 10:47:16', '2022-07-29 10:47:16'),
(13, 'test', 'test@gmail.com', '8/6Pe2gr49cuWnyShqzaWYJFQsgHYxAo8S16YaFTPYVYbl3450nLApAzTOjfAoThZ0VNau8fDOnuICcNE+BCmQ==', 'JE/4pqwfln0wZ94E+pn1WA==', NULL, NULL, '023422444333', 'abc.jpg', '411616', '2022-07-29 11:17:07', 0, '2022-07-29 11:12:04', '2022-07-29 11:12:07'),
(14, 'test2', 'test2@gmail.com', 'RxSecmup1PxnJFktdEiFHkjNiTgbrN+EiH/fcOAQ7Yd3iCw8Y8jzDE7vZFGZgOSYMWbrHiE/f63tuvnaPlLlXg==', '15GxaZMgcQIIMWMxkZxN/Q==', NULL, NULL, '023422444333', 'abc.jpg', '355066', '2022-07-29 11:32:31', 0, '2022-07-29 11:27:29', '2022-07-29 11:27:31'),
(15, 'moiz isaq', 'ali@gmail.com', '5oXmTHqqLHiHlZmaohSBrg2SDnqd64g8ReYENPr/1xQ351bgZ22S50Nuzi4ljYaZOrXxZKmcViT8tA1o8YNQZA==', '4yKS5TfLR22Fm0L5SO9xFQ==', NULL, NULL, '03468989467', NULL, '076250', '2022-08-01 11:04:38', 0, '2022-08-01 10:59:37', '2022-08-01 10:59:38'),
(16, 'moiz ishaq', 'moizadmin@admin.com', 'mmszX80Bj5nC8O15vlb95mAjfHtE3dixLja8jNRiOcwEdfFR+J725ESq/+V0mXzVjoIGMUTRSv5nKVr2/Thn/w==', 'e1JIugRKlX460McjmpySag==', NULL, NULL, '024689894611111', NULL, '486296', '2022-08-01 11:30:27', 0, '2022-08-01 11:25:26', '2022-08-01 11:25:27'),
(17, 'moiz ishaq', 'moizadmin@jiffisy.com', 'LXlrKzT/Cs6eoM9OHCk5zKrzB12xkH/et3Ygq5QoDPg0w21PpwfkU3BCBAtnBQ4H6AbvVnBbwqGa0+GDqfLoEw==', 'wEc/OC5w7iqevlAzyZ4tnA==', NULL, NULL, '024689894611111', NULL, '637679', '2022-08-01 11:35:05', 0, '2022-08-01 11:30:04', '2022-08-01 11:30:05'),
(18, 'ali ahmed', 'moizishaq@test.com', 'r6QyTitReCDaKCfg0PigPRNCeH4sMtefQgOK/hTFIG8q/tnBn3MrrCF3MsnOZc4UtCm2CD376hFZZCdHD+ekvg==', 'jA2yCLpD/u9QrOn1xUIRcw==', NULL, NULL, '023333333333333', NULL, '004269', '2022-08-01 11:43:12', 0, '2022-08-01 11:38:11', '2022-08-01 11:38:12'),
(19, 'moizishaq', 'email@email.com', 'doP+8kN6+ZO2Czw0JZCqMxoMZSOF7Wv+HWbKUFxYSVOdU/HCQ57Z7W58DAXOI+o8ZKI8L1KeMafCUSWA+3s5LQ==', 'wIeyo9KN0BeTiH/AiIJhGw==', NULL, NULL, '9022010101021', NULL, '004507', '2022-08-01 11:45:06', 0, '2022-08-01 11:40:05', '2022-08-01 11:40:06'),
(20, 'adminis admin', 'adminmoiz@admin.com', 'oneVI6r3Bck4lr19/ls+cV7WYf3WrNocLGEYnKhBzVBEaxebFVmOhZXtfmlsS7vvslELa8dvE7cejJOIhmC9kQ==', '7rbmfVTPYoEkbViFelmY+g==', NULL, NULL, '299999999999', NULL, '937577', '2022-08-01 11:47:43', 0, '2022-08-01 11:42:42', '2022-08-01 11:42:43'),
(21, 'asdfgf', 'asdfgfasdgfd@gmail.com', '8Rr+u9s48trnh1bnzusNPX3Jwc6V3694YwGQqquhyWDlT+Y1YnAIxIxR4YBXcFd9yXNO8V9feuWJb2ylw/+hQw==', '9wPuzW6xRyAJS+LU+r3/7Q==', NULL, NULL, '033111111111', NULL, '735666', '2022-08-01 12:39:53', 0, '2022-08-01 12:34:52', '2022-08-01 12:34:53'),
(22, 'moizisahaq', 'moizishaq321@gmail.com', 'bunjFsdmKonhS4uciZvgsaoz3lJkeJhn630UdcfZuczEKNZKYEtiso6AMUMPolRw6K3o6rk0g2N3T07QgH92JA==', 'MGyLb4z1UPv4RYPpcZb0IQ==', NULL, NULL, '03468989467', NULL, '300933', '2022-08-01 12:42:21', 1, '2022-08-01 12:37:19', '2022-08-01 12:38:20'),
(23, 'moiz.infinitybits', 'moiz.infinitybits@gmail.com', 'TPYUnoQWYFIMvf38GIk8YaxbR3tt6m/rgxj6hfuSgi/GXg3fJgUtrQJ0yChcoJ33pja60qwyRc6sxLH7Ys59WA==', 'xQN31T+fy+Yh2vQ6TFbsyQ==', NULL, NULL, '03468989467', NULL, '878059', '2022-08-01 12:49:22', 1, '2022-08-01 12:44:21', '2022-08-01 12:44:41'),
(24, 'moiz.infinitybits', 'nabeel.infinitybits@gmail.com', 'A3KcUXiO27CilyqislCL/KRXcyxFO6w5dx9eJzfxQVEhgBTLkMFWrnc4Z1ujSBBVYIFz9Mk4+TZpolQBQWrGrA==', 'rQ/0YVwQ0Rv1WXx5ng4kNQ==', NULL, NULL, '03468989467', NULL, '148587', '2022-08-01 13:01:12', 0, '2022-08-01 12:56:11', '2022-08-01 12:56:12'),
(25, 'moiz.infinitybits', 'naveed.infinitybits@gmail.com', 'EaFC0VR4euPuz444ZHigzFfJwRrS61EQXHxy/7z+VOpSZQ1PLeXbEmgmciYdNIfMGRXdEscJPDV2yEPsaE2dDg==', 'sg9BG6LjzSnlN3Gx3Xw79Q==', NULL, NULL, '03468989467', NULL, '168292', '2022-08-01 13:02:26', 1, '2022-08-01 12:57:25', '2022-08-01 12:57:47'),
(26, 'mansoor', 'gixitev544@logodez.com', '8+qXQEqiU7+MEmXX1OCb8b2FPO08WRAXpHu40XzF3oVeLlP9W+/B/5+6lWw99pT1fQb7kYj2oepgChLcJYIr7g==', '98UKPiu/Hoqm46sRln1H5A==', NULL, NULL, '03128841541', NULL, '955092', '2022-08-02 19:44:44', 1, '2022-08-02 19:39:43', '2022-08-02 19:40:06');

-- --------------------------------------------------------

--
-- Table structure for table `ComboProduct`
--

CREATE TABLE `ComboProduct` (
  `id` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `childId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `Coupon`
--

CREATE TABLE `Coupon` (
  `code` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `quantity` int DEFAULT '0',
  `expiry` datetime NOT NULL,
  `discountPercentage` int NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `Order`
--

CREATE TABLE `Order` (
  `id` int NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `address` varchar(999) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `city` varchar(255) NOT NULL,
  `note` varchar(999) DEFAULT NULL,
  `intentId` varchar(500) DEFAULT NULL,
  `confirmed` tinyint(1) DEFAULT '0',
  `status` varchar(255) DEFAULT 'pending',
  `dateOrderPlaced` datetime NOT NULL,
  `clientId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `Order`
--

INSERT INTO `Order` (`id`, `amount`, `address`, `phone`, `city`, `note`, `intentId`, `confirmed`, `status`, `dateOrderPlaced`, `clientId`) VALUES
(1, '375.00', 'mohallah gulbahar,gulibagh,shamsi road ,mardan', '03128841541', 'Mardan', NULL, 'pi_3LSQxuLvYa516UtY0dWOBHGk', 0, 'pending', '2022-08-02 19:41:18', 26);

-- --------------------------------------------------------

--
-- Table structure for table `OrderProduct`
--

CREATE TABLE `OrderProduct` (
  `id` int NOT NULL,
  `quantity` int NOT NULL,
  `orderId` int DEFAULT NULL,
  `productId` int DEFAULT NULL,
  `couponCode` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `OrderProduct`
--

INSERT INTO `OrderProduct` (`id`, `quantity`, `orderId`, `productId`, `couponCode`) VALUES
(1, 1, 1, 14, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ProductImages`
--

CREATE TABLE `ProductImages` (
  `id` int NOT NULL,
  `url` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `productId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ProductImages`
--

INSERT INTO `ProductImages` (`id`, `url`, `createdAt`, `updatedAt`, `productId`) VALUES
(28, 'https://jiffy-test.herokuapp.com/image/camisa-xadrez-11551063158zkqsuxmqif-1659445473335.png', '2022-08-02 13:04:33', '2022-08-02 13:04:33', 13),
(30, 'https://jiffy-test.herokuapp.com/image/—Pngtree—coffee time to relax day_5538811-1659445766714.png', '2022-08-02 13:09:26', '2022-08-02 13:09:26', 15),
(31, 'https://jiffy-test.herokuapp.com/image/kisspng-plastic-bag-chana-masala-indian-cuisine-spice-pack-spices-png-photo-5ab1c906aac2b5-1659446096510.3945984715216007746995.png', '2022-08-02 13:14:56', '2022-08-02 13:14:56', 16),
(32, 'https://jiffy-test.herokuapp.com/image/kisspng-vegetable-fruit-basket-century-farms-international-fruits-and-vegetables-5abfb9c60122f5-1659446141274.2485309615225143740047.png', '2022-08-02 13:15:41', '2022-08-02 13:15:41', 17),
(33, 'https://jiffy-test.herokuapp.com/image/kisspng-chocolate-spread-nutella-hazelnut-ferrero-spa-nutela-5b16cdd1916ee8-1659446168012.2810031615282211375957.png', '2022-08-02 13:16:08', '2022-08-02 13:16:08', 18),
(34, 'https://jiffy-test.herokuapp.com/image/—Pngtree—white t-shirt_2005822-1659446983799.png', '2022-08-02 13:29:45', '2022-08-02 13:29:45', 14);

-- --------------------------------------------------------

--
-- Table structure for table `Products`
--

CREATE TABLE `Products` (
  `id` int NOT NULL,
  `title` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `discount` int DEFAULT '0',
  `quantity` int NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `isDeleted` tinyint(1) DEFAULT '0',
  `unitQuantity` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `categoryId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `Products`
--

INSERT INTO `Products` (`id`, `title`, `price`, `discount`, `quantity`, `description`, `isDeleted`, `unitQuantity`, `createdAt`, `updatedAt`, `categoryId`) VALUES
(1, 'Rolex Watch', 1200, 10, 500, 'Your perfect pack for everyday use', 1, NULL, '2022-07-26 11:52:48', '2022-07-27 13:41:24', 1),
(2, 'Rolex Watch', 1000, 20, 1000, 'lorem ipsum asdas asldkskd', 1, '1/12 pieces', '2022-07-27 13:39:53', '2022-07-29 09:45:14', 1),
(3, 'Rolex Watch', 99.5, 20, 1000, 'lorem ipsum', 1, '1/12 pieces', '2022-07-27 13:48:58', '2022-07-29 12:57:16', 1),
(4, 'Rolex Watch', 1200, 10, 500, 'Your perfect pack for everyday use', 1, NULL, '2022-07-29 11:14:01', '2022-07-29 12:57:11', 1),
(5, 'Rolex Watch', 1200, 10, 500, 'Your perfect pack for everyday use', 1, '12 units', '2022-07-29 11:19:21', '2022-08-02 12:12:37', 1),
(6, 'Rolex Watch', 1200, 10, 500, 'Your perfect pack for everyday use', 1, '12 units', '2022-07-29 11:19:39', '2022-08-02 12:12:41', 1),
(7, 'Rolex Watch', 1200, 10, 500, 'Your perfect pack for everyday use', 1, '12 units', '2022-07-29 11:20:51', '2022-07-29 12:42:02', 1),
(8, 'Rolex Watch', 1200, 10, 500, 'Your perfect pack for everyday use', 1, NULL, '2022-07-29 11:57:42', '2022-07-29 12:41:59', 1),
(9, 'Beauty Products', 12222, 20, 2000, 'this is very beauty produts', 1, '12  units', '2022-07-29 12:56:40', '2022-08-02 06:11:21', 1),
(10, 'new', 545, 0, 2, 'piza', 1, NULL, '2022-08-02 06:12:01', '2022-08-02 12:12:44', 1),
(11, 'coffee', 45, 0, 2, 'coffee', 1, NULL, '2022-08-02 10:32:10', '2022-08-02 12:10:23', 1),
(12, 'chai', 50, 0, 1, 'chai', 1, NULL, '2022-08-02 12:46:46', '2022-08-02 13:09:40', 5),
(13, 'Shirt', 50, 0, 1, 'Shirt', 0, NULL, '2022-08-02 13:04:33', '2022-08-02 13:04:33', 5),
(14, 'Jacket', 500, 25, 1, 'Jacket', 0, '12 units', '2022-08-02 13:08:59', '2022-08-02 13:29:45', 9),
(15, 'Coffee', 100, 0, 1, 'Coffee', 0, NULL, '2022-08-02 13:09:26', '2022-08-02 13:09:26', 5),
(16, 'Spices', 800, 0, 10, '10 spices for the whole month', 0, NULL, '2022-08-02 13:14:56', '2022-08-02 13:14:56', 7),
(17, 'Vegetable\'s ', 2000, 0, 20, 'vegetables for the whole week', 0, NULL, '2022-08-02 13:15:41', '2022-08-02 13:15:41', 8),
(18, 'Nutela', 600, 0, 1, 'Nutella', 0, NULL, '2022-08-02 13:16:08', '2022-08-02 13:16:08', 5);

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `hashedPassword` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `passwordResetToken` varchar(200) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `photoURL` varchar(300) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`id`, `name`, `email`, `hashedPassword`, `salt`, `passwordResetToken`, `phone`, `photoURL`, `createdAt`, `updatedAt`) VALUES
(1, 'Uzair Saeed', 'uzairsaeed2015@gmail.com', 'cgBIDWUoOXJ9Or/xvuXCZbYSYQ/Tg5Zg/Uh0DAI1Crd3bDtdokj5D1mWwn1SjEUPviMtuHbUr9IxqZ/KQ3/LLA==', 'fKTVzFuNCi3oDZ6HK7DBYQ==', NULL, NULL, NULL, '2022-03-11 09:44:12', '2022-03-11 09:44:12');

-- --------------------------------------------------------

--
-- Table structure for table `Visitor`
--

CREATE TABLE `Visitor` (
  `id` int NOT NULL,
  `token` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `Visitor`
--

INSERT INTO `Visitor` (`id`, `token`, `createdAt`) VALUES
(1, '634768d7-b596-4db5-90d9-8a0aa20da243', '2022-08-02 18:59:58'),
(2, 'd86db40c-93a1-4386-a17d-168a2f7fa6ec', '2022-08-02 19:00:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Category`
--
ALTER TABLE `Category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Client`
--
ALTER TABLE `Client`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`) USING BTREE;

--
-- Indexes for table `ComboProduct`
--
ALTER TABLE `ComboProduct`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ComboProduct_childId_parentId_unique` (`parentId`,`childId`),
  ADD KEY `childId` (`childId`);

--
-- Indexes for table `Coupon`
--
ALTER TABLE `Coupon`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `Order`
--
ALTER TABLE `Order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clientId` (`clientId`);

--
-- Indexes for table `OrderProduct`
--
ALTER TABLE `OrderProduct`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orderId` (`orderId`),
  ADD KEY `productId` (`productId`),
  ADD KEY `couponCode` (`couponCode`);

--
-- Indexes for table `ProductImages`
--
ALTER TABLE `ProductImages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productId` (`productId`);

--
-- Indexes for table `Products`
--
ALTER TABLE `Products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryId` (`categoryId`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `Visitor`
--
ALTER TABLE `Visitor`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Category`
--
ALTER TABLE `Category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `Client`
--
ALTER TABLE `Client`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `ComboProduct`
--
ALTER TABLE `ComboProduct`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Order`
--
ALTER TABLE `Order`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `OrderProduct`
--
ALTER TABLE `OrderProduct`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ProductImages`
--
ALTER TABLE `ProductImages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `Products`
--
ALTER TABLE `Products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `User`
--
ALTER TABLE `User`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Visitor`
--
ALTER TABLE `Visitor`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ComboProduct`
--
ALTER TABLE `ComboProduct`
  ADD CONSTRAINT `ComboProduct_ibfk_1` FOREIGN KEY (`parentId`) REFERENCES `Products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ComboProduct_ibfk_2` FOREIGN KEY (`childId`) REFERENCES `Products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Order`
--
ALTER TABLE `Order`
  ADD CONSTRAINT `Order_ibfk_1` FOREIGN KEY (`clientId`) REFERENCES `Client` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `OrderProduct`
--
ALTER TABLE `OrderProduct`
  ADD CONSTRAINT `OrderProduct_ibfk_106` FOREIGN KEY (`orderId`) REFERENCES `Order` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `OrderProduct_ibfk_107` FOREIGN KEY (`productId`) REFERENCES `Products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `OrderProduct_ibfk_108` FOREIGN KEY (`couponCode`) REFERENCES `Coupon` (`code`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `ProductImages`
--
ALTER TABLE `ProductImages`
  ADD CONSTRAINT `ProductImages_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `Products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `Products`
--
ALTER TABLE `Products`
  ADD CONSTRAINT `Products_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `Category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
