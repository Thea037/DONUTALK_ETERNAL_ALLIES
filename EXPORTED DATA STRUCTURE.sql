-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 21, 2023 at 03:58 PM
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
-- Database: `donutalk`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(55) NOT NULL,
  `cat_desc` text NOT NULL,
  `cat_status` char(1) NOT NULL DEFAULT 'A' COMMENT 'A - Available\r\nB - Not Available',
  `cat_price` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_name`, `cat_desc`, `cat_status`, `cat_price`) VALUES
(1, 'Solo - Plain', '1 piece', 'A', 10.00),
(2, 'Solo - with toppings', '1 piece', 'A', 15.00),
(3, 'Half-dozen', '6 pieces - plain', 'A', 50.00),
(4, 'Half-dozen', '6 pieces - with toppings', 'A', 75.00),
(5, 'Half-dozen', '6 pieces - assorted (3 plains & 3 with toppings)', 'A', 65.00),
(6, 'Dozen', '12 pieces - plain', 'A', 100.00),
(7, 'Dozen', '12 pieces - with toppings', 'A', 150.00),
(8, 'Dozen', '12 pieces - assorted (6 plains & 6 with toppings)', 'A', 130.00);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `Item_id` int(11) NOT NULL,
  `Item_name` varchar(55) NOT NULL,
  `Item_desc` text NOT NULL,
  `Item_price` decimal(6,2) NOT NULL,
  `item_status` char(1) NOT NULL DEFAULT 'A' COMMENT 'A - Available\r\nB - Not Available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`Item_id`, `Item_name`, `Item_desc`, `Item_price`, `item_status`) VALUES
(1, 'Chocolate', 'These chocolate mini donuts are deliciously soft and fluffy. Baked not fixed. Made with melted chocolate bar and pancake mixture.', 10.00, 'A'),
(2, 'Matcha', 'Enjoy these heavenly mini donuts covered with melted matcha chocolate bar on top.', 10.00, 'A'),
(3, 'Strawberry', 'Enjoy these mini donut with real melted strawberry chocolate bar.', 10.00, 'A'),
(4, 'Milk Chocolate', 'Taste and enjoy these gorgeous mini milkchocolate donut made with melted white chocolate coveres on top.', 10.00, 'A'),
(5, 'Ube', 'Taste and enjoy these delightful purple ube mini donut made with melted ube chocolate bar.', 10.00, 'A'),
(6, 'Dalgonut', 'This flavor is our special variant flavor. Enjoy and savor our mini dalgonut beautifully covered with dalgona coffee icing on top.', 15.00, 'A'),
(7, 'Chocoprinkles', 'A delightful mini donut infused with rich chocolate flavor and adored with colorful sprinkles for a sweet and playful treat.', 15.00, 'A'),
(8, 'Matchamond', 'Delight in the perfect bite sized treat a mini donut infused with the rich flavor of matcha, crowned with a delicate almond topping.', 15.00, 'A'),
(9, 'Milkinuts', 'Delight in the rich indulgence of a mini donut, generously coated with smooth milk chocolate and crowned with a satisfying crunch of nuts.', 15.00, 'A'),
(10, 'Ubereo', 'Delicious mini donut infused with the flavor of purple ube, crowned with a delightful crunch of oreo cookies on top.', 15.00, 'A'),
(11, 'Mallowberry', 'Delight in every bite with our mini donut covered with shelted strawberry chocolate and crowned with fluffy marshmallow topping.', 15.00, 'A');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `order_qty` int(11) NOT NULL,
  `date_ordered` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `item_id`, `cat_id`, `order_qty`, `date_ordered`) VALUES
(1, 1, 1, 2, 4, '2023-10-20'),
(2, 2, 1, 2, 5, '2023-10-20'),
(3, 3, 4, 3, 3, '2023-10-20');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_fullname` varchar(255) NOT NULL,
  `username` varchar(55) NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user_date_joined` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_status` char(1) NOT NULL COMMENT 'A - ACTIVE\r\nB - BANNED\r\nD - DELETED\r\nI - INACTIVE',
  `user_email_address` varchar(255) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `user_contact_number` varchar(11) NOT NULL,
  `user_type` char(1) NOT NULL COMMENT 'A - ADMIN\r\nU - USER',
  `user_address` varchar(255) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_fullname`, `username`, `password`, `user_date_joined`, `user_status`, `user_email_address`, `user_contact_number`, `user_type`, `user_address`) VALUES
(1, 'MADEL BAUTISTA', 'mjnb2121', '2121mjnb', '2023-10-21 13:56:24', '', 'madelb@gmail.com', '09123456789', '', 'Zone 5 Libon, Albay'),
(2, 'KRISTINE AREVALO', 'kzmba1234', '1234kzmba', '2023-10-21 13:56:24', '', 'kristinea@gmail.com', '09107364759', '', 'Camagong, Oas, Albay'),
(3, 'ALTHEA LOBOS', 'arl5678', '5678arl', '2023-10-21 13:56:24', '', 'altheal@gmail.com', '09098735261', '', 'Mayao, Oas, Albay'),
(4, 'JEM CASUROG', 'jnc9012', '9012jnc', '2023-10-21 13:56:24', '', 'jemc@gmail.com', '09989442123', '', 'Cavasi, Ligao, Albay'),
(5, 'SHAINE SANJUAN', 'sss3456', '3456sss', '2023-10-21 13:56:24', '', 'shaines@gmail.com', '09111145672', '', 'Sugcad, Polangui, Albay'),
(6, 'DONUTALK', 'donutalk', 'dunotdunot', '2023-10-21 13:56:24', '', 'donutalk2023@gmail.com', '09987654321', '', 'Polangui, Albay');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`Item_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `Item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
