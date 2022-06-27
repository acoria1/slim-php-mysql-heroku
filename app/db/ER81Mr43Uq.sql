-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 27-06-2022 a las 05:09:29
-- Versión del servidor: 8.0.13-4
-- Versión de PHP: 7.2.24-0ubuntu0.18.04.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ER81Mr43Uq`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bebidas`
--

CREATE TABLE `bebidas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `minutos_de_preparacion` int(11) NOT NULL,
  `precio` double NOT NULL,
  `mililitros` int(11) NOT NULL,
  `fecha_alta` datetime NOT NULL,
  `fecha_modificacion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `bebidas`
--

INSERT INTO `bebidas` (`id`, `nombre`, `descripcion`, `minutos_de_preparacion`, `precio`, `mililitros`, `fecha_alta`, `fecha_modificacion`) VALUES
(1, 'Martini Classic ', 'Martini Seco con aceitunas y limon', 3, 549, 400, '2022-06-18 05:51:30', '2022-06-18 05:53:23');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `cervezas`
--

INSERT INTO `cervezas` (`id`, `nombre`, `descripcion`, `minutos_de_preparacion`, `precio`, `mililitros`, `porcentaje_alcohol`, `variedad`, `fecha_alta`, `fecha_modificacion`) VALUES
(1, 'Capitan Espacial', 'IPA capital Espacial con lúpulo, dejo de trigo y notas de te', 3, 549, 500, 5.9, 'IPA', '2022-06-18 06:06:25', '2022-06-18 06:08:07'),
(2, 'Perro Rabioso', 'APA americana con notas de frutos rojos y acidez', 2, 399, 500, 6.2, 'APA', '2022-06-18 06:07:16', '2022-06-18 06:07:16'),
(3, 'Capitan Espacial', 'IPA capital Espacial con lúpulo, dejo de trigo y notas de te', 3, 549, 500, 5.9, 'IPA', '2022-06-21 07:05:16', '2022-06-21 07:05:16'),
(4, 'Perro Rabioso', 'APA americana con notas de frutos rojos y acidez', 2, 399, 500, 6.2, 'APA', '2022-06-21 07:05:17', '2022-06-21 07:05:17');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id`, `nombre`, `apellido`, `rol`, `email`, `dni`, `fecha_nacimiento`, `direccion`, `fecha_alta`, `fecha_modificacion`, `fecha_baja`) VALUES
(5, 'Pedro', 'Sanchez', 'pastelero', 'psanch13@gmail.com', '14351435', '1992-03-12', 'Cordoba 1669, CABA, Buenos Aires', '2022-06-11 23:24:59', '2022-06-25 23:49:49', NULL),
(6, 'Ricky', 'Sanchez', 'pastelero', 'psanch13@gmail.com', '65329981', '1992-03-12', 'Cordoba 1669, CABA, Buenos Aires', '2022-06-17 06:33:47', '2022-06-17 06:33:47', NULL),
(17, 'Agustin', 'Coria', 'socio', 'psanch1356@gmail.com', '65321433', '1990-04-04', 'Cordoba 1669, CABA, Buenos Aires', '2022-06-26 00:32:35', '2022-06-25 21:32:35', NULL),
(18, 'Ignacio', 'Coria', 'socio', 'das3r51rgf6@gmail.com', '35321433', '1995-04-04', 'Arredonodo 1263, CABA, Buenos Aires', '2022-06-28 22:54:16', '2022-06-25 22:54:16', NULL),
(20, 'Lianna', 'Pendergrast', 'cervecero', 'lpendergrast5@phpbb.com', '27074536', '1965-11-19', '8526 Marquette Lane', '2022-06-27 00:38:38', '2022-06-27 00:38:38', NULL),
(21, 'Melloney', 'Geaveny', 'mozo', 'mgeavenyb@blogs.com', '40622834', '1998-10-16', '394 Badeau Pass', '2022-06-27 00:38:38', '2022-06-27 00:38:38', NULL),
(22, 'Herby', 'Coite', 'bartender', 'hcoited@spiegel.de', '30807409', '1996-10-16', '1273 New Castle Crossing', '2022-06-27 00:38:38', '2022-06-27 00:38:38', NULL),
(23, 'Penn', 'Hlavecek', 'cocinero', 'phlavecekh@skype.com', '32315099', '1954-10-18', '3111 Schurz Road', '2022-06-27 00:38:39', '2022-06-27 00:38:39', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encuestas`
--

CREATE TABLE `encuestas` (
  `id` int(11) NOT NULL,
  `general_puntaje` int(11) NOT NULL,
  `mesa_id` int(11) DEFAULT NULL,
  `mesa_puntaje` int(11) DEFAULT NULL,
  `mozo_id` int(11) DEFAULT NULL,
  `mozo_puntaje` int(11) DEFAULT NULL,
  `comida_puntaje` int(11) DEFAULT NULL,
  `descripcion` varchar(66) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_alta` datetime NOT NULL,
  `fecha_modificacion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `encuestas`
--

INSERT INTO `encuestas` (`id`, `general_puntaje`, `mesa_id`, `mesa_puntaje`, `mozo_id`, `mozo_puntaje`, `comida_puntaje`, `descripcion`, `fecha_alta`, `fecha_modificacion`) VALUES
(103, 9, 8, 10, 3, 10, 3, 'Seborrheic infantile dermatitis', '2022-06-26 03:12:10', '2022-06-26 03:12:10'),
(104, 5, 7, 8, 43, 5, 3, 'Oth injury due to other accident on board sailboat, sequela', '2022-06-26 03:12:10', '2022-06-26 03:12:10'),
(105, 5, 6, 1, 16, 6, 7, 'Chronic mastoiditis, bilateral', '2022-06-26 03:12:10', '2022-06-26 03:12:10'),
(106, 5, 5, 6, 27, 9, 6, 'Supervision of elderly primigravida, unspecified trimester', '2022-06-26 03:12:10', '2022-06-26 03:12:10'),
(107, 6, 10, 5, 3, 8, 10, 'Rheu arthritis of shoulder w involv of organs and systems', '2022-06-26 03:12:10', '2022-06-26 03:12:10'),
(108, 2, 6, 3, 3, 3, 7, 'Herpes gestationis, second trimester', '2022-06-26 03:12:10', '2022-06-26 03:12:10'),
(109, 4, 5, 10, 43, 10, 3, 'Congenital kyphosis, occipito-atlanto-axial region', '2022-06-26 03:12:10', '2022-06-26 03:12:10'),
(110, 3, 11, 7, 3, 8, 3, 'Nondisp fx of lateral malleolus of l fibula, 7thC', '2022-06-26 03:12:11', '2022-06-26 03:12:11'),
(111, 5, 6, 7, 16, 3, 8, 'Nondisp suprcndl fx w intrcndl extn low end r femr, 7thR', '2022-06-26 03:12:11', '2022-06-26 03:12:11'),
(112, 8, 5, 7, 16, 7, 3, 'Burn of third degree of neck', '2022-06-26 03:12:11', '2022-06-26 03:12:11'),
(113, 1, 9, 7, 29, 8, 6, 'Acute anal fissure', '2022-06-26 03:12:11', '2022-06-26 03:12:11'),
(114, 10, 8, 2, 27, 5, 6, 'Non-pressure chronic ulcer of right thigh with unsp severity', '2022-06-26 03:12:11', '2022-06-26 03:12:11'),
(115, 4, 6, 1, 29, 2, 7, 'Hematosalpinx', '2022-06-26 03:12:11', '2022-06-26 03:12:11'),
(116, 3, 7, 6, 16, 10, 8, 'Chorioretinal scars after surgery for detachment, right eye', '2022-06-26 03:12:11', '2022-06-26 03:12:11'),
(117, 1, 5, 6, 16, 2, 4, 'Occupant of rail trn/veh injured in collisn/hit by roll stok', '2022-06-26 03:12:11', '2022-06-26 03:12:11'),
(118, 5, 5, 5, 29, 8, 8, 'Corrosion of third degree of left toe(s) (nail), subs encntr', '2022-06-26 03:12:11', '2022-06-26 03:12:11'),
(119, 10, 7, 10, 29, 10, 9, 'Lacerat intrns musc/fasc/tend and unsp finger at wrs/hnd lv', '2022-06-26 03:12:11', '2022-06-26 03:12:11'),
(120, 4, 9, 1, 3, 2, 1, 'Open bite of abd wall, left lower q w penet perit cav, sqla', '2022-06-26 03:12:11', '2022-06-26 03:12:11'),
(121, 6, 6, 4, 16, 3, 5, 'Central pterygium of unspecified eye', '2022-06-26 03:12:11', '2022-06-26 03:12:11'),
(122, 9, 8, 5, 29, 6, 10, 'Dislocation of carpometacarpal joint of unsp hand, sequela', '2022-06-26 03:12:11', '2022-06-26 03:12:11'),
(123, 6, 5, 3, 16, 7, 9, 'Congenital malformation of orbit', '2022-06-26 03:12:11', '2022-06-26 03:12:11'),
(124, 7, 10, 6, 29, 8, 8, 'Incomplete atypical femoral fracture, unspecified leg, 7thD', '2022-06-26 03:12:11', '2022-06-26 03:12:11'),
(125, 3, 9, 7, 43, 8, 7, 'Toxic effects of chromium and its compounds', '2022-06-26 03:12:11', '2022-06-26 03:12:11'),
(126, 3, 11, 10, 27, 9, 5, 'Injury of other cranial nerves', '2022-06-26 03:12:11', '2022-06-26 03:12:11'),
(127, 6, 6, 3, 43, 3, 7, 'Displ transverse fx shaft of unsp femr, 7thQ', '2022-06-26 03:12:11', '2022-06-26 03:12:11'),
(128, 2, 9, 10, 3, 10, 6, 'Rapidly progr nephritic syndrome w dense deposit disease', '2022-06-26 03:12:11', '2022-06-26 03:12:11'),
(129, 1, 11, 7, 3, 6, 5, 'Inj oth blood vessels at wrs/hnd lv of left arm, sequela', '2022-06-26 03:12:11', '2022-06-26 03:12:11'),
(130, 9, 9, 4, 29, 5, 9, 'Open bite of right ring finger with damage to nail, sequela', '2022-06-26 03:12:11', '2022-06-26 03:12:11'),
(131, 7, 9, 3, 29, 4, 2, 'Nondisp fx of posterior wall of unsp acetabulum, init', '2022-06-26 03:12:11', '2022-06-26 03:12:11'),
(132, 3, 10, 9, 27, 4, 7, 'Pressure ulcer of right heel, unspecified stage', '2022-06-26 03:12:11', '2022-06-26 03:12:11'),
(133, 4, 6, 10, 43, 2, 1, 'Nondisp seg fx shaft of unsp tibia, 7thJ', '2022-06-26 03:12:12', '2022-06-26 03:12:12'),
(134, 6, 11, 6, 27, 8, 8, 'Non-prs chr ulcer of right heel and midfoot w unsp severt', '2022-06-26 03:12:12', '2022-06-26 03:12:12'),
(135, 9, 9, 7, 3, 1, 3, 'Sltr-haris Type I physl fx upr end humer, r arm, 7thD', '2022-06-26 03:12:12', '2022-06-26 03:12:12'),
(136, 7, 9, 1, 16, 9, 6, 'Lac w/o fb of abd wall, epigst rgn w/o penet perit cav', '2022-06-26 03:12:12', '2022-06-26 03:12:12'),
(137, 10, 9, 10, 27, 5, 8, 'Postprocedural hematoma of the spleen fol proc on spleen', '2022-06-26 03:12:12', '2022-06-26 03:12:12'),
(138, 1, 5, 1, 29, 3, 10, 'Sltr-haris Type II physl fx low end humer, l arm, 7thP', '2022-06-26 03:12:12', '2022-06-26 03:12:12'),
(139, 1, 11, 1, 43, 4, 4, 'Pityriasis lichenoides chronica', '2022-06-26 03:12:12', '2022-06-26 03:12:12'),
(140, 1, 11, 1, 43, 4, 5, 'Passenger in hv veh injured in clsn w unsp mv nontraf, init', '2022-06-26 03:12:12', '2022-06-26 03:12:12'),
(141, 9, 10, 10, 29, 6, 5, 'Spondylopathy in diseases classified elsewhere', '2022-06-26 03:12:12', '2022-06-26 03:12:12'),
(142, 7, 11, 6, 27, 7, 10, 'Breakdown (mechanical) of int fix of bones, init', '2022-06-26 03:12:12', '2022-06-26 03:12:12'),
(143, 5, 8, 8, 29, 8, 10, 'Person injured in oth transport acc w non-mv, nontraf, init', '2022-06-26 03:12:12', '2022-06-26 03:12:12'),
(144, 6, 7, 9, 27, 8, 3, 'Respiratory bronchiolitis interstitial lung disease', '2022-06-26 03:12:12', '2022-06-26 03:12:12'),
(145, 8, 8, 4, 16, 7, 7, 'Other injury of urethra, initial encounter', '2022-06-26 03:12:12', '2022-06-26 03:12:12'),
(146, 8, 11, 10, 27, 6, 7, 'Melanoma in situ of other part of trunk', '2022-06-26 03:12:12', '2022-06-26 03:12:12'),
(147, 1, 10, 6, 29, 7, 8, 'Inj superficial vein at shldr/up arm, left arm, sequela', '2022-06-26 03:12:12', '2022-06-26 03:12:12'),
(148, 9, 7, 7, 27, 2, 5, 'Unsp fx shaft of l femr, 7thR', '2022-06-26 03:12:12', '2022-06-26 03:12:12'),
(149, 6, 9, 8, 27, 9, 1, 'Subluxation of metacarpophalangeal joint of left ring finger', '2022-06-26 03:12:12', '2022-06-26 03:12:12'),
(150, 1, 9, 9, 27, 10, 7, 'Dislocation of interphalangeal joint of unsp great toe, init', '2022-06-26 03:12:12', '2022-06-26 03:12:12'),
(151, 7, 5, 2, 27, 10, 4, 'Blister (nonthermal) of right little finger, subs encntr', '2022-06-26 03:12:12', '2022-06-26 03:12:12'),
(152, 3, 7, 8, 43, 10, 4, 'Unsp fx fourth MC bone, right hand, subs for fx w nonunion', '2022-06-26 03:12:12', '2022-06-26 03:12:12'),
(153, 2, 6, 9, 27, 10, 4, 'Dacryoadenitis', '2022-06-26 03:12:12', '2022-06-26 03:12:12'),
(154, 9, 10, 6, 43, 7, 4, 'Oth meniscus derangements, oth lateral meniscus, right knee', '2022-06-26 03:12:12', '2022-06-26 03:12:12'),
(155, 9, 6, 3, 43, 1, 6, 'Other physeal fracture of upper end of radius, right arm', '2022-06-26 03:12:12', '2022-06-26 03:12:12'),
(156, 5, 8, 3, 16, 1, 7, 'Accidental malfunction of other larger firearm, sequela', '2022-06-26 03:12:12', '2022-06-26 03:12:12'),
(157, 3, 6, 2, 43, 9, 8, 'Diffuse cystic mastopathy of right breast', '2022-06-26 03:12:12', '2022-06-26 03:12:12'),
(158, 3, 7, 6, 29, 10, 7, 'Toxic effect of hydrogen sulfide, self-harm, subs', '2022-06-26 03:12:12', '2022-06-26 03:12:12'),
(159, 6, 5, 6, 29, 6, 7, 'Posterior sublux of proximal end of tibia, l knee, sequela', '2022-06-26 03:12:12', '2022-06-26 03:12:12'),
(160, 5, 11, 2, 29, 10, 6, 'Nondisp spiral fx shaft of l tibia, 7thM', '2022-06-26 03:12:12', '2022-06-26 03:12:12'),
(161, 7, 6, 6, 29, 7, 3, 'Other stimulant dependence with intoxication delirium', '2022-06-26 03:12:12', '2022-06-26 03:12:12'),
(162, 10, 10, 10, 43, 6, 8, 'Sltr-haris Type III physl fx low end unsp femr, 7thD', '2022-06-26 03:12:12', '2022-06-26 03:12:12'),
(163, 3, 6, 6, 29, 4, 4, 'Nondisplaced dome fracture of unsp acetabulum, sequela', '2022-06-26 03:12:12', '2022-06-26 03:12:12'),
(164, 10, 9, 7, 16, 2, 9, 'Other long term (current) drug therapy', '2022-06-26 03:12:12', '2022-06-26 03:12:12'),
(165, 1, 5, 5, 16, 5, 4, 'Oth fx head/neck of l femr, 7thH', '2022-06-26 03:12:12', '2022-06-26 03:12:12'),
(166, 3, 6, 2, 29, 9, 10, 'Hyphema, right eye', '2022-06-26 03:12:12', '2022-06-26 03:12:12'),
(167, 2, 9, 2, 43, 8, 5, 'Burn of first degree of right toe(s) (nail)', '2022-06-26 03:12:13', '2022-06-26 03:12:13'),
(168, 9, 7, 3, 43, 1, 5, 'Laceration of ulnar artery at forearm level, unsp arm, init', '2022-06-26 03:12:13', '2022-06-26 03:12:13'),
(169, 4, 6, 5, 3, 1, 6, 'Fall into storm drain or manhole', '2022-06-26 03:12:13', '2022-06-26 03:12:13'),
(170, 5, 8, 9, 43, 2, 3, 'Nondisp suprcndl fx w intrcndl extn low end l femr, 7thM', '2022-06-26 03:12:13', '2022-06-26 03:12:13'),
(171, 7, 8, 3, 27, 2, 7, 'Pleural effusion in other conditions classified elsewhere', '2022-06-26 03:12:13', '2022-06-26 03:12:13'),
(172, 4, 10, 10, 43, 7, 7, 'Toxic effect of noxious substnc eaten as food, undet, subs', '2022-06-26 03:12:13', '2022-06-26 03:12:13'),
(173, 1, 8, 9, 43, 1, 2, 'Crushing injury of unspecified thumb, initial encounter', '2022-06-26 03:12:13', '2022-06-26 03:12:13'),
(174, 7, 9, 4, 29, 10, 6, 'Burn 2nd deg mul right fingers (nail), not inc thumb, subs', '2022-06-26 03:12:13', '2022-06-26 03:12:13'),
(175, 4, 5, 6, 3, 5, 5, 'Nondisp fx of proximal phalanx of left little finger', '2022-06-26 03:12:13', '2022-06-26 03:12:13'),
(176, 9, 8, 5, 3, 3, 6, 'Striking against unsp object w subsequent fall, subs encntr', '2022-06-26 03:12:13', '2022-06-26 03:12:13'),
(177, 6, 11, 6, 43, 9, 8, 'Hymenolepiasis', '2022-06-26 03:12:13', '2022-06-26 03:12:13'),
(178, 5, 6, 6, 16, 5, 4, 'Local infection due to central venous catheter', '2022-06-26 03:12:13', '2022-06-26 03:12:13'),
(179, 8, 6, 1, 16, 10, 2, 'Other anemias', '2022-06-26 03:12:13', '2022-06-26 03:12:13'),
(180, 4, 5, 9, 3, 1, 3, 'War operations involving firearms pellets, civilian, subs', '2022-06-26 03:12:13', '2022-06-26 03:12:13'),
(181, 2, 8, 10, 43, 4, 7, 'Nondisp fx of dist phalanx of finger, subs for fx w malunion', '2022-06-26 03:12:13', '2022-06-26 03:12:13'),
(182, 5, 5, 9, 43, 8, 6, 'Immunodeficiency with increased immunoglobulin M [IgM]', '2022-06-26 03:12:13', '2022-06-26 03:12:13'),
(183, 10, 6, 8, 27, 2, 5, 'Disp fx of shaft of third metacarpal bone, right hand', '2022-06-26 03:12:13', '2022-06-26 03:12:13'),
(184, 7, 8, 1, 27, 2, 1, 'Unspecified fracture of fourth cervical vertebra', '2022-06-26 03:12:13', '2022-06-26 03:12:13'),
(185, 5, 5, 4, 27, 10, 4, 'Contracture of muscle, unspecified lower leg', '2022-06-26 03:12:13', '2022-06-26 03:12:13'),
(186, 4, 9, 2, 16, 8, 7, 'Strain of flexor musc/fasc/tend finger at wrs/hnd lv', '2022-06-26 03:12:13', '2022-06-26 03:12:13'),
(187, 10, 10, 8, 3, 10, 5, 'Drug-induced gout, ankle and foot', '2022-06-26 03:12:13', '2022-06-26 03:12:13'),
(188, 3, 8, 4, 3, 4, 6, 'Other disorders of peritoneum', '2022-06-26 03:12:13', '2022-06-26 03:12:13'),
(189, 3, 11, 4, 3, 7, 3, 'Myopathy of extraocular muscles, left orbit', '2022-06-26 03:12:13', '2022-06-26 03:12:13'),
(190, 7, 10, 2, 29, 2, 6, 'Toxic effect of unsp halgn deriv of aromat hydrocrb, slf-hrm', '2022-06-26 03:12:13', '2022-06-26 03:12:13'),
(191, 2, 11, 3, 3, 6, 9, 'Corrosion of unsp deg mult sites of left wrs/hnd, init', '2022-06-26 03:12:13', '2022-06-26 03:12:13'),
(192, 1, 6, 7, 16, 8, 1, 'Burn of unspecified degree of right axilla, subs encntr', '2022-06-26 03:12:13', '2022-06-26 03:12:13'),
(193, 2, 5, 2, 29, 6, 3, 'External constriction of right wrist, initial encounter', '2022-06-26 03:12:13', '2022-06-26 03:12:13'),
(194, 8, 7, 5, 16, 2, 1, 'Displ oblique fx shaft of r fibula, 7thG', '2022-06-26 03:12:14', '2022-06-26 03:12:14'),
(195, 8, 5, 6, 43, 7, 1, 'Displ seg fx shaft of ulna, r arm, 7thC', '2022-06-26 03:12:14', '2022-06-26 03:12:14'),
(196, 10, 11, 10, 43, 10, 10, 'Sprain of other part of unspecified wrist and hand, sequela', '2022-06-26 03:12:14', '2022-06-26 03:12:14'),
(197, 1, 5, 6, 27, 3, 2, 'Myositis ossificans progressiva, unspecified arm', '2022-06-26 03:12:14', '2022-06-26 03:12:14'),
(198, 6, 8, 8, 3, 3, 3, 'Moderate laceration of unsp part of pancreas, subs encntr', '2022-06-26 03:12:14', '2022-06-26 03:12:14'),
(199, 9, 9, 5, 29, 10, 1, 'Underdosing of macrolides, subsequent encounter', '2022-06-26 03:12:14', '2022-06-26 03:12:14'),
(200, 10, 7, 7, 27, 9, 3, 'Oil rig as the place of occurrence of the external cause', '2022-06-26 03:12:14', '2022-06-26 03:12:14'),
(201, 3, 7, 4, 16, 5, 7, 'Crushing injury of right lower leg, sequela', '2022-06-26 03:12:14', '2022-06-26 03:12:14'),
(202, 3, 8, 2, 16, 6, 7, 'Displ oblique fx shaft of r rad, 7thD', '2022-06-26 03:12:14', '2022-06-26 03:12:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesas`
--

CREATE TABLE `mesas` (
  `id` int(11) NOT NULL,
  `codigo` varchar(5) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `fecha_alta` datetime NOT NULL,
  `fecha_modificacion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `mesas`
--

INSERT INTO `mesas` (`id`, `codigo`, `estado`, `fecha_alta`, `fecha_modificacion`) VALUES
(5, 'AFGT1', 'cerrada', '2022-06-12 08:56:17', '2022-06-25 04:47:32'),
(6, 'DA1DS', 'cerrada', '2022-06-12 08:57:13', '2022-06-12 08:57:13'),
(7, 'MGOE4', 'cerrada', '2022-06-12 08:59:16', '2022-06-12 08:59:16'),
(8, 'CO1R2', 'cerrada', '2022-06-12 08:59:26', '2022-06-25 04:09:51'),
(9, '1204U', 'cerrada', '2022-06-12 09:02:09', '2022-06-12 09:13:59'),
(10, '124CD', 'cerrada', '2022-06-17 05:44:13', '2022-06-17 05:44:13'),
(11, '123RR', 'cerrada', '2022-06-17 05:44:49', '2022-06-17 05:44:49');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `platos`
--

INSERT INTO `platos` (`id`, `nombre`, `descripcion`, `minutos_de_preparacion`, `precio`, `apto_veganos`, `fecha_alta`, `fecha_modificacion`) VALUES
(1, 'Lomo con ensalada', 'Bife de Lomo 200gr. con ensalada de tomate, lechuga, cebolla cruda, zanahoria, huevo.', 24, 1679, 'N', '2022-06-14 05:57:09', '2022-06-17 05:26:22'),
(8, 'Milanesa napolitana', 'Milanesa napolitana', 16, 1100.99, 'N', '2022-06-18 04:14:12', '2022-06-18 04:14:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `postres`
--

CREATE TABLE `postres` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `minutos_de_preparacion` int(11) NOT NULL,
  `precio` double NOT NULL,
  `apto_celiacos` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fecha_alta` datetime NOT NULL,
  `fecha_modificacion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `postres`
--

INSERT INTO `postres` (`id`, `nombre`, `descripcion`, `minutos_de_preparacion`, `precio`, `apto_celiacos`, `fecha_alta`, `fecha_modificacion`) VALUES
(1, 'Volcan Chocolate', 'Volcan de Chocolate hecho en el momento', 20, 890, 'Y', '2022-06-18 06:16:40', '2022-06-18 06:18:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tragos`
--

CREATE TABLE `tragos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `minutos_de_preparacion` int(11) NOT NULL,
  `precio` double NOT NULL,
  `mililitros` int(11) NOT NULL,
  `porcentaje_alcohol` double NOT NULL,
  `fecha_alta` datetime NOT NULL,
  `fecha_modificacion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `tragos`
--

INSERT INTO `tragos` (`id`, `nombre`, `descripcion`, `minutos_de_preparacion`, `precio`, `mililitros`, `porcentaje_alcohol`, `fecha_alta`, `fecha_modificacion`) VALUES
(1, 'Gin Tonic Absolute', 'Gin and Tonic con mix de absolute de limon', 6, 590, 250, 14.4, '2022-06-18 06:10:19', '2022-06-18 06:11:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `clave` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(50) NOT NULL,
  `perfil` varchar(30) NOT NULL,
  `empleado_id` int(11) DEFAULT NULL,
  `fecha_alta` datetime NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  `fecha_baja` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(61, 'AAA123', '$2y$10$95rdSh9ZeQQsuf.pi.Xur.5MNr6hORlH6/DcVtoHig7', 'test124@ghot.com', 'admin', NULL, '2022-06-26 18:25:17', '2022-06-26 18:25:17', NULL),
(66, 'GHILLO', '$2y$10$QTQvDLXPjC3PyPoBq7wsmeR6X120aYt08.XO.0IXvFf', 'gully_hillo@ghot.com', 'socio', 5, '2022-06-26 20:03:07', '2022-06-26 21:29:50', NULL),
(67, 'GHILLO142', '$2y$10$sxxlzcmC0s5ISfDpNXuY1eBtKxSwOaSxeGe5tyn57LSIvNaJ9.4ba', 'gully_hi213@ghot.com', 'mozo', NULL, '2022-06-27 00:04:12', '2022-06-27 00:04:12', NULL),
(68, 'ADMIN1', '$2y$10$2QTdo7G6y0Q6x0E/PfAlAe2VnM/aks9hcB1eVLEJU6.rACV9KnUda', 'admin123@ghot.com', 'admin', NULL, '2022-06-27 00:05:18', '2022-06-27 00:05:18', NULL),
(69, 'COCINERO1', '$2y$10$1oZyxUk41bNWFHHOJrilhuVEMyJav6a5VPzDItZelrpkWpAN778Sq', 'cocinero123@ghot.com', 'cocinero', 23, '2022-06-27 01:10:03', '2022-06-27 01:10:03', NULL),
(71, 'BARTENDER1', '$2y$10$mGNWifzoBbDDgvo04e2MZ.jv29xNc.cSQKvdaGzrGZlrXGLqb2Kw2', 'bartender123@ghot.com', 'bartender', 22, '2022-06-27 01:10:50', '2022-06-27 01:10:50', NULL),
(72, 'MOZO1', '$2y$10$R6qwAXblIqwcqm/UCYJ26ubrmRJ74ZFKsvqUjHaNDG0V4AGuAo2d.', 'mozo123@ghot.com', 'mozo', 21, '2022-06-27 01:11:32', '2022-06-27 01:11:32', NULL),
(73, 'CERVECERO1', '$2y$10$R81n2yWf9M6xeTGdglRIcOKfruqXil6mz4J/Wy5pdsKqsRgnKXXmW', 'cervecero123@ghot.com', 'cervecero', 20, '2022-06-27 01:12:07', '2022-06-27 01:12:07', NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
-- Indices de la tabla `bebidas`
--
ALTER TABLE `bebidas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cervezas`
--
ALTER TABLE `cervezas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `dni` (`dni`);

--
-- Indices de la tabla `encuestas`
--
ALTER TABLE `encuestas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mesa` (`mesa_id`),
  ADD KEY `mozo` (`mozo_id`);

--
-- Indices de la tabla `mesas`
--
ALTER TABLE `mesas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo` (`codigo`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `realizador` (`realizador_pago`);

--
-- Indices de la tabla `platos`
--
ALTER TABLE `platos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `postres`
--
ALTER TABLE `postres`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tragos`
--
ALTER TABLE `tragos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQUE usuario` (`usuario`) USING BTREE,
  ADD KEY `empleado_id` (`empleado_id`);

--
-- Indices de la tabla `vinos`
--
ALTER TABLE `vinos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bebidas`
--
ALTER TABLE `bebidas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `cervezas`
--
ALTER TABLE `cervezas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `encuestas`
--
ALTER TABLE `encuestas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=203;

--
-- AUTO_INCREMENT de la tabla `mesas`
--
ALTER TABLE `mesas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT de la tabla `platos`
--
ALTER TABLE `platos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `postres`
--
ALTER TABLE `postres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tragos`
--
ALTER TABLE `tragos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT de la tabla `vinos`
--
ALTER TABLE `vinos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `realizador` FOREIGN KEY (`realizador_pago`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `empleado_id` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
