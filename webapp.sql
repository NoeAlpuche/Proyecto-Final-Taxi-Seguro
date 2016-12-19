-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-12-2016 a las 17:01:52
-- Versión del servidor: 10.1.8-MariaDB
-- Versión de PHP: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `webapp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `idalumno` int(10) NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `direccion` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_chofer`
--

CREATE TABLE `cat_chofer` (
  `cve_chofer` int(5) NOT NULL,
  `nombre_chofer` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `apPaterno_chofer` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `apMaterno_chofer` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `foto_chofer` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cat_chofer`
--

INSERT INTO `cat_chofer` (`cve_chofer`, `nombre_chofer`, `apPaterno_chofer`, `apMaterno_chofer`, `foto_chofer`) VALUES
(12401, 'Yesenia Margely', 'Sánchez', 'Ek', ''),
(12402, 'Daniel Jesús', 'X', 'Alpuche', ''),
(12403, 'Rogelio', 'Solis', 'Hernandez', ''),
(12404, 'Reyna ', 'Sansores', 'Sansores', ''),
(12405, 'Alejandro ', 'Cardenas', 'Zapata', ''),
(12406, 'Naydel', 'Solis', 'Lima', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_socio`
--

CREATE TABLE `cat_socio` (
  `cve_socio` int(5) NOT NULL,
  `nombre_socio` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `apPaterno_socio` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `apMaterno_socio` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `foto_socio` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cat_socio`
--

INSERT INTO `cat_socio` (`cve_socio`, `nombre_socio`, `apPaterno_socio`, `apMaterno_socio`, `foto_socio`) VALUES
(12391, 'Benjamin ', 'Caamal', 'Poot', ''),
(12392, 'Rocio Elizabeth', 'Villanueva', 'Baeza', ''),
(12393, 'Luis Antonio', 'Sosa', 'Xix', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_taxi`
--

CREATE TABLE `cat_taxi` (
  `num_taxi` int(4) NOT NULL,
  `placa` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `modelo_taxi` varchar(20) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cat_taxi`
--

INSERT INTO `cat_taxi` (`num_taxi`, `placa`, `modelo_taxi`) VALUES
(67, '10-59-TRS', 'TSURU'),
(100, '56-13-TRW', 'ATOS'),
(240, '48-32-TRS', 'TSURU'),
(356, '78-34-TRW', 'ATOS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_usuario`
--

CREATE TABLE `cat_usuario` (
  `cve_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `apPaterno_usuario` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `apMaterno_usuario` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `correo` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `tipo_usuario` varchar(20) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cat_usuario`
--

INSERT INTO `cat_usuario` (`cve_usuario`, `nombre_usuario`, `apPaterno_usuario`, `apMaterno_usuario`, `correo`, `password`, `tipo_usuario`) VALUES
(1, 'Ricardo Jesus', 'May', 'Chale', 'ricardomay@hotmail.com', 'ricardomay', ''),
(2, 'Gloria ', 'Lopez', 'Contreras', 'gloria10@hotmail.com', 'gloria10', ''),
(3, 'david', 'may', 'chale', 'david@hotmail.com', 'david', ''),
(4, 'danai', '', '', '', '', ''),
(5, 'fre', '', 'hdf', '', '', ''),
(6, 'hdhdhd', 'hdhjdjd', '', '', '', ''),
(7, 'jfhfjd', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario`
--

CREATE TABLE `comentario` (
  `id` int(10) NOT NULL,
  `numerotaxi` int(10) NOT NULL,
  `calificacion` varchar(10) NOT NULL,
  `comentario` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `comentario`
--

INSERT INTO `comentario` (`id`, `numerotaxi`, `calificacion`, `comentario`) VALUES
(1, 1496, '5', 'Excelente servicio'),
(2, 1496, '4', 'buen servicio'),
(4, 0, 'muy', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datosgenerales`
--

CREATE TABLE `datosgenerales` (
  `num_taxi` int(4) NOT NULL,
  `cve_socio` int(5) NOT NULL,
  `cve_chofer` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `datosgenerales`
--

INSERT INTO `datosgenerales` (`num_taxi`, `cve_socio`, `cve_chofer`) VALUES
(240, 12391, 12401),
(100, 12392, 12402),
(240, 12391, 12403),
(240, 12391, 12404),
(356, 12392, 12405),
(67, 12393, 12406);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--

CREATE TABLE `historial` (
  `num_taxi` int(4) NOT NULL,
  `fecha_abordo` date NOT NULL,
  `hora_abordo` time NOT NULL,
  `hora_terminacion` time NOT NULL,
  `cve_chofer` int(5) NOT NULL,
  `punto_localizacion` varchar(255) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `id` int(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `dni` varchar(100) NOT NULL,
  `telefono` int(10) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`id`, `nombre`, `dni`, `telefono`, `email`) VALUES
(1, 'ricRdo', 'qwe', 2147483647, 'ricardo@hotmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id_product` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `description` varchar(500) CHARACTER SET utf8 NOT NULL,
  `category` varchar(100) CHARACTER SET utf8 NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id_product`, `name`, `description`, `category`, `price`) VALUES
(1, 'zapatos adidas', 'zapatos adidas de color gris', 'Deportes', 89),
(2, 'Zapatos de hombre', 'Zapatos de hombre de color negro para salir de fiesta.', 'Calzado', 90.23),
(3, 'Vestido rosa', 'Vestido para mujer de color Rosa.', 'Vestidos', 110.23),
(4, 'Vestido blanco', 'Vestido de color blanco.', 'Vestidos', 120),
(5, 'Sujetador rojo', 'Sujetador rojo para que tu novio se ponga a cien.', 'Ropa interior', 30.33),
(6, 'Tanga de mujer con pitufos', 'Tanga de mujer con pitufos para ir a la playa.', 'BaÃ±ador', 34.78),
(7, 'Gafas de sol', 'Gafas de sol de alta gama.', 'Complementos', 45),
(8, 'Gafas azules', 'Gafas de sol con cristales azules.', 'Complementos', 78.77),
(9, 'Ordenador portÃ¡til', 'Ordenador portÃ¡til', 'InformÃ¡tica', 350.21),
(10, 'Curso de PHP', 'Curso avanzado de PHP', 'ProgramaciÃ³n', 120),
(11, 'Curso de Javascript', 'Curso bÃ¡sico de Javascript', 'ProgramaciÃ³n', 90),
(12, 'Pulsera azul', 'Pulsera de color azul', 'Complementos', 10),
(13, 'Reloj de hombre', 'Reloj analÃ³gico de hombre', 'Complementos', 87.3),
(14, 'BalÃ³n de baloncesto', 'BalÃ³n de baloncesto profesional.', 'Deportes', 50),
(15, 'Pelota de tenÃ­s', 'Pack de 8 pelotas de tenÃ­s', 'Deportes', 33),
(16, 'Raqueta de tenis', 'Raqueta de tenis profesional', 'Deportes', 150),
(17, 'Curso de Python', 'Curso de Python avanzado.', 'ProgramaciÃ³n', 130.21),
(18, 'Reloj acuÃ¡tico', 'Reloj femenino acuÃ¡tico.', 'Complementos', 88.77),
(19, 'Memoria RAM 8GB', 'Memoria RAM 8GB', 'InformÃ¡tica', 100),
(20, 'Disco duro 250GB', 'Disco duro 250GB', 'InformÃ¡tica', 120),
(21, 'Curso de CSS', 'Curso de CSS bÃ¡sico', 'ProgramaciÃ³n', 60),
(22, 'Chaqueta de cuero masculina', 'Chaqueta de cuero masculina', 'Chaquetas', 200.23),
(23, 'Abrigo rosa', 'Abrigo de color rosa', 'Abrigos', 300),
(24, 'BalÃ³n de fÃºtbol', 'BalÃ³n de fÃºtbol', 'Deportes', 30),
(25, 'Camisa deportiva masculina', 'Camisa deportiva masculina.', 'Deportes', 20.99),
(26, 'Camisa deportiva femenina', 'Camisa deportiva femenina', 'Deportes', 21),
(27, 'MÃ³vil Android', 'MÃ³vil Android Ice Cream 4.0', 'MÃ³viles', 300),
(28, 'Torre ordenador', 'Torre ordenador 32GB de Memoria RAM y 300GB de disco duro.', 'InformÃ¡tica', 600);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `retrofit_users`
--

CREATE TABLE `retrofit_users` (
  `id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `id` int(10) NOT NULL,
  `num_taxi` int(4) NOT NULL,
  `numerotaxi` int(10) NOT NULL,
  `calificacion` int(2) NOT NULL,
  `comentario` varchar(255) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`id`, `num_taxi`, `numerotaxi`, `calificacion`, `comentario`) VALUES
(5, 67, 1496, 4, 'Buen servicio'),
(6, 67, 1496, 3, 'Servicio regular'),
(8, 67, 0, 5, ''),
(9, 67, 0, 5, ''),
(10, 67, 0, 5, ''),
(11, 67, 0, 3, ''),
(12, 67, 0, 4, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socio`
--

CREATE TABLE `socio` (
  `id` int(10) NOT NULL,
  `numerotaxi` int(10) NOT NULL,
  `nombresocio` varchar(255) NOT NULL,
  `password` varchar(25) NOT NULL,
  `edad` int(3) NOT NULL,
  `tiposocio` varchar(25) NOT NULL,
  `foto` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `socio`
--

INSERT INTO `socio` (`id`, `numerotaxi`, `nombresocio`, `password`, `edad`, `tiposocio`, `foto`) VALUES
(4, 250494, 'Ricardo Jesus May Chale', 'djrmayvluna2530', 23, 'administrador', ''),
(8, 1496, 'Fermi Duran', '1496', 22, 'socio', ''),
(9, 1496, 'Noe alpuche', 'noe1496', 22, 'conductor', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabulador`
--

CREATE TABLE `tabulador` (
  `id` int(10) NOT NULL,
  `origen` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `destino` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `costo` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tabulador`
--

INSERT INTO `tabulador` (`id`, `origen`, `destino`, `costo`) VALUES
(1, 'Centro', 'Centro', 16),
(2, 'Centro', 'Dina', 19),
(3, 'Centro', 'Fovissste 5 Etapa', 21),
(4, 'Centro', 'Clinica de la mujer', 27),
(5, 'Centro', 'Expofer', 33),
(6, 'Centro', 'Residencial Marsella', 28),
(7, 'Centro', 'Forjadores', 21),
(8, 'Centro', 'Jardines', 20),
(9, 'Centro', '8 Octubre', 19),
(10, 'Centro', 'Las casitas', 18),
(11, 'Centro', 'Lopez Mateos', 18),
(12, 'Centro', 'Proterritorio', 19),
(13, 'Centro', 'Solidaridad', 19),
(14, 'Centro', 'Magisterial', 20),
(15, 'Centro', 'Payo Obispo', 21),
(16, 'Centro', 'Lagunitas los monos', 22),
(17, 'Centro', 'Nuevo Progreso', 22),
(18, 'Centro', 'Lazaro Cardenas', 21),
(19, 'Centro', 'Arboledas', 21),
(20, 'Centro', 'Santa Maria', 26),
(21, 'Centro', 'Caribe', 22),
(22, 'Centro', 'Las Americas 1 y 2', 25),
(23, 'Centro', 'Las Americas 3 y 4 ', 27),
(24, 'Centro', 'Pacto Obrero', 28),
(25, 'Centro', 'Calderitas', 36),
(26, 'Dina', 'Centro', 19),
(27, 'Dina', 'Dina', 16),
(28, 'Dina', 'Fovisste 5 etapa', 18),
(29, 'Dina', 'Clinica de la mujer', 23),
(30, 'Dina', 'Expofer', 27),
(31, 'Dina', 'Residencial Marsella', 25),
(32, 'Dina', 'Forjadores', 22),
(33, 'Dina', 'Jardines', 21),
(34, 'Dina', '8 de Octubre', 20),
(35, 'Dina', 'Las Casitas', 19),
(36, 'Dina', 'Lopez Mateos', 20),
(37, 'Dina', '5 de Abril', 22),
(38, 'Dina', 'Proterritorio', 23),
(39, 'Dina', 'Solidaridad', 21),
(40, 'Dina', 'Magisterial', 22),
(41, 'Dina', 'Payo Obispo', 23),
(42, 'Dina', 'Lagunitas los monos', 24),
(43, 'Dina', 'Nuevo Progreso', 25),
(44, 'Dina', 'Lazaro Cardenas', 23),
(45, 'Dina', 'Arboledas', 25),
(46, 'Dina', 'Santa Maria', 28),
(47, 'Dina', 'Caribe', 25),
(48, 'Dina', 'Las Americas 1 y 2', 27),
(49, 'Dina ', 'Las Americas 3 y 4', 29),
(50, 'Dina', 'Pacto Obrero', 32),
(51, 'Dina', 'Calderitas', 38),
(52, 'Fovissste 5 Etapa', 'Centro', 21),
(53, 'Fovissste 5 Etapa', 'Dina', 18),
(54, 'Fovissste 5 Etapa', 'Fovissste 5 Etapa', 16),
(55, 'Fovissste 5 Etapa', 'Clinica de la mujer', 20),
(56, 'Fovissste 5 Etapa', 'Expofer', 25),
(57, 'Fovissste 5 Etapa', 'Residencial Marsella', 27),
(58, 'Fovissste 5 Etapa', 'Forjadores ', 24),
(59, 'Fovissste 5 Etapa', 'Jardines', 23),
(60, 'Fovissste 5 Etapa', '8 de Octubre', 22),
(61, 'Fovissste 5 Etapa', 'Las casitas', 21),
(62, 'Fovissste 5 Etapa', 'Lopez Mateos', 22),
(63, 'Fovissste 5 Etapa', '5 de Abril', 25),
(64, 'Fovissste 5 Etapa', 'Proterritorio', 25),
(65, 'Fovissste 5 Etapa', 'Solidaridad', 24),
(66, 'Fovissste 5 Etapa', 'Magisterial', 23),
(67, 'Fovissste 5 Etapa', 'Payo Obispo', 24),
(68, 'Fovissste 5 Etapa', 'Lagunitas los monos', 25),
(69, 'Fovissste 5 Etapa', 'Nuevo Progreso', 26),
(70, 'Fovissste 5 Etapa', 'Lazaro Cardenas', 25),
(71, 'Fovissste 5 Etapa', 'Arboledas', 26),
(72, 'Fovissste 5 Etapa', 'Santa Maria', 31),
(73, 'Fovissste 5 Etapa', 'Caribe', 26),
(74, 'Fovissste 5 Etapa', 'Las Americas 1 y 2', 28),
(75, 'Fovissste 5 Etapa', 'Las Americas 3 y 4 ', 30),
(76, 'Fovissste 5 Etapa', 'Pacto Obrero', 34),
(77, 'Fovissste 5 Etapa', 'Calderitas', 40),
(78, 'Clinica de la mujer', 'Centro', 27),
(79, 'Clinica de la mujer', 'Dina', 23),
(80, 'Clinica de la mujer', 'Fovissste 5 Etapa', 20),
(81, 'Clinica de la mujer', 'Clinica de la mujer', 16),
(82, 'Clinica de la mujer', 'Expofer', 20),
(83, 'Clinica de la mujer', 'Residencial Marsella', 22),
(84, 'Clinica de la mujer', 'Forjadores', 25),
(85, 'Clinica de la mujer', 'Jardines', 28),
(86, 'Clinica de la mujer', '8 de Octubre', 27),
(87, 'Clinica de la mujer', 'Las casitas', 27),
(88, 'Clinica de la mujer', 'Lopez Mateos', 28),
(89, 'Clinica de la mujer', '5 de Abril', 30),
(90, 'Clinica de la mujer', 'Proterritorio', 29),
(91, 'Clinica de la mujer', 'Solidaridad', 28),
(92, 'Clinica de la mujer', 'Magisterial', 28),
(93, 'Clinica de la mujer', 'Payo Obispo', 29),
(94, 'Clinica de la mujer', 'Lagunitas los monos', 25),
(95, 'Clinica de la mujer', 'Nuevo Progreso', 30),
(96, 'Clinica de la mujer', 'Lazaro Cardenas', 30),
(97, 'Clinica de la mujer', 'Arboledas', 30),
(98, 'Clinica de la mujer', 'Santa Maria', 35),
(99, 'Clinica de la mujer', 'Caribe', 30),
(100, 'Clinica de la mujer', 'Las Americas 1 y 2', 32),
(101, 'Clinica de la mujer', 'Las Americas 3 y 4', 34),
(102, 'Clinica de la mujer', 'Pacto Obrero', 39),
(103, 'Clinica de la mujer', 'Calderitas', 45),
(104, 'Expofer', 'Centro', 33),
(105, 'Expofer', 'Dina', 27),
(106, 'Expofer', 'Fovissste 5 Etapa', 25),
(107, 'Expofer', 'Clinica de la Mujer', 20),
(108, 'Expofer', 'Expofer', 16),
(109, 'Expofer', 'Residencial Marsella', 19),
(110, 'Expofer', 'Forjadores', 24),
(111, 'Expofer', 'Jardines', 28),
(112, 'Expofer', '8 de Octubre', 30),
(113, 'Expofer', 'Las casitas', 32),
(114, 'Expofer', 'Lopez Mateos', 33),
(115, 'Expofer', '5 de Abril', 35),
(116, 'Expofer', 'Proterritorio', 33),
(117, 'Expofer', 'Solidaridad', 33),
(118, 'Expofer', 'Magisterial', 30),
(119, 'Expofer', 'Payo Obispo', 28),
(120, 'Expofer', 'Lagunitas los monos', 25),
(121, 'Expofer', 'Nuevo Progreso', 30),
(122, 'Expofer', 'Lazaro Cardenas', 30),
(123, 'Expofer', 'Arboledas', 34),
(124, 'Expofer', 'Santa Maria', 40),
(125, 'Expofer', 'Caribe', 33),
(126, 'Expofer', 'Las Americas 1 y 2', 35),
(127, 'Expofer', 'Las Americas 3 y 4', 37),
(128, 'Expofer', 'Pacto Obrero', 43),
(129, 'Expofer', 'Calderitas', 50),
(130, 'Residencial Marsella', 'Centro', 28),
(131, 'Residencial Marsella', 'Dina', 25),
(132, 'Residencial Marsella', 'Fovissste 5 Etapa', 27),
(133, 'Residencial Marsella', 'Clinica de la Mujer', 22),
(134, 'Residencial Marsella', 'Expofer', 19),
(135, 'Residencial Marsella', 'Residencial Marsella', 16),
(136, 'Residencial Marsella', 'Forjadores', 20),
(137, 'Residencial Marsella', 'Jardines', 22),
(138, 'Residencial Marsella', '8 de Octubre', 24),
(139, 'Residencial Marsella', 'Las casitas', 26),
(140, 'Residencial Marsella', 'Lopez Mateos', 28),
(141, 'Residencial Marsella', '5 de Abril', 30),
(142, 'Residencial Marsella', 'Proterritorio', 28),
(143, 'Residencial Marsella', 'Solidaridad', 26),
(144, 'Residencial Marsella', 'Magisterial', 24),
(145, 'Residencial Marsella', 'Payo Obispo', 22),
(146, 'Residencial Marsella', 'Lagunitas los monos', 20),
(147, 'Residencial Marsella', 'Nuevo Progreso', 23),
(148, 'Residencial Marsella', 'Lazaro Cardenas', 26),
(149, 'Residencial Marsella', 'Arboledas', 30),
(150, 'Residencial Marsella', 'Santa Maria', 35),
(151, 'Residencial Marsella', 'Caribe', 28),
(152, 'Residencial Marsella', 'Las Americas 1 y 2', 33),
(153, 'Residencial Marsella', 'Las Americas  3 y 4', 35),
(154, 'Residencial Marsella', 'Pacto Obrero', 37),
(155, 'Residencial Marsella', 'Calderitas', 45),
(156, 'Forjadores', 'Centro', 21),
(157, 'Forjadores', 'Dina', 22),
(158, 'Forjadores', 'Fovissste 5 Etapa', 24),
(159, 'Forjadores', 'Clinica de la Mujer', 25),
(160, 'Forjadores', 'Expofer', 24),
(161, 'Forjadores', 'Residencial Marsella', 20),
(162, 'Forjadores', 'Forjadores', 16),
(163, 'Forjadores', 'Jardines', 18),
(164, 'Forjadores', '8 de Octubre', 19),
(165, 'Forjadores', 'Las casitas', 20),
(166, 'Forjadores', 'Lopez Mateos', 21),
(167, 'Forjadores', '5 de Abril', 23),
(168, 'Forjadores', 'Proterritorio', 21),
(169, 'Forjadores', 'Solidaridad', 20),
(170, 'Forjadores', 'Magisterial', 19),
(171, 'Forjadores', 'Payo Obispo', 18),
(172, 'Forjadores', 'Lagunitas los monos', 18),
(173, 'Forjadores', 'Nuevo Progreso', 19),
(174, 'Forjadores', 'Lazaro Cardenas', 21),
(175, 'Forjadores', 'Arboledas', 23),
(176, 'Forjadores', 'Santa Maria', 30),
(177, 'Forjadores', 'Caribe', 22),
(178, 'Forjadores', 'Las Americas 1 y 2', 25),
(179, 'Forjadores', 'Las Americas 3 y 4', 27),
(180, 'Forjadores', 'Pacto Obrero', 34),
(181, 'Forjadores', 'Calderitas', 41),
(182, 'Jardines', 'Centro', 20),
(183, 'Jardines', 'Dina', 21),
(184, 'Jardines', 'Fovissste 5 Etapa', 23),
(185, 'Jardines', 'Clinica de la Mujer', 28),
(186, 'Jardines', 'Expofer', 28),
(187, 'Jardines', 'Residencial Marsella', 22),
(188, 'Jardines', 'Forjadores', 18),
(189, 'Jardines', 'Jardines', 16),
(190, 'Jardines', '8 de Octubre', 18),
(191, 'Jardines', 'Las casitas', 19),
(192, 'Jardines', 'Lopez Mateos', 20),
(193, 'Jardines', '5 de Abril', 21),
(194, 'Jardines', 'Proterritorio', 21),
(195, 'Jardines', 'Solidaridad', 19),
(196, 'Jardines', 'Magisterial', 18),
(197, 'Jardines', 'Payo Obispo', 18),
(198, 'Jardines', 'Lagunitas los monos', 18),
(199, 'Jardines', 'Nuevo Progreso', 19),
(200, 'Jardines', 'Lazaro Cardenas', 20),
(201, 'Jardines', 'Arboledas', 22),
(202, 'Jardines', 'Santa Maria', 28),
(203, 'Jardines', 'Caribe', 22),
(204, 'Jardines', 'Las Americas 1 y 2', 24),
(205, 'Jardines', 'Las Americas 3 y 4', 26),
(206, 'Jardines', 'Pacto Obrero', 30),
(207, 'Jardines', 'Calderitas', 38),
(208, '8 de Octubre', 'Centro', 19),
(209, '8 de Octubre', 'Dina', 20),
(210, '8 de Octubre', 'Fovissste 5 Etapa', 22),
(211, '8 de Octubre', 'Clinica de la Mujer', 27),
(212, '8 de Octubre', 'Expofer', 30),
(213, '8 de Octubre', 'Residencial Marsella', 24),
(214, '8 de Octubre', 'Forjadores', 19),
(215, '8 de Octubre', 'Jardines', 18),
(216, '8 de Octubre', '8 de Octubre', 16),
(217, '8 de Octubre', 'Las casitas', 18),
(218, '8 de Octubre', 'Lopez Mateos', 19),
(219, '8 de Octubre', '5 de Abril', 20),
(220, '8 de Octubre', 'Proterritorio', 19),
(221, '8 de Octubre', 'Solidaridad', 18),
(222, '8 de Octubre', 'Magisterial', 18),
(223, '8 de Octubre', 'Payo Obispo', 18),
(224, '8 de Octubre', 'Lagunitas los monos', 19),
(225, '8 de Octubre', 'Nuevo Progreso', 19),
(226, '8 de Octubre', 'Lazaro Cardenas', 19),
(227, '8 de Octubre', 'Arboledas', 20),
(228, '8 de Octubre', 'Santa Maria', 27),
(229, '8 de Octubre', 'Caribe', 21),
(230, '8 de Octubre', 'Las Americas 1 y 2', 23),
(231, '8 de Octubre', 'Las Americas 3 y 4', 25),
(232, '8 de Octubre', 'Pacto Obrero', 29),
(233, '8 de Octubre', 'Calderitas', 37),
(234, 'Las casitas', 'Centro', 18),
(235, 'Las casitas', 'Dina', 19),
(236, 'Las casitas', 'Fovissste 5 Etapa', 21),
(237, 'Las casitas', 'Clinica de la Mujer', 27),
(238, 'Las casitas', 'Expofer', 32),
(239, 'Las casitas', 'Residencial Marsella', 26),
(240, 'Las casitas', 'Forjadores', 20),
(241, 'Las casitas', 'Jardines', 19),
(242, 'Las casitas', '8 de Octubre', 18),
(243, 'Las casitas', 'Las casitas', 16),
(244, 'Las casitas', 'Lopez Mateos', 18),
(245, 'Las casitas', '5 de Abril', 19),
(246, 'Las casitas', 'Proterritorio', 19),
(247, 'Las casitas', 'Solidaridad', 18),
(248, 'Las casitas', 'Magisterial', 19),
(249, 'Las casitas', 'Payo Obispo', 20),
(250, 'Las casitas', 'Lagunitas los monos', 21),
(251, 'Las casitas', 'Nuevo Progreso', 20),
(252, 'Las casitas', 'Lazaro Cardenas', 19),
(253, 'Las casitas', 'Arboledas', 20),
(254, 'Las casitas', 'Santa Maria', 25),
(255, 'Las casitas', 'Caribe', 20),
(256, 'Las casitas', 'Las Americas 1 y 2', 22),
(257, 'Las casitas', 'Las Americas 3 y 4', 24),
(258, 'Las casitas', 'Pacto Obrero', 28),
(259, 'Las casitas', 'Calderitas', 35),
(260, 'Lopez Mateos', 'Centro', 18),
(261, 'Lopez Mateos', 'Dina', 20),
(262, 'Lopez Mateos', 'Fovissste 5 Etapa', 22),
(263, 'Lopez Mateos', 'Clinica de la Mujer', 28),
(264, 'Lopez Mateos', 'Expofer', 33),
(265, 'Lopez Mateos', 'Residencial Marsella', 28),
(266, 'Lopez Mateos', 'Forjadores', 21),
(267, 'Lopez Mateos', 'Jardines', 20),
(268, 'Lopez Mateos', '8 de Octubre', 19),
(269, 'Lopez Mateos', 'Las casitas', 18),
(270, 'Lopez Mateos', 'Lopez Mateos', 16),
(271, 'Lopez Mateos', '5 de Abril', 18),
(272, 'Lopez Mateos', 'Proterritorio', 18),
(273, 'Lopez Mateos', 'Solidaridad', 18),
(274, 'Lopez Mateos', 'Magisterial', 19),
(275, 'Lopez Mateos', 'Payo Obispo', 20),
(276, 'Lopez Mateos', 'Lagunitas los monos', 22),
(277, 'Lopez Mateos', 'Nuevo Progreso', 21),
(278, 'Lopez Mateos', 'Lazaro Cardenas', 20),
(279, 'Lopez Mateos', 'Arboledas', 19),
(280, 'Lopez Mateos', 'Santa Maria', 24),
(281, 'Lopez Mateos', 'Caribe', 21),
(282, 'Lopez Mateos', 'Las Americas 1 y 2', 23),
(283, 'Lopez Mateos', 'Las Americas 3 y 4', 25),
(284, 'Lopez Mateos', 'Pacto Obrero', 26),
(285, 'Lopez Mateos', 'Calderitas', 33),
(286, '5 de Abril', 'Centro', 19),
(287, '5 de Abril', 'Dina', 22),
(288, '5 de Abril', 'Fovissste 5 Etapa', 25),
(289, '5 de Abril', 'Clinica de la Mujer', 30),
(290, '5 de Abril', 'Expofer', 35),
(291, '5 de Abril', 'Residencial Marsella', 30),
(292, '5 de Abril', 'Forjadores', 23),
(293, '5 de Abril', 'Jardines', 21),
(294, '5 de Abril', '8 de Octubre', 20),
(295, '5 de Abril', 'Las casitas', 19),
(296, '5 de Abril', 'Lopez Mateos', 18),
(297, '5 de Abril', '5 de Abril', 16),
(298, '5 de Abril', 'Proterritorio', 18),
(299, '5 de Abril', 'Solidaridad', 19),
(300, '5 de Abril', 'Magisterial', 20),
(301, '5 de Abril', 'Payo Obispo', 21),
(302, '5 de Abril', 'Lagunitas los monos', 23),
(303, '5 de Abril', 'Nuevo Progreso', 21),
(304, '5 de Abril', 'Lazaro Cardenas', 19),
(305, '5 de Abril', 'Arboledas', 18),
(306, '5 de Abril', 'Santa Maria', 22),
(307, '5 de Abril', 'Caribe', 21),
(308, '5 de Abril', 'Las Americas 1 y 2', 23),
(309, '5 de Abril', 'Las Americas 3 y 4', 25),
(310, '5 de Abril', 'Pacto Obrero', 24),
(311, '5 de Abril', 'Calderitas', 30),
(312, 'Proterritorio', 'Centro', 19),
(313, 'Proterritorio', 'Dina', 23),
(314, 'Proterritorio', 'Fovissste 5 Etapa', 25),
(315, 'Proterritorio', 'Clinica de la Mujer', 29),
(316, 'Proterritorio', 'Expofer', 33),
(317, 'Proterritorio', 'Residencial Marsella', 28),
(318, 'Proterritorio', 'Forjadores', 21),
(319, 'Proterritorio', 'Jardines', 21),
(320, 'Proterritorio', 'Centro', 19),
(321, 'Proterritorio', 'Dina', 23),
(322, 'Proterritorio', 'Fovissste 5 Etapa', 25),
(323, 'Proterritorio', 'Clinica de la Mujer', 29),
(324, 'Proterritorio', 'Expofer', 33),
(325, 'Proterritorio', 'Residencial Marsella', 28),
(326, 'Proterritorio', 'Forjadores', 21),
(327, 'Proterritorio', 'Jardines', 21),
(328, 'Proterritorio', '8 de Octubre', 19),
(329, 'Proterritorio', 'Las casitas', 19),
(330, 'Proterritorio', 'Lopez Mateos', 18),
(331, 'Proterritorio', '5 de Abril', 18),
(332, 'Proterritorio', 'Proterritorio', 16),
(333, 'Proterritorio', 'Solidaridad', 18),
(334, 'Proterritorio', 'Magisterial', 19),
(335, 'Proterritorio', 'Payo Obispo', 20),
(336, 'Proterritorio', 'Lagnitas los monos', 21),
(337, 'Proterritorio', 'Nuevo Progreso', 20),
(338, 'Proterritorio', 'Lazaro Cardenas', 19),
(339, 'Proterritorio', 'Arboledas', 18),
(340, 'Proterritorio', 'Santa Maria', 22),
(341, 'Proterritorio', 'Caribe', 20),
(342, 'Proterritorio', 'Las Americas 1 y 2', 22),
(343, 'Proterritorio', 'Las Americas 3 y 4', 24),
(344, 'Proterritorio', 'Pacto Obrero', 24),
(345, 'Proterritorio', 'Calderitas', 29),
(346, 'Solidaridad', 'Centro', 19),
(347, 'Solidaridad', 'Dina', 21),
(348, 'Solidaridad', 'Fovissste 5 Etapa', 24),
(349, 'Solidaridad', 'Clinica de la Mujer', 28),
(350, 'Solidaridad', 'Expofer', 33),
(351, 'Solidaridad', 'Residencial Marsella', 26),
(352, 'Solidaridad', 'Forjadores', 20),
(353, 'Solidaridad', 'Jardines', 19),
(354, 'Solidaridad', '8 de Octubre', 18),
(355, 'Solidaridad', 'Las casitas', 18),
(356, 'Solidaridad', 'Lopez Mateos', 18),
(357, 'Solidaridad', '5 de Abril', 19),
(358, 'Solidaridad', 'Proterritorio', 18),
(359, 'Solidaridad', 'Solidaridad', 16),
(360, 'Solidaridad', 'Magisterial', 18),
(361, 'Solidaridad', 'Payo Obispo', 19),
(362, 'Solidaridad', 'Lagunitas los monos', 20),
(363, 'Solidaridad', 'Nuevo Progreso', 19),
(364, 'Solidaridad', 'Lazaro Cardenas', 18),
(365, 'Solidaridad', 'Arboledas', 18),
(366, 'Solidaridad', 'Santa Maria', 24),
(367, 'Solidaridad', 'Caribe', 19),
(368, 'Solidaridad', 'Las Americas 1 y 2', 21),
(369, 'Solidaridad', 'Las Americas 3 y 4', 23),
(370, 'Solidaridad', 'Pacto Obrero', 27),
(371, 'Solidaridad', 'Calderitas', 32),
(372, 'Magisterial', 'Centro', 20),
(373, 'Magisterial', 'Dina', 22),
(374, 'Magisterial', 'Fovissste 5 Etapa', 23),
(375, 'Magisterial', 'Clinica de la Mujer', 28),
(376, 'Magisterial', 'Expofer', 30),
(377, 'Magisterial', 'Residencial Marsella', 24),
(378, 'Magisterial', 'Forjadores', 19),
(379, 'Magisterial', 'Jardines', 18),
(380, 'Magisterial', '8 de Octubre', 18),
(381, 'Magisterial', 'Las casitas', 19),
(382, 'Magisterial', 'Lopez Mateos', 19),
(383, 'Magisterial', '5 de Abril', 20),
(384, 'Magisterial', 'Proterritorio', 19),
(385, 'Magisterial', 'Solidaridad', 18),
(386, 'Magisterial', 'Magisterial', 16),
(387, 'Magisterial', 'Payo Obispo', 18),
(388, 'Magisterial', 'Lagunitas los monos', 19),
(389, 'Magisterial', 'Nuevo Progreso', 18),
(390, 'Magisterial', 'Lazaro Cardenas', 18),
(391, 'Magisterial', 'Arboledas', 19),
(392, 'Magisterial', 'Santa Maria', 26),
(393, 'Magisterial', 'Caribe', 19),
(394, 'Magisterial', 'Las Americas 1 y 2', 21),
(395, 'Magisterial', 'Las Americas 3 y 4', 23),
(396, 'Magisterial', 'Pacto Obrero', 28),
(397, 'Magisterial', 'Calderitas', 34),
(398, 'Payo Obispo', 'Centro', 21),
(399, 'Payo Obispo', 'Dina', 23),
(400, 'Payo Obispo', 'Fovissste 5 Etapa', 24),
(401, 'Payo Obispo', 'Clinica de la Mujer', 29),
(402, 'Payo Obispo', 'Expofer', 28),
(403, 'Payo Obispo', 'Residencial Marsella', 22),
(404, 'Payo Obispo', 'Forjadores', 18),
(405, 'Payo Obispo', 'Jardines', 18),
(406, 'Payo Obispo', '8 de Octubre', 18),
(407, 'Payo Obispo', 'Las casitas', 20),
(408, 'Payo Obispo', 'Lopez Mateos', 20),
(409, 'Payo Obispo', '5 de Abril', 21),
(410, 'Payo Obispo', 'Proterritorio', 20),
(411, 'Payo Obispo', 'Solidaridad', 19),
(412, 'Payo Obispo', 'Magisterial', 18),
(413, 'Payo Obispo', 'Payo Obispo', 16),
(414, 'Payo Obispo', 'Lagunitas los monos', 18),
(415, 'Payo Obispo', 'Nuevo Progreso', 18),
(416, 'Payo Obispo', 'Lazaro Cardenas', 19),
(417, 'Payo Obispo', 'Arboledas', 20),
(418, 'Payo Obispo', 'Santa Maria', 28),
(419, 'Payo Obispo', 'Caribe', 20),
(420, 'Payo Obispo', 'Las Americas 1 y 2', 22),
(421, 'Payo Obispo', 'Las Americas 3 y 4', 24),
(422, 'Payo Obispo', 'Pacto Obrero', 29),
(423, 'Payo Obispo', 'Calderitas', 36),
(424, 'Lagunitas los monos', 'Centro', 22),
(425, 'Lagunitas los monos', 'Dina', 24),
(426, 'Lagunitas los monos', 'Fovissste 5 Etapa', 25),
(427, 'Lagunitas los monos', 'Clinica de la Mujer', 25),
(428, 'Lagunitas los monos', 'Expofer', 25),
(429, 'Lagunitas los monos', 'Residencial Marsella', 20),
(430, 'Lagunitas los monos', 'Forjadores', 18),
(431, 'Lagunitas los monos', 'Jardines', 18),
(432, 'Lagunitas los monos', '8 de Octubre', 19),
(433, 'Lagunitas los monos', 'Las casitas', 21),
(434, 'Lagunitas los monos', 'Lopez Mateos', 22),
(435, 'Lagunitas los monos', '5 de Abril', 23),
(436, 'Lagunitas los monos', 'Proterritorio', 21),
(437, 'Lagunitas los monos', 'Solidaridad', 20),
(438, 'Lagunitas los monos', 'Magisterial', 19),
(439, 'Lagunitas los monos', 'Payo Obispo', 18),
(440, 'Lagunitas los monos', 'Lagunitas los monos', 16),
(441, 'Lagunitas los monos', 'Nuevo Progreso', 18),
(442, 'Lagunitas los monos', 'Lazaro Cardenas', 21),
(443, 'Lagunitas los monos', 'Arboledas', 22),
(444, 'Lagunitas los monos', 'Santa Maria', 30),
(445, 'Lagunitas los monos', 'Caribe', 22),
(446, 'Lagunitas los monos', 'Las Americas 1 y 2', 24),
(447, 'Lagunitas los monos', 'Las Americas 3 y 4', 26),
(448, 'Lagunitas los monos', 'Pacto Obrero', 34),
(449, 'Lagunitas los monos', 'Calderitas', 41),
(450, 'Nuevo Progreso', 'Centro', 22),
(451, 'Nuevo Progreso', 'Dina', 25),
(452, 'Nuevo Progreso', 'Fovissste 5 Etapa', 26),
(453, 'Nuevo Progreso', 'Clinica de la Mujer', 30),
(454, 'Nuevo Progreso', 'Expofer', 30),
(455, 'Nuevo Progreso', 'Residencial Marsella', 23),
(456, 'Nuevo Progreso', 'Forjadores', 19),
(457, 'Nuevo Progreso', 'Jardines', 19),
(458, 'Nuevo Progreso', '8 de Octubre', 19),
(459, 'Nuevo Progreso', 'Las casitas', 20),
(460, 'Nuevo Progreso', 'Lopez Mateos', 21),
(461, 'Nuevo Progreso', '5 de Abril', 21),
(462, 'Nuevo Progreso', 'Proterritorio', 20),
(463, 'Nuevo Progreso', 'Solidaridad', 19),
(464, 'Nuevo Progreso', 'Magisterial', 18),
(465, 'Nuevo Progreso', 'Payo Obispo', 18),
(466, 'Nuevo Progreso', 'Lagunitas los monos', 18),
(467, 'Nuevo Progreso', 'Nuevo Progreso', 16),
(468, 'Nuevo Progreso', 'Lazaro Cardenas', 18),
(469, 'Nuevo Progreso', 'Arboledas', 20),
(470, 'Nuevo Progreso', 'Santa Maria', 27),
(471, 'Nuevo Progreso', 'Caribe', 19),
(472, 'Nuevo Progreso', 'Las Americas 1 y 2', 21),
(473, 'Nuevo Progreso', 'Las Americas 3 y 4', 23),
(474, 'Nuevo Progreso', 'Pacto Obrero', 29),
(475, 'Nuevo Progreso', 'Calderitas', 35),
(476, 'Lazaro Cardenas', 'Centro', 21),
(477, 'Lazaro Cardenas', 'Dina', 23),
(478, 'Lazaro Cardenas', 'Fovissste 5 Etapa', 25),
(479, 'Lazaro Cardenas', 'Clinica de la Mujer', 30),
(480, 'Lazaro Cardenas', 'Expofer', 30),
(481, 'Lazaro Cardenas', 'Residencial Marsella', 26),
(482, 'Lazaro Cardenas', 'Forjadores', 21),
(483, 'Lazaro Cardenas', 'Jardines', 20),
(484, 'Lazaro Cardenas', '8 de Octubre', 19),
(485, 'Lazaro Cardenas', 'Las casitas', 19),
(486, 'Lazaro Cardenas', 'Lopez Mateos', 20),
(487, 'Lazaro Cardenas', '5 de Abril', 19),
(488, 'Lazaro Cardenas', 'Proterritorio', 19),
(489, 'Lazaro Cardenas', 'Solidaridad', 18),
(490, 'Lazaro Cardenas', 'Magisterial', 18),
(491, 'Lazaro Cardenas', 'Payo Obispo', 19),
(492, 'Lazaro Cardenas', 'Lagunitas los monos', 21),
(493, 'Lazaro Cardenas', 'Nuevo Progreso', 18),
(494, 'Lazaro Cardenas', 'Lazaro Cardenas', 16),
(495, 'Lazaro Cardenas', 'Arboledas', 18),
(496, 'Lazaro Cardenas', 'Santa Maria', 23),
(497, 'Lazaro Cardenas', 'Caribe', 18),
(498, 'Lazaro Cardenas', 'Las Americas 1 y 2', 20),
(499, 'Lazaro Cardenas', 'Las Americas 3 y 4', 22),
(500, 'Lazaro Cardenas', 'Pacto Obrero', 26),
(501, 'Lazaro Cardenas', 'Calderitas', 30),
(502, 'Arboledas', 'Centro', 21),
(503, 'Arboledas', 'Dina', 25),
(504, 'Arboledas', 'Fovissste 5 Etapa', 26),
(505, 'Arboledas', 'Clinica de la Mujer', 30),
(506, 'Arboledas', 'Expofer', 34),
(507, 'Arboledas', 'Residencial Marsella', 30),
(508, 'Arboledas', 'Forjadores', 23),
(509, 'Arboledas', 'Jardines', 22),
(510, 'Arboledas', '8 de Octubre', 20),
(511, 'Arboledas', 'Las casitas', 20),
(512, 'Arboledas', 'Lopez Mateos', 19),
(513, 'Arboledas', '5 de Abril', 18),
(514, 'Arboledas', 'Proterritorio', 18),
(515, 'Arboledas', 'Solidaridad', 18),
(516, 'Arboledas', 'Magisterial', 19),
(517, 'Arboledas', 'Payo Obispo', 20),
(518, 'Arboledas', 'Lagunitas los monos', 22),
(519, 'Arboledas', 'Nuevo Progreso', 20),
(520, 'Arboledas', 'Lazaro Cardenas', 18),
(521, 'Arboledas', 'Arboledas', 16),
(522, 'Arboledas', 'Santa Maria', 21),
(523, 'Arboledas', 'Caribe', 19),
(524, 'Arboledas', 'Las Americas 1 y 2', 20),
(525, 'Arboledas', 'Las Americas 3 y 4', 22),
(526, 'Arboledas', 'Pacto Obrero', 23),
(527, 'Arboledas', 'Calderitas', 27),
(528, 'Santa Maria', 'Centro', 26),
(529, 'Santa Maria', 'Dina', 28),
(530, 'Santa Maria', 'Fovissste 5 Etapa', 31),
(531, 'Santa Maria', 'Clinica de la Mujer', 35),
(532, 'Santa Maria', 'Expofer', 40),
(533, 'Santa Maria', 'Residencial Marsella', 35),
(534, 'Santa Maria', 'Forjadores', 30),
(535, 'Santa Maria', 'Jardines', 28),
(536, 'Santa Maria', '8 de Octubre', 27),
(537, 'Santa Maria', 'Las casitas', 25),
(538, 'Santa Maria', 'Lopez Mateos', 24),
(539, 'Santa Maria', '5 de Abril', 22),
(540, 'Santa Maria', 'Proterritorio', 22),
(541, 'Santa Maria', 'Solidaridad', 24),
(542, 'Santa Maria', 'Magisterial', 26),
(543, 'Santa Maria', 'Payo Obispo', 28),
(544, 'Santa Maria', 'Lagunitas los monos', 30),
(545, 'Santa Maria', 'Nuevo Progreso', 27),
(546, 'Santa Maria', 'Lazaro Cardenas', 23),
(547, 'Santa Maria', 'Arboledas', 21),
(548, 'Santa Maria', 'Santa Maria', 16),
(549, 'Santa Maria', 'Caribe', 24),
(550, 'Santa Maria', 'Las Americas 1 y 2', 22),
(551, 'Santa Maria', 'Las Americas 3 y 4', 24),
(552, 'Santa Maria', 'Pacto Obrero', 18),
(553, 'Santa Maria', 'Calderitas', 22),
(554, 'Caribe', 'Centro', 22),
(555, 'Caribe', 'Dina', 25),
(556, 'Caribe', 'Fovissste 5 Etapa', 26),
(557, 'Caribe', 'Clinica de la Mujer', 30),
(558, 'Caribe', 'Expofer', 33),
(559, 'Caribe', 'Residencial Marsella', 28),
(560, 'Caribe', 'Forjadores', 22),
(561, 'Caribe', 'Jardines', 22),
(562, 'Caribe', '8 de Octubre', 21),
(563, 'Caribe', 'Las casitas', 20),
(564, 'Caribe', 'Lopez Mateos', 21),
(565, 'Caribe', '5 de Abril', 21),
(566, 'Caribe', 'Proterritorio', 20),
(567, 'Caribe', 'Solidaridad', 19),
(568, 'Caribe', 'Magisterial', 19),
(569, 'Caribe', 'Payo Obispo', 20),
(570, 'Caribe', 'Lagunitas los monos', 22),
(571, 'Caribe', 'Nuevo Progreso', 19),
(572, 'Caribe', 'Lazaro Cardenas', 18),
(573, 'Caribe', 'Arboledas', 19),
(574, 'Caribe', 'Santa Maria', 24),
(575, 'Caribe', 'Caribe', 16),
(576, 'Caribe', 'Las Americas 1 y 2', 18),
(577, 'Caribe', 'Las Americas 3 y 4', 20),
(578, 'Caribe', 'Pacto Obrero', 27),
(579, 'Caribe', 'Calderitas', 30),
(580, 'Las Americas 1 y 2', 'Centro', 25),
(581, 'Las Americas 1 y 2', 'Dina', 27),
(582, 'Las Americas 1 y 2', 'Fovissste 5 Etapa', 28),
(583, 'Las Americas 1 y 2', 'Clinica de la Mujer', 32),
(584, 'Las Americas 1 y 2', 'Expofer', 35),
(585, 'Las Americas 1 y 2', 'Residencial Marsella', 33),
(586, 'Las Americas 1 y 2', 'Forjadores', 25),
(587, 'Las Americas 1 y 2', 'Jardines', 24),
(588, 'Las Americas 1 y 2', '8 de Octubre', 23),
(589, 'Las Americas 1 y 2', 'Las casitas', 22),
(590, 'Las Americas 1 y 2', 'Lopez Mateos', 23),
(591, 'Las Americas 1 y 2', '5 de Abril', 23),
(592, 'Las Americas 1 y 2', 'Proterritorio', 22),
(593, 'Las Americas 1 y 2', 'Solidaridad', 21),
(594, 'Las Americas 1 y 2', 'Magisterial', 21),
(595, 'Las Americas 1 y 2', 'Payo Obispo', 22),
(596, 'Las Americas 1 y 2', 'Lagunitas los monos', 24),
(597, 'Las Americas 1 y 2', 'Nuevo Progreso', 21),
(598, 'Las Americas 1 y 2', 'Lazaro Cardenas', 20),
(599, 'Las Americas 1 y 2', 'Arboledas', 20),
(600, 'Las Americas 1 y 2', 'Santa Maria', 22),
(601, 'Las Americas 1 y 2', 'Caribe', 18),
(602, 'Las Americas 1 y 2', 'Las Americas 1 y 2', 16),
(603, 'Las Americas 1 y 2', 'Las Americas 3 y 4', 18),
(604, 'Las Americas 1 y 2', 'Pacto Obrero', 20),
(605, 'Las Americas 1 y 2', 'Calderitas', 27),
(606, 'Las Americas 3 y 4', 'Centro', 27),
(607, 'Las Americas 3 y 4', 'Dina', 29),
(608, 'Las Americas 3 y 4', 'Fovissste 5 Etapa', 30),
(609, 'Las Americas 3 y 4', 'Clinica de la Mujer', 34),
(610, 'Las Americas 3 y 4', 'Expofer', 37),
(611, 'Las Americas 3 y 4', 'Residencial Marsella', 35),
(612, 'Las Americas 3 y 4', 'Forjadores', 27),
(613, 'Las Americas 3 y 4', 'Jardines', 26),
(614, 'Las Americas 3 y 4', '8 de Octubre', 25),
(615, 'Las Americas 3 y 4', 'Las casitas', 24),
(616, 'Las Americas 3 y 4', 'Lopez Mateos', 25),
(617, 'Las Americas 3 y 4', '5 de Abril', 25),
(618, 'Las Americas 3 y 4', 'Proterritorio', 24),
(619, 'Las Americas 3 y 4', 'Solidaridad', 23),
(620, 'Las Americas 3 y 4', 'Magisterial', 23),
(621, 'Las Americas 3 y 4', 'Payo Obispo', 24),
(622, 'Las Americas 3 y 4', 'Lagunitas los monos', 26),
(623, 'Las Americas 3 y 4', 'Nuevo Progreso', 23),
(624, 'Las Americas 3 y 4', 'Lazaro Cardenas', 22),
(625, 'Las Americas 3 y 4', 'Arboledas', 22),
(626, 'Las Americas 3 y 4', 'Santa Maria', 24),
(627, 'Las Americas 3 y 4', 'Caribe', 20),
(628, 'Las Americas 3 y 4', 'Las Americas 1 y 2', 18),
(629, 'Las Americas 3 y 4', 'Las Americas 3 y 4', 16),
(630, 'Las Americas 3 y 4', 'Pacto Obrero', 21),
(631, 'Las Americas 3 y 4', 'Calderitas', 26),
(632, 'Pacto Obrero', 'Centro', 28),
(633, 'Pacto Obrero', 'Dina', 32),
(634, 'Pacto Obrero', 'Fovissste 5 Etapa', 34),
(635, 'Pacto Obrero', 'Clinica de la Mujer', 39),
(636, 'Pacto Obrero', 'Expofer', 43),
(637, 'Pacto Obrero', 'Residencial Marsella', 37),
(638, 'Pacto Obrero', 'Forjadores', 34),
(639, 'Pacto Obrero', 'Jardines', 30),
(640, 'Pacto Obrero', '8 de Octubre', 29),
(641, 'Pacto Obrero', 'Las casitas', 28),
(642, 'Pacto Obrero', 'Lopez Mateos', 26),
(643, 'Pacto Obrero', '5 de Abril', 24),
(644, 'Pacto Obrero', 'Proterritorio', 24),
(645, 'Pacto Obrero', 'Solidaridad', 27),
(646, 'Pacto Obrero', 'Magisterial', 28),
(647, 'Pacto Obrero', 'Payo Obispo', 29),
(648, 'Pacto Obrero', 'Lagunitas los monos', 34),
(649, 'Pacto Obrero', 'Nuevo Progreso', 29),
(650, 'Pacto Obrero', 'Lazaro Cardenas', 26),
(651, 'Pacto Obrero', 'Arboledas', 23),
(652, 'Pacto Obrero', 'Santa Maria', 18),
(653, 'Pacto Obrero', 'Caribe', 27),
(654, 'Pacto Obrero', 'Las Americas 1 y 2', 20),
(655, 'Pacto Obrero', 'Las Americas 3 y 4', 21),
(656, 'Pacto Obrero', 'Pacto Obrero', 16),
(657, 'Pacto Obrero', 'Calderitas', 20),
(658, 'Calderitas', 'Centro', 36),
(659, 'Calderitas', 'Dina', 38),
(660, 'Calderitas', 'Fovissste 5 Etapa', 40),
(661, 'Calderitas', 'Clinica de la Mujer', 45),
(662, 'Calderitas', 'Expofer', 50),
(663, 'Calderitas', 'Residencial Marsella', 45),
(664, 'Calderitas', 'Forjadores', 41),
(665, 'Calderitas', 'Jardines', 38),
(666, 'Calderitas', '8 de Octubre', 37),
(667, 'Calderitas', 'Las casitas', 35),
(668, 'Calderitas', 'Lopez Mateos', 33),
(669, 'Calderitas', '5 de Abril', 30),
(670, 'Calderitas', 'Proterritorio', 29),
(671, 'Calderitas', 'Solidaridad', 32),
(672, 'Calderitas', 'Magisterial', 34),
(673, 'Calderitas', 'Payo Obispo', 36),
(674, 'Calderitas', 'Lagunitas los monos', 41),
(675, 'Calderitas', 'Nuevo Progreso', 35),
(676, 'Calderitas', 'Lazaro Cardenas', 30),
(677, 'Calderitas', 'Arboledas', 27),
(678, 'Calderitas', 'Santa Maria', 22),
(679, 'Calderitas', 'Caribe', 30),
(680, 'Calderitas', 'Las Americas 1 y 2', 27),
(681, 'Calderitas', 'Las Americas 3 y 4', 26),
(682, 'Calderitas', 'Pacto Obrero', 20),
(683, 'Calderitas', 'Calderitas', 16);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`idalumno`);

--
-- Indices de la tabla `cat_chofer`
--
ALTER TABLE `cat_chofer`
  ADD PRIMARY KEY (`cve_chofer`);

--
-- Indices de la tabla `cat_socio`
--
ALTER TABLE `cat_socio`
  ADD PRIMARY KEY (`cve_socio`);

--
-- Indices de la tabla `cat_taxi`
--
ALTER TABLE `cat_taxi`
  ADD PRIMARY KEY (`num_taxi`);

--
-- Indices de la tabla `cat_usuario`
--
ALTER TABLE `cat_usuario`
  ADD PRIMARY KEY (`cve_usuario`);

--
-- Indices de la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `datosgenerales`
--
ALTER TABLE `datosgenerales`
  ADD KEY `num` (`num_taxi`),
  ADD KEY `cve_socio` (`cve_socio`),
  ADD KEY `cve_chofer` (`cve_chofer`);

--
-- Indices de la tabla `historial`
--
ALTER TABLE `historial`
  ADD KEY `num_taxi` (`num_taxi`),
  ADD KEY `cve_chofer` (`cve_chofer`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_product`);

--
-- Indices de la tabla `retrofit_users`
--
ALTER TABLE `retrofit_users`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `num_taxi` (`num_taxi`);

--
-- Indices de la tabla `socio`
--
ALTER TABLE `socio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tabulador`
--
ALTER TABLE `tabulador`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `idalumno` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cat_usuario`
--
ALTER TABLE `cat_usuario`
  MODIFY `cve_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `comentario`
--
ALTER TABLE `comentario`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT de la tabla `retrofit_users`
--
ALTER TABLE `retrofit_users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `socio`
--
ALTER TABLE `socio`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `tabulador`
--
ALTER TABLE `tabulador`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=684;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `datosgenerales`
--
ALTER TABLE `datosgenerales`
  ADD CONSTRAINT `datosgenerales_ibfk_1` FOREIGN KEY (`num_taxi`) REFERENCES `cat_taxi` (`num_taxi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `datosgenerales_ibfk_2` FOREIGN KEY (`cve_socio`) REFERENCES `cat_socio` (`cve_socio`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `datosgenerales_ibfk_3` FOREIGN KEY (`cve_chofer`) REFERENCES `cat_chofer` (`cve_chofer`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `historial`
--
ALTER TABLE `historial`
  ADD CONSTRAINT `historial_ibfk_1` FOREIGN KEY (`num_taxi`) REFERENCES `cat_taxi` (`num_taxi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ibfk_2` FOREIGN KEY (`cve_chofer`) REFERENCES `cat_chofer` (`cve_chofer`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD CONSTRAINT `servicio_ibfk_1` FOREIGN KEY (`num_taxi`) REFERENCES `cat_taxi` (`num_taxi`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
