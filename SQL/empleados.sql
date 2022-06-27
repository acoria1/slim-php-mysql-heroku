-- phpMyAdmin SQL Dump
-- version 5.3.0-dev+20220626.78b2c1f4eb
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-06-2022 a las 03:04:22
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `slim`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(70) NOT NULL,
  `rol` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `dni` varchar(30) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `fecha_alta` datetime NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  `fecha_baja` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id`, `nombre`, `apellido`, `rol`, `email`, `dni`, `fecha_nacimiento`, `direccion`, `fecha_alta`, `fecha_modificacion`, `fecha_baja`) VALUES
(5, 'Pedro', 'Sanchez', 'pastelero', 'psanch13@gmail.com', '14351435', '1992-03-12', 'Cordoba 1669, CABA, Buenos Aires', '2022-06-11 23:24:59', '2022-06-25 23:49:49', NULL),
(6, 'Ricky', 'Sanchez', 'pastelero', 'psanch13@gmail.com', '65329981', '1992-03-12', 'Cordoba 1669, CABA, Buenos Aires', '2022-06-17 06:33:47', '2022-06-17 06:33:47', NULL),
(10, 'Pedro', 'Sanchez', 'pastelero', 'psanch13@gmail.com', '65321111', '1990-05-05', 'Cordoba 1669, CABA, Buenos Aires', '2022-06-17 06:34:40', '2022-06-17 06:34:40', NULL),
(17, 'Agustin', 'Coria', 'socio', 'psanch1356@gmail.com', '65321433', '1990-04-04', 'Cordoba 1669, CABA, Buenos Aires', '2022-06-26 00:32:35', '2022-06-25 21:32:35', NULL),
(18, 'Ignacio', 'Coria', 'socio', 'das3r51rgf6@gmail.com', '35321433', '1995-04-04', 'Arredonodo 1263, CABA, Buenos Aires', '2022-06-28 22:54:16', '2022-06-25 22:54:16', NULL),
(19, 'Ignacio', 'Coria', 'socio', 'das3r51rgf6@gmail.com', '12415134', '1995-04-04', 'Arredonodo 1263, CABA, Buenos Aires', '2022-06-25 20:15:57', '2022-06-25 20:15:57', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `dni` (`dni`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



