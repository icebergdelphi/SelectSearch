-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.5.27 - MySQL Community Server (GPL)
-- SO del servidor:              Win32
-- HeidiSQL Versión:             8.0.0.4396
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura de base de datos para mvcclientes
CREATE DATABASE IF NOT EXISTS `mvcclientes` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `mvcclientes`;


-- Volcando estructura para tabla mvcclientes.ci_sessions
CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla mvcclientes.ci_sessions: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `ci_sessions` DISABLE KEYS */;
INSERT INTO `ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
	('ffaf28676aaf7da23c1cfaf76bd446e9', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:28.0) Gecko/20100101 Firefox/28.0', 1399473837, 'a:2:{s:9:"user_data";s:0:"";s:9:"logged_in";a:2:{s:2:"id";s:1:"6";s:8:"username";s:5:"Hiber";}}');
/*!40000 ALTER TABLE `ci_sessions` ENABLE KEYS */;


-- Volcando estructura para tabla mvcclientes.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `idcliente` int(10) NOT NULL AUTO_INCREMENT,
  `Cliente` char(120) DEFAULT NULL,
  `Sexo` char(1) DEFAULT 'M',
  `Edad` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla mvcclientes.clientes: ~18 rows (aproximadamente)
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` (`idcliente`, `Cliente`, `Sexo`, `Edad`) VALUES
	(1, 'Juan Patistan Lopez Lara', 'M', 27),
	(2, 'Hortencia Ramirez Diaz', 'F', 35),
	(6, 'Esteban Rios Pascacio', 'F', 12),
	(12, 'Andres Ivan Moreno Pascacio', 'M', 12),
	(15, 'Juan Pablo Moreno Tovilla', 'M', 30),
	(16, 'Armando Diaz Lopez', 'M', 35),
	(23, 'Donaciano Tovilla Hernandez', 'M', 26),
	(27, 'Carlos Alejandro Moreno Pascacio', 'M', 2),
	(60, 'Artemio Macias Acero', 'M', 56),
	(63, 'Jock Janovich', 'M', 45),
	(66, 'Hiber Tadeo Moreno', 'M', 1),
	(67, 'Francisco Duran Diaz', 'M', 34),
	(68, 'Paco', 'M', 32),
	(69, 'Juan Querendon', 'M', 1),
	(70, 'Juan Polainas', 'F', 10),
	(71, 'Chucha Cachucha', 'M', 1),
	(72, 'Prueba', 'M', 22),
	(75, 'Testing', 'M', 1);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;


-- Volcando estructura para tabla mvcclientes.facturas
CREATE TABLE IF NOT EXISTS `facturas` (
  `IdFactura` int(10) NOT NULL AUTO_INCREMENT,
  `Idcliente` int(10) DEFAULT '0',
  `Total` double DEFAULT '0',
  PRIMARY KEY (`IdFactura`),
  KEY `FK__clientes` (`Idcliente`),
  CONSTRAINT `FK__clientes` FOREIGN KEY (`Idcliente`) REFERENCES `clientes` (`idcliente`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla mvcclientes.facturas: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
INSERT INTO `facturas` (`IdFactura`, `Idcliente`, `Total`) VALUES
	(1, 1, 100),
	(2, 1, 200),
	(3, 2, 100);
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;


-- Volcando estructura para tabla mvcclientes.users
CREATE TABLE IF NOT EXISTS `users` (
  `email_address` char(50) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` char(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla mvcclientes.users: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`email_address`, `password`, `id`, `username`) VALUES
	('andres@hotmail.com', '883768b6dd2c42aea0031b24be8a2da40fef4b64', 4, 'Andres'),
	('iceberg350@hotmail.com', '189788aebf8dbc4760d66dcf9b4cbb17a3b66307', 6, 'Hiber'),
	('jmendoza@tejidosjorgito.com', '7550d35a69be9aca9af9c29b880dc3adea01bedc', 7, 'Jose');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
