-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-06-2021 a las 15:36:41
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `melectrico_php`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idClientes` int(11) NOT NULL,
  `nombreCliente` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `apellidosCliente` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `dniCliente` varchar(9) COLLATE utf8_spanish2_ci NOT NULL,
  `correoCliente` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `telefonoCliente` int(9) NOT NULL,
  `direccionCliente` varchar(45) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idClientes`, `nombreCliente`, `apellidosCliente`, `dniCliente`, `correoCliente`, `telefonoCliente`, `direccionCliente`) VALUES
(1, 'Jorge', 'Rodríguez', '66756621W', 'JStudium@hotmail.com', 993225331, 'Sevilla'),
(2, 'Félix', 'Ballester', '11122266C', 'Ballester007@gmail.com', 664888000, 'Sevilla');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras_clientes`
--

CREATE TABLE `compras_clientes` (
  `idCompras_Clientes` int(11) NOT NULL,
  `idClienteFK6` int(11) NOT NULL,
  `idProductoFK7` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `compras_clientes`
--

INSERT INTO `compras_clientes` (`idCompras_Clientes`, `idClienteFK6`, `idProductoFK7`) VALUES
(1, 2, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados_autonomos`
--

CREATE TABLE `empleados_autonomos` (
  `idEmpleados_Autonomos` int(11) NOT NULL,
  `dniEmpleado` varchar(9) COLLATE utf8_spanish2_ci NOT NULL,
  `nombreEmpleado` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `apellidosEmpleado` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `telefonoEmpleado` int(9) NOT NULL,
  `correoEmpleado` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `direccionEmpleado` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `fechaingresoEmpleado` date NOT NULL,
  `idAutonomo` int(11) NOT NULL,
  `idPuntoDeVentaFK2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `empleados_autonomos`
--

INSERT INTO `empleados_autonomos` (`idEmpleados_Autonomos`, `dniEmpleado`, `nombreEmpleado`, `apellidosEmpleado`, `telefonoEmpleado`, `correoEmpleado`, `direccionEmpleado`, `fechaingresoEmpleado`, `idAutonomo`, `idPuntoDeVentaFK2`) VALUES
(1, '20086789A', 'Antonio', 'Rodíguez', 663442442, 'Anro80@gmail.com', 'Sevilla', '2021-06-02', 0, 1),
(2, '45557654Z', 'Pablo', 'Romero', 664121122, 'RomeroP@hotmail.com', 'Sevilla', '2021-06-01', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fabrica`
--

CREATE TABLE `fabrica` (
  `idFabrica` int(11) NOT NULL,
  `direccionFabrica` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `telefonoFabrica` int(9) NOT NULL,
  `idPuntoDeVentaFK1` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `fabrica`
--

INSERT INTO `fabrica` (`idFabrica`, `direccionFabrica`, `telefonoFabrica`, `idPuntoDeVentaFK1`) VALUES
(1, 'Sevilla', 954789789, 1),
(2, 'Cádiz', 666555444, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL,
  `nombreProducto` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `precioProducto` decimal(6,2) NOT NULL,
  `idFabricaFK3` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `nombreProducto`, `precioProducto`, `idFabricaFK3`) VALUES
(1, 'Cables', '10.00', 1),
(2, 'Motor', '100.00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puntodeventa`
--

CREATE TABLE `puntodeventa` (
  `idPuntoDeVenta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `puntodeventa`
--

INSERT INTO `puntodeventa` (`idPuntoDeVenta`) VALUES
(1),
(2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventalibre`
--

CREATE TABLE `ventalibre` (
  `idVentaLibre` int(11) NOT NULL,
  `idProductoFK4` int(11) NOT NULL,
  `idEmpleado_AutonomoFK5` int(11) NOT NULL,
  `comisionesVenta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `ventalibre`
--

INSERT INTO `ventalibre` (`idVentaLibre`, `idProductoFK4`, `idEmpleado_AutonomoFK5`, `comisionesVenta`) VALUES
(1, 1, 2, 20),
(2, 2, 2, 20);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idClientes`);

--
-- Indices de la tabla `compras_clientes`
--
ALTER TABLE `compras_clientes`
  ADD PRIMARY KEY (`idCompras_Clientes`),
  ADD KEY `idClienteFK6` (`idClienteFK6`,`idProductoFK7`),
  ADD KEY `idProductoFK7` (`idProductoFK7`);

--
-- Indices de la tabla `empleados_autonomos`
--
ALTER TABLE `empleados_autonomos`
  ADD PRIMARY KEY (`idEmpleados_Autonomos`),
  ADD KEY `idPuntoDeVentaFK2` (`idPuntoDeVentaFK2`);

--
-- Indices de la tabla `fabrica`
--
ALTER TABLE `fabrica`
  ADD PRIMARY KEY (`idFabrica`),
  ADD KEY `idPuntoDeVentaFK1` (`idPuntoDeVentaFK1`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `idFabricaFK3` (`idFabricaFK3`);

--
-- Indices de la tabla `puntodeventa`
--
ALTER TABLE `puntodeventa`
  ADD PRIMARY KEY (`idPuntoDeVenta`);

--
-- Indices de la tabla `ventalibre`
--
ALTER TABLE `ventalibre`
  ADD PRIMARY KEY (`idVentaLibre`),
  ADD KEY `idProductoFK4` (`idProductoFK4`),
  ADD KEY `idEmpleado_AutonomoFK5` (`idEmpleado_AutonomoFK5`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idClientes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `compras_clientes`
--
ALTER TABLE `compras_clientes`
  MODIFY `idCompras_Clientes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `empleados_autonomos`
--
ALTER TABLE `empleados_autonomos`
  MODIFY `idEmpleados_Autonomos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `fabrica`
--
ALTER TABLE `fabrica`
  MODIFY `idFabrica` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `puntodeventa`
--
ALTER TABLE `puntodeventa`
  MODIFY `idPuntoDeVenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `ventalibre`
--
ALTER TABLE `ventalibre`
  MODIFY `idVentaLibre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras_clientes`
--
ALTER TABLE `compras_clientes`
  ADD CONSTRAINT `idClienteFK6` FOREIGN KEY (`idClienteFK6`) REFERENCES `clientes` (`idClientes`),
  ADD CONSTRAINT `idProductoFK7` FOREIGN KEY (`idProductoFK7`) REFERENCES `producto` (`idProducto`);

--
-- Filtros para la tabla `empleados_autonomos`
--
ALTER TABLE `empleados_autonomos`
  ADD CONSTRAINT `idPuntoDeVentaFK2` FOREIGN KEY (`idPuntoDeVentaFK2`) REFERENCES `puntodeventa` (`idPuntoDeVenta`);

--
-- Filtros para la tabla `fabrica`
--
ALTER TABLE `fabrica`
  ADD CONSTRAINT `idPuntoDeVentaFK1` FOREIGN KEY (`idPuntoDeVentaFK1`) REFERENCES `puntodeventa` (`idPuntoDeVenta`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `idFabricaFK3` FOREIGN KEY (`idFabricaFK3`) REFERENCES `fabrica` (`idFabrica`);

--
-- Filtros para la tabla `ventalibre`
--
ALTER TABLE `ventalibre`
  ADD CONSTRAINT `idEmpleado_AutonomoFK5` FOREIGN KEY (`idEmpleado_AutonomoFK5`) REFERENCES `empleados_autonomos` (`idEmpleados_Autonomos`),
  ADD CONSTRAINT `idProductoFK4` FOREIGN KEY (`idProductoFK4`) REFERENCES `producto` (`idProducto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
