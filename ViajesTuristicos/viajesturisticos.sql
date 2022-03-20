-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-09-2018 a las 23:21:19
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `viajesturisticos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acompañante`
--

CREATE TABLE `acompañante` (
  `cod_aco` int(11) NOT NULL,
  `nombre` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `apellido` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `cedula` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `det_dir` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `cod_par` int(9) NOT NULL,
  `cod_mun` int(9) NOT NULL,
  `cod_est` int(9) NOT NULL,
  `cod_pai` int(9) NOT NULL,
  `fec_nac` date NOT NULL,
  `edad` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acompañante_cliente`
--

CREATE TABLE `acompañante_cliente` (
  `cod_aco` int(11) NOT NULL,
  `cod_cli` int(11) NOT NULL,
  `cod_tiprel` tinyint(1) NOT NULL,
  `fec_com` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cheque`
--

CREATE TABLE `cheque` (
  `cod_che` int(11) NOT NULL,
  `cod_comven` bigint(20) NOT NULL,
  `cantid` double NOT NULL
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
  `cod_pai` int(9) NOT NULL,
  `fec_nac` date NOT NULL,
  `edad` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra_viaje`
--

CREATE TABLE `compra_viaje` (
  `cod_comven` bigint(20) NOT NULL,
  `cod_via` bigint(20) NOT NULL,
  `cod_cli` int(11) NOT NULL,
  `cos_tot` double NOT NULL,
  `num_per` int(4) NOT NULL,
  `fec_pag` datetime NOT NULL,
  `efectivo` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deposito`
--

CREATE TABLE `deposito` (
  `cod_dep` int(11) NOT NULL,
  `cod_comven` bigint(20) NOT NULL,
  `cantid` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `destino_alojamiento`
--

CREATE TABLE `destino_alojamiento` (
  `cod_desalo` int(11) NOT NULL,
  `cod_destur` int(11) NOT NULL,
  `cod_tipalo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `destino_turistico`
--

CREATE TABLE `destino_turistico` (
  `cod_destur` int(11) NOT NULL,
  `descrip` varchar(200) COLLATE utf8_unicode_ci NOT NULL
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
  `nombre` varchar(60) COLLATE utf8_unicode_ci NOT NULL
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
-- Estructura de tabla para la tabla `tipo_alojamiento`
--

CREATE TABLE `tipo_alojamiento` (
  `cod_tipalo` int(11) NOT NULL,
  `descrip` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_relacion`
--

CREATE TABLE `tipo_relacion` (
  `cod_tiprel` tinyint(1) NOT NULL,
  `descrip` varchar(60) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_viaje`
--

CREATE TABLE `tipo_viaje` (
  `cod_tipvia` tinyint(1) NOT NULL,
  `descrip` varchar(35) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transferencia`
--

CREATE TABLE `transferencia` (
  `cod_tra` int(11) NOT NULL,
  `cod_comven` bigint(20) NOT NULL,
  `cantid` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `viaje`
--

CREATE TABLE `viaje` (
  `cod_via` bigint(20) NOT NULL,
  `fec_sal` date NOT NULL,
  `fec_ret` date NOT NULL,
  `cod_tipvia` tinyint(1) NOT NULL,
  `cod_desalo` int(11) NOT NULL,
  `tot_per` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acompañante`
--
ALTER TABLE `acompañante`
  ADD PRIMARY KEY (`cod_aco`),
  ADD UNIQUE KEY `cedula` (`cedula`),
  ADD UNIQUE KEY `telefono` (`telefono`),
  ADD KEY `cod_par` (`cod_par`),
  ADD KEY `cod_mun` (`cod_mun`),
  ADD KEY `cod_est` (`cod_est`),
  ADD KEY `cod_pai` (`cod_pai`);

--
-- Indices de la tabla `acompañante_cliente`
--
ALTER TABLE `acompañante_cliente`
  ADD KEY `cod_aco` (`cod_aco`),
  ADD KEY `cod_cli` (`cod_cli`),
  ADD KEY `cod_tiprel` (`cod_tiprel`);

--
-- Indices de la tabla `cheque`
--
ALTER TABLE `cheque`
  ADD PRIMARY KEY (`cod_che`),
  ADD KEY `cod_comven` (`cod_comven`);

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
-- Indices de la tabla `compra_viaje`
--
ALTER TABLE `compra_viaje`
  ADD PRIMARY KEY (`cod_comven`),
  ADD KEY `cod_via` (`cod_via`),
  ADD KEY `cod_cli` (`cod_cli`);

--
-- Indices de la tabla `deposito`
--
ALTER TABLE `deposito`
  ADD PRIMARY KEY (`cod_dep`),
  ADD KEY `cod_comven` (`cod_comven`);

--
-- Indices de la tabla `destino_alojamiento`
--
ALTER TABLE `destino_alojamiento`
  ADD PRIMARY KEY (`cod_desalo`),
  ADD KEY `cod_destur` (`cod_destur`),
  ADD KEY `cod_tipalo` (`cod_tipalo`);

--
-- Indices de la tabla `destino_turistico`
--
ALTER TABLE `destino_turistico`
  ADD PRIMARY KEY (`cod_destur`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`cod_est`),
  ADD KEY `cod_pai` (`cod_pai`);

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
-- Indices de la tabla `telefono_cliente`
--
ALTER TABLE `telefono_cliente`
  ADD PRIMARY KEY (`num_tel`),
  ADD KEY `cod_cli` (`cod_cli`);

--
-- Indices de la tabla `tipo_alojamiento`
--
ALTER TABLE `tipo_alojamiento`
  ADD PRIMARY KEY (`cod_tipalo`);

--
-- Indices de la tabla `tipo_relacion`
--
ALTER TABLE `tipo_relacion`
  ADD PRIMARY KEY (`cod_tiprel`);

--
-- Indices de la tabla `tipo_viaje`
--
ALTER TABLE `tipo_viaje`
  ADD PRIMARY KEY (`cod_tipvia`);

--
-- Indices de la tabla `transferencia`
--
ALTER TABLE `transferencia`
  ADD PRIMARY KEY (`cod_tra`),
  ADD KEY `cod_comven` (`cod_comven`);

--
-- Indices de la tabla `viaje`
--
ALTER TABLE `viaje`
  ADD PRIMARY KEY (`cod_via`),
  ADD KEY `cod_tipvia` (`cod_tipvia`),
  ADD KEY `cod_desalo` (`cod_desalo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acompañante`
--
ALTER TABLE `acompañante`
  MODIFY `cod_aco` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cheque`
--
ALTER TABLE `cheque`
  MODIFY `cod_che` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `cod_cli` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `compra_viaje`
--
ALTER TABLE `compra_viaje`
  MODIFY `cod_comven` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `deposito`
--
ALTER TABLE `deposito`
  MODIFY `cod_dep` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `destino_alojamiento`
--
ALTER TABLE `destino_alojamiento`
  MODIFY `cod_desalo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `destino_turistico`
--
ALTER TABLE `destino_turistico`
  MODIFY `cod_destur` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `cod_est` int(9) NOT NULL AUTO_INCREMENT;
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
-- AUTO_INCREMENT de la tabla `tipo_alojamiento`
--
ALTER TABLE `tipo_alojamiento`
  MODIFY `cod_tipalo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tipo_relacion`
--
ALTER TABLE `tipo_relacion`
  MODIFY `cod_tiprel` tinyint(1) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tipo_viaje`
--
ALTER TABLE `tipo_viaje`
  MODIFY `cod_tipvia` tinyint(1) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `transferencia`
--
ALTER TABLE `transferencia`
  MODIFY `cod_tra` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `viaje`
--
ALTER TABLE `viaje`
  MODIFY `cod_via` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acompañante`
--
ALTER TABLE `acompañante`
  ADD CONSTRAINT `acompañante_ibfk_1` FOREIGN KEY (`cod_par`) REFERENCES `parroquia` (`cod_par`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `acompañante_ibfk_2` FOREIGN KEY (`cod_mun`) REFERENCES `municipio` (`cod_mun`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `acompañante_ibfk_3` FOREIGN KEY (`cod_est`) REFERENCES `estado` (`cod_est`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `acompañante_ibfk_4` FOREIGN KEY (`cod_pai`) REFERENCES `pais` (`cod_pai`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `acompañante_cliente`
--
ALTER TABLE `acompañante_cliente`
  ADD CONSTRAINT `acompañante_cliente_ibfk_1` FOREIGN KEY (`cod_aco`) REFERENCES `acompañante` (`cod_aco`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `acompañante_cliente_ibfk_2` FOREIGN KEY (`cod_cli`) REFERENCES `cliente` (`cod_cli`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `acompañante_cliente_ibfk_3` FOREIGN KEY (`cod_tiprel`) REFERENCES `tipo_relacion` (`cod_tiprel`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cheque`
--
ALTER TABLE `cheque`
  ADD CONSTRAINT `cheque_ibfk_1` FOREIGN KEY (`cod_comven`) REFERENCES `compra_viaje` (`cod_comven`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`cod_par`) REFERENCES `parroquia` (`cod_par`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cliente_ibfk_2` FOREIGN KEY (`cod_mun`) REFERENCES `municipio` (`cod_mun`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cliente_ibfk_3` FOREIGN KEY (`cod_est`) REFERENCES `estado` (`cod_est`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cliente_ibfk_4` FOREIGN KEY (`cod_pai`) REFERENCES `pais` (`cod_pai`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `compra_viaje`
--
ALTER TABLE `compra_viaje`
  ADD CONSTRAINT `compra_viaje_ibfk_1` FOREIGN KEY (`cod_via`) REFERENCES `viaje` (`cod_via`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compra_viaje_ibfk_2` FOREIGN KEY (`cod_cli`) REFERENCES `cliente` (`cod_cli`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `deposito`
--
ALTER TABLE `deposito`
  ADD CONSTRAINT `deposito_ibfk_1` FOREIGN KEY (`cod_comven`) REFERENCES `compra_viaje` (`cod_comven`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `destino_alojamiento`
--
ALTER TABLE `destino_alojamiento`
  ADD CONSTRAINT `destino_alojamiento_ibfk_1` FOREIGN KEY (`cod_destur`) REFERENCES `destino_turistico` (`cod_destur`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `destino_alojamiento_ibfk_2` FOREIGN KEY (`cod_tipalo`) REFERENCES `tipo_alojamiento` (`cod_tipalo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `estado`
--
ALTER TABLE `estado`
  ADD CONSTRAINT `estado_ibfk_1` FOREIGN KEY (`cod_pai`) REFERENCES `pais` (`cod_pai`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Filtros para la tabla `telefono_cliente`
--
ALTER TABLE `telefono_cliente`
  ADD CONSTRAINT `telefono_cliente_ibfk_1` FOREIGN KEY (`cod_cli`) REFERENCES `cliente` (`cod_cli`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `transferencia`
--
ALTER TABLE `transferencia`
  ADD CONSTRAINT `transferencia_ibfk_1` FOREIGN KEY (`cod_comven`) REFERENCES `compra_viaje` (`cod_comven`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `viaje`
--
ALTER TABLE `viaje`
  ADD CONSTRAINT `viaje_ibfk_1` FOREIGN KEY (`cod_tipvia`) REFERENCES `tipo_viaje` (`cod_tipvia`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `viaje_ibfk_2` FOREIGN KEY (`cod_desalo`) REFERENCES `destino_alojamiento` (`cod_desalo`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
