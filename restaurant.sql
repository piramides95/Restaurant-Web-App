-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 01, 2022 at 10:38 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restaurant`
--

-- --------------------------------------------------------

--
-- Table structure for table `authorities`
--

CREATE TABLE `authorities` (
  `username` varchar(50) DEFAULT NULL,
  `authority` varchar(45) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `authorities`
--

INSERT INTO `authorities` (`username`, `authority`, `id`) VALUES
('jovan', 'ROLE_employee', 2),
('pero,Petrovic', 'ROLE_admin', 3),
('jovo,Jovon', 'ROLE_admin', 4),
('marko', 'ROLE_admin', 7);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `isOnMainPage` tinyint(1) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `isOnMainPage`, `image`, `description`) VALUES
(1, 'dorucak', 1, 'img/lunchTime1.jpg', 'Domaci dorucak'),
(2, 'glavno jelo', 0, 'img/pasta.png', 'Uzivajte u nasim jelima '),
(3, 'supe & corbe', 0, '', ''),
(4, 'salate', 1, NULL, NULL),
(5, 'Desert', 1, 'img/dessert.png', 'Najsladji kolaci'),
(8, 'Predjelo', 0, 'img/lunchTime.png', 'Dok cekate glavno jelo'),
(9, 'Test ', 0, 'img/test.png', 'Opis test ');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `name`, `role`, `description`, `image`) VALUES
(1, 'John Sawyer', 'Chef of the day', 'Najbolji kuvar u kuhinji', 'img/chef.jpg'),
(3, 'Miki Hranisavljevic', 'pomocni kuvar', 'pomocni kuvar sa 10 godina iskustva', 'img/chef.jpg'),
(4, 'Toma Milenkovic', 'Specijalista za meso', 'Kuvar sa preko 20 godina radnog iskustva, specijalizovan za pravljenje mesa', 'img/chef.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `description` varchar(120) DEFAULT NULL,
  `image` varchar(120) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `idRecipe` int(11) DEFAULT NULL,
  `idCategory` int(11) DEFAULT NULL,
  `isOnMainPage` tinyint(1) DEFAULT NULL,
  `isOnMenu` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `image`, `price`, `idRecipe`, `idCategory`, `isOnMainPage`, `isOnMenu`) VALUES
(28, 'Jaja na oko', 'Domaca jaja na oko', 'https://krstarica.name/wp-content/uploads/2019/12/32879654000_6efc642f3d_b-750x430.jpg', 120, 17, 1, 1, 1),
(32, 'Sopska salata', 'Sveza salata', 'https://walter.rs/wp-content/uploads/2021/02/walter-blog-sopska-salata-cover-image-e1612869005889.png', 120, 21, 4, 1, 1),
(39, 'Pileca supa', 'Domaca supa', 'https://static.juznasrbija.info/files/pileca-supa.jpg', 200, 28, 3, 1, 1),
(40, 'Corbasti pasulj', 'Pasulj sa kobasicom', 'https://staticstvarukusa.mondo.rs/Picture/20418/jpeg/Napravite-cuveni-corbast-pasulj-po-receptu-iz-JNA', 200, 29, 2, 1, 1),
(41, 'Prasece pecenje', 'Sveze pecenje', 'https://www.recepti.com/img/advice/prasece-pecenje.jpg', 650, 30, 2, 1, 1),
(42, 'Jagnjece pecenje', 'Sveze pecenje', 'https://ekuharica.com/wp-content/uploads/2021/07/147345589_2807718739478532_825620431867885166_n-960x500-1.jpg', 800, 31, 2, 1, 1),
(44, 'Koh', 'Koh koji se pravi na tradicionalan nacin, omiljeno jelo sa nasih prostora', 'https://www.cooking.rs/wp-content/uploads/2021/08/IMG_0487-1020x600.jpg', 200, 33, 5, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_tag`
--

CREATE TABLE `product_tag` (
  `idProduct` int(11) DEFAULT NULL,
  `idTag` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_tag`
--

INSERT INTO `product_tag` (`idProduct`, `idTag`, `id`) VALUES
(32, 2, 5),
(32, 5, 6);

-- --------------------------------------------------------

--
-- Table structure for table `recipe`
--

CREATE TABLE `recipe` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `description` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `recipe`
--

INSERT INTO `recipe` (`id`, `name`, `description`) VALUES
(1, 'Recept pileca supa', 'Za pravljenje pilece supe potrebno je imati :'),
(3, 'Corbasti pasulj', 'Kobasica i pasulj se dugo kuvaju, zatim zacin'),
(5, 'Recept za jagnjece p', 'Potrebno mlado jagnje, so, vatra i 4 sata pec'),
(6, 'Recept za prasece pe', 'Potrebno je prase , so, vatra i 3.5 sati pece'),
(7, 'Sopska salata recept', 'Pravi se od svezeg povrca'),
(9, 'dsdss', ''),
(15, 'Recept test', 'recept test opisss'),
(17, 'Recept jaja na oko', 'Opis recepta'),
(19, 'Test recept', 'Test recept opis'),
(20, 'Recept jaja na oko', 'Opis recepta'),
(21, 'Sopska salata recept', 'Pravi se od svezeg povrca'),
(22, 'Sopska salata recept', 'Pravi se od svezeg povrca'),
(23, 'Recept za jagnjece p', 'Potrebno mlado jagnje, so, vatra i 4 sata pec'),
(24, 'Recept za prasece pe', 'Potrebno je prase , so, vatra i 3.5 sati pece'),
(25, 'Recept pileca supa', 'Za pravljenje pilece supe potrebno je imati :'),
(26, 'Corbasti pasulj', 'Kobasica i pasulj se dugo kuvaju, zatim zacin'),
(27, 'Recept jaja na oko', 'Opis recepta'),
(28, 'Recept pileca supa', 'Za pravljenje pilece supe potrebno je imati :'),
(29, 'Corbasti pasulj', 'Kobasica i pasulj se dugo kuvaju, zatim zacin'),
(30, 'Recept za prasece pe', 'Potrebno je prase , so, vatra i 3.5 sati pece'),
(31, 'Recept za jagnjece p', 'Potrebno mlado jagnje, so, vatra i 4 sata pec'),
(32, 'poparicaaaaaaa', 'poparica mmmmmmmmm'),
(33, 'Recept za koh:', 'pomesati jaja i mleko u smesu i peci na 200 stepeni pola sata u rerni');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  `time` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `number` varchar(45) DEFAULT NULL,
  `isSeen` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`id`, `name`, `email`, `date`, `time`, `phone`, `number`, `isSeen`) VALUES
(1, 'Marko Markovic', 'marko.markovic@gmail.com', '08 October 2021', '22:00', '064111111', '4 People', 1),
(2, 'Ivan Ivanovic', 'ivan@gmail.com', '15 October 2021', '18:05', '5454646464', '2 People', 1);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `authority` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`authority`) VALUES
('ROLE_admin'),
('ROLE_employee');

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`id`, `name`) VALUES
(1, 'piletina'),
(2, 'povrce'),
(3, 'pasulj'),
(4, 'meso'),
(5, 'sir'),
(6, 'luk'),
(7, 'zacinjeno'),
(8, 'Test tag');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(68) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `surname` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `enabled`, `name`, `surname`) VALUES
('jovan', '{bcrypt}$2a$12$5aVrxA2g7xg0onYRz..bueFKd23qCbAvOnQ2iqoeEth9WJvoESBjS', 1, 'Jovan', 'Jovanovic'),
('jovo,Jovon', '{bcrypt}$2a$10$rYo9JnQCWfxWbKu6ykldt.ciISN0wXvrF0s7kKibNT0gg2mvTZzkC', 0, 'Jovo', NULL),
('marko', '{bcrypt}$2a$10$QTRnkp7y/1WH91lPBaQto.h0STNHbEYhgRnLHOt2YAvD1ynYnTOS2', 1, 'Marko', 'Markovic'),
('pero,Petrovic', '{bcrypt}$2a$10$m5QGYEXuxsaYoK9PL5RUsu7fSTTX2ziShV/ypbHHJQnik6FTomWYy', 0, 'Petar', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authorities`
--
ALTER TABLE `authorities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username_idx` (`username`),
  ADD KEY `authority_idx` (`authority`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idRecipe_idx` (`idRecipe`),
  ADD KEY `idCategory_idx` (`idCategory`);

--
-- Indexes for table `product_tag`
--
ALTER TABLE `product_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recipe`
--
ALTER TABLE `recipe`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`authority`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authorities`
--
ALTER TABLE `authorities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `product_tag`
--
ALTER TABLE `product_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `recipe`
--
ALTER TABLE `recipe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `authorities`
--
ALTER TABLE `authorities`
  ADD CONSTRAINT `authority` FOREIGN KEY (`authority`) REFERENCES `roles` (`authority`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `username` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `idCategory` FOREIGN KEY (`idCategory`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `idRecipe` FOREIGN KEY (`idRecipe`) REFERENCES `recipe` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
