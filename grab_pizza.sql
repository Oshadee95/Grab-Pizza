-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 20, 2019 at 04:22 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `grab_pizza`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `order_details` text NOT NULL,
  `order_status` enum('unpaid','paid') NOT NULL DEFAULT 'unpaid',
  `order_cost` double NOT NULL,
  `delivery_time` time NOT NULL,
  `additional_info` text,
  `booked_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `booked_by` varchar(255) NOT NULL,
  `confirmed_by` varchar(255) DEFAULT NULL,
  `delivery_add` text NOT NULL,
  `delivered_by` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `pizza` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `ingredients` text NOT NULL,
  `sm` double NOT NULL,
  `md` double NOT NULL,
  `lg` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `pizza`, `image`, `description`, `ingredients`, `sm`, `md`, `lg`) VALUES
(1, 'Cheese Lovers', 'american-1239091_1920.png', 'Rich tomato sauce with a triple layer of mozzarella cheese.', 'Tomato sauce, Mozzarella cheese', 510, 995, 1770),
(2, 'Sausage Mix', 'american-1239091_1920.png', 'Chicken sausages & onions with a double layer of mozzarella ', 'Chicken, Sausages, Onions, Mozzarella cheese', 510, 995, 1770),
(3, 'Tandoori Taste', 'american-1239091_1920.png', 'Tandoori chicken & onions with a double layer of mozzarella cheese.', 'Tandoori Chicken, Onions, Mozzarella cheese', 510, 995, 1770),
(4, 'Spicy Veggie ', 'american-1239091_1920.png', 'Tase of paneer with a double layer of mozzarella cheese.', ' Capsicums, Pineapple, Paneer, Mozzarella cheese.\r\n                                        ', 510, 995, 1770);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` enum('admin','delivery','customer') NOT NULL DEFAULT 'customer',
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `gender` enum('male','female') NOT NULL DEFAULT 'male',
  `address` text NOT NULL,
  `contact` int(11) NOT NULL,
  `registered_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `role`, `first_name`, `last_name`, `avatar`, `gender`, `address`, `contact`, `registered_date`, `password`) VALUES
(1, 'admin@gmail.com', 'admin', 'Jonna', 'Doe', '', 'male', 'SLIIT Malabe Campus, New Kandy Rd, Malabe. 10115', 770412085, '2019-10-07 01:28:20', '12345678'),
(2, 'delivery@gmail.com', 'delivery', 'Jane', 'Doe', 'user-profile.jpg', 'male', 'SLIIT Malabe Campus, New Kandy Rd, Malabe. 10115', 714025704, '2019-10-07 01:29:40', '123456'),
(3, 'customer@gmail.com', 'customer', 'Rachel', 'Stevensen', 'user-profile.jpg', 'male', 'SLIIT Malabe Campus, New Kandy Rd, Malabe. 10115', 781024507, '2019-10-07 01:31:01', '123456'),
(4, 'sameera@gmail.com', 'delivery', 'Sameera', 'Kodithuwakku', 'user-profile.jpg', 'male', 'SLIIT Malabe Campus, New Kandy Rd, Malabe. 10115', 770421045, '2019-10-07 01:51:45', '123456');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
