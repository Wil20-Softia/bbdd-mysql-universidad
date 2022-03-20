-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-08-2018 a las 16:49:26
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `procesoelectoral`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alcalde`
--

CREATE TABLE `alcalde` (
  `cod_alc` int(11) NOT NULL,
  `fec_ini` date NOT NULL,
  `fec_fin` date NOT NULL,
  `cod_mun` int(9) NOT NULL,
  `cod_can` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `candidato`
--

CREATE TABLE `candidato` (
  `cod_can` int(11) NOT NULL,
  `cod_tipcan` tinyint(1) NOT NULL,
  `fec_pos` date NOT NULL,
  `cod_parti` int(9) NOT NULL,
  `votos_obt` int(9) NOT NULL,
  `porc_pobl` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `centro_votacion`
--

CREATE TABLE `centro_votacion` (
  `cod_cenvot` int(9) NOT NULL,
  `nombre` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `can_vot` int(4) NOT NULL,
  `cod_par` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `circuito`
--

CREATE TABLE `circuito` (
  `cod_cir` int(9) NOT NULL,
  `cod_est` int(9) NOT NULL,
  `nombre` varchar(70) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diputado_an`
--

CREATE TABLE `diputado_an` (
  `cod_dip` int(11) NOT NULL,
  `fec_ini` date NOT NULL,
  `fec_fin` date NOT NULL,
  `cod_est` int(9) NOT NULL,
  `cod_can` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eleccion`
--

CREATE TABLE `eleccion` (
  `cod_ele` int(11) NOT NULL,
  `realizacion` date NOT NULL,
  `abstencion` float NOT NULL,
  `votos_nulos` float NOT NULL,
  `cod_tipele` tinyint(1) NOT NULL,
  `tot_votantes` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eleccion_candidato`
--

CREATE TABLE `eleccion_candidato` (
  `cod_ele` int(11) NOT NULL,
  `cod_can` int(11) NOT NULL,
  `cod_parpol` int(9) NOT NULL,
  `cant_votos` int(8) NOT NULL
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
-- Estructura de tabla para la tabla `gobernador`
--

CREATE TABLE `gobernador` (
  `cod_gob` int(11) NOT NULL,
  `fec_ini` date NOT NULL,
  `fec_fin` date NOT NULL,
  `cod_est` int(9) NOT NULL,
  `cod_can` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lugar_nacimiento`
--

CREATE TABLE `lugar_nacimiento` (
  `cod_lugnac` int(9) NOT NULL,
  `nombre` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `det_dir` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `cod_par` int(9) NOT NULL,
  `cod_mun` int(9) NOT NULL,
  `cod_est` int(9) NOT NULL,
  `cod_pai` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesa_electoral`
--

CREATE TABLE `mesa_electoral` (
  `cod_mesele` int(9) NOT NULL,
  `nombre` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `can_per` int(4) NOT NULL,
  `cod_cenvot` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipio`
--

CREATE TABLE `municipio` (
  `cod_mun` int(9) NOT NULL,
  `cod_est` int(9) NOT NULL,
  `cod_cir` int(9) NOT NULL,
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
-- Estructura de tabla para la tabla `partidista`
--

CREATE TABLE `partidista` (
  `cod_parti` int(9) NOT NULL,
  `nombre1` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `nombre2` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `apellido1` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `apellido2` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `cedula` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `RIF` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `det_dir` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `fec_nac` date NOT NULL,
  `cod_parpol` int(9) NOT NULL,
  `fec_act` date NOT NULL,
  `cod_par` int(9) NOT NULL,
  `cod_mun` int(9) NOT NULL,
  `cod_est` int(9) NOT NULL,
  `cod_pai` int(9) NOT NULL,
  `cod_lugnac` int(9) NOT NULL,
  `edad` int(2) NOT NULL,
  `cod_cir` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partido_politico`
--

CREATE TABLE `partido_politico` (
  `cod_parpol` int(9) NOT NULL,
  `nombre` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `ideologia` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `fundacion` date NOT NULL,
  `can_par` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `cedula` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `apellido1` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `apellido2` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `fec_nac` date NOT NULL,
  `edad` int(2) NOT NULL,
  `cod_par` int(9) NOT NULL,
  `cod_mun` int(9) NOT NULL,
  `cod_est` int(9) NOT NULL,
  `cod_pai` int(9) NOT NULL,
  `cod_cenvot` int(9) NOT NULL,
  `cod_mesele` int(9) NOT NULL,
  `cod_lugnac` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_eleccion`
--

CREATE TABLE `persona_eleccion` (
  `cedula` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `cod_ele` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presidente`
--

CREATE TABLE `presidente` (
  `cod_pre` int(11) NOT NULL,
  `fec_ini` date NOT NULL,
  `fec_fin` date NOT NULL,
  `cod_pai` int(9) NOT NULL,
  `cod_can` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono_partidista`
--

CREATE TABLE `telefono_partidista` (
  `num_tel` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `cod_parti` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono_persona`
--

CREATE TABLE `telefono_persona` (
  `num_tel` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `cedula` varchar(15) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_candidato`
--

CREATE TABLE `tipo_candidato` (
  `cod_tipcan` tinyint(1) NOT NULL,
  `descrip` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_eleccion`
--

CREATE TABLE `tipo_eleccion` (
  `cod_tipele` tinyint(1) NOT NULL,
  `descrip` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alcalde`
--
ALTER TABLE `alcalde`
  ADD PRIMARY KEY (`cod_alc`),
  ADD KEY `cod_can` (`cod_can`),
  ADD KEY `cod_mun` (`cod_mun`);

--
-- Indices de la tabla `candidato`
--
ALTER TABLE `candidato`
  ADD PRIMARY KEY (`cod_can`),
  ADD KEY `cod_tipcan` (`cod_tipcan`),
  ADD KEY `cod_parti` (`cod_parti`);

--
-- Indices de la tabla `centro_votacion`
--
ALTER TABLE `centro_votacion`
  ADD PRIMARY KEY (`cod_cenvot`),
  ADD KEY `cod_par` (`cod_par`);

--
-- Indices de la tabla `circuito`
--
ALTER TABLE `circuito`
  ADD PRIMARY KEY (`cod_cir`),
  ADD KEY `cod_est` (`cod_est`);

--
-- Indices de la tabla `diputado_an`
--
ALTER TABLE `diputado_an`
  ADD PRIMARY KEY (`cod_dip`),
  ADD KEY `cod_est` (`cod_est`),
  ADD KEY `cod_can` (`cod_can`);

--
-- Indices de la tabla `eleccion`
--
ALTER TABLE `eleccion`
  ADD PRIMARY KEY (`cod_ele`),
  ADD KEY `cod_tipele` (`cod_tipele`);

--
-- Indices de la tabla `eleccion_candidato`
--
ALTER TABLE `eleccion_candidato`
  ADD KEY `cod_ele` (`cod_ele`),
  ADD KEY `cod_can` (`cod_can`),
  ADD KEY `cod_parpol` (`cod_parpol`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`cod_est`),
  ADD KEY `cod_pai` (`cod_pai`);

--
-- Indices de la tabla `gobernador`
--
ALTER TABLE `gobernador`
  ADD PRIMARY KEY (`cod_gob`),
  ADD KEY `cod_est` (`cod_est`),
  ADD KEY `cod_can` (`cod_can`);

--
-- Indices de la tabla `lugar_nacimiento`
--
ALTER TABLE `lugar_nacimiento`
  ADD PRIMARY KEY (`cod_lugnac`),
  ADD KEY `cod_par` (`cod_par`),
  ADD KEY `cod_mun` (`cod_mun`),
  ADD KEY `cod_est` (`cod_est`),
  ADD KEY `cod_pai` (`cod_pai`);

--
-- Indices de la tabla `mesa_electoral`
--
ALTER TABLE `mesa_electoral`
  ADD PRIMARY KEY (`cod_mesele`),
  ADD KEY `cod_cenvot` (`cod_cenvot`);

--
-- Indices de la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD PRIMARY KEY (`cod_mun`),
  ADD KEY `cod_est` (`cod_est`),
  ADD KEY `cod_cir` (`cod_cir`);

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
-- Indices de la tabla `partidista`
--
ALTER TABLE `partidista`
  ADD PRIMARY KEY (`cod_parti`),
  ADD UNIQUE KEY `cedula` (`cedula`),
  ADD UNIQUE KEY `RIF` (`RIF`),
  ADD KEY `cod_parpol` (`cod_parpol`),
  ADD KEY `cod_par` (`cod_par`),
  ADD KEY `cod_mun` (`cod_mun`),
  ADD KEY `cod_est` (`cod_est`),
  ADD KEY `cod_pai` (`cod_pai`),
  ADD KEY `cod_lugnac` (`cod_lugnac`),
  ADD KEY `cod_cir` (`cod_cir`);

--
-- Indices de la tabla `partido_politico`
--
ALTER TABLE `partido_politico`
  ADD PRIMARY KEY (`cod_parpol`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`cedula`),
  ADD KEY `cod_par` (`cod_par`),
  ADD KEY `cod_mun` (`cod_mun`),
  ADD KEY `cod_est` (`cod_est`),
  ADD KEY `cod_pai` (`cod_pai`),
  ADD KEY `cod_cenvot` (`cod_cenvot`),
  ADD KEY `cod_mesele` (`cod_mesele`),
  ADD KEY `cod_lugnac` (`cod_lugnac`);

--
-- Indices de la tabla `persona_eleccion`
--
ALTER TABLE `persona_eleccion`
  ADD KEY `cod_ele` (`cod_ele`),
  ADD KEY `cedula` (`cedula`);

--
-- Indices de la tabla `presidente`
--
ALTER TABLE `presidente`
  ADD PRIMARY KEY (`cod_pre`),
  ADD KEY `cod_can` (`cod_can`),
  ADD KEY `cod_pai` (`cod_pai`);

--
-- Indices de la tabla `telefono_partidista`
--
ALTER TABLE `telefono_partidista`
  ADD PRIMARY KEY (`num_tel`),
  ADD KEY `cod_parti` (`cod_parti`);

--
-- Indices de la tabla `telefono_persona`
--
ALTER TABLE `telefono_persona`
  ADD PRIMARY KEY (`num_tel`),
  ADD KEY `cedula` (`cedula`);

--
-- Indices de la tabla `tipo_candidato`
--
ALTER TABLE `tipo_candidato`
  ADD PRIMARY KEY (`cod_tipcan`);

--
-- Indices de la tabla `tipo_eleccion`
--
ALTER TABLE `tipo_eleccion`
  ADD PRIMARY KEY (`cod_tipele`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alcalde`
--
ALTER TABLE `alcalde`
  MODIFY `cod_alc` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `candidato`
--
ALTER TABLE `candidato`
  MODIFY `cod_can` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `centro_votacion`
--
ALTER TABLE `centro_votacion`
  MODIFY `cod_cenvot` int(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `circuito`
--
ALTER TABLE `circuito`
  MODIFY `cod_cir` int(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `diputado_an`
--
ALTER TABLE `diputado_an`
  MODIFY `cod_dip` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `eleccion`
--
ALTER TABLE `eleccion`
  MODIFY `cod_ele` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `cod_est` int(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `gobernador`
--
ALTER TABLE `gobernador`
  MODIFY `cod_gob` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `lugar_nacimiento`
--
ALTER TABLE `lugar_nacimiento`
  MODIFY `cod_lugnac` int(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mesa_electoral`
--
ALTER TABLE `mesa_electoral`
  MODIFY `cod_mesele` int(9) NOT NULL AUTO_INCREMENT;
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
-- AUTO_INCREMENT de la tabla `partidista`
--
ALTER TABLE `partidista`
  MODIFY `cod_parti` int(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `partido_politico`
--
ALTER TABLE `partido_politico`
  MODIFY `cod_parpol` int(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `presidente`
--
ALTER TABLE `presidente`
  MODIFY `cod_pre` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tipo_candidato`
--
ALTER TABLE `tipo_candidato`
  MODIFY `cod_tipcan` tinyint(1) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tipo_eleccion`
--
ALTER TABLE `tipo_eleccion`
  MODIFY `cod_tipele` tinyint(1) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alcalde`
--
ALTER TABLE `alcalde`
  ADD CONSTRAINT `alcalde_ibfk_1` FOREIGN KEY (`cod_mun`) REFERENCES `municipio` (`cod_mun`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `alcalde_ibfk_2` FOREIGN KEY (`cod_can`) REFERENCES `candidato` (`cod_can`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `candidato`
--
ALTER TABLE `candidato`
  ADD CONSTRAINT `candidato_ibfk_1` FOREIGN KEY (`cod_tipcan`) REFERENCES `tipo_candidato` (`cod_tipcan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `candidato_ibfk_2` FOREIGN KEY (`cod_parti`) REFERENCES `partidista` (`cod_parti`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `centro_votacion`
--
ALTER TABLE `centro_votacion`
  ADD CONSTRAINT `centro_votacion_ibfk_1` FOREIGN KEY (`cod_par`) REFERENCES `parroquia` (`cod_par`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `circuito`
--
ALTER TABLE `circuito`
  ADD CONSTRAINT `circuito_ibfk_1` FOREIGN KEY (`cod_est`) REFERENCES `estado` (`cod_est`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `diputado_an`
--
ALTER TABLE `diputado_an`
  ADD CONSTRAINT `diputado_an_ibfk_1` FOREIGN KEY (`cod_est`) REFERENCES `estado` (`cod_est`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `diputado_an_ibfk_2` FOREIGN KEY (`cod_can`) REFERENCES `candidato` (`cod_can`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `eleccion`
--
ALTER TABLE `eleccion`
  ADD CONSTRAINT `eleccion_ibfk_1` FOREIGN KEY (`cod_tipele`) REFERENCES `tipo_eleccion` (`cod_tipele`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `eleccion_candidato`
--
ALTER TABLE `eleccion_candidato`
  ADD CONSTRAINT `eleccion_candidato_ibfk_1` FOREIGN KEY (`cod_ele`) REFERENCES `eleccion` (`cod_ele`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `eleccion_candidato_ibfk_2` FOREIGN KEY (`cod_can`) REFERENCES `candidato` (`cod_can`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `eleccion_candidato_ibfk_3` FOREIGN KEY (`cod_parpol`) REFERENCES `partido_politico` (`cod_parpol`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `estado`
--
ALTER TABLE `estado`
  ADD CONSTRAINT `estado_ibfk_1` FOREIGN KEY (`cod_pai`) REFERENCES `pais` (`cod_pai`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `gobernador`
--
ALTER TABLE `gobernador`
  ADD CONSTRAINT `gobernador_ibfk_1` FOREIGN KEY (`cod_est`) REFERENCES `estado` (`cod_est`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `gobernador_ibfk_2` FOREIGN KEY (`cod_can`) REFERENCES `candidato` (`cod_can`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `lugar_nacimiento`
--
ALTER TABLE `lugar_nacimiento`
  ADD CONSTRAINT `lugar_nacimiento_ibfk_1` FOREIGN KEY (`cod_par`) REFERENCES `parroquia` (`cod_par`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lugar_nacimiento_ibfk_2` FOREIGN KEY (`cod_mun`) REFERENCES `municipio` (`cod_mun`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lugar_nacimiento_ibfk_3` FOREIGN KEY (`cod_est`) REFERENCES `estado` (`cod_est`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lugar_nacimiento_ibfk_4` FOREIGN KEY (`cod_pai`) REFERENCES `pais` (`cod_pai`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `mesa_electoral`
--
ALTER TABLE `mesa_electoral`
  ADD CONSTRAINT `mesa_electoral_ibfk_1` FOREIGN KEY (`cod_cenvot`) REFERENCES `centro_votacion` (`cod_cenvot`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD CONSTRAINT `municipio_ibfk_1` FOREIGN KEY (`cod_est`) REFERENCES `estado` (`cod_est`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `municipio_ibfk_2` FOREIGN KEY (`cod_cir`) REFERENCES `circuito` (`cod_cir`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `parroquia`
--
ALTER TABLE `parroquia`
  ADD CONSTRAINT `parroquia_ibfk_1` FOREIGN KEY (`cod_mun`) REFERENCES `municipio` (`cod_mun`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `partidista`
--
ALTER TABLE `partidista`
  ADD CONSTRAINT `partidista_ibfk_1` FOREIGN KEY (`cod_parpol`) REFERENCES `partido_politico` (`cod_parpol`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `partidista_ibfk_2` FOREIGN KEY (`cod_par`) REFERENCES `parroquia` (`cod_par`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `partidista_ibfk_3` FOREIGN KEY (`cod_mun`) REFERENCES `municipio` (`cod_mun`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `partidista_ibfk_4` FOREIGN KEY (`cod_est`) REFERENCES `estado` (`cod_est`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `partidista_ibfk_5` FOREIGN KEY (`cod_pai`) REFERENCES `pais` (`cod_pai`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `partidista_ibfk_6` FOREIGN KEY (`cod_lugnac`) REFERENCES `lugar_nacimiento` (`cod_lugnac`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `partidista_ibfk_7` FOREIGN KEY (`cod_cir`) REFERENCES `circuito` (`cod_cir`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`cod_par`) REFERENCES `parroquia` (`cod_par`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `persona_ibfk_2` FOREIGN KEY (`cod_mun`) REFERENCES `municipio` (`cod_mun`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `persona_ibfk_3` FOREIGN KEY (`cod_est`) REFERENCES `estado` (`cod_est`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `persona_ibfk_4` FOREIGN KEY (`cod_pai`) REFERENCES `pais` (`cod_pai`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `persona_ibfk_5` FOREIGN KEY (`cod_cenvot`) REFERENCES `centro_votacion` (`cod_cenvot`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `persona_ibfk_6` FOREIGN KEY (`cod_mesele`) REFERENCES `mesa_electoral` (`cod_mesele`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `persona_ibfk_7` FOREIGN KEY (`cod_lugnac`) REFERENCES `lugar_nacimiento` (`cod_lugnac`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `persona_eleccion`
--
ALTER TABLE `persona_eleccion`
  ADD CONSTRAINT `persona_eleccion_ibfk_1` FOREIGN KEY (`cedula`) REFERENCES `persona` (`cedula`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `persona_eleccion_ibfk_2` FOREIGN KEY (`cod_ele`) REFERENCES `eleccion` (`cod_ele`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `presidente`
--
ALTER TABLE `presidente`
  ADD CONSTRAINT `presidente_ibfk_1` FOREIGN KEY (`cod_pai`) REFERENCES `pais` (`cod_pai`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `presidente_ibfk_2` FOREIGN KEY (`cod_can`) REFERENCES `candidato` (`cod_can`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `telefono_partidista`
--
ALTER TABLE `telefono_partidista`
  ADD CONSTRAINT `telefono_partidista_ibfk_1` FOREIGN KEY (`cod_parti`) REFERENCES `partidista` (`cod_parti`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `telefono_persona`
--
ALTER TABLE `telefono_persona`
  ADD CONSTRAINT `telefono_persona_ibfk_1` FOREIGN KEY (`cedula`) REFERENCES `persona` (`cedula`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
