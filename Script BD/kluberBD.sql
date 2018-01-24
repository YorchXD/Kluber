/*
Navicat MySQL Data Transfer

Source Server         : TaxiUber
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : kluber

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-01-24 12:33:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `usuario` varchar(100) NOT NULL,
  `clave` varchar(100) NOT NULL,
  PRIMARY KEY (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('blake', '789');
INSERT INTO `admin` VALUES ('fito', '123');
INSERT INTO `admin` VALUES ('yorch', '456');

-- ----------------------------
-- Table structure for adminrecorrido
-- ----------------------------
DROP TABLE IF EXISTS `adminrecorrido`;
CREATE TABLE `adminrecorrido` (
  `refRecorrido` varchar(256) DEFAULT NULL,
  `refAdmin` varchar(256) DEFAULT NULL,
  KEY `refRecorrido` (`refRecorrido`),
  KEY `refAdmin` (`refAdmin`),
  CONSTRAINT `adminrecorrido_ibfk_1` FOREIGN KEY (`refRecorrido`) REFERENCES `recorrido` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `adminrecorrido_ibfk_2` FOREIGN KEY (`refAdmin`) REFERENCES `admin` (`usuario`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of adminrecorrido
-- ----------------------------
INSERT INTO `adminrecorrido` VALUES ('1', 'fito');
INSERT INTO `adminrecorrido` VALUES ('2', 'yorch');
INSERT INTO `adminrecorrido` VALUES ('3', 'blake');

-- ----------------------------
-- Table structure for boleta
-- ----------------------------
DROP TABLE IF EXISTS `boleta`;
CREATE TABLE `boleta` (
  `id` varchar(100) NOT NULL,
  `fecha` date NOT NULL,
  `bajadaBandera` int(11) NOT NULL,
  `costoMetro` int(11) NOT NULL,
  `costoSegDetencion` int(11) NOT NULL,
  `distancia` int(11) NOT NULL,
  `tiempoDetencion` int(11) NOT NULL,
  `costo` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of boleta
-- ----------------------------
INSERT INTO `boleta` VALUES ('1', '2018-01-24', '500', '200', '200', '10', '10', '2000');
INSERT INTO `boleta` VALUES ('2', '2018-01-25', '500', '200', '200', '5', '10', '1000');
INSERT INTO `boleta` VALUES ('3', '2018-01-26', '500', '200', '200', '30', '10', '6000');
INSERT INTO `boleta` VALUES ('4', '2018-01-27', '500', '200', '200', '20', '20', '4000');
INSERT INTO `boleta` VALUES ('5', '2018-01-29', '500', '200', '200', '20', '15', '4000');
INSERT INTO `boleta` VALUES ('6', '2018-01-30', '500', '200', '200', '50', '30', '10000');

-- ----------------------------
-- Table structure for boletarecorrido
-- ----------------------------
DROP TABLE IF EXISTS `boletarecorrido`;
CREATE TABLE `boletarecorrido` (
  `refRecorrido` varchar(256) DEFAULT NULL,
  `refBoleta` varchar(256) DEFAULT NULL,
  KEY `refRecorrido` (`refRecorrido`),
  KEY `refBoleta` (`refBoleta`),
  CONSTRAINT `boletarecorrido_ibfk_1` FOREIGN KEY (`refRecorrido`) REFERENCES `recorrido` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `boletarecorrido_ibfk_2` FOREIGN KEY (`refBoleta`) REFERENCES `boleta` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of boletarecorrido
-- ----------------------------
INSERT INTO `boletarecorrido` VALUES ('1', '1');
INSERT INTO `boletarecorrido` VALUES ('2', '2');
INSERT INTO `boletarecorrido` VALUES ('3', '3');
INSERT INTO `boletarecorrido` VALUES ('4', '4');
INSERT INTO `boletarecorrido` VALUES ('5', '5');
INSERT INTO `boletarecorrido` VALUES ('6', '6');

-- ----------------------------
-- Table structure for empresa
-- ----------------------------
DROP TABLE IF EXISTS `empresa`;
CREATE TABLE `empresa` (
  `rut` varchar(256) NOT NULL,
  `correo` varchar(256) NOT NULL,
  `nombre` varchar(256) NOT NULL,
  `direccion` varchar(256) NOT NULL,
  `telefono` varchar(256) NOT NULL,
  `clave` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`rut`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of empresa
-- ----------------------------
INSERT INTO `empresa` VALUES ('333', 'empresa@gmail.com', 'empnose', 'los niches 59', '4545', '123123');
INSERT INTO `empresa` VALUES ('444', 'frutas@gmail.com', 'frutaExpo', 'yungay 65', '7676', '765765');
INSERT INTO `empresa` VALUES ('555', 'comp@gmail.com', 'computacionTec', 'peña 89', '5959', '987789');

-- ----------------------------
-- Table structure for empresarecorrido
-- ----------------------------
DROP TABLE IF EXISTS `empresarecorrido`;
CREATE TABLE `empresarecorrido` (
  `refRecorrido` varchar(256) DEFAULT NULL,
  `refEmpresa` varchar(256) DEFAULT NULL,
  `refPasajeros` varchar(256) DEFAULT NULL,
  KEY `refRecorrido` (`refRecorrido`),
  KEY `refEmpresa` (`refEmpresa`),
  KEY `refPasajeros` (`refPasajeros`),
  CONSTRAINT `empresarecorrido_ibfk_1` FOREIGN KEY (`refRecorrido`) REFERENCES `recorrido` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `empresarecorrido_ibfk_2` FOREIGN KEY (`refEmpresa`) REFERENCES `empresa` (`rut`) ON UPDATE CASCADE,
  CONSTRAINT `empresarecorrido_ibfk_3` FOREIGN KEY (`refPasajeros`) REFERENCES `pasajeros` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of empresarecorrido
-- ----------------------------
INSERT INTO `empresarecorrido` VALUES ('4', '333', '1');
INSERT INTO `empresarecorrido` VALUES ('5', '444', '2');
INSERT INTO `empresarecorrido` VALUES ('6', '555', '3');

-- ----------------------------
-- Table structure for encargadoempresa
-- ----------------------------
DROP TABLE IF EXISTS `encargadoempresa`;
CREATE TABLE `encargadoempresa` (
  `refEmpresa` varchar(256) DEFAULT NULL,
  `id` varchar(50) NOT NULL,
  `nombre` varchar(256) NOT NULL,
  `apellidopaterno` varchar(256) NOT NULL,
  `apellidomaterno` varchar(256) NOT NULL,
  KEY `refEmpresa` (`refEmpresa`),
  CONSTRAINT `encargadoempresa_ibfk_2` FOREIGN KEY (`refEmpresa`) REFERENCES `empresa` (`rut`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of encargadoempresa
-- ----------------------------
INSERT INTO `encargadoempresa` VALUES ('333', '1', 'ismael', 'sepulveda', 'saldivia');
INSERT INTO `encargadoempresa` VALUES ('444', '2', 'carla', 'vazquez', 'gonzalez');
INSERT INTO `encargadoempresa` VALUES ('555', '3', 'camila', 'sanchez', 'miranda');

-- ----------------------------
-- Table structure for encargadotaxi
-- ----------------------------
DROP TABLE IF EXISTS `encargadotaxi`;
CREATE TABLE `encargadotaxi` (
  `refTaxista` varchar(256) DEFAULT NULL,
  `refTaxi` varchar(256) DEFAULT NULL,
  KEY `refTaxista` (`refTaxista`),
  KEY `refTaxi` (`refTaxi`),
  CONSTRAINT `encargadotaxi_ibfk_1` FOREIGN KEY (`refTaxista`) REFERENCES `taxista` (`rut`) ON UPDATE CASCADE,
  CONSTRAINT `encargadotaxi_ibfk_2` FOREIGN KEY (`refTaxi`) REFERENCES `taxi` (`patente`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of encargadotaxi
-- ----------------------------
INSERT INTO `encargadotaxi` VALUES ('1234', '23423');
INSERT INTO `encargadotaxi` VALUES ('342', '4545');
INSERT INTO `encargadotaxi` VALUES ('432', '666');

-- ----------------------------
-- Table structure for impresora
-- ----------------------------
DROP TABLE IF EXISTS `impresora`;
CREATE TABLE `impresora` (
  `mac` varchar(256) NOT NULL,
  `modelo` varchar(256) NOT NULL,
  `marca` varchar(256) NOT NULL,
  PRIMARY KEY (`mac`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of impresora
-- ----------------------------
INSERT INTO `impresora` VALUES ('1', 'nn', 'hp');
INSERT INTO `impresora` VALUES ('2', 'nn', 'hp');
INSERT INTO `impresora` VALUES ('3', 'nn', 'hp');

-- ----------------------------
-- Table structure for impresorataxi
-- ----------------------------
DROP TABLE IF EXISTS `impresorataxi`;
CREATE TABLE `impresorataxi` (
  `refTaxi` varchar(256) DEFAULT NULL,
  `refImpresora` varchar(256) DEFAULT NULL,
  KEY `refTaxi` (`refTaxi`),
  KEY `refImpresora` (`refImpresora`),
  CONSTRAINT `impresorataxi_ibfk_1` FOREIGN KEY (`refTaxi`) REFERENCES `taxi` (`patente`) ON UPDATE CASCADE,
  CONSTRAINT `impresorataxi_ibfk_2` FOREIGN KEY (`refImpresora`) REFERENCES `impresora` (`mac`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of impresorataxi
-- ----------------------------
INSERT INTO `impresorataxi` VALUES ('23423', '1');
INSERT INTO `impresorataxi` VALUES ('4545', '2');
INSERT INTO `impresorataxi` VALUES ('666', '3');

-- ----------------------------
-- Table structure for pasajeros
-- ----------------------------
DROP TABLE IF EXISTS `pasajeros`;
CREATE TABLE `pasajeros` (
  `id` varchar(256) NOT NULL,
  `nombre` varchar(256) NOT NULL,
  `apPaterno` varchar(256) NOT NULL,
  `apMaterno` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pasajeros
-- ----------------------------
INSERT INTO `pasajeros` VALUES ('1', 'jesus', 'carcamo', 'zamorano');
INSERT INTO `pasajeros` VALUES ('2', 'cecilia', 'gonzalez', 'perez');
INSERT INTO `pasajeros` VALUES ('3', 'carolina', 'vasquez', 'mansilla');

-- ----------------------------
-- Table structure for persona
-- ----------------------------
DROP TABLE IF EXISTS `persona`;
CREATE TABLE `persona` (
  `correo` varchar(256) NOT NULL,
  `nombre` varchar(256) NOT NULL,
  `apPaterno` varchar(256) NOT NULL,
  `apMaterno` varchar(256) NOT NULL,
  `direccion` varchar(256) NOT NULL,
  `telefono` varchar(256) NOT NULL,
  `clave` varchar(256) NOT NULL,
  PRIMARY KEY (`correo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of persona
-- ----------------------------
INSERT INTO `persona` VALUES ('ddd@gmail.com', 'diego', 'cardenas', 'pizarro', 'camilo henriquez 65', '666', '6464');
INSERT INTO `persona` VALUES ('ggg@gmail.com', 'juan', 'soto', 'soto', 'san martin 2', '333', '1234');
INSERT INTO `persona` VALUES ('iii@gmail.com', 'ignacio', 'nuñez', 'diaz', 'o\'higgins 45', '444', '1111');

-- ----------------------------
-- Table structure for personarecorrido
-- ----------------------------
DROP TABLE IF EXISTS `personarecorrido`;
CREATE TABLE `personarecorrido` (
  `refRecorrido` varchar(256) DEFAULT NULL,
  `refPersona` varchar(256) DEFAULT NULL,
  KEY `refRecorrido` (`refRecorrido`),
  KEY `refPersona` (`refPersona`),
  CONSTRAINT `personarecorrido_ibfk_1` FOREIGN KEY (`refRecorrido`) REFERENCES `recorrido` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `personarecorrido_ibfk_2` FOREIGN KEY (`refPersona`) REFERENCES `persona` (`correo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of personarecorrido
-- ----------------------------
INSERT INTO `personarecorrido` VALUES ('1', 'ddd@gmail.com');
INSERT INTO `personarecorrido` VALUES ('2', 'ggg@gmail.com');
INSERT INTO `personarecorrido` VALUES ('3', 'iii@gmail.com');

-- ----------------------------
-- Table structure for recorrido
-- ----------------------------
DROP TABLE IF EXISTS `recorrido`;
CREATE TABLE `recorrido` (
  `id` varchar(256) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `lugarInicio` varchar(100) NOT NULL,
  `lugarDestino` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of recorrido
-- ----------------------------
INSERT INTO `recorrido` VALUES ('1', '2018-01-24', '09:33:20', 'Curico', 'Talca');
INSERT INTO `recorrido` VALUES ('2', '2018-01-25', '11:33:47', 'Av. Circunvalacion 32', 'Camilo Henriquez 56');
INSERT INTO `recorrido` VALUES ('3', '2018-01-29', '12:38:12', 'San Martin 132', 'Prat 345');
INSERT INTO `recorrido` VALUES ('4', '2018-01-26', '10:17:36', 'los niches 59', 'san martin 678');
INSERT INTO `recorrido` VALUES ('5', '2018-01-29', '12:18:32', 'yungay 65', 'prat 999');
INSERT INTO `recorrido` VALUES ('6', '2018-01-30', '14:19:19', 'peña 89', 'sarmiento 387');

-- ----------------------------
-- Table structure for taxi
-- ----------------------------
DROP TABLE IF EXISTS `taxi`;
CREATE TABLE `taxi` (
  `patente` varchar(256) NOT NULL,
  `marca` varchar(256) NOT NULL,
  `modelo` varchar(256) NOT NULL,
  `numTaxi` int(11) NOT NULL,
  PRIMARY KEY (`patente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of taxi
-- ----------------------------
INSERT INTO `taxi` VALUES ('23423', 'toyota', 'yaris', '1');
INSERT INTO `taxi` VALUES ('4545', 'chevrolet', 'spark', '2');
INSERT INTO `taxi` VALUES ('666', 'nissan', 'terrano', '3');

-- ----------------------------
-- Table structure for taxista
-- ----------------------------
DROP TABLE IF EXISTS `taxista`;
CREATE TABLE `taxista` (
  `rut` varchar(256) NOT NULL,
  `correo` varchar(256) NOT NULL,
  `nombre` varchar(256) NOT NULL,
  `apPaterno` varchar(256) NOT NULL,
  `apMaterno` varchar(256) NOT NULL,
  `telefono` bigint(20) NOT NULL,
  `clave` varchar(256) NOT NULL,
  PRIMARY KEY (`rut`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of taxista
-- ----------------------------
INSERT INTO `taxista` VALUES ('1234', 'rrr@gmail.com', 'pedro', 'cardenas', 'rojas', '555', '4545');
INSERT INTO `taxista` VALUES ('342', 'fff@gmail.com', 'carlos', 'nuñez', 'correa', '444', '4356');
INSERT INTO `taxista` VALUES ('432', 'ddd@gmail.com', 'cesar', 'gutierrez', 'reyes', '333', '3232');

-- ----------------------------
-- Table structure for taxistarecorrido
-- ----------------------------
DROP TABLE IF EXISTS `taxistarecorrido`;
CREATE TABLE `taxistarecorrido` (
  `refRecorrido` varchar(256) DEFAULT NULL,
  `refTaxista` varchar(256) DEFAULT NULL,
  KEY `refRecorrido` (`refRecorrido`),
  KEY `refTaxista` (`refTaxista`),
  CONSTRAINT `taxistarecorrido_ibfk_1` FOREIGN KEY (`refRecorrido`) REFERENCES `recorrido` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `taxistarecorrido_ibfk_2` FOREIGN KEY (`refTaxista`) REFERENCES `taxista` (`rut`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of taxistarecorrido
-- ----------------------------
INSERT INTO `taxistarecorrido` VALUES ('1', '1234');
INSERT INTO `taxistarecorrido` VALUES ('2', '342');
INSERT INTO `taxistarecorrido` VALUES ('3', '432');
