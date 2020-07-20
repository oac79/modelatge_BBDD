-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-07-2020 a las 17:18:57
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.2.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `optica`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `addresses`
--

CREATE TABLE `addresses` (
  `id_address` int(11) NOT NULL,
  `street` varchar(100) NOT NULL,
  `house_number` int(11) NOT NULL,
  `floor` int(11) NOT NULL,
  `door` int(11) NOT NULL,
  `city` varchar(45) NOT NULL,
  `postal_code` int(11) NOT NULL,
  `country` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `addresses`
--

INSERT INTO `addresses` (`id_address`, `street`, `house_number`, `floor`, `door`, `city`, `postal_code`, `country`) VALUES
(0, 'Pintor Fortuny', 25, 4, 6, 'Barcelona', 8005, 'España'),
(1, 'Jacint Verdague', 102, 8, 5, 'Mataro', 8345, 'España');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brands`
--

CREATE TABLE `brands` (
  `id_brand` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `id_sup` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `brands`
--

INSERT INTO `brands` (`id_brand`, `name`, `id_sup`) VALUES
(1, 'Lacoste', 3),
(2, 'Arnette', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customers`
--

CREATE TABLE `customers` (
  `id_customer` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `phone` varchar(9) NOT NULL,
  `email` varchar(45) NOT NULL,
  `registration_date` date NOT NULL,
  `recommended_user` int(11) DEFAULT NULL,
  `id_address` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `customers`
--

INSERT INTO `customers` (`id_customer`, `name`, `phone`, `email`, `registration_date`, `recommended_user`, `id_address`) VALUES
(1, 'Manolo', '666555222', 'juanito@gmail.com', '2020-07-20', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glasses`
--

CREATE TABLE `glasses` (
  `id_glasses` int(11) NOT NULL,
  `graduate_left` float NOT NULL,
  `graduate right` float NOT NULL,
  `mount_type` varchar(20) NOT NULL,
  `colored_glass` varchar(20) NOT NULL,
  `color montage` varchar(20) NOT NULL,
  `price` float NOT NULL,
  `brand` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `glasses`
--

INSERT INTO `glasses` (`id_glasses`, `graduate_left`, `graduate right`, `mount_type`, `colored_glass`, `color montage`, `price`, `brand`) VALUES
(1, 0.2, 0.5, 'Pasta', 'Azul', 'Verde', 105.99, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `id_order` int(11) NOT NULL,
  `id_glasses` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `employee` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`id_order`, `id_glasses`, `id_customer`, `employee`) VALUES
(1, 1, 1, 'Arnau');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suppliers`
--

CREATE TABLE `suppliers` (
  `id_sup` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `phone` varchar(9) NOT NULL,
  `fax` varchar(15) NOT NULL,
  `id_address` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `suppliers`
--

INSERT INTO `suppliers` (`id_sup`, `name`, `phone`, `fax`, `id_address`) VALUES
(3, 'Manipulats S.L', '666555222', '3554564', 1),
(4, 'Tecnical SA', '666558155', '54646055', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id_address`);

--
-- Indices de la tabla `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id_brand`),
  ADD KEY `id_sup` (`id_sup`);

--
-- Indices de la tabla `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id_customer`),
  ADD KEY `id_address` (`id_address`);

--
-- Indices de la tabla `glasses`
--
ALTER TABLE `glasses`
  ADD PRIMARY KEY (`id_glasses`),
  ADD KEY `brand` (`brand`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `id_glasses` (`id_glasses`),
  ADD KEY `id_customer` (`id_customer`);

--
-- Indices de la tabla `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id_sup`),
  ADD KEY `id_address` (`id_address`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `brands`
--
ALTER TABLE `brands`
  MODIFY `id_brand` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `customers`
--
ALTER TABLE `customers`
  MODIFY `id_customer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `glasses`
--
ALTER TABLE `glasses`
  MODIFY `id_glasses` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id_sup` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `brands_ibfk_1` FOREIGN KEY (`id_sup`) REFERENCES `suppliers` (`id_sup`);

--
-- Filtros para la tabla `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`id_address`) REFERENCES `addresses` (`id_address`);

--
-- Filtros para la tabla `glasses`
--
ALTER TABLE `glasses`
  ADD CONSTRAINT `glasses_ibfk_1` FOREIGN KEY (`brand`) REFERENCES `brands` (`id_brand`);

--
-- Filtros para la tabla `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `customers` (`id_customer`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`id_glasses`) REFERENCES `glasses` (`id_glasses`);

--
-- Filtros para la tabla `suppliers`
--
ALTER TABLE `suppliers`
  ADD CONSTRAINT `suppliers_ibfk_1` FOREIGN KEY (`id_address`) REFERENCES `addresses` (`id_address`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
