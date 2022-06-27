-- phpMyAdmin SQL Dump
-- version 5.3.0-dev+20220626.78b2c1f4eb
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-06-2022 a las 03:05:34
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
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `clave` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `perfil` varchar(30) NOT NULL,
  `empleado_id` int(11) DEFAULT NULL,
  `fecha_alta` datetime NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  `fecha_baja` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `clave`, `email`, `perfil`, `empleado_id`, `fecha_alta`, `fecha_modificacion`, `fecha_baja`) VALUES
(1, 'ACORIA', '$2y$10$62IGjcuaWrERAg5oaBW0TehfNA/homuulbtFzKRrLfL', 'aaa@asdo.com', 'bartender', 5, '2022-06-07 02:20:30', '2022-06-18 04:56:02', NULL),
(3, 'JHALL', '$2y$10$F50kMzkSQGL6IL.xLxRtJuIclW.gM.b3lXOCf.h5pZO', 'aaa@asdo.com', 'mozo', 5, '2022-06-09 07:15:47', '2022-06-10 06:55:05', NULL),
(10, 'FFIAHO', '$2y$10$4aug.CIDqz4y4OeQeLCCEeZxIuL7D2tHOA/ECYEqdQn', 'dqwaqwr@ghot.com', 'bartender', NULL, '2022-06-10 02:52:07', '2022-06-10 04:13:55', '2022-06-10 04:13:55'),
(14, 'LOLOLO', '$2y$10$Qq6CoQjCyd.FdK3gVHbiOe2ns94o/wJCETbNpEuQnst', 'bfpoj@ghot.com', 'bartender', NULL, '2022-06-10 06:30:51', '2022-06-10 06:30:51', NULL),
(15, 'MGOHOUL', '$2y$10$M02yc36oD8PQfaVuXuBu9OBBtDp8zjCf9UWgo6/6Tug', 'bfpoj@ghot.com', 'mozo', NULL, '2022-06-10 06:58:45', '2022-06-10 06:58:45', NULL),
(16, 'TDOWNR', '$2y$10$bwE2rtiyL7sOVCUXKVbx9OVVNlY6epf54WtTN9QGyIG', 'asdgb23r@ghot.com', 'mozo', NULL, '2022-06-10 07:07:02', '2022-06-10 07:07:02', NULL),
(17, 'FWIQNE', '$2y$10$aHesV1fnkUWou8OBA86bRuntplXr8ua5KCtnusN4IST', 'asdgb23r@ghot.com', 'cocinero', NULL, '2022-06-12 00:41:38', '2022-06-12 00:41:38', NULL),
(18, 'FWIQNEE', '$2y$10$gNxpSgkCXfLnX1cBPixnzebxX6kC/GJ4NQ1wkppf5Ea', 'admin_128y9y3@ghot.com', 'admin', NULL, '2022-06-12 00:54:20', '2022-06-12 00:54:20', NULL),
(20, 'NIDSO', '$2y$10$V2tEoViP0ubx7tnJ/fBhf.0rB7gsANyLEeeD4E85oeN', 'admin_d1@ghot.com', 'cocinero', NULL, '2022-06-12 01:25:54', '2022-06-12 01:25:54', NULL),
(21, 'ADDASMOP', '$2y$10$u12791JM453gRxLJtANSv.Y6l4fwgYetcw/eaoidh3m', 'admin_d1@ghot.com', 'cocinero', NULL, '2022-06-14 04:03:22', '2022-06-14 04:03:22', NULL),
(23, 'IUASGDI', '$2y$10$KvhStYlnanrJ0S4jeT1fRevlVYTbNTReMAqwwiJ72ff', 'admin_d1@ghot.com', 'cocinero', 6, '2022-06-17 23:17:49', '2022-06-17 23:17:49', NULL),
(27, 'WQEOIYFFF', '$2y$10$sTJ0aFCQuI2fJP..JeyjpeTBFk0NgCz4jwTirQtFFKJ', 'admin_d1@ghot.com', 'mozo', NULL, '2022-06-17 23:26:20', '2022-06-17 23:26:20', NULL),
(29, 'QWERGCC', '$2y$10$iC27afvUfamNNvis8WgukOnwvkl8zaBnKDxBnV8I7xb', 'adsdn_d1@ghot.com', 'mozo', NULL, '2022-06-17 23:28:42', '2022-06-17 23:28:42', NULL),
(31, 'ERUDOLF', '$2y$10$Gq7odko0qNVyuoJ3oH4npebwyk3Es9GBHx8y9nzeUh7', 'adsdn_d1@ghot.com', 'bartender', NULL, '2022-06-18 05:01:19', '2022-06-18 05:01:19', NULL),
(35, 'DASG12', '$2y$10$XOWFou3ihsDTjJvbrMAMIOUGnfqYfV5zy87uany6Cc0', 'adsdn_d1@ghot.com', 'bartender', NULL, '2022-06-20 06:21:38', '2022-06-20 06:21:38', NULL),
(36, 'ctolerton0', '$2y$10$BKvaXRLH6Q7S39w2cnAsUuk3BB8POR6q4siyxyMUoew', 'ecuardall0@google.pl', 'mozo', NULL, '2022-06-21 07:17:12', '2022-06-21 07:17:12', NULL),
(37, 'mcorcut1', '$2y$10$oLEdMj5j1A81O0Tyu0FxEOBJPd4pbqeLSUQKU1mw2i/', 'sferenczy1@multiply.com', 'cervecero', NULL, '2022-06-21 07:17:13', '2022-06-21 07:17:13', NULL),
(38, 'marons2', '$2y$10$RUr9Np9w.dPxmL4/fKRSC.umXexFtb4WCPOK3oCQqoS', 'sbazoge2@vinaora.com', 'bartender', NULL, '2022-06-21 07:17:13', '2022-06-21 07:17:13', NULL),
(39, 'lsymmons3', '$2y$10$GH3Mf/bVf1EVtzq1Kbu3WebPQl3DueqToFg3ghYp0Cy', 'iminogue3@unicef.org', 'cervecero', NULL, '2022-06-21 07:17:13', '2022-06-21 07:17:13', NULL),
(40, 'epetersen4', '$2y$10$QVfSIGpH02EFonYlDSyNSeTIC4tvHY9QUj4gJKBONIK', 'ctewkesbury4@dell.com', 'socio', 5, '2022-06-21 07:17:14', '2022-06-21 07:17:14', NULL),
(41, 'gtripon5', '$2y$10$puCzzGWdGoAmul5y1EOAQO.jAtFVnZAKNRjkP8ZN/qz', 'skalker5@google.com.br', 'socio', NULL, '2022-06-21 07:17:14', '2022-06-21 07:17:14', NULL),
(42, 'lbarratt6', '$2y$10$5nujtoVCx94O41Jrn4tYKu7ETI56.O6gNrYicTUnPx5', 'ndooman6@yellowbook.com', 'admin', NULL, '2022-06-21 07:17:14', '2022-06-21 07:17:14', NULL),
(43, 'amolohan7', '$2y$10$UjihH8G6BhjouwCQOwI0QO5pLrbgsOFF4l7f99F1ppR', 'viliffe7@ftc.gov', 'mozo', NULL, '2022-06-21 07:17:14', '2022-06-21 07:17:14', NULL),
(44, 'hhamon8', '$2y$10$kC4EE4jXOEc0h10Og9Hc.eN.N/8gTrG2xtdnh4Hi57w', 'mesherwood8@abc.net.au', 'cocinero', NULL, '2022-06-21 07:17:14', '2022-06-21 07:17:14', NULL),
(45, 'mcaen9', '$2y$10$lAjr5Ulse3Yz2esmm.txdeLZ9U9LXLlRmyRw5HdqO9I', 'fpimblott9@mit.edu', 'cervecero', NULL, '2022-06-21 07:17:14', '2022-06-21 07:17:14', NULL),
(56, 'RRRRR', '$2y$10$GWXOUoowdd8CXNxwr81H2OB7UY1H3wcX0SSuveQgUzw', 'adsdn_d1@ghot.com', 'bartender', NULL, '2022-06-25 21:54:29', '2022-06-25 21:54:29', NULL),
(57, 'QQQQQ', '$2y$10$rh4GJR0YiHJzaXYmXFIku.CNs2HKWtLEVIvcRLkp53R', 'adsdn_d1@ghot.com', 'bartender', NULL, '2022-06-25 21:55:43', '2022-06-25 21:55:43', NULL),
(59, 'WWWWW', '$2y$10$t2/FbF4VObiPOff5GmGR2.ySmnZHbeS6WSf6FBU7aAj', 'adsdn_d1@ghot.com', 'bartender', NULL, '2022-06-25 21:56:26', '2022-06-25 21:56:26', NULL),
(60, 'JAJAJ', '$2y$10$JDNb0UvJweZYgFvsIUIedO/iMwkz0x9fOvx9AdOVVjT', 'test124@ghot.com', 'cervecero', NULL, '2022-06-25 22:53:05', '2022-06-25 22:53:05', NULL),
(61, 'AAA123', '$2y$10$95rdSh9ZeQQsuf.pi.Xur.5MNr6hORlH6/DcVtoHig7', 'test124@ghot.com', 'admin', NULL, '2022-06-26 18:25:17', '2022-06-26 18:25:17', NULL),
(62, 'F13R2RTG2', '$2y$10$fvVVp5o.Qs/XjYifTsfojuW.4gpr3BtkmDk4BR/k9Jn', 'test124@ghot.com', 'cocinero', NULL, '2022-06-26 18:28:55', '2022-06-26 18:28:55', NULL),
(64, 'F13R2RTG2ASD', '$2y$10$M4MsiGKNuduTwgNckRZXJ.JvDebU03gTccJOkD2MYMD', 'test124@ghot.com', 'cocinero', NULL, '2022-06-26 18:30:03', '2022-06-26 18:30:03', NULL),
(65, 'ASDH431GE', '$2y$10$VLUYFqqsoIIyBNtpeg/M1uopqW9H5jxZY9ULteoGGbk', 'tes1332r2@ghot.com', 'cocinero', NULL, '2022-06-26 18:34:39', '2022-06-26 18:34:39', NULL),
(66, 'GHILLO', '$2y$10$QTQvDLXPjC3PyPoBq7wsmeR6X120aYt08.XO.0IXvFf', 'gully_hillo@ghot.com', 'socio', 5, '2022-06-26 20:03:07', '2022-06-26 21:29:50', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQUE usuario` (`usuario`) USING BTREE,
  ADD KEY `empleado_id` (`empleado_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `empleado_id` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



