-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-08-2018 a las 04:21:39
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hc_pedroemiliocarrillo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area_acceso`
--

CREATE TABLE `area_acceso` (
  `cod_areacc` int(3) NOT NULL,
  `descrip` varchar(60) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELACIONES PARA LA TABLA `area_acceso`:
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area_trabajo`
--

CREATE TABLE `area_trabajo` (
  `cod_aretra` int(11) NOT NULL,
  `descrip` varchar(40) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELACIONES PARA LA TABLA `area_trabajo`:
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia_empleado`
--

CREATE TABLE `asistencia_empleado` (
  `cod_asiemp` bigint(20) NOT NULL,
  `cod_emp` int(11) NOT NULL,
  `cod_tipasi` tinyint(1) NOT NULL,
  `cod_jor` int(11) NOT NULL,
  `momento` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELACIONES PARA LA TABLA `asistencia_empleado`:
--   `cod_emp`
--       `empleado` -> `cod_emp`
--   `cod_tipasi`
--       `tipo_asistencia` -> `cod_tipasi`
--   `cod_jor`
--       `jornada` -> `cod_jor`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia_medico`
--

CREATE TABLE `asistencia_medico` (
  `cod_asimed` bigint(20) NOT NULL,
  `cod_med` int(11) NOT NULL,
  `cod_tipasi` tinyint(1) NOT NULL,
  `cod_jor` int(11) NOT NULL,
  `momento` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELACIONES PARA LA TABLA `asistencia_medico`:
--   `cod_med`
--       `medico` -> `cod_med`
--   `cod_tipasi`
--       `tipo_asistencia` -> `cod_tipasi`
--   `cod_jor`
--       `jornada` -> `cod_jor`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consulta`
--

CREATE TABLE `consulta` (
  `cod_con` int(11) NOT NULL,
  `cod_diasem` int(11) NOT NULL,
  `cod_med` int(11) NOT NULL,
  `hora` time NOT NULL,
  `det_rev` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `cod_pac` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELACIONES PARA LA TABLA `consulta`:
--   `cod_diasem`
--       `dia_semana` -> `cod_diasem`
--   `cod_med`
--       `medico` -> `cod_med`
--   `cod_pac`
--       `paciente` -> `cod_pac`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dia`
--

CREATE TABLE `dia` (
  `cod_dia` tinyint(1) NOT NULL,
  `nom_dia` varchar(9) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELACIONES PARA LA TABLA `dia`:
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dia_semana`
--

CREATE TABLE `dia_semana` (
  `cod_diasem` int(11) NOT NULL,
  `cod_dia` tinyint(1) NOT NULL,
  `num_sem` int(9) NOT NULL,
  `año` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELACIONES PARA LA TABLA `dia_semana`:
--   `cod_dia`
--       `dia` -> `cod_dia`
--   `num_sem`
--       `semana` -> `num_sem`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `cod_emp` int(11) NOT NULL,
  `nombre` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `apellido` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `cedula` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `det_dir` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `cod_aretra` int(11) NOT NULL,
  `cod_tipemp` int(11) NOT NULL,
  `RIF` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `cod_par` int(9) NOT NULL,
  `cod_mun` int(9) NOT NULL,
  `cod_est` int(9) NOT NULL,
  `cod_pai` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELACIONES PARA LA TABLA `empleado`:
--   `cod_aretra`
--       `area_trabajo` -> `cod_aretra`
--   `cod_tipemp`
--       `tipo_empleado` -> `cod_tipemp`
--   `cod_par`
--       `parroquia` -> `cod_par`
--   `cod_mun`
--       `municipio` -> `cod_mun`
--   `cod_est`
--       `estado` -> `cod_est`
--   `cod_pai`
--       `pais` -> `cod_pai`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE `especialidad` (
  `cod_esp` int(11) NOT NULL,
  `descrip` varchar(40) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELACIONES PARA LA TABLA `especialidad`:
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `cod_est` int(9) NOT NULL,
  `cod_pai` int(9) NOT NULL,
  `nombre` varchar(70) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELACIONES PARA LA TABLA `estado`:
--   `cod_pai`
--       `pais` -> `cod_pai`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jornada`
--

CREATE TABLE `jornada` (
  `cod_jor` int(11) NOT NULL,
  `nom_jor` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `entrada` time NOT NULL,
  `salida` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELACIONES PARA LA TABLA `jornada`:
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medico`
--

CREATE TABLE `medico` (
  `cod_med` int(11) NOT NULL,
  `nombre` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `apellido` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `cedula` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `RIF` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `det_dir` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `num_cole` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `cod_esp` int(11) NOT NULL,
  `cod_tipmed` int(11) NOT NULL,
  `cod_aretra` int(11) NOT NULL,
  `cod_par` int(9) NOT NULL,
  `cod_mun` int(9) NOT NULL,
  `cod_est` int(9) NOT NULL,
  `cod_pai` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELACIONES PARA LA TABLA `medico`:
--   `cod_aretra`
--       `area_trabajo` -> `cod_aretra`
--   `cod_par`
--       `parroquia` -> `cod_par`
--   `cod_mun`
--       `municipio` -> `cod_mun`
--   `cod_est`
--       `estado` -> `cod_est`
--   `cod_pai`
--       `pais` -> `cod_pai`
--   `cod_esp`
--       `especialidad` -> `cod_esp`
--   `cod_tipmed`
--       `tipo_medico` -> `cod_tipmed`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipio`
--

CREATE TABLE `municipio` (
  `cod_mun` int(9) NOT NULL,
  `cod_est` int(9) NOT NULL,
  `nombre` varchar(70) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELACIONES PARA LA TABLA `municipio`:
--   `cod_est`
--       `estado` -> `cod_est`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE `paciente` (
  `cod_pac` int(11) NOT NULL,
  `nombre` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `apellido` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `det_dir` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `cedula` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `cod_par` int(9) NOT NULL,
  `cod_mun` int(9) NOT NULL,
  `cod_est` int(9) NOT NULL,
  `cod_pai` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELACIONES PARA LA TABLA `paciente`:
--   `cod_par`
--       `parroquia` -> `cod_par`
--   `cod_mun`
--       `municipio` -> `cod_mun`
--   `cod_est`
--       `estado` -> `cod_est`
--   `cod_pai`
--       `pais` -> `cod_pai`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente_acceso`
--

CREATE TABLE `paciente_acceso` (
  `cod_pac` int(11) NOT NULL,
  `cod_areacc` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELACIONES PARA LA TABLA `paciente_acceso`:
--   `cod_pac`
--       `paciente` -> `cod_pac`
--   `cod_areacc`
--       `area_acceso` -> `cod_areacc`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE `pais` (
  `cod_pai` int(9) NOT NULL,
  `nombre` varchar(70) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELACIONES PARA LA TABLA `pais`:
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parroquia`
--

CREATE TABLE `parroquia` (
  `cod_par` int(9) NOT NULL,
  `cod_mun` int(9) NOT NULL,
  `nombre` varchar(70) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELACIONES PARA LA TABLA `parroquia`:
--   `cod_mun`
--       `municipio` -> `cod_mun`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `semana`
--

CREATE TABLE `semana` (
  `num_sem` int(9) NOT NULL,
  `nom_sem` varchar(9) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELACIONES PARA LA TABLA `semana`:
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono_empleado`
--

CREATE TABLE `telefono_empleado` (
  `num_tel` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `cod_emp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELACIONES PARA LA TABLA `telefono_empleado`:
--   `cod_emp`
--       `empleado` -> `cod_emp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono_medico`
--

CREATE TABLE `telefono_medico` (
  `num_tel` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `cod_med` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELACIONES PARA LA TABLA `telefono_medico`:
--   `cod_med`
--       `medico` -> `cod_med`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_asistencia`
--

CREATE TABLE `tipo_asistencia` (
  `cod_tipasi` tinyint(1) NOT NULL,
  `nom_tipasi` varchar(7) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELACIONES PARA LA TABLA `tipo_asistencia`:
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_empleado`
--

CREATE TABLE `tipo_empleado` (
  `cod_tipemp` int(11) NOT NULL,
  `descrip` varchar(40) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELACIONES PARA LA TABLA `tipo_empleado`:
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_medico`
--

CREATE TABLE `tipo_medico` (
  `cod_tipmed` int(11) NOT NULL,
  `descrip` varchar(40) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELACIONES PARA LA TABLA `tipo_medico`:
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_vacaciones`
--

CREATE TABLE `tipo_vacaciones` (
  `cod_tipvac` tinyint(1) NOT NULL,
  `descrip` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELACIONES PARA LA TABLA `tipo_vacaciones`:
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vacaciones_empleado`
--

CREATE TABLE `vacaciones_empleado` (
  `cod_vacemp` bigint(20) NOT NULL,
  `cod_tipvac` tinyint(1) NOT NULL,
  `cod_emp` int(11) NOT NULL,
  `inicia` date NOT NULL,
  `finaliza` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELACIONES PARA LA TABLA `vacaciones_empleado`:
--   `cod_tipvac`
--       `tipo_vacaciones` -> `cod_tipvac`
--   `cod_emp`
--       `empleado` -> `cod_emp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vacaciones_medico`
--

CREATE TABLE `vacaciones_medico` (
  `cod_vacmed` bigint(20) NOT NULL,
  `cod_tipvac` tinyint(1) NOT NULL,
  `cod_med` int(11) NOT NULL,
  `inicia` date NOT NULL,
  `finaliza` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELACIONES PARA LA TABLA `vacaciones_medico`:
--   `cod_tipvac`
--       `tipo_vacaciones` -> `cod_tipvac`
--   `cod_med`
--       `medico` -> `cod_med`
--

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `area_acceso`
--
ALTER TABLE `area_acceso`
  ADD PRIMARY KEY (`cod_areacc`);

--
-- Indices de la tabla `area_trabajo`
--
ALTER TABLE `area_trabajo`
  ADD PRIMARY KEY (`cod_aretra`);

--
-- Indices de la tabla `asistencia_empleado`
--
ALTER TABLE `asistencia_empleado`
  ADD PRIMARY KEY (`cod_asiemp`),
  ADD KEY `cod_emp` (`cod_emp`),
  ADD KEY `cod_tipasi` (`cod_tipasi`),
  ADD KEY `cod_jor` (`cod_jor`);

--
-- Indices de la tabla `asistencia_medico`
--
ALTER TABLE `asistencia_medico`
  ADD PRIMARY KEY (`cod_asimed`),
  ADD KEY `cod_med` (`cod_med`),
  ADD KEY `cod_tipasi` (`cod_tipasi`),
  ADD KEY `cod_jor` (`cod_jor`);

--
-- Indices de la tabla `consulta`
--
ALTER TABLE `consulta`
  ADD PRIMARY KEY (`cod_con`),
  ADD KEY `cod_diasem` (`cod_diasem`),
  ADD KEY `cod_med` (`cod_med`),
  ADD KEY `cod_pac` (`cod_pac`);

--
-- Indices de la tabla `dia`
--
ALTER TABLE `dia`
  ADD PRIMARY KEY (`cod_dia`),
  ADD UNIQUE KEY `nom_dia` (`nom_dia`);

--
-- Indices de la tabla `dia_semana`
--
ALTER TABLE `dia_semana`
  ADD PRIMARY KEY (`cod_diasem`),
  ADD KEY `cod_dia` (`cod_dia`),
  ADD KEY `num_sem` (`num_sem`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`cod_emp`),
  ADD UNIQUE KEY `cedula` (`cedula`),
  ADD UNIQUE KEY `RIF` (`RIF`),
  ADD KEY `cod_aretra` (`cod_aretra`),
  ADD KEY `cod_tipemp` (`cod_tipemp`),
  ADD KEY `cod_par` (`cod_par`),
  ADD KEY `cod_est` (`cod_est`),
  ADD KEY `cod_pai` (`cod_pai`),
  ADD KEY `cod_mun` (`cod_mun`),
  ADD KEY `cod_est_2` (`cod_est`),
  ADD KEY `cod_pai_2` (`cod_pai`);

--
-- Indices de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`cod_esp`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`cod_est`),
  ADD KEY `cod_pai` (`cod_pai`);

--
-- Indices de la tabla `jornada`
--
ALTER TABLE `jornada`
  ADD PRIMARY KEY (`cod_jor`);

--
-- Indices de la tabla `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`cod_med`),
  ADD UNIQUE KEY `cedula` (`cedula`),
  ADD UNIQUE KEY `RIF` (`RIF`),
  ADD KEY `cod_esp` (`cod_esp`),
  ADD KEY `cod_tipmed` (`cod_tipmed`),
  ADD KEY `cod_aretra` (`cod_aretra`),
  ADD KEY `cod_par` (`cod_par`),
  ADD KEY `cod_mun` (`cod_mun`),
  ADD KEY `cod_est` (`cod_est`),
  ADD KEY `cod_pai` (`cod_pai`);

--
-- Indices de la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD PRIMARY KEY (`cod_mun`),
  ADD KEY `cod_est` (`cod_est`);

--
-- Indices de la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`cod_pac`),
  ADD UNIQUE KEY `cedula` (`cedula`),
  ADD KEY `cod_par` (`cod_par`),
  ADD KEY `cod_mun` (`cod_mun`),
  ADD KEY `cod_est` (`cod_est`),
  ADD KEY `cod_pai` (`cod_pai`);

--
-- Indices de la tabla `paciente_acceso`
--
ALTER TABLE `paciente_acceso`
  ADD KEY `cod_pac` (`cod_pac`),
  ADD KEY `cod_areacc` (`cod_areacc`);

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
-- Indices de la tabla `semana`
--
ALTER TABLE `semana`
  ADD PRIMARY KEY (`num_sem`),
  ADD UNIQUE KEY `nom_sem` (`nom_sem`);

--
-- Indices de la tabla `telefono_empleado`
--
ALTER TABLE `telefono_empleado`
  ADD PRIMARY KEY (`num_tel`),
  ADD KEY `cod_emp` (`cod_emp`);

--
-- Indices de la tabla `telefono_medico`
--
ALTER TABLE `telefono_medico`
  ADD PRIMARY KEY (`num_tel`),
  ADD KEY `cod_med` (`cod_med`);

--
-- Indices de la tabla `tipo_asistencia`
--
ALTER TABLE `tipo_asistencia`
  ADD PRIMARY KEY (`cod_tipasi`);

--
-- Indices de la tabla `tipo_empleado`
--
ALTER TABLE `tipo_empleado`
  ADD PRIMARY KEY (`cod_tipemp`);

--
-- Indices de la tabla `tipo_medico`
--
ALTER TABLE `tipo_medico`
  ADD PRIMARY KEY (`cod_tipmed`);

--
-- Indices de la tabla `tipo_vacaciones`
--
ALTER TABLE `tipo_vacaciones`
  ADD PRIMARY KEY (`cod_tipvac`);

--
-- Indices de la tabla `vacaciones_empleado`
--
ALTER TABLE `vacaciones_empleado`
  ADD PRIMARY KEY (`cod_vacemp`),
  ADD KEY `cod_tipvac` (`cod_tipvac`),
  ADD KEY `cod_emp` (`cod_emp`);

--
-- Indices de la tabla `vacaciones_medico`
--
ALTER TABLE `vacaciones_medico`
  ADD PRIMARY KEY (`cod_vacmed`),
  ADD KEY `cod_tipvac` (`cod_tipvac`),
  ADD KEY `cod_med` (`cod_med`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `area_acceso`
--
ALTER TABLE `area_acceso`
  MODIFY `cod_areacc` int(3) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `area_trabajo`
--
ALTER TABLE `area_trabajo`
  MODIFY `cod_aretra` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `asistencia_empleado`
--
ALTER TABLE `asistencia_empleado`
  MODIFY `cod_asiemp` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `asistencia_medico`
--
ALTER TABLE `asistencia_medico`
  MODIFY `cod_asimed` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `consulta`
--
ALTER TABLE `consulta`
  MODIFY `cod_con` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `dia`
--
ALTER TABLE `dia`
  MODIFY `cod_dia` tinyint(1) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `dia_semana`
--
ALTER TABLE `dia_semana`
  MODIFY `cod_diasem` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `cod_emp` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  MODIFY `cod_esp` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `cod_est` int(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `jornada`
--
ALTER TABLE `jornada`
  MODIFY `cod_jor` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `medico`
--
ALTER TABLE `medico`
  MODIFY `cod_med` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `municipio`
--
ALTER TABLE `municipio`
  MODIFY `cod_mun` int(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `paciente`
--
ALTER TABLE `paciente`
  MODIFY `cod_pac` int(11) NOT NULL AUTO_INCREMENT;
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
-- AUTO_INCREMENT de la tabla `semana`
--
ALTER TABLE `semana`
  MODIFY `num_sem` int(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tipo_asistencia`
--
ALTER TABLE `tipo_asistencia`
  MODIFY `cod_tipasi` tinyint(1) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tipo_empleado`
--
ALTER TABLE `tipo_empleado`
  MODIFY `cod_tipemp` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tipo_medico`
--
ALTER TABLE `tipo_medico`
  MODIFY `cod_tipmed` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tipo_vacaciones`
--
ALTER TABLE `tipo_vacaciones`
  MODIFY `cod_tipvac` tinyint(1) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `vacaciones_empleado`
--
ALTER TABLE `vacaciones_empleado`
  MODIFY `cod_vacemp` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `vacaciones_medico`
--
ALTER TABLE `vacaciones_medico`
  MODIFY `cod_vacmed` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asistencia_empleado`
--
ALTER TABLE `asistencia_empleado`
  ADD CONSTRAINT `asistencia_empleado_ibfk_1` FOREIGN KEY (`cod_emp`) REFERENCES `empleado` (`cod_emp`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `asistencia_empleado_ibfk_2` FOREIGN KEY (`cod_tipasi`) REFERENCES `tipo_asistencia` (`cod_tipasi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `asistencia_empleado_ibfk_3` FOREIGN KEY (`cod_jor`) REFERENCES `jornada` (`cod_jor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `asistencia_medico`
--
ALTER TABLE `asistencia_medico`
  ADD CONSTRAINT `asistencia_medico_ibfk_1` FOREIGN KEY (`cod_med`) REFERENCES `medico` (`cod_med`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `asistencia_medico_ibfk_2` FOREIGN KEY (`cod_tipasi`) REFERENCES `tipo_asistencia` (`cod_tipasi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `asistencia_medico_ibfk_3` FOREIGN KEY (`cod_jor`) REFERENCES `jornada` (`cod_jor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `consulta`
--
ALTER TABLE `consulta`
  ADD CONSTRAINT `consulta_ibfk_1` FOREIGN KEY (`cod_diasem`) REFERENCES `dia_semana` (`cod_diasem`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `consulta_ibfk_2` FOREIGN KEY (`cod_med`) REFERENCES `medico` (`cod_med`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `consulta_ibfk_3` FOREIGN KEY (`cod_pac`) REFERENCES `paciente` (`cod_pac`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `dia_semana`
--
ALTER TABLE `dia_semana`
  ADD CONSTRAINT `dia_semana_ibfk_1` FOREIGN KEY (`cod_dia`) REFERENCES `dia` (`cod_dia`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `dia_semana_ibfk_2` FOREIGN KEY (`num_sem`) REFERENCES `semana` (`num_sem`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`cod_aretra`) REFERENCES `area_trabajo` (`cod_aretra`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empleado_ibfk_2` FOREIGN KEY (`cod_tipemp`) REFERENCES `tipo_empleado` (`cod_tipemp`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empleado_ibfk_3` FOREIGN KEY (`cod_par`) REFERENCES `parroquia` (`cod_par`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empleado_ibfk_4` FOREIGN KEY (`cod_mun`) REFERENCES `municipio` (`cod_mun`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empleado_ibfk_5` FOREIGN KEY (`cod_est`) REFERENCES `estado` (`cod_est`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empleado_ibfk_6` FOREIGN KEY (`cod_pai`) REFERENCES `pais` (`cod_pai`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `estado`
--
ALTER TABLE `estado`
  ADD CONSTRAINT `estado_ibfk_1` FOREIGN KEY (`cod_pai`) REFERENCES `pais` (`cod_pai`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `medico`
--
ALTER TABLE `medico`
  ADD CONSTRAINT `medico_ibfk_10` FOREIGN KEY (`cod_aretra`) REFERENCES `area_trabajo` (`cod_aretra`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `medico_ibfk_11` FOREIGN KEY (`cod_par`) REFERENCES `parroquia` (`cod_par`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `medico_ibfk_12` FOREIGN KEY (`cod_mun`) REFERENCES `municipio` (`cod_mun`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `medico_ibfk_13` FOREIGN KEY (`cod_est`) REFERENCES `estado` (`cod_est`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `medico_ibfk_14` FOREIGN KEY (`cod_pai`) REFERENCES `pais` (`cod_pai`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `medico_ibfk_8` FOREIGN KEY (`cod_esp`) REFERENCES `especialidad` (`cod_esp`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `medico_ibfk_9` FOREIGN KEY (`cod_tipmed`) REFERENCES `tipo_medico` (`cod_tipmed`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD CONSTRAINT `municipio_ibfk_1` FOREIGN KEY (`cod_est`) REFERENCES `estado` (`cod_est`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD CONSTRAINT `paciente_ibfk_1` FOREIGN KEY (`cod_par`) REFERENCES `parroquia` (`cod_par`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `paciente_ibfk_2` FOREIGN KEY (`cod_mun`) REFERENCES `municipio` (`cod_mun`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `paciente_ibfk_3` FOREIGN KEY (`cod_est`) REFERENCES `estado` (`cod_est`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `paciente_ibfk_4` FOREIGN KEY (`cod_pai`) REFERENCES `pais` (`cod_pai`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `paciente_acceso`
--
ALTER TABLE `paciente_acceso`
  ADD CONSTRAINT `paciente_acceso_ibfk_1` FOREIGN KEY (`cod_pac`) REFERENCES `paciente` (`cod_pac`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `paciente_acceso_ibfk_2` FOREIGN KEY (`cod_areacc`) REFERENCES `area_acceso` (`cod_areacc`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `parroquia`
--
ALTER TABLE `parroquia`
  ADD CONSTRAINT `parroquia_ibfk_1` FOREIGN KEY (`cod_mun`) REFERENCES `municipio` (`cod_mun`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `telefono_empleado`
--
ALTER TABLE `telefono_empleado`
  ADD CONSTRAINT `telefono_empleado_ibfk_1` FOREIGN KEY (`cod_emp`) REFERENCES `empleado` (`cod_emp`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `telefono_medico`
--
ALTER TABLE `telefono_medico`
  ADD CONSTRAINT `telefono_medico_ibfk_1` FOREIGN KEY (`cod_med`) REFERENCES `medico` (`cod_med`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `vacaciones_empleado`
--
ALTER TABLE `vacaciones_empleado`
  ADD CONSTRAINT `vacaciones_empleado_ibfk_1` FOREIGN KEY (`cod_tipvac`) REFERENCES `tipo_vacaciones` (`cod_tipvac`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vacaciones_empleado_ibfk_2` FOREIGN KEY (`cod_emp`) REFERENCES `empleado` (`cod_emp`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `vacaciones_medico`
--
ALTER TABLE `vacaciones_medico`
  ADD CONSTRAINT `vacaciones_medico_ibfk_1` FOREIGN KEY (`cod_tipvac`) REFERENCES `tipo_vacaciones` (`cod_tipvac`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vacaciones_medico_ibfk_2` FOREIGN KEY (`cod_med`) REFERENCES `medico` (`cod_med`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
