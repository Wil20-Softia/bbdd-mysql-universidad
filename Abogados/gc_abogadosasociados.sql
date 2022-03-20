-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-08-2018 a las 06:07:12
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gc_abogadosasociados`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asunto`
--

CREATE TABLE `asunto` (
  `cod_asu` int(11) NOT NULL,
  `cod_cli` int(11) NOT NULL,
  `num_exp` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `cod_cli` int(11) NOT NULL,
  `nombre` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `apellido` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `cedula` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `det_dir` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `cod_par` int(9) NOT NULL,
  `cod_mun` int(9) NOT NULL,
  `cod_est` int(9) NOT NULL,
  `cod_pai` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `cod_est` int(9) NOT NULL,
  `cod_pai` int(9) NOT NULL,
  `nombre` varchar(70) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_asunto`
--

CREATE TABLE `estado_asunto` (
  `cod_estasu` tinyint(1) NOT NULL,
  `descrip` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_estados`
--

CREATE TABLE `historial_estados` (
  `cod_asu` int(11) NOT NULL,
  `cod_estasu` tinyint(1) NOT NULL,
  `fec_mod` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipio`
--

CREATE TABLE `municipio` (
  `cod_mun` int(9) NOT NULL,
  `cod_est` int(9) NOT NULL,
  `nombre` varchar(70) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE `pais` (
  `cod_pai` int(9) NOT NULL,
  `nombre` varchar(70) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parroquia`
--

CREATE TABLE `parroquia` (
  `cod_par` int(9) NOT NULL,
  `cod_mun` int(9) NOT NULL,
  `nombre` varchar(70) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `procurador`
--

CREATE TABLE `procurador` (
  `cod_pro` int(11) NOT NULL,
  `nombre` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `apellido` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `cedula` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `RIF` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `det_dir` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `cod_par` int(9) NOT NULL,
  `cod_mun` int(9) NOT NULL,
  `cod_est` int(9) NOT NULL,
  `cod_pai` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `procurador_asunto`
--

CREATE TABLE `procurador_asunto` (
  `cod_pro` int(11) NOT NULL,
  `cod_asu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono_cliente`
--

CREATE TABLE `telefono_cliente` (
  `num_tel` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `cod_cli` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono_procurador`
--

CREATE TABLE `telefono_procurador` (
  `num_tel` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `cod_pro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asunto`
--
ALTER TABLE `asunto`
  ADD PRIMARY KEY (`cod_asu`),
  ADD UNIQUE KEY `num_exp` (`num_exp`),
  ADD KEY `cod_cli` (`cod_cli`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cod_cli`),
  ADD UNIQUE KEY `cedula` (`cedula`),
  ADD KEY `cod_par` (`cod_par`),
  ADD KEY `cod_mun` (`cod_mun`),
  ADD KEY `cod_est` (`cod_est`),
  ADD KEY `cod_pai` (`cod_pai`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`cod_est`),
  ADD KEY `cod_pai` (`cod_pai`);

--
-- Indices de la tabla `estado_asunto`
--
ALTER TABLE `estado_asunto`
  ADD PRIMARY KEY (`cod_estasu`);

--
-- Indices de la tabla `historial_estados`
--
ALTER TABLE `historial_estados`
  ADD KEY `cod_asu` (`cod_asu`),
  ADD KEY `cod_estasu` (`cod_estasu`);

--
-- Indices de la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD PRIMARY KEY (`cod_mun`),
  ADD KEY `cod_est` (`cod_est`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`cod_pai`);

--
-- Indices de la tabla `parroquia`
--
ALTER TABLE `parroquia`
  ADD PRIMARY KEY (`cod_par`),
  ADD KEY `cod_mun` (`cod_mun`);

--
-- Indices de la tabla `procurador`
--
ALTER TABLE `procurador`
  ADD PRIMARY KEY (`cod_pro`),
  ADD UNIQUE KEY `cedula` (`cedula`),
  ADD UNIQUE KEY `RIF` (`RIF`),
  ADD KEY `cod_par` (`cod_par`),
  ADD KEY `cod_mun` (`cod_mun`),
  ADD KEY `cod_est` (`cod_est`),
  ADD KEY `cod_pai` (`cod_pai`);

--
-- Indices de la tabla `procurador_asunto`
--
ALTER TABLE `procurador_asunto`
  ADD KEY `cod_pro` (`cod_pro`),
  ADD KEY `cod_asu` (`cod_asu`);

--
-- Indices de la tabla `telefono_cliente`
--
ALTER TABLE `telefono_cliente`
  ADD PRIMARY KEY (`num_tel`),
  ADD KEY `cod_cli` (`cod_cli`);

--
-- Indices de la tabla `telefono_procurador`
--
ALTER TABLE `telefono_procurador`
  ADD PRIMARY KEY (`num_tel`),
  ADD KEY `cod_pro` (`cod_pro`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asunto`
--
ALTER TABLE `asunto`
  MODIFY `cod_asu` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `cod_cli` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `cod_est` int(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `estado_asunto`
--
ALTER TABLE `estado_asunto`
  MODIFY `cod_estasu` tinyint(1) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `municipio`
--
ALTER TABLE `municipio`
  MODIFY `cod_mun` int(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pais`
--
ALTER TABLE `pais`
  MODIFY `cod_pai` int(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `parroquia`
--
ALTER TABLE `parroquia`
  MODIFY `cod_par` int(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `procurador`
--
ALTER TABLE `procurador`
  MODIFY `cod_pro` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asunto`
--
ALTER TABLE `asunto`
  ADD CONSTRAINT `asunto_ibfk_1` FOREIGN KEY (`cod_cli`) REFERENCES `cliente` (`cod_cli`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`cod_par`) REFERENCES `parroquia` (`cod_par`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cliente_ibfk_2` FOREIGN KEY (`cod_mun`) REFERENCES `municipio` (`cod_mun`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cliente_ibfk_3` FOREIGN KEY (`cod_est`) REFERENCES `estado` (`cod_est`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cliente_ibfk_4` FOREIGN KEY (`cod_pai`) REFERENCES `pais` (`cod_pai`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `estado`
--
ALTER TABLE `estado`
  ADD CONSTRAINT `estado_ibfk_1` FOREIGN KEY (`cod_pai`) REFERENCES `pais` (`cod_pai`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `historial_estados`
--
ALTER TABLE `historial_estados`
  ADD CONSTRAINT `historial_estados_ibfk_1` FOREIGN KEY (`cod_asu`) REFERENCES `asunto` (`cod_asu`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_estados_ibfk_2` FOREIGN KEY (`cod_estasu`) REFERENCES `estado_asunto` (`cod_estasu`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD CONSTRAINT `municipio_ibfk_1` FOREIGN KEY (`cod_est`) REFERENCES `estado` (`cod_est`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `parroquia`
--
ALTER TABLE `parroquia`
  ADD CONSTRAINT `parroquia_ibfk_1` FOREIGN KEY (`cod_mun`) REFERENCES `municipio` (`cod_mun`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `procurador`
--
ALTER TABLE `procurador`
  ADD CONSTRAINT `procurador_ibfk_1` FOREIGN KEY (`cod_par`) REFERENCES `parroquia` (`cod_par`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `procurador_ibfk_2` FOREIGN KEY (`cod_mun`) REFERENCES `municipio` (`cod_mun`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `procurador_ibfk_3` FOREIGN KEY (`cod_est`) REFERENCES `estado` (`cod_est`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `procurador_ibfk_4` FOREIGN KEY (`cod_pai`) REFERENCES `pais` (`cod_pai`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `procurador_asunto`
--
ALTER TABLE `procurador_asunto`
  ADD CONSTRAINT `procurador_asunto_ibfk_1` FOREIGN KEY (`cod_pro`) REFERENCES `procurador` (`cod_pro`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `procurador_asunto_ibfk_2` FOREIGN KEY (`cod_asu`) REFERENCES `asunto` (`cod_asu`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `telefono_cliente`
--
ALTER TABLE `telefono_cliente`
  ADD CONSTRAINT `telefono_cliente_ibfk_1` FOREIGN KEY (`cod_cli`) REFERENCES `cliente` (`cod_cli`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `telefono_procurador`
--
ALTER TABLE `telefono_procurador`
  ADD CONSTRAINT `telefono_procurador_ibfk_1` FOREIGN KEY (`cod_pro`) REFERENCES `procurador` (`cod_pro`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
