-- phpMyAdmin SQL Dump
-- version 5.3.0-dev+20220626.78b2c1f4eb
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-06-2022 a las 03:04:38
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `encuestas`
--
ALTER TABLE `encuestas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mesa` (`mesa_id`),
  ADD KEY `mozo` (`mozo_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `encuestas`
--
ALTER TABLE `encuestas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=203;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `encuestas`
--
ALTER TABLE `encuestas`
  ADD CONSTRAINT `mesa` FOREIGN KEY (`mesa_id`) REFERENCES `mesas` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `mozo` FOREIGN KEY (`mozo_id`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



