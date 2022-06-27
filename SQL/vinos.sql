-- phpMyAdmin SQL Dump
-- version 5.3.0-dev+20220626.78b2c1f4eb
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-06-2022 a las 03:05:42
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
-- Estructura de tabla para la tabla `vinos`
--

CREATE TABLE `vinos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `minutos_de_preparacion` int(11) NOT NULL,
  `precio` double NOT NULL,
  `mililitros` int(11) NOT NULL,
  `porcentaje_alcohol` double NOT NULL,
  `tipo_uva` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_alta` datetime NOT NULL,
  `fecha_modificacion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `vinos`
--

INSERT INTO `vinos` (`id`, `nombre`, `descripcion`, `minutos_de_preparacion`, `precio`, `mililitros`, `porcentaje_alcohol`, `tipo_uva`, `fecha_alta`, `fecha_modificacion`) VALUES
(1, 'Las Cumbres 2019', 'Vino rojizo de uva americana con notas de frutos rojos y notas de vainilla y cedro', 3, 380, 200, 11.9, 'Cabernet Sauvignon', '2022-06-18 06:13:05', '2022-06-18 06:13:05'),
(2, 'Las Cumbres 2020', 'Vino rojizo de uva americana con notas de frutos rojos y notas de vainilla y cedro', 3, 410, 200, 12.4, 'Cabernet Sauvignon', '2022-06-18 06:13:16', '2022-06-18 06:13:16');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `vinos`
--
ALTER TABLE `vinos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `vinos`
--
ALTER TABLE `vinos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



