-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-12-2018 a las 04:12:13
-- Versión del servidor: 5.7.14
-- Versión de PHP: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gobus`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `new_rutas`
--

CREATE TABLE `new_rutas` (
  `id_destino` int(6) UNSIGNED NOT NULL,
  `destino` varchar(50) NOT NULL,
  `hora_salida` time NOT NULL,
  `servicio` varchar(15) DEFAULT NULL,
  `hora_llegada` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `new_rutas`
--

INSERT INTO `new_rutas` (`id_destino`, `destino`, `hora_salida`, `servicio`, `hora_llegada`) VALUES
(1, 'TGA-NCA', '12:05:08', 'lujo', '15:11:13'),
(3, 'TGA--CAT', '07:00:00', 'lujo', '09:30:00'),
(4, 'TGA--CAT', '13:15:16', 'LUJO', '16:20:09'),
(5, 'TGA--CAT', '08:05:00', 'lujo', '12:00:00'),
(6, 'JPA--TGA', '13:30:00', 'plus/lujo', '17:00:00'),
(7, 'JPA--TGA', '10:00:00', 'lujo', '13:00:00'),
(8, 'TGA--SIG', '07:00:00', 'Lujo', '09:20:00'),
(9, 'TGA--SIG', '02:00:00', 'Lujo', '05:00:00'),
(10, 'TGA--SIG', '15:00:00', 'Lujo', '18:20:00'),
(11, 'TGA--SIG', '02:00:00', 'Lujo', '05:00:00'),
(12, 'CBA--TGA', '02:00:00', 'Lujo', '05:00:00'),
(13, 'CBA--TGA', '05:00:00', 'Lujo', '08:00:00'),
(14, 'TGA--SPS', '10:00:00', 'Lujo', '13:00:00'),
(15, 'TGA--SPS', '09:00:00', 'Lujo', '11:00:00'),
(16, 'TGA--SIG', '15:00:00', 'Lujo', '17:00:00'),
(17, 'TGA--SIG', '08:00:00', 'Lujo', '10:00:00'),
(18, 'TGA--SPS', '11:00:00', 'Lujo', '13:00:00'),
(19, 'TGA--SPS', '20:00:00', 'Lujo', '23:00:00'),
(20, 'TGA--SLO', '08:00:00', 'Lujo/plus', '11:00:00'),
(21, 'TGA--SLO', '14:00:00', 'normal', '17:00:00'),
(22, 'NCA--TGA', '08:00:00', 'Lujo', '10:29:00'),
(23, 'NCA--TGA', '13:20:00', 'Plus', '16:00:00'),
(24, 'CAT--TGA', '08:00:00', 'lujo/plus', '10:11:00'),
(25, 'CAT--TGA', '19:00:00', 'plus', '22:00:00'),
(26, 'TGA--NCA', '08:00:00', 'Lujo', '10:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_automotor`
--

CREATE TABLE `tbl_automotor` (
  `cod_bus` int(11) NOT NULL,
  `fk_cod_empresa` int(11) NOT NULL,
  `tipo_bus` varchar(45) NOT NULL,
  `marca_bus` varchar(45) NOT NULL,
  `color_bus` varchar(45) NOT NULL,
  `capacidad_asientos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_automotor_ruta`
--

CREATE TABLE `tbl_automotor_ruta` (
  `cod_ruta_bus` int(11) NOT NULL,
  `cod_automotor` int(11) NOT NULL,
  `cod_ruta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_boleto`
--

CREATE TABLE `tbl_boleto` (
  `cod_pago` int(11) NOT NULL,
  `cod_usuario` int(11) NOT NULL,
  `cod_ruta` int(11) NOT NULL,
  `cod_marca` int(11) NOT NULL,
  `precio` float NOT NULL,
  `fecha_vencimiento` varchar(20) NOT NULL,
  `impuesto` float DEFAULT NULL,
  `numero_asiento` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_compra`
--

CREATE TABLE `tbl_compra` (
  `cod_compra` int(11) NOT NULL,
  `cod_usuario` int(11) DEFAULT NULL,
  `cod_ruta` int(11) DEFAULT NULL,
  `fecha_vencimiento` varchar(45) DEFAULT NULL,
  `impuesto` float DEFAULT NULL,
  `Total` float DEFAULT NULL,
  `numero_tarjeta` int(30) NOT NULL,
  `csv` int(100) NOT NULL,
  `cant_boletos` int(11) NOT NULL,
  `precio_boleto` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_compra`
--

INSERT INTO `tbl_compra` (`cod_compra`, `cod_usuario`, `cod_ruta`, `fecha_vencimiento`, `impuesto`, `Total`, `numero_tarjeta`, `csv`, `cant_boletos`, `precio_boleto`) VALUES
(1, 44, 5, '12/12', 5, 56, 12345678, 0, 0, 0),
(2, 44, 5, '12/19', 1, 34, 1234567, 0, 0, 0),
(3, 44, 3, '12/18', NULL, NULL, 1234567, 1234, 0, 0),
(4, 44, 1, '31/12', NULL, NULL, 12345, 1223, 0, 0),
(5, 44, 5, '12/13', NULL, NULL, 12345, 1212, 0, 0),
(6, 44, 7, '12/19', NULL, NULL, 1234, 4567, 0, 0),
(7, 44, 1, '12/12', NULL, NULL, 12346, 1234, 0, 0),
(8, 44, 4, '12/18', NULL, NULL, 123465678, 1235, 0, 0),
(9, 44, 5, '12/12/18', 30, 400, 12345678, 1234, 0, 0),
(10, 44, 5, '12/12/18', 30, 600, 12345678, 1234, 3, 200),
(11, 44, 2, '12/12/18', 61.65, 411, 1234567890, 1234, 3, 137),
(12, 44, 3, '12/12/18', 41.1, 274, 1234567890, 5678, 2, 137),
(13, 44, 1, '12/12/18', 16.35, 109, 1234567890, 6789, 1, 109),
(14, 44, 4, '12/12', 16.35, 109, 1234567, 7896, 1, 109),
(15, 44, 1, '2018-12-12', 16.35, 109, 12345, 1212, 1, 109),
(16, 44, 1, '2018-12-12', 32.7, 218, 12345, 1212, 2, 109),
(17, 44, 1, '2018-12-05', 16.35, 109, 123456, 1111, 1, 109),
(18, 44, 5, '2018-12-08', 60, 400, 1234567, 1212, 2, 200),
(19, 44, 6, '2018-12-29', 11.25, 75, 1234567890, 1111, 1, 75),
(20, 44, 6, '2018-12-22', 22.5, 150, 12345, 1221, 2, 75),
(21, 44, 7, '2018-12-05', 24, 160, 123456789, 1221, 1, 160),
(22, 44, 5, '2018-12-13', 30, 200, 1234512345, 1221, 1, 200),
(23, 44, 2, '2018-12-06', 41.1, 274, 12345678, 2345, 2, 137),
(24, 44, 1, '2018-12-08', 555.9, 3706, 1234567890, 8909, 34, 109);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_empleado`
--

CREATE TABLE `tbl_empleado` (
  `cod_persona` int(11) NOT NULL,
  `tipo_empleado` int(11) NOT NULL,
  `cod_empresa` int(11) NOT NULL,
  `experiencia` varchar(200) DEFAULT NULL,
  `foto` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_empleado_bus`
--

CREATE TABLE `tbl_empleado_bus` (
  `cod_empl_bus` int(11) NOT NULL,
  `cod_bus` int(11) NOT NULL,
  `cod_persona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_empresa_transporte`
--

CREATE TABLE `tbl_empresa_transporte` (
  `cod_empresa` int(11) NOT NULL,
  `cod_lugar` int(11) DEFAULT NULL,
  `nombre_empresa` varchar(100) NOT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `cantidad_sucursal` int(11) DEFAULT NULL,
  `correo` varchar(45) NOT NULL,
  `dueño` varchar(45) NOT NULL,
  `registro_operaciones` varchar(45) DEFAULT NULL,
  `descripcion` varchar(4000) DEFAULT NULL,
  `ubicacion` varchar(4000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_empresa_transporte`
--

INSERT INTO `tbl_empresa_transporte` (`cod_empresa`, `cod_lugar`, `nombre_empresa`, `telefono`, `cantidad_sucursal`, `correo`, `dueño`, `registro_operaciones`, `descripcion`, `ubicacion`) VALUES
(1, NULL, 'Discovery', '87653454', 3, 'discovery@yahoo.com', 'Juan', '1990', 'Es un agrado para nosotros presentarnos como una empresa dinámica y emprendedora donde la experiencia garantiza la calidad de nuestros servicios teniendo como finalidad coordinar sus actividades turísticas y de negocios. en el país de una manera confiable y eficaz. Discovery cuenta con un centro de operaciones en la ciudad de Tegucigalpa, honduras y alianzas estratégicas con empresas afines en los destinos de nuestro país y fuera de nuestro país.', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d26033.141561419616!2d-87.21968606769538!3d14.086051484115533!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x62167df276ef738d!2sEmpresa+de+Transporte+Discovery!5e0!3m2!1ses-419!2shn!4v1541567068362'),
(2, NULL, 'Cristina', '93423146', 5, 'mirna@yahoo.com', 'Francisco Soler', '1999', 'Empresa familiar, creada para satisfacer, y dar el mejor servicio a las personas que viajan hacia la zona norte de nuestra República de Honduras', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d26034.08656445794!2d-87.22437426128793!3d14.077760376200295!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x5bbfa59ce3a8d3f8!2sEmpresa+de+Transportes+Cristina!5e0!3m2!1ses-419!2shn!4v1541559462027'),
(3, NULL, 'Mirna', '87654352', 4, 'mirna@yahoo.com', 'Javier Zuniga', '2004', 'Transporte Mirna es una empresa hondureña la cual se dedica al transporte de pasajeros y al servicio de mensajería interurbano dentro del territorio de la república de honduras', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d61917.56308102683!2d-87.23998204913633!3d14.086166765559062!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xf5ab3944a6f54183!2sTransportes+Mirna!5e0!3m2!1ses-419!2shn!4v1541567103354'),
(4, NULL, 'Hedman Alas', '22345678', 8, 'dedman.alas@gmail.com', 'Patricia Zuniga', '1995', 'Hedman Alas es una empresa de transporte terrestre en Honduras con sede en la ciudad de San Pedro Sula, actualmente dirigida por Alexander Hedman Alas, esta empresa se a constituido como una línea de lujo en Honduras ofreciendo servicio Lujo, Servicio Ejecutivo y Servicio Ejecutivo Plus. la empresa se destaca por su servicio y modernas unidades. Hedman Alas ganó el premio "Service Best" en 2010', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3869.9073262845145!2d-87.18707428584239!3d14.08264769333629!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8f6fa2af0199b889%3A0xab7d94621e1efbb3!2sHedman+Alas!5e0!3m2!1ses-419!2shn!4v1541567011967');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_genero`
--

CREATE TABLE `tbl_genero` (
  `cod_genero` int(11) NOT NULL,
  `genero` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_genero`
--

INSERT INTO `tbl_genero` (`cod_genero`, `genero`) VALUES
(1, 'Masculino'),
(2, 'Femenino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_hora`
--

CREATE TABLE `tbl_hora` (
  `cod_hora` int(11) NOT NULL,
  `hora` time NOT NULL,
  `minutos` time DEFAULT NULL,
  `segundos` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_hora`
--

INSERT INTO `tbl_hora` (`cod_hora`, `hora`, `minutos`, `segundos`) VALUES
(1, '05:30:00', NULL, NULL),
(2, '07:00:00', NULL, NULL),
(3, '08:30:00', NULL, NULL),
(4, '09:15:00', NULL, NULL),
(5, '12:00:00', NULL, NULL),
(6, '01:30:00', NULL, NULL),
(7, '03:00:00', NULL, NULL),
(8, '05:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_lugar`
--

CREATE TABLE `tbl_lugar` (
  `cod_lugar` int(11) NOT NULL,
  `nombre_lugar` varchar(200) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `codigo_postal` int(11) DEFAULT NULL,
  `cod_lugar_hijo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_lugar`
--

INSERT INTO `tbl_lugar` (`cod_lugar`, `nombre_lugar`, `descripcion`, `codigo_postal`, `cod_lugar_hijo`) VALUES
(1, 'Juticalpa', NULL, NULL, NULL),
(2, 'Catacamas', NULL, NULL, NULL),
(3, 'SPS', NULL, NULL, NULL),
(4, 'Siguatepeque', NULL, NULL, NULL),
(5, 'Tela', NULL, NULL, NULL),
(6, 'Ceiba', NULL, NULL, NULL),
(7, 'Tocoa-Colon', NULL, NULL, NULL),
(8, 'Tegucigalpa', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_marca_tarjeta`
--

CREATE TABLE `tbl_marca_tarjeta` (
  `cod_marca` int(11) NOT NULL,
  `nombre_marca` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_marca_tarjeta`
--

INSERT INTO `tbl_marca_tarjeta` (`cod_marca`, `nombre_marca`, `descripcion`) VALUES
(1, 'VISA', 'ES UNA TARJETA DE DEBITO/CREDITO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_persona`
--

CREATE TABLE `tbl_persona` (
  `cod_persona` int(11) NOT NULL,
  `cod_genero` int(11) NOT NULL,
  `cod_lugar` int(11) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `nombre_persona` varchar(45) NOT NULL,
  `apellido_persona` varchar(45) NOT NULL,
  `edad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_persona`
--

INSERT INTO `tbl_persona` (`cod_persona`, `cod_genero`, `cod_lugar`, `telefono`, `nombre_persona`, `apellido_persona`, `edad`) VALUES
(10, 2, NULL, '123', 'juan', 'lopez', NULL),
(20, 1, NULL, '97654534', 'juan', 'lopez', NULL),
(24, 1, NULL, '97654534', 'juan', 'lopez', NULL),
(29, 1, NULL, '97654534', 'juan', 'lopez', NULL),
(30, 1, NULL, '97654534', 'juan', 'lopez', NULL),
(31, 1, NULL, '97654534', 'carlos', 'garcia', NULL),
(32, 1, NULL, '97654534', 'carlos', 'lopez', NULL),
(33, 1, NULL, '97654534', 'carlos', 'garcia', NULL),
(34, 1, NULL, '97654534', 'juan', 'lopez', NULL),
(35, 1, NULL, '97654534', 'juan', 'lopez', NULL),
(36, 1, NULL, '97654534', 'juan', 'garcia', NULL),
(37, 1, NULL, '97654534', 'juan', 'garcia', NULL),
(38, 1, NULL, '97654534', 'juan', 'lopez', NULL),
(39, 1, NULL, '98675434', 'Arnold', 'Colindres', NULL),
(40, 1, NULL, '97654534', 'arnold francisco', 'colindres', NULL),
(41, 1, NULL, '97654534', 'carlos', 'lopez', NULL),
(42, 1, NULL, '97654534', 'carlos', 'lopez', NULL),
(43, 1, NULL, '97654534', 'Fran', 'lopez', NULL),
(44, 2, NULL, '97654534', 'Ana', 'Padilla', NULL),
(45, 1, NULL, '98564325', 'pedro', 'lopez', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_ruta`
--

CREATE TABLE `tbl_ruta` (
  `cod_ruta` int(11) NOT NULL,
  `tbl_empleado_cod_persona` int(11) DEFAULT NULL,
  `cod_hora` int(11) NOT NULL,
  `cod_lugar_origen` int(11) NOT NULL,
  `cod_lugar_destino` int(11) NOT NULL,
  `Duracion` float NOT NULL,
  `precio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_ruta`
--

INSERT INTO `tbl_ruta` (`cod_ruta`, `tbl_empleado_cod_persona`, `cod_hora`, `cod_lugar_origen`, `cod_lugar_destino`, `Duracion`, `precio`) VALUES
(1, NULL, 1, 8, 1, 5, 109),
(2, NULL, 2, 8, 2, 6, 137),
(3, NULL, 3, 2, 8, 5, 137),
(4, NULL, 5, 1, 8, 4, 109),
(5, NULL, 1, 8, 6, 5, 200),
(6, NULL, 3, 8, 4, 5, 75),
(7, NULL, 5, 8, 3, 6, 160),
(8, NULL, 3, 2, 8, 3, 130);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_ruta_x_empresa`
--

CREATE TABLE `tbl_ruta_x_empresa` (
  `cod_ruta_empresa` int(11) NOT NULL,
  `cod_ruta` int(11) NOT NULL,
  `cod_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_ruta_x_empresa`
--

INSERT INTO `tbl_ruta_x_empresa` (`cod_ruta_empresa`, `cod_ruta`, `cod_empresa`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 4),
(6, 6, 4),
(7, 7, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_sucursal`
--

CREATE TABLE `tbl_sucursal` (
  `cod_sucursal` int(11) NOT NULL,
  `cod_empresa` int(11) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `tbl_lugar_cod_lugar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_sucursal`
--

INSERT INTO `tbl_sucursal` (`cod_sucursal`, `cod_empresa`, `descripcion`, `tbl_lugar_cod_lugar`) VALUES
(1, 1, NULL, 1),
(2, 1, NULL, 2),
(3, 1, NULL, 8),
(4, 2, NULL, 8),
(5, 2, NULL, 3),
(6, 2, NULL, 5),
(7, 2, NULL, 6),
(8, 3, NULL, 8),
(9, 3, NULL, 6),
(10, 3, NULL, 7),
(11, 4, NULL, 3),
(12, 4, NULL, 5),
(13, 4, NULL, 6),
(14, 4, NULL, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tipo_empleado`
--

CREATE TABLE `tbl_tipo_empleado` (
  `cod_empleado` int(11) NOT NULL,
  `tipo_empleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuario`
--

CREATE TABLE `tbl_usuario` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(1000) NOT NULL,
  `acerca` varchar(100) DEFAULT NULL,
  `ubicacion` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_usuario`
--

INSERT INTO `tbl_usuario` (`id`, `username`, `password`, `acerca`, `ubicacion`) VALUES
(10, 'yty', 'juuyh', NULL, NULL),
(20, 'correo', 'e345', NULL, NULL),
(24, 'asdgf', 'hytg', NULL, NULL),
(36, 'carlos@yahoo.com', '123', NULL, NULL),
(38, 'juan@yahoo.com', '$2a$10$5/grhs6av7JtrQuL0aQ45Ol/gfgWXKU5lvHgn6//aaMJxyLqh8AOO', NULL, NULL),
(39, 'arnold@yahoo.com', '$2a$10$RNU/b4ChoDv.X/bpyiSy8OPCLFpxoFpJMlevcxkJ5VSWewoc7P4nm', NULL, NULL),
(40, 'arnold@yahoo.com', '$2a$10$UjKe/J.uy1U6M9kbtCsExux3e2Am.1WlZuAoTraWtvl5KjSyXL9a.', NULL, NULL),
(41, 'carlos@yahoo.com', '$2a$10$tWS7GcK5axsHeDN5lSLv2eJ89JOog94Gn0yaY7zPk0uEWBUKdE3ti', NULL, NULL),
(42, 'carlos2@yahoo.com', '$2a$10$Pp/ozIyANOHN/xYcwNAE6OzPaz7tKjBWlObBMAGSeqUo3lJUJpggq', NULL, NULL),
(43, 'fran@yahoo.com', '$2a$10$rZa/MFPoviaDBoggZWw.2uk9FP0ilcDviyb6xieEh32vbaGPpFotq', NULL, NULL),
(44, 'ana@yahoo.com', '$2a$10$2gGW7weoxck1VXKLos1O8eXU4AwDwRsiD7370Iktll/BLa36rZMey', 'Estudiante de la carrera de Ingenieria en Sistemas', 'Residencial Plaza, bloque 5, peatonal 7'),
(45, 'pedro@yahoo.com', '$2a$10$uXUUvstacUDDxP6N03dayesXNmt6cWFfnw0KVf5d6/eIpJUkYE8zm', NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `new_rutas`
--
ALTER TABLE `new_rutas`
  ADD PRIMARY KEY (`id_destino`);

--
-- Indices de la tabla `tbl_automotor`
--
ALTER TABLE `tbl_automotor`
  ADD PRIMARY KEY (`cod_bus`),
  ADD KEY `fk_AUTOMOTOR_EMPRESA` (`fk_cod_empresa`);

--
-- Indices de la tabla `tbl_automotor_ruta`
--
ALTER TABLE `tbl_automotor_ruta`
  ADD PRIMARY KEY (`cod_ruta_bus`,`cod_automotor`,`cod_ruta`),
  ADD KEY `fk_bus_ruta` (`cod_automotor`),
  ADD KEY `fk_bus_x_ruta` (`cod_ruta`);

--
-- Indices de la tabla `tbl_boleto`
--
ALTER TABLE `tbl_boleto`
  ADD PRIMARY KEY (`cod_pago`,`cod_usuario`,`cod_ruta`),
  ADD KEY `fk_tbl_usuario_tbl_ruta` (`cod_usuario`),
  ADD KEY `fk_tbl_usuario_tbl_ruta1` (`cod_ruta`),
  ADD KEY `fk_tbl_pago_tbl_marca_tarjeta1` (`cod_marca`);

--
-- Indices de la tabla `tbl_compra`
--
ALTER TABLE `tbl_compra`
  ADD PRIMARY KEY (`cod_compra`),
  ADD KEY `cod_usuario_idx` (`cod_usuario`),
  ADD KEY `cod_ruta_idx` (`cod_ruta`);

--
-- Indices de la tabla `tbl_empleado`
--
ALTER TABLE `tbl_empleado`
  ADD PRIMARY KEY (`cod_persona`),
  ADD KEY `fk_empleado_tipoEmpleado` (`tipo_empleado`),
  ADD KEY `fk_empleado_empresa` (`cod_empresa`);

--
-- Indices de la tabla `tbl_empleado_bus`
--
ALTER TABLE `tbl_empleado_bus`
  ADD PRIMARY KEY (`cod_empl_bus`,`cod_bus`,`cod_persona`),
  ADD KEY `fk_bus_empleado` (`cod_bus`),
  ADD KEY `fk_automotor_empleado` (`cod_persona`);

--
-- Indices de la tabla `tbl_empresa_transporte`
--
ALTER TABLE `tbl_empresa_transporte`
  ADD PRIMARY KEY (`cod_empresa`),
  ADD KEY `fk_empresa_lugar` (`cod_lugar`);

--
-- Indices de la tabla `tbl_genero`
--
ALTER TABLE `tbl_genero`
  ADD PRIMARY KEY (`cod_genero`);

--
-- Indices de la tabla `tbl_hora`
--
ALTER TABLE `tbl_hora`
  ADD PRIMARY KEY (`cod_hora`);

--
-- Indices de la tabla `tbl_lugar`
--
ALTER TABLE `tbl_lugar`
  ADD PRIMARY KEY (`cod_lugar`),
  ADD KEY `fk_Lp_Lhijo` (`cod_lugar_hijo`);

--
-- Indices de la tabla `tbl_marca_tarjeta`
--
ALTER TABLE `tbl_marca_tarjeta`
  ADD PRIMARY KEY (`cod_marca`);

--
-- Indices de la tabla `tbl_persona`
--
ALTER TABLE `tbl_persona`
  ADD PRIMARY KEY (`cod_persona`),
  ADD KEY `fk_tbl_persona_tbl_genero1` (`cod_genero`),
  ADD KEY `fk_tbl_persona_tbl_lugar1` (`cod_lugar`);

--
-- Indices de la tabla `tbl_ruta`
--
ALTER TABLE `tbl_ruta`
  ADD PRIMARY KEY (`cod_ruta`),
  ADD KEY `fk_RUTA_HORA1` (`cod_hora`),
  ADD KEY `fk_ruta_lugar` (`cod_lugar_origen`),
  ADD KEY `fk_tbl_ruta_tbl_emple` (`tbl_empleado_cod_persona`),
  ADD KEY `fk_tbl_ruta_tbl_lugar1` (`cod_lugar_destino`);

--
-- Indices de la tabla `tbl_ruta_x_empresa`
--
ALTER TABLE `tbl_ruta_x_empresa`
  ADD PRIMARY KEY (`cod_ruta_empresa`,`cod_ruta`,`cod_empresa`),
  ADD KEY `fk_ruta_emoresa` (`cod_ruta`),
  ADD KEY `fk_empresa_ruta` (`cod_empresa`);

--
-- Indices de la tabla `tbl_sucursal`
--
ALTER TABLE `tbl_sucursal`
  ADD PRIMARY KEY (`cod_sucursal`,`tbl_lugar_cod_lugar`),
  ADD KEY `fk_sucursal_empresa` (`cod_empresa`),
  ADD KEY `fk_tbl_sucursal_tbl_lugar1` (`tbl_lugar_cod_lugar`);

--
-- Indices de la tabla `tbl_tipo_empleado`
--
ALTER TABLE `tbl_tipo_empleado`
  ADD PRIMARY KEY (`cod_empleado`);

--
-- Indices de la tabla `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `new_rutas`
--
ALTER TABLE `new_rutas`
  MODIFY `id_destino` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT de la tabla `tbl_automotor`
--
ALTER TABLE `tbl_automotor`
  MODIFY `cod_bus` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbl_automotor_ruta`
--
ALTER TABLE `tbl_automotor_ruta`
  MODIFY `cod_ruta_bus` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbl_boleto`
--
ALTER TABLE `tbl_boleto`
  MODIFY `cod_marca` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbl_compra`
--
ALTER TABLE `tbl_compra`
  MODIFY `cod_compra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT de la tabla `tbl_empleado`
--
ALTER TABLE `tbl_empleado`
  MODIFY `cod_persona` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbl_empleado_bus`
--
ALTER TABLE `tbl_empleado_bus`
  MODIFY `cod_empl_bus` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbl_empresa_transporte`
--
ALTER TABLE `tbl_empresa_transporte`
  MODIFY `cod_empresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tbl_genero`
--
ALTER TABLE `tbl_genero`
  MODIFY `cod_genero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tbl_hora`
--
ALTER TABLE `tbl_hora`
  MODIFY `cod_hora` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `tbl_lugar`
--
ALTER TABLE `tbl_lugar`
  MODIFY `cod_lugar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `tbl_marca_tarjeta`
--
ALTER TABLE `tbl_marca_tarjeta`
  MODIFY `cod_marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tbl_persona`
--
ALTER TABLE `tbl_persona`
  MODIFY `cod_persona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT de la tabla `tbl_ruta`
--
ALTER TABLE `tbl_ruta`
  MODIFY `cod_ruta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `tbl_ruta_x_empresa`
--
ALTER TABLE `tbl_ruta_x_empresa`
  MODIFY `cod_ruta_empresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `tbl_sucursal`
--
ALTER TABLE `tbl_sucursal`
  MODIFY `cod_sucursal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `tbl_tipo_empleado`
--
ALTER TABLE `tbl_tipo_empleado`
  MODIFY `cod_empleado` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_automotor`
--
ALTER TABLE `tbl_automotor`
  ADD CONSTRAINT `fk_AUTOMOTOR_EMPRESA` FOREIGN KEY (`fk_cod_empresa`) REFERENCES `tbl_empresa_transporte` (`cod_empresa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_automotor_ruta`
--
ALTER TABLE `tbl_automotor_ruta`
  ADD CONSTRAINT `fk_bus_ruta` FOREIGN KEY (`cod_automotor`) REFERENCES `tbl_automotor` (`cod_bus`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_bus_x_ruta` FOREIGN KEY (`cod_ruta`) REFERENCES `tbl_ruta` (`cod_ruta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_boleto`
--
ALTER TABLE `tbl_boleto`
  ADD CONSTRAINT `fk_tbl_pago_tbl_marca_tarjeta1` FOREIGN KEY (`cod_marca`) REFERENCES `tbl_marca_tarjeta` (`cod_marca`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_usuario_tbl_ruta` FOREIGN KEY (`cod_usuario`) REFERENCES `tbl_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_usuario_tbl_ruta1` FOREIGN KEY (`cod_ruta`) REFERENCES `tbl_ruta` (`cod_ruta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_empleado`
--
ALTER TABLE `tbl_empleado`
  ADD CONSTRAINT `fk_empleado_empresa` FOREIGN KEY (`cod_empresa`) REFERENCES `tbl_empresa_transporte` (`cod_empresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_empleado_persona` FOREIGN KEY (`cod_persona`) REFERENCES `tbl_persona` (`cod_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_empleado_tipoEmpleado` FOREIGN KEY (`tipo_empleado`) REFERENCES `tbl_tipo_empleado` (`cod_empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_empleado_bus`
--
ALTER TABLE `tbl_empleado_bus`
  ADD CONSTRAINT `fk_automotor_empleado` FOREIGN KEY (`cod_persona`) REFERENCES `tbl_empleado` (`cod_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_bus_empleado` FOREIGN KEY (`cod_bus`) REFERENCES `tbl_automotor` (`cod_bus`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_empresa_transporte`
--
ALTER TABLE `tbl_empresa_transporte`
  ADD CONSTRAINT `fk_empresa_lugar` FOREIGN KEY (`cod_lugar`) REFERENCES `tbl_lugar` (`cod_lugar`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_lugar`
--
ALTER TABLE `tbl_lugar`
  ADD CONSTRAINT `fk_Lp_Lhijo` FOREIGN KEY (`cod_lugar_hijo`) REFERENCES `tbl_lugar` (`cod_lugar`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_persona`
--
ALTER TABLE `tbl_persona`
  ADD CONSTRAINT `fk_tbl_persona_tbl_genero1` FOREIGN KEY (`cod_genero`) REFERENCES `tbl_genero` (`cod_genero`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_persona_tbl_lugar1` FOREIGN KEY (`cod_lugar`) REFERENCES `tbl_lugar` (`cod_lugar`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_ruta`
--
ALTER TABLE `tbl_ruta`
  ADD CONSTRAINT `fk_RUTA_HORA1` FOREIGN KEY (`cod_hora`) REFERENCES `tbl_hora` (`cod_hora`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ruta_lugar` FOREIGN KEY (`cod_lugar_origen`) REFERENCES `tbl_lugar` (`cod_lugar`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_ruta_tbl_emple` FOREIGN KEY (`tbl_empleado_cod_persona`) REFERENCES `tbl_empleado` (`cod_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_ruta_tbl_lugar1` FOREIGN KEY (`cod_lugar_destino`) REFERENCES `tbl_lugar` (`cod_lugar`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_ruta_x_empresa`
--
ALTER TABLE `tbl_ruta_x_empresa`
  ADD CONSTRAINT `fk_empresa_ruta` FOREIGN KEY (`cod_empresa`) REFERENCES `tbl_empresa_transporte` (`cod_empresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ruta_emoresa` FOREIGN KEY (`cod_ruta`) REFERENCES `tbl_ruta` (`cod_ruta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_sucursal`
--
ALTER TABLE `tbl_sucursal`
  ADD CONSTRAINT `fk_sucursal_empresa` FOREIGN KEY (`cod_empresa`) REFERENCES `tbl_empresa_transporte` (`cod_empresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_sucursal_tbl_lugar1` FOREIGN KEY (`tbl_lugar_cod_lugar`) REFERENCES `tbl_lugar` (`cod_lugar`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  ADD CONSTRAINT `fk_usuario_persona` FOREIGN KEY (`id`) REFERENCES `tbl_persona` (`cod_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
