-- phpMyAdmin SQL Dump
-- version 5.3.0-dev+20220626.78b2c1f4eb
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-06-2022 a las 03:03:59
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
-- Estructura de tabla para la tabla `cervezas`
--

CREATE TABLE `cervezas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `minutos_de_preparacion` int(11) NOT NULL,
  `precio` double NOT NULL,
  `mililitros` int(11) NOT NULL,
  `porcentaje_alcohol` double NOT NULL,
  `variedad` varchar(30) DEFAULT NULL,
  `fecha_alta` datetime NOT NULL,
  `fecha_modificacion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cervezas`
--

INSERT INTO `cervezas` (`id`, `nombre`, `descripcion`, `minutos_de_preparacion`, `precio`, `mililitros`, `porcentaje_alcohol`, `variedad`, `fecha_alta`, `fecha_modificacion`) VALUES
(1, 'Capitan Espacial', 'IPA capital Espacial con lúpulo, dejo de trigo y notas de te', 3, 549, 500, 5.9, 'IPA', '2022-06-18 06:06:25', '2022-06-18 06:08:07'),
(2, 'Perro Rabioso', 'APA americana con notas de frutos rojos y acidez', 2, 399, 500, 6.2, 'APA', '2022-06-18 06:07:16', '2022-06-18 06:07:16'),
(3, 'Capitan Espacial', 'IPA capital Espacial con lúpulo, dejo de trigo y notas de te', 3, 549, 500, 5.9, 'IPA', '2022-06-21 07:05:16', '2022-06-21 07:05:16'),
(4, 'Perro Rabioso', 'APA americana con notas de frutos rojos y acidez', 2, 399, 500, 6.2, 'APA', '2022-06-21 07:05:17', '2022-06-21 07:05:17');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cervezas`
--
ALTER TABLE `cervezas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cervezas`
--
ALTER TABLE `cervezas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



