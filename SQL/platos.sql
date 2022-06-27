-- phpMyAdmin SQL Dump
-- version 5.3.0-dev+20220626.78b2c1f4eb
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-06-2022 a las 03:05:11
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
-- Estructura de tabla para la tabla `platos`
--

CREATE TABLE `platos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `minutos_de_preparacion` int(11) NOT NULL,
  `precio` double NOT NULL,
  `apto_veganos` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fecha_alta` datetime NOT NULL,
  `fecha_modificacion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `platos`
--

INSERT INTO `platos` (`id`, `nombre`, `descripcion`, `minutos_de_preparacion`, `precio`, `apto_veganos`, `fecha_alta`, `fecha_modificacion`) VALUES
(1, 'Lomo con ensalada', 'Bife de Lomo 200gr. con ensalada de tomate, lechuga, cebolla cruda, zanahoria, huevo.', 24, 1679, 'N', '2022-06-14 05:57:09', '2022-06-17 05:26:22'),
(2, 'Lomo con ensalada', 'Bife de Lomo 200gr. con ensalada de tomate, lechuga, cebolla cruda, zanahoria, huevo.', 26, 1679, 'N', '2022-06-14 05:58:05', '2022-06-14 06:31:00'),
(7, 'Milanesa napolitana', 'Milanesa napolitana', 16, 1100.99, 'N', '2022-06-17 05:22:45', '2022-06-17 05:22:45'),
(8, 'Milanesa napolitana', 'Milanesa napolitana', 16, 1100.99, 'N', '2022-06-18 04:14:12', '2022-06-18 04:14:12'),
(9, 'Milanesa napolitana', 'Milanesa napolitana', 16, 1100.99, 'N', '2022-06-18 04:16:02', '2022-06-18 04:16:02'),
(10, 'Milanesa napolitana', '', 16, 1100.99, 'N', '2022-06-18 05:18:41', '2022-06-18 05:18:41'),
(11, 'Milanesa napolitana', '', 16, 1100.99, 'N', '2022-06-18 05:18:47', '2022-06-18 05:18:47');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `platos`
--
ALTER TABLE `platos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `platos`
--
ALTER TABLE `platos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



