-- phpMyAdmin SQL Dump
-- version 5.3.0-dev+20220626.78b2c1f4eb
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-06-2022 a las 03:04:10
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
-- Estructura de tabla para la tabla `detalles_pedido`
--

CREATE TABLE `detalles_pedido` (
  `id` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `consumible_id` int(11) NOT NULL,
  `consumible_tipo` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cantidad` int(11) NOT NULL,
  `estado` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_final_estimada` datetime DEFAULT NULL,
  `fecha_alta` datetime NOT NULL,
  `fecha_modificacion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalles_pedido`
--

INSERT INTO `detalles_pedido` (`id`, `pedido_id`, `consumible_id`, `consumible_tipo`, `cantidad`, `estado`, `usuario_id`, `fecha_inicio`, `fecha_final_estimada`, `fecha_alta`, `fecha_modificacion`) VALUES
(43, 40, 1, 'bebida', 5, 'terminado', 35, '2022-06-20 07:38:07', '2022-06-20 07:58:07', '2022-06-20 01:02:46', '2022-06-20 08:03:35'),
(44, 40, 1, 'plato', 5, 'terminado', 35, '2022-06-20 07:49:52', '2022-06-20 08:03:52', '2022-06-20 01:02:46', '2022-06-20 08:11:47'),
(45, 42, 1, 'bebida', 5, 'terminado', 0, NULL, NULL, '2022-06-20 01:08:29', '2022-06-20 06:46:05'),
(46, 42, 1, 'plato', 5, 'terminado', 0, NULL, NULL, '2022-06-20 01:08:29', '2022-06-20 06:50:27'),
(49, 44, 1, 'bebida', 5, 'terminado', 1, NULL, NULL, '2022-06-20 01:10:47', '2022-06-20 06:54:14'),
(50, 44, 1, 'plato', 5, 'terminado', 23, NULL, NULL, '2022-06-20 01:10:47', '2022-06-20 06:56:13'),
(51, 45, 1, 'bebida', 5, 'terminado', 35, NULL, NULL, '2022-06-20 01:13:59', '2022-06-20 06:59:14'),
(52, 45, 1, 'plato', 5, 'terminado', NULL, NULL, NULL, '2022-06-20 01:13:59', '2022-06-20 01:13:59'),
(63, 47, 1, 'plato', 5, 'terminado', 3, NULL, NULL, '2022-06-25 04:47:32', '2022-06-25 04:47:32'),
(64, 48, 1, 'plato', 5, 'terminado', NULL, NULL, NULL, '2022-06-25 04:49:26', '2022-06-25 04:49:26'),
(65, 49, 1, 'plato', 5, 'terminado', 3, NULL, NULL, '2022-06-25 04:51:53', '2022-06-25 04:51:53'),
(70, 66, 1, 'bebida', 5, 'terminado', NULL, NULL, NULL, '2022-06-25 05:02:50', '2022-06-25 05:02:50'),
(71, 66, 2, 'cerveza', 5, 'terminado', 5, NULL, NULL, '2022-06-25 05:02:50', '2022-06-25 05:02:50'),
(72, 67, 1, 'bebida', 5, 'terminado', 23, NULL, NULL, '2022-06-25 05:03:36', '2022-06-25 05:03:36'),
(73, 67, 2, 'cerveza', 5, 'terminado', 23, NULL, NULL, '2022-06-25 05:03:36', '2022-06-25 05:03:36'),
(76, 67, 1, 'bebida', 5, 'terminado', NULL, NULL, NULL, '2022-06-25 05:19:53', '2022-06-25 05:20:47'),
(77, 67, 1, 'postre', 5, 'terminado', NULL, NULL, NULL, '2022-06-25 05:19:53', '2022-06-25 05:20:44');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



