-- phpMyAdmin SQL Dump
-- version 5.3.0-dev+20220626.78b2c1f4eb
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-06-2022 a las 03:05:01
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
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `codigo` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `mesa_id` int(11) DEFAULT NULL,
  `estado` varchar(30) NOT NULL,
  `mozo_id` int(11) DEFAULT NULL,
  `precio` double NOT NULL,
  `fecha_final_esperada` datetime DEFAULT NULL,
  `realizador_pago` int(11) DEFAULT NULL,
  `url_foto` varchar(300) DEFAULT NULL,
  `fecha_alta` datetime NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  `fecha_final` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `codigo`, `mesa_id`, `estado`, `mozo_id`, `precio`, `fecha_final_esperada`, `realizador_pago`, `url_foto`, `fecha_alta`, `fecha_modificacion`, `fecha_final`) VALUES
(40, '84NZX', 6, 'finalizado', 3, 500, '2022-06-20 08:06:00', 35, NULL, '2022-06-20 01:02:46', '2022-06-21 00:38:48', '2022-06-20 09:07:00'),
(42, 'PM4Q1', 5, 'cancelado', 21, 0, NULL, NULL, NULL, '2022-06-20 01:08:29', '2022-06-20 01:08:29', NULL),
(44, '9WBJH', 6, 'pedido', 3, 2228, NULL, NULL, NULL, '2022-06-20 01:10:47', '2022-06-20 01:10:47', NULL),
(45, '8ZOTR', 5, 'finalizado', 3, 2228, '2022-06-20 23:44:44', NULL, NULL, '2022-06-20 01:13:59', '2022-06-20 22:44:44', '2022-06-20 23:54:44'),
(47, 'TFY2W', 6, 'finalizado', 3, 1679, NULL, 1, NULL, '2022-06-25 04:47:32', '2022-06-25 04:47:32', NULL),
(48, 'VTH2Q', 6, 'finalizado', 3, 1679, NULL, 1, NULL, '2022-06-25 04:49:26', '2022-06-25 04:49:26', NULL),
(50, 'WC74B', 7, 'finalizado', 3, 1679, NULL, 40, NULL, '2022-06-25 04:52:29', '2022-06-25 04:52:29', NULL),
(66, 'GKNYH', 5, 'finalizado', 3, 4590, NULL, 40, NULL, '2022-06-25 05:02:50', '2022-06-25 05:02:50', NULL),
(67, 'JGOU5', 5, 'pedido', 3, 4590, NULL, 40, NULL, '2022-06-25 05:03:35', '2022-06-25 05:20:48', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `realizador` (`realizador_pago`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `realizador` FOREIGN KEY (`realizador_pago`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



