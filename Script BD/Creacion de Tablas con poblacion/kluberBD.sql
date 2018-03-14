/*
Navicat MySQL Data Transfer

Source Server         : Kluber
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : kluber

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-03-12 17:38:35
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
  `refRecorrido` int(20) DEFAULT NULL,
  `refAdmin` varchar(256) DEFAULT NULL,
  KEY `refAdmin` (`refAdmin`),
  KEY `recorrido` (`refRecorrido`),
  CONSTRAINT `adminrecorrido_ibfk_2` FOREIGN KEY (`refAdmin`) REFERENCES `admin` (`usuario`) ON UPDATE CASCADE,
  CONSTRAINT `recorrido` FOREIGN KEY (`refRecorrido`) REFERENCES `recorrido` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of adminrecorrido
-- ----------------------------
INSERT INTO `adminrecorrido` VALUES (null, 'fito');
INSERT INTO `adminrecorrido` VALUES (null, 'yorch');
INSERT INTO `adminrecorrido` VALUES (null, 'blake');

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
  `refRecorrido` int(20) DEFAULT NULL,
  `refBoleta` varchar(256) DEFAULT NULL,
  KEY `refRecorrido` (`refRecorrido`),
  KEY `refBoleta` (`refBoleta`),
  CONSTRAINT `boletarecorrido_ibfk_2` FOREIGN KEY (`refBoleta`) REFERENCES `boleta` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `recorr` FOREIGN KEY (`refRecorrido`) REFERENCES `recorrido` (`id`) ON UPDATE CASCADE
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
-- Table structure for contadorsolicitudes
-- ----------------------------
DROP TABLE IF EXISTS `contadorsolicitudes`;
CREATE TABLE `contadorsolicitudes` (
  `contador` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of contadorsolicitudes
-- ----------------------------
INSERT INTO `contadorsolicitudes` VALUES ('0');

-- ----------------------------
-- Table structure for disponibilidadchoferes
-- ----------------------------
DROP TABLE IF EXISTS `disponibilidadchoferes`;
CREATE TABLE `disponibilidadchoferes` (
  `RefTaxista` varchar(256) NOT NULL,
  `ubicacion` varchar(256) NOT NULL,
  `estado` varchar(256) NOT NULL,
  `tiempoDisponible` time NOT NULL,
  PRIMARY KEY (`RefTaxista`),
  CONSTRAINT `FK_Taxista` FOREIGN KEY (`RefTaxista`) REFERENCES `taxista` (`rut`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of disponibilidadchoferes
-- ----------------------------
INSERT INTO `disponibilidadchoferes` VALUES ('1234', '22 oriente', 'ocupado', '00:00:00');
INSERT INTO `disponibilidadchoferes` VALUES ('342', '15 sur', 'no disponible', '00:00:00');
INSERT INTO `disponibilidadchoferes` VALUES ('432', '25 norte', 'disponible', '00:00:00');
INSERT INTO `disponibilidadchoferes` VALUES ('454', '20 oriente', 'disponible', '00:00:00');
INSERT INTO `disponibilidadchoferes` VALUES ('666666666', '15 norte', 'disponible', '00:00:00');
INSERT INTO `disponibilidadchoferes` VALUES ('895869865985', '10 norte', 'disponible', '00:00:00');

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
  `refRecorrido` int(20) DEFAULT NULL,
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
INSERT INTO `encargadotaxi` VALUES ('342', '666');
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
INSERT INTO `impresorataxi` VALUES ('666', '2');
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
-- Table structure for pedido
-- ----------------------------
DROP TABLE IF EXISTS `pedido`;
CREATE TABLE `pedido` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(256) NOT NULL,
  `apellido` varchar(256) NOT NULL,
  `direccionInicial` varchar(256) NOT NULL,
  `direccionFinal` varchar(256) NOT NULL,
  `telefono` varchar(256) NOT NULL,
  `RefChoferTaxista` varchar(256) NOT NULL,
  `estado` varchar(256) NOT NULL,
  `duracion` time NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `latitudInicial` varchar(256) NOT NULL,
  `longitudInicial` varchar(256) NOT NULL,
  `latitudFinal` varchar(256) NOT NULL,
  `longitudFinal` varchar(256) NOT NULL,
  `distanciaEstimada` int(20) NOT NULL,
  `tiempoEstimado` time NOT NULL,
  `segundosEstimados` int(11) NOT NULL,
  `costoEstimado` int(20) NOT NULL,
  `tiempoEsperaComienzo` time NOT NULL,
  `segundosEsperaComienzo` int(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKChofer` (`RefChoferTaxista`),
  CONSTRAINT `FKChofer` FOREIGN KEY (`RefChoferTaxista`) REFERENCES `taxista` (`rut`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pedido
-- ----------------------------
INSERT INTO `pedido` VALUES ('1', 'yo', 'yo', 'yo', 'yo', 'yo', '1234', 'esperando', '13:36:02', '2018-02-23', '00:00:00', '0', '0', '0', '0', '0', '00:00:00', '0', '0', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('2', 'aaa', 'aaa', 'aaa', 'aaa', 'aaa', '342', 'viajando', '17:42:17', '2018-02-23', '00:00:00', '0', '0', '0', '0', '0', '00:00:00', '0', '0', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('3', 'rrr', 'rrr', 'rrrr', 'rrr', 'rrr', '432', 'viajando', '18:07:14', '2018-02-23', '00:00:00', '0', '0', '0', '0', '0', '00:00:00', '0', '0', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('5', 'ggg', 'ggg', 'ggg', 'ggg', 'ggggg', '1234', 'finalizado', '18:12:50', '2018-02-23', '02:00:00', '0', '0', '0', '0', '0', '00:00:00', '0', '0', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('6', 'ttt', 't', 't', 't', 't', '1234', 'esperando', '00:00:00', '2018-02-23', '00:00:00', '0', '0', '0', '0', '0', '00:00:00', '0', '0', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('7', 'yyy', 'y', 'y', 'y', 'y', '432', 'finalizado', '00:00:00', '2018-02-23', '00:00:00', '0', '0', '0', '0', '0', '00:00:00', '0', '0', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('10', 'frfr', 'fr', 'fr', 'fr', 'fr', '1234', 'finalizado', '10:06:48', '2018-02-27', '10:06:55', '0', '0', '0', '0', '0', '00:00:00', '0', '0', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('11', 'yuyuy', 'yyy', '(-35.42324440000001, -71.64848039999998)', '(-34.9779853, -71.25288030000002)', '7777', '1234', 'esperando', '00:00:00', '2018-02-27', '11:11:31', '0', '0', '0', '0', '0', '00:00:00', '0', '0', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('20', 'ijoq3rijorjir', 'jdjd', 'Talca, Chile', 'Curicó, Chile', '9', '666666666', 'esperando', '00:00:00', '2018-02-28', '12:59:33', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '0', '00:00:00', '0', '0', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('21', 'jljljl', 'jljl', 'Talca, Chile', 'Curicó, Chile', '98', '666666666', 'esperando', '00:00:00', '2018-02-28', '13:02:37', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '0', '00:00:00', '0', '0', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('22', 'jdjhdjdkjdssndlfsñdf', 'fsdfds', 'Talca, Chile', 'Curicó, Chile', '6767', '666666666', 'esperando', '00:00:00', '2018-02-28', '13:04:05', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '0', '00:00:00', '0', '0', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('23', 'jkjjjjj', 'jjjjj', 'Talca, Chile', 'Curicó, Chile', '87', '666666666', 'esperando', '00:00:00', '2018-02-28', '13:05:36', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '0', '00:00:00', '0', '0', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('24', 'yyyyyyuuuiiiiii', 'yyuyu', 'Talca, Chile', 'Curicó, Chile', '666', '666666666', 'esperando', '00:00:00', '2018-02-28', '13:07:38', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '0', '00:00:00', '0', '0', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('43', 'ttttt', 'tttt', 'Talca, Chile', 'Curicó, Chile', '78', '895869865985', 'esperando', '00:00:00', '2018-03-01', '09:26:05', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '0', '00:00:00', '0', '0', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('44', 'thththth', 'tht', 'Talca, Chile', 'Curicó, Chile', '7777', '666666666', 'esperando', '00:00:00', '2018-03-01', '09:28:04', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '0', '00:00:00', '0', '0', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('45', 'yyyyy', 'yyy', 'Talca, Chile', 'Curicó, Chile', '8888', '454', 'esperando', '00:00:00', '2018-03-01', '09:33:29', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '0', '00:00:00', '0', '0', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('46', 'tttt', 'ttt', 'Talca, Chile', 'Curicó, Chile', '77', '432', 'esperando', '00:00:00', '2018-03-01', '09:34:34', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '0', '00:00:00', '0', '0', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('47', 'uuuuu', 'uuu', 'Talca, Chile', 'Curicó, Chile', '777', '895869865985', 'esperando', '00:00:00', '2018-03-01', '09:48:36', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '0', '00:00:00', '0', '0', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('48', 'eeee', 'eee', 'Talca, Chile', 'Curicó, Chile', '666', '666666666', 'esperando', '00:00:00', '2018-03-01', '09:52:58', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '0', '00:00:00', '0', '0', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('51', 'kkkkk', 'kkk', 'Talca, Chile', 'Curicó, Chile', '777', '454', 'esperando', '00:00:00', '2018-03-01', '10:00:44', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '0', '00:00:00', '0', '0', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('52', 'hhhh', 'hh', 'Talca, Chile', 'Curicó, Chile', '7777', '432', 'esperando', '00:00:00', '2018-03-01', '10:04:39', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '0', '00:00:00', '0', '0', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('53', 'jjjjjjj', 'jjjj', 'Talca, Chile', 'Curicó, Chile', '999', '895869865985', 'esperando', '00:00:00', '2018-03-01', '10:06:15', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '0', '00:00:00', '0', '0', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('54', 'gghhgh', 'ghgh', 'Talca, Chile', 'Curicó, Chile', '777', '895869865985', 'esperando', '00:00:00', '2018-03-01', '10:48:24', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '0', '00:00:00', '0', '0', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('55', 'jhjhj', 'jhjh', 'Talca, Chile', 'Curicó, Chile', '55', '666666666', 'esperando', '00:00:00', '2018-03-01', '10:56:21', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '0', '00:00:00', '0', '0', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('56', 'lklklk', 'lklkl', 'Talca, Chile', 'Curicó, Chile', '555', '895869865985', 'esperando', '00:00:00', '2018-03-01', '11:04:22', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '0', '00:00:00', '0', '0', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('57', 'hhhh', 'hhh', 'Talca, Chile', 'Curicó, Chile', '555', '895869865985', 'esperando', '00:00:00', '2018-03-01', '11:13:14', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '0', '00:00:00', '0', '0', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('58', 'kkk', 'kk', 'Talca, Chile', 'Curicó, Chile', '7676', '895869865985', 'esperando', '00:00:00', '2018-03-01', '11:16:10', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '0', '00:00:00', '0', '0', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('59', 'xcfdgdfgd', 'dsfsd', 'Talca, Chile', 'Curicó, Chile', '88', '895869865985', 'esperando', '00:00:00', '2018-03-01', '11:18:30', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '0', '00:00:00', '0', '0', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('60', 'jjjjj', 'jjj', 'Talca, Chile', 'Curicó, Chile', '555', '895869865985', 'esperando', '00:00:00', '2018-03-01', '11:20:31', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '0', '00:00:00', '0', '0', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('61', 'trrr', 'tr', 'Talca, Chile', 'Curicó, Chile', '5555', '895869865985', 'esperando', '00:00:00', '2018-03-01', '11:27:19', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '0', '00:00:00', '0', '0', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('62', 'ggg', 'ggg', 'Talca, Chile', 'Curicó, Chile', '55', '895869865985', 'esperando', '00:00:00', '2018-03-01', '11:33:27', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '0', '00:00:00', '0', '0', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('63', 'gghg', 'ghg', 'Talca, Chile', 'Curicó, Chile', '555', '895869865985', 'esperando', '00:00:00', '2018-03-01', '11:34:39', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '0', '00:00:00', '0', '0', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('64', 'hhhh', 'hhh', 'Talca, Chile', 'Curicó, Chile', '555', '895869865985', 'esperando', '00:00:00', '2018-03-01', '11:38:58', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '0', '00:00:00', '0', '0', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('65', 'asdas', 'asdas', 'Talca, Chile', 'Curicó, Chile', 'asdasd', '895869865985', 'esperando', '00:00:00', '2018-03-01', '11:57:00', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '0', '00:00:00', '0', '0', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('66', 'asdada', 'asdasd', 'Talca, Chile', 'Curicó, Chile', 'asdas', '895869865985', 'esperando', '00:00:00', '2018-03-01', '13:06:01', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '0', '00:00:00', '0', '0', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('67', 'asda', 'asda', 'Talca, Chile', 'Curicó, Chile', 'asda', '895869865985', 'esperando', '00:00:00', '2018-03-01', '13:07:55', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '0', '00:00:00', '0', '0', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('68', 'asda', 'asda', 'Talca, Chile', 'Curicó, Chile', 'asda', '895869865985', 'esperando', '00:00:00', '2018-03-01', '13:09:26', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '0', '00:00:00', '0', '0', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('69', 'asdsa', 'asdas', 'Talca, Chile', 'Curicó, Chile', 'asdas', '895869865985', 'esperando', '00:00:00', '2018-03-01', '13:11:27', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '0', '00:00:00', '0', '0', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('70', 'asda', 'asdas', 'Talca, Chile', 'Curicó, Chile', 'asd', '895869865985', 'finalizado', '00:00:00', '2018-03-02', '13:13:50', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '0', '00:00:00', '0', '0', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('71', 'sdfsd', 'sdfds', 'Talca, Chile', 'Curicó, Chile', 'sdfs', '895869865985', 'viajando', '00:00:00', '2018-03-02', '13:16:39', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '0', '00:00:00', '0', '0', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('72', 'fito', 'henzi', 'Avenida Circunvalación, Curicó, Chile', 'Castro, Chile', '6565', '895869865985', 'esperando', '00:00:00', '2018-03-05', '13:27:24', '-34.9717673', '-71.21931130000002', '-42.4801402', '-73.76241370000002', '0', '00:00:00', '0', '0', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('73', 'asada', 'yooo', 'Curicó, Chile', 'Santiago, Chile', 'asda', '895869865985', 'esperando', '00:00:00', '2018-03-05', '13:29:49', '-34.9779853', '-71.25288030000002', '-33.4378305', '-70.65044920000003', '0', '00:00:00', '0', '0', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('74', 'fito', 'henzi', 'Talca, Chile', 'Santiago, Chile', '6565', '895869865985', 'esperando', '00:00:00', '2018-03-05', '16:20:44', '-35.42324440000001', '-71.64848039999998', '-33.4378305', '-70.65044920000003', '0', '00:00:00', '0', '0', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('75', 'fito', 'henzi', 'Talca, Chile', 'Curicó, Chile', '6565', '666666666', 'esperando', '00:00:00', '2018-03-05', '16:24:47', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '0', '00:00:00', '0', '0', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('76', 'fito', 'henzi', 'Talca, Chile', 'Santiago, Chile', '6565', '454', 'esperando', '00:00:00', '2018-03-05', '16:25:46', '-35.42324440000001', '-71.64848039999998', '-33.4378305', '-70.65044920000003', '0', '00:00:00', '0', '0', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('77', 'fito', 'henzi', 'Talca, Chile', 'Santiago, Chile', '6565', '432', 'esperando', '00:00:00', '2018-03-05', '16:28:34', '-35.42324440000001', '-71.64848039999998', '-33.4378305', '-70.65044920000003', '0', '00:00:00', '0', '0', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('79', 'yuuuu', 'yuuu', 'Talca, Chile', 'Curicó, Chile', '7777', '454', 'esperando', '00:00:00', '2018-03-06', '17:12:45', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '0', '00:00:00', '0', '0', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('80', 'tuuuu', 'tuu', 'Talca, Chile', 'Curicó, Chile', '888', '666666666', 'esperando', '00:00:00', '2018-03-06', '17:13:35', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '0', '00:00:00', '0', '0', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('81', 'prie', 'poee', 'Talca, Chile', 'Curicó, Chile', '888', '432', 'esperando', '00:00:00', '2018-03-06', '18:06:52', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '0', '00:00:00', '0', '0', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('82', 'ttr', 'tr', 'Talca, Chile', 'Curicó, Chile', '5', '895869865985', 'esperando', '00:00:00', '2018-03-07', '10:47:38', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '0', '00:00:00', '0', '0', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('83', 'ytyt', 'ytyt', 'Talca, Chile', 'Curicó, Chile', '65', '432', 'esperando', '00:00:00', '2018-03-07', '12:02:32', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '67032', '00:00:56', '0', '40719', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('84', 'iiiii', 'iiii', 'Talca, Chile', 'Curicó, Chile', '76', '454', 'esperando', '00:00:00', '2018-03-07', '12:13:01', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '67032', '00:56:01', '0', '40719', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('85', 'pppp', 'pp', 'Talca, Chile', 'Curicó, Chile', '87', '666666666', 'esperando', '00:00:00', '2018-03-07', '12:19:05', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '67032', '01:06:01', '0', '40719', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('86', 'ggtgtgt', 'gtgt', 'Talca, Chile', 'Curicó, Chile', '657', '432', 'esperando', '00:00:00', '2018-03-07', '14:37:11', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '67032', '01:06:01', '0', '40719', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('87', 'yyyyy', 'yyy', 'Talca, Chile', 'Curicó, Chile', '666', '454', 'esperando', '00:00:00', '2018-03-07', '14:41:03', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '67032', '01:06:01', '0', '40719', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('88', 'yyyyy', 'yyy', 'Talca, Chile', 'Curicó, Chile', '666', '454', 'esperando', '00:00:00', '2018-03-07', '14:41:23', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '67032', '01:06:01', '0', '40719', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('89', 'trtrt', 'trt', 'Talca, Chile', 'Curicó, Chile', '5', '666666666', 'esperando', '00:00:00', '2018-03-07', '14:44:30', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '67032', '01:06:01', '0', '40719', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('90', 'ytyty', 'yty', 'Talca, Chile', 'Curicó, Chile', '8787', '895869865985', 'esperando', '00:00:00', '2018-03-07', '14:48:07', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '67032', '01:06:01', '0', '40719', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('91', 'hhhhhh', 'hhh', 'Talca, Chile', 'Curicó, Chile', '777', '454', 'esperando', '00:00:00', '2018-03-07', '14:51:09', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '67032', '01:06:01', '0', '40719', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('92', 'dfd', 'fddf', 'Talca, Chile', 'Curicó, Chile', '6', '666666666', 'esperando', '00:00:00', '2018-03-07', '14:52:19', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '67032', '01:06:01', '0', '40719', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('93', 'gggg', 'ggg', 'Talca, Chile', 'Curicó, Chile', '777', '895869865985', 'esperando', '00:00:00', '2018-03-07', '14:55:30', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '67032', '01:06:01', '0', '40719', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('94', 'hhhh', 'hh', 'Talca, Chile', 'Curicó, Chile', '777', '432', 'esperando', '00:00:00', '2018-03-07', '14:56:42', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '67032', '01:06:01', '0', '40719', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('95', 'ytyt', 'yty', 'Talca, Chile', 'Curicó, Chile', '77', '454', 'esperando', '00:00:00', '2018-03-07', '14:57:35', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '67032', '01:06:01', '0', '40719', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('96', 'tttt', 'ttt', 'Talca, Chile', 'Curicó, Chile', '777', '666666666', 'esperando', '00:00:00', '2018-03-07', '14:58:47', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '67032', '01:06:01', '0', '40719', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('97', 'trtrtrtr', 'trtrtr', 'Talca, Chile', 'Curicó, Chile', '777', '895869865985', 'esperando', '00:00:00', '2018-03-07', '15:02:57', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '67032', '01:06:01', '0', '40719', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('98', 't', 't', 'Talca, Chile', 'Curicó, Chile', '6', '432', 'esperando', '00:00:00', '2018-03-07', '15:04:01', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '67032', '01:06:01', '0', '40719', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('99', 'hhhh', 'h', 'Talca, Chile', 'Curicó, Chile', '5', '454', 'esperando', '00:00:00', '2018-03-07', '15:04:44', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '67032', '01:06:01', '0', '40719', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('100', 'h', 'h', 'Talca, Chile', 'Curicó, Chile', '5', '666666666', 'esperando', '00:00:00', '2018-03-07', '15:05:17', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '67032', '01:06:01', '0', '40719', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('101', 'z', 'c', 'Talca, Chile', 'Curicó, Chile', '5', '895869865985', 'esperando', '00:00:00', '2018-03-07', '15:06:39', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '67032', '01:06:01', '0', '40719', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('102', 'b', 'b', 'Talca, Chile', 'Curicó, Chile', '5', '432', 'esperando', '00:00:00', '2018-03-07', '15:08:01', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '67032', '01:06:01', '0', '40719', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('103', 'f', 'f', 'Talca, Chile', 'Curicó, Chile', '5', '454', 'esperando', '00:00:00', '2018-03-07', '15:10:19', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '67032', '01:06:01', '0', '40719', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('104', 'ggg', 'gg', 'Talca, Chile', 'Curicó, Chile', '5', '666666666', 'esperando', '00:00:00', '2018-03-07', '15:11:07', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '67032', '01:06:01', '0', '40719', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('105', 'd', 'd', 'Talca, Chile', 'Curicó, Chile', '5', '895869865985', 'esperando', '00:00:00', '2018-03-07', '15:12:19', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '67032', '01:06:01', '0', '40719', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('106', 'x', 'x', 'Talca, Chile', 'Curicó, Chile', '5', '432', 'esperando', '00:00:00', '2018-03-07', '15:13:38', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '67032', '01:06:01', '0', '40719', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('107', 'v', 'v', 'Talca, Chile', 'Curicó, Chile', '5', '454', 'esperando', '00:00:00', '2018-03-07', '15:19:10', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '67032', '01:06:01', '0', '40719', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('108', 'b', 'b', 'Talca, Chile', 'Curicó, Chile', '5', '666666666', 'esperando', '00:00:00', '2018-03-07', '15:20:17', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '67032', '01:06:01', '0', '40719', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('109', 'ggtgt', 'gtg', 'Talca, Chile', 'Curicó, Chile', '5', '895869865985', 'esperando', '00:00:00', '2018-03-07', '16:56:28', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '67032', '01:06:01', '0', '40719', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('110', 'aaaa', 'aaa', 'Talca, Chile', 'Curicó, Chile', '5', '432', 'esperando', '00:00:00', '2018-03-08', '10:14:37', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '67032', '01:05:59', '0', '40719', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('111', 'trtrtr', 'tr', 'Talca, Chile', 'Curicó, Chile', '5', '454', 'esperando', '00:00:00', '2018-03-08', '11:41:44', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '67032', '01:05:59', '0', '40719', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('112', 'wwwww', 'www', 'Oriente 25, Talca, Chile', 'Cinco Norte, Talca, Chile', '5', '666666666', 'esperando', '00:00:00', '2018-03-09', '10:45:05', '-35.4189166', '-71.6132495', '-35.4207872', '-71.65940560000001', '6128', '00:26:15', '0', '4176', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('113', 'fiiii', 'toooo', 'Oriente 5, Talca, Chile', 'Cinco Norte, Talca, Chile', '5', '895869865985', 'esperando', '00:00:00', '2018-03-09', '18:03:57', '-35.4182757', '-71.61587220000001', '-35.4207872', '-71.65940560000001', '5951', '00:50:48', '3048', '4070', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('114', 'tax', 't', 'Oriente 20, Talca, Chile', 'Oriente 22, Talca, Chile', '5', '432', 'finalizado', '00:00:00', '2018-03-12', '10:50:55', '-35.4187397', '-71.61594200000002', '-35.4186336', '-71.6134697', '457', '00:11:43', '703', '774', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('115', 'pppp', 'ppp', 'Oriente 25, Talca, Chile', 'Oriente 20, Talca, Chile', '55', '432', 'finalizado', '00:00:00', '2018-03-12', '11:07:47', '-35.4189166', '-71.6132495', '-35.4187397', '-71.61594200000002', '477', '00:11:57', '717', '786', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('116', 'rrrr', 'rrr', 'Ruta 118 200, Talca, Chile', 'Cinco Norte, Talca, Chile', '5', '432', 'finalizado', '00:00:00', '2018-03-12', '11:26:07', '-35.3992275', '-71.62347449999999', '-35.4207872', '-71.65940560000001', '4415', '00:18:26', '1106', '3149', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('117', 'trtrt', 'trtr', 'Tres Sur, Talca, Chile', '2 Norte, Talca, Chile', '5', '432', 'finalizado', '00:00:00', '2018-03-12', '11:44:11', '-35.4302052', '-71.6542781', '-35.42452919999999', '-71.6466863', '1899', '00:32:24', '1944', '1639', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('118', 'gggg', 'ggg', 'Tres Norte, Talca, Chile', 'Dos Sur, Talca, Chile', '5', '454', 'finalizado', '00:00:00', '2018-03-12', '11:44:39', '-35.42382550000001', '-71.66235340000003', '-35.4292953', '-71.65584810000001', '1167', '00:14:44', '884', '1200', '00:00:00', '0');
INSERT INTO `pedido` VALUES ('119', 'jhjh', 'jhjh', 'Oriente 34 1/2, Talca, Chile', 'Ruta 5 2525, Talca, Chile', '5', '432', 'finalizado', '00:00:00', '2018-03-12', '12:10:32', '-35.4186431', '-71.613452', '-35.426858', '-71.63493699999998', '3651', '00:24:48', '1488', '2690', '00:20:00', '1200');
INSERT INTO `pedido` VALUES ('120', 'hghg', 'hghg', 'Avenida Lircay 3395, Talca, Chile', 'Panamericana Sur 2536, Talca, Chile', '5', '432', 'finalizado', '00:00:00', '2018-03-12', '12:53:00', '-35.4032034', '-71.63844870000003', '-35.4361576', '-71.63880410000002', '6702', '00:31:37', '1897', '4521', '00:20:00', '1200');
INSERT INTO `pedido` VALUES ('127', 'ñlaskda', 'ñlas', 'Avenida Lircay 3395, Talca, Chile', 'Calle 1 Norte 440, Talca, Chile', '45', '432', 'finalizado', '00:00:00', '2018-03-12', '14:30:53', '-35.4032034', '-71.63844870000003', '-35.4257437', '-71.67011880000001', '4657', '00:21:28', '1288', '3294', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('128', 'gghg', 'ghgh', 'Circunvalación Norte 3, Talca, Chile', '5 Norte, Talca, Chile', '5', '454', 'finalizado', '00:00:00', '2018-03-12', '14:51:13', '-35.3998563', '-71.65508349999999', '-35.42008149999999', '-71.6695446', '3452', '00:15:18', '918', '2571', '00:10:00', '600');

-- ----------------------------
-- Table structure for pedidoadmin
-- ----------------------------
DROP TABLE IF EXISTS `pedidoadmin`;
CREATE TABLE `pedidoadmin` (
  `RefAdmin` varchar(256) NOT NULL,
  `RefPedido` int(20) NOT NULL,
  KEY `FK_admin` (`RefAdmin`),
  KEY `FK_pedido` (`RefPedido`),
  CONSTRAINT `FK_admin` FOREIGN KEY (`RefAdmin`) REFERENCES `admin` (`usuario`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pedido` FOREIGN KEY (`RefPedido`) REFERENCES `pedido` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pedidoadmin
-- ----------------------------

-- ----------------------------
-- Table structure for pedidopersona
-- ----------------------------
DROP TABLE IF EXISTS `pedidopersona`;
CREATE TABLE `pedidopersona` (
  `RefPersona` varchar(256) NOT NULL,
  `RefPedido` int(20) NOT NULL,
  KEY `FKped` (`RefPedido`),
  KEY `FKpers` (`RefPersona`),
  CONSTRAINT `FKped` FOREIGN KEY (`RefPedido`) REFERENCES `pedido` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FKpers` FOREIGN KEY (`RefPersona`) REFERENCES `persona` (`correo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pedidopersona
-- ----------------------------

-- ----------------------------
-- Table structure for pedidotiempotranscurrido
-- ----------------------------
DROP TABLE IF EXISTS `pedidotiempotranscurrido`;
CREATE TABLE `pedidotiempotranscurrido` (
  `RefPedido` int(20) NOT NULL,
  `TiempoTranscurrido` time NOT NULL,
  `estado` varchar(256) NOT NULL,
  `contador` varchar(256) NOT NULL,
  `tiempoAgotado` int(20) NOT NULL,
  PRIMARY KEY (`RefPedido`),
  CONSTRAINT `FKpedido` FOREIGN KEY (`RefPedido`) REFERENCES `pedido` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pedidotiempotranscurrido
-- ----------------------------
INSERT INTO `pedidotiempotranscurrido` VALUES ('81', '00:00:05', 'finalizado', '0', '0');
INSERT INTO `pedidotiempotranscurrido` VALUES ('90', '00:00:00', 'esperando', '0', '0');
INSERT INTO `pedidotiempotranscurrido` VALUES ('107', '00:00:00', 'viajando', '0', '0');
INSERT INTO `pedidotiempotranscurrido` VALUES ('108', '00:00:00', 'esperando', '15774', '0');
INSERT INTO `pedidotiempotranscurrido` VALUES ('109', '00:00:00', 'esperando', '18', '0');
INSERT INTO `pedidotiempotranscurrido` VALUES ('110', '03:20:18', 'esperando', '12018', '0');
INSERT INTO `pedidotiempotranscurrido` VALUES ('111', '01:58:16', 'esperando', '7096', '0');
INSERT INTO `pedidotiempotranscurrido` VALUES ('112', '01:42:34', 'esperando', '6154', '1');
INSERT INTO `pedidotiempotranscurrido` VALUES ('113', '00:56:17', 'esperando', '3377', '1');
INSERT INTO `pedidotiempotranscurrido` VALUES ('114', '00:12:04', 'finalizado', '724', '1');
INSERT INTO `pedidotiempotranscurrido` VALUES ('115', '00:12:17', 'finalizado', '737', '1');
INSERT INTO `pedidotiempotranscurrido` VALUES ('116', '00:18:41', 'finalizado', '1121', '1');
INSERT INTO `pedidotiempotranscurrido` VALUES ('117', '00:33:40', 'finalizado', '2020', '1');
INSERT INTO `pedidotiempotranscurrido` VALUES ('118', '00:18:29', 'finalizado', '1109', '1');
INSERT INTO `pedidotiempotranscurrido` VALUES ('119', '00:24:52', 'finalizado', '1492', '1');
INSERT INTO `pedidotiempotranscurrido` VALUES ('120', '00:31:43', 'finalizado', '1903', '1');
INSERT INTO `pedidotiempotranscurrido` VALUES ('127', '00:21:42', 'finalizado', '1302', '1');
INSERT INTO `pedidotiempotranscurrido` VALUES ('128', '00:15:19', 'finalizado', '919', '1');

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
INSERT INTO `persona` VALUES ('f', 'f', 'f', 'f', 'f', '5', 'f');
INSERT INTO `persona` VALUES ('ggg@gmail.com', 'juan', 'soto', 'soto', 'san martin 2', '333', '1234');
INSERT INTO `persona` VALUES ('iii@gmail.com', 'ignacio', 'nuñez', 'diaz', 'o\'higgins 45', '444', '1111');
INSERT INTO `persona` VALUES ('jjj', 'r', '', '', '', '', '');

-- ----------------------------
-- Table structure for personarecorrido
-- ----------------------------
DROP TABLE IF EXISTS `personarecorrido`;
CREATE TABLE `personarecorrido` (
  `refRecorrido` int(20) DEFAULT NULL,
  `refPersona` varchar(256) DEFAULT NULL,
  KEY `refRecorrido` (`refRecorrido`),
  KEY `refPersona` (`refPersona`),
  CONSTRAINT `idRecorrido` FOREIGN KEY (`refRecorrido`) REFERENCES `recorrido` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `personarecorrido_ibfk_2` FOREIGN KEY (`refPersona`) REFERENCES `persona` (`correo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of personarecorrido
-- ----------------------------
INSERT INTO `personarecorrido` VALUES ('1', 'ddd@gmail.com');
INSERT INTO `personarecorrido` VALUES ('2', 'ggg@gmail.com');
INSERT INTO `personarecorrido` VALUES ('3', 'iii@gmail.com');
INSERT INTO `personarecorrido` VALUES (null, 'f');
INSERT INTO `personarecorrido` VALUES (null, 'iii@gmail.com');
INSERT INTO `personarecorrido` VALUES (null, 'f');
INSERT INTO `personarecorrido` VALUES (null, 'f');
INSERT INTO `personarecorrido` VALUES ('1', 'f');
INSERT INTO `personarecorrido` VALUES ('2', 'f');
INSERT INTO `personarecorrido` VALUES ('2', 'ggg@gmail.com');
INSERT INTO `personarecorrido` VALUES ('3', 'f');
INSERT INTO `personarecorrido` VALUES ('4', 'f');
INSERT INTO `personarecorrido` VALUES ('5', 'f');
INSERT INTO `personarecorrido` VALUES ('5', 'f');
INSERT INTO `personarecorrido` VALUES ('111', 'f');
INSERT INTO `personarecorrido` VALUES ('112', 'jjj');
INSERT INTO `personarecorrido` VALUES ('113', 'jjj');
INSERT INTO `personarecorrido` VALUES ('114', 'jjj');
INSERT INTO `personarecorrido` VALUES ('115', 'jjj');
INSERT INTO `personarecorrido` VALUES ('116', 'jjj');
INSERT INTO `personarecorrido` VALUES ('117', 'f');
INSERT INTO `personarecorrido` VALUES ('118', 'f');
INSERT INTO `personarecorrido` VALUES ('137', 'f');
INSERT INTO `personarecorrido` VALUES ('138', 'f');
INSERT INTO `personarecorrido` VALUES ('139', 'f');
INSERT INTO `personarecorrido` VALUES ('140', 'f');
INSERT INTO `personarecorrido` VALUES ('141', 'f');
INSERT INTO `personarecorrido` VALUES ('142', 'f');
INSERT INTO `personarecorrido` VALUES ('143', 'f');
INSERT INTO `personarecorrido` VALUES ('144', 'f');
INSERT INTO `personarecorrido` VALUES ('145', 'f');
INSERT INTO `personarecorrido` VALUES ('146', 'f');
INSERT INTO `personarecorrido` VALUES ('147', 'f');
INSERT INTO `personarecorrido` VALUES ('148', 'f');
INSERT INTO `personarecorrido` VALUES ('149', 'f');
INSERT INTO `personarecorrido` VALUES ('150', 'f');
INSERT INTO `personarecorrido` VALUES ('151', 'f');
INSERT INTO `personarecorrido` VALUES ('152', 'f');
INSERT INTO `personarecorrido` VALUES ('153', 'f');
INSERT INTO `personarecorrido` VALUES ('154', 'f');
INSERT INTO `personarecorrido` VALUES ('155', 'f');
INSERT INTO `personarecorrido` VALUES ('156', 'f');
INSERT INTO `personarecorrido` VALUES ('158', 'f');
INSERT INTO `personarecorrido` VALUES ('159', 'f');
INSERT INTO `personarecorrido` VALUES ('161', 'f');
INSERT INTO `personarecorrido` VALUES ('162', 'f');
INSERT INTO `personarecorrido` VALUES ('163', 'f');
INSERT INTO `personarecorrido` VALUES ('164', 'f');
INSERT INTO `personarecorrido` VALUES ('165', 'f');
INSERT INTO `personarecorrido` VALUES ('166', 'f');
INSERT INTO `personarecorrido` VALUES ('167', 'f');
INSERT INTO `personarecorrido` VALUES ('168', 'f');
INSERT INTO `personarecorrido` VALUES ('169', 'f');
INSERT INTO `personarecorrido` VALUES ('170', 'f');
INSERT INTO `personarecorrido` VALUES ('171', 'f');
INSERT INTO `personarecorrido` VALUES ('172', 'f');
INSERT INTO `personarecorrido` VALUES ('173', 'f');

-- ----------------------------
-- Table structure for precios
-- ----------------------------
DROP TABLE IF EXISTS `precios`;
CREATE TABLE `precios` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `costoInicial` int(20) NOT NULL,
  `costoMetro` int(20) NOT NULL,
  `costoTiempo` int(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of precios
-- ----------------------------
INSERT INTO `precios` VALUES ('1', '500', '120', '120');

-- ----------------------------
-- Table structure for recorrido /*modificada */
-- ----------------------------
DROP TABLE IF EXISTS `recorrido`;
CREATE TABLE `recorrido` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `RefPedido` int(11) DEFAULT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `lugarInicio` varchar(100) NOT NULL,
  `lugarDestino` varchar(100) NOT NULL,
  `latitudInicio` varchar(200) NOT NULL,
  `longitudInicio` varchar(200) NOT NULL,
  `latitudDestino` varchar(200) NOT NULL,
  `longitudDestino` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_RefPedido` (`RefPedido`),
  CONSTRAINT `FK_RefPedido` FOREIGN KEY (`RefPedido`) REFERENCES `pedido` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of recorrido  /*modificada*/
-- ----------------------------
INSERT INTO `recorrido` VALUES ('1', null, '2018-01-24', '09:33:20', 'Curico', 'Talca', '', '', '', '');
INSERT INTO `recorrido` VALUES ('2', null, '2018-01-25', '11:33:47', 'Av. Circunvalacion 32', 'Camilo Henriquez 56', '', '', '', '');
INSERT INTO `recorrido` VALUES ('3', null, '2018-01-29', '12:38:12', 'San Martin 132', 'Prat 345', '', '', '', '');
INSERT INTO `recorrido` VALUES ('4', null, '2018-01-26', '10:17:36', 'los niches 59', 'san martin 678', '', '', '', '');
INSERT INTO `recorrido` VALUES ('5', null, '2018-01-29', '12:18:32', 'yungay 65', 'prat 999', '', '', '', '');
INSERT INTO `recorrido` VALUES ('6', null, '2018-01-30', '14:19:19', 'peña 89', 'sarmiento 387', '', '', '', '');
INSERT INTO `recorrido` VALUES ('99', null, '2018-02-14', '17:06:02', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '21 Nte. A, Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('100', null, '2018-02-14', '17:07:57', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('101', null, '2018-02-14', '17:13:11', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '21 Nte. A, Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('102', null, '2018-02-14', '17:15:22', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '24 Ote., Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('103', null, '2018-02-14', '17:16:21', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '24 Ote., Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('104', null, '2018-02-14', '17:18:47', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'CircunvalaciÃ³n 2475, Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('105', null, '2018-02-14', '17:20:14', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('106', null, '2018-02-14', '17:30:29', '19 Norte A, Talca, VII RegiÃ³n, Chile', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('107', null, '2018-02-14', '17:37:43', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 1/2 Ote., Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('108', null, '2018-02-14', '17:39:14', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('109', null, '2018-02-14', '17:46:51', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('110', null, '2018-02-14', '17:49:13', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '21 Nte. A, Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('111', null, '2018-02-14', '17:52:41', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('112', null, '2018-02-14', '17:57:54', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('113', null, '2018-02-14', '18:07:02', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('114', null, '2018-02-14', '18:08:24', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('115', null, '2018-02-14', '18:10:02', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '24 Ote., Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('116', null, '2018-02-14', '18:12:12', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('117', null, '2018-02-14', '18:13:55', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('118', null, '2018-02-14', '18:31:38', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Ote., Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('119', null, '2018-02-15', '10:00:14', 'Unnamed Road, ChÃ©pica, VI RegiÃ³n, Chile', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('120', null, '2018-02-15', '10:00:17', 'Unnamed Road, ChÃ©pica, VI RegiÃ³n, Chile', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('121', null, '2018-02-15', '10:00:24', 'Unnamed Road, ChÃ©pica, VI RegiÃ³n, Chile', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('122', null, '2018-02-15', '10:00:25', 'Unnamed Road, ChÃ©pica, VI RegiÃ³n, Chile', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('123', null, '2018-02-15', '10:00:25', 'Unnamed Road, ChÃ©pica, VI RegiÃ³n, Chile', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('124', null, '2018-02-15', '10:00:25', 'Unnamed Road, ChÃ©pica, VI RegiÃ³n, Chile', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('125', null, '2018-02-15', '10:01:45', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('126', null, '2018-02-15', '10:01:47', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('127', null, '2018-02-15', '10:01:47', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('128', null, '2018-02-15', '10:03:36', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('129', null, '2018-02-15', '10:06:23', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('130', null, '2018-02-15', '10:11:35', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('131', null, '2018-02-15', '10:11:39', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('132', null, '2018-02-15', '10:11:39', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('133', null, '2018-02-15', '10:11:40', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('134', null, '2018-02-15', '10:11:57', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('135', null, '2018-02-15', '10:14:44', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('136', null, '2018-02-15', '10:17:10', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('137', null, '2018-02-15', '10:57:53', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 1/2 Ote., Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('138', null, '2018-02-15', '11:17:48', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('139', null, '2018-02-15', '11:34:12', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('140', null, '2018-02-15', '11:46:08', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.40927221123707', '-71.6194847971201', '-35.407028703458', '-71.61983717232943');
INSERT INTO `recorrido` VALUES ('141', null, '2018-02-15', '11:47:41', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '24 Ote., Talca, VII RegiÃ³n, Chile', '-35.40956542024607', '-71.61964070051908', '-35.410453785111656', '-71.62139989435673');
INSERT INTO `recorrido` VALUES ('142', null, '2018-02-15', '11:48:46', 'Calle 13 Ote. 3262, Talca, VII RegiÃ³n, Chile', 'Pasaje Doce 12 1/2 Oriente C 3224, Talca, VII RegiÃ³n, Chile', '-35.40982966267957', '-71.63536079227924', '-35.4086849702286', '-71.63662645965815');
INSERT INTO `recorrido` VALUES ('143', null, '2018-02-15', '12:18:42', 'Diego Portales 1110, CuricÃ³, VII RegiÃ³n, Chile', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile', '-34.9779853', '-71.2528803', '-35.42324440000001', '-71.6484804');
INSERT INTO `recorrido` VALUES ('144', null, '2018-02-15', '12:24:07', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile', 'Diego Portales 1110, CuricÃ³, VII RegiÃ³n, Chile', '-35.42324440000001', '-71.6484804', '-34.9779853', '-71.2528803');
INSERT INTO `recorrido` VALUES ('145', null, '2018-02-15', '12:28:54', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile', 'Diego Portales 1110, CuricÃ³, VII RegiÃ³n, Chile', '-35.42324440000001', '-71.6484804', '-34.9779853', '-71.2528803');
INSERT INTO `recorrido` VALUES ('146', null, '2018-02-15', '12:37:47', '21 Nte. A, Talca, VII RegiÃ³n, Chile', 'Pje B 1998, Talca, VII RegiÃ³n, Chile', '-35.41171376536334', '-71.6197369247675', '-35.41646932334171', '-71.6455940902233');
INSERT INTO `recorrido` VALUES ('147', null, '2018-02-15', '12:39:47', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile', 'Diego Portales 1110, CuricÃ³, VII RegiÃ³n, Chile', '-35.42324440000001', '-71.6484804', '-34.9779853', '-71.2528803');
INSERT INTO `recorrido` VALUES ('148', null, '2018-02-15', '13:36:51', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.40929680476436', '-71.62065993994474', '-35.407361271221035', '-71.61964975297451');
INSERT INTO `recorrido` VALUES ('149', null, '2018-02-15', '13:44:39', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.40917438357642', '-71.6187971457839', '-35.40829338275761', '-71.62280537188053');
INSERT INTO `recorrido` VALUES ('150', null, '2018-02-15', '13:53:22', 'Diego Portales 1110, CuricÃ³, VII RegiÃ³n, Chile', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile', '-34.9779853', '-71.2528803', '-35.42324440000001', '-71.6484804');
INSERT INTO `recorrido` VALUES ('151', null, '2018-02-15', '13:57:15', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile', 'Diego Portales 1110, CuricÃ³, VII RegiÃ³n, Chile', '-35.42324440000001', '-71.6484804', '-34.9779853', '-71.2528803');
INSERT INTO `recorrido` VALUES ('152', null, '2018-02-22', '16:59:52', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 1/2 Ote., Talca, VII RegiÃ³n, Chile', '-35.40875547216711', '-71.61843907088041', '-35.410003728835136', '-71.62238124758005');
INSERT INTO `recorrido` VALUES ('153', null, '2018-02-22', '17:04:36', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile', 'Diego Portales 1110, CuricÃ³, VII RegiÃ³n, Chile', '-35.42324440000001', '-71.6484804', '-34.9779853', '-71.2528803');
INSERT INTO `recorrido` VALUES ('154', null, '2018-02-22', '17:13:51', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.40849641822954', '-71.61912839859724', '-35.41022588807627', '-71.62029784172773');
INSERT INTO `recorrido` VALUES ('155', null, '2018-02-23', '14:13:09', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'VeintidÃ³s Sur 41, Talca, VII RegiÃ³n, Chile', '-35.408788263745414', '-71.6188544780016', '-35.43734630031883', '-71.69154100120068');
INSERT INTO `recorrido` VALUES ('156', null, '2018-02-23', '14:13:52', 'Unnamed Road, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.408309778642426', '-71.61805283278227', '-35.41004034552957', '-71.6206069663167');
INSERT INTO `recorrido` VALUES ('157', null, '2018-03-05', '13:40:57', 'Ocho Ote 301-337, Talca, VII RegiÃ³n, Chile', 'Pasaje Doce 1/2 Oriente A 2813, Talca, VII RegiÃ³n, Chile', '-35.43649920736144', '-71.65637154132128', '-35.41177606706376', '-71.64384227246046');
INSERT INTO `recorrido` VALUES ('158', null, '2018-03-06', '10:21:35', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '22 Ote. B, Talca, VII RegiÃ³n, Chile', '-35.40919405842274', '-71.61969233304262', '-35.40921919849715', '-71.6238071769476');
INSERT INTO `recorrido` VALUES ('159', null, '2018-03-06', '10:24:31', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '24 Ote., Talca, VII RegiÃ³n, Chile', '-35.409015618321355', '-71.61856949329376', '-35.410416348832335', '-71.6214183345437');
INSERT INTO `recorrido` VALUES ('160', null, '2018-03-07', '11:58:36', 'Unnamed Road, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.40615341789821', '-71.61928899586201', '-35.407208241032144', '-71.61958571523428');
INSERT INTO `recorrido` VALUES ('161', null, '2018-03-07', '15:06:46', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile', 'Diego Portales 1110, CuricÃ³, VII RegiÃ³n, Chile', '-35.42324440000001', '-71.6484804', '-34.9779853', '-71.2528803');
INSERT INTO `recorrido` VALUES ('162', null, '2018-03-07', '18:41:53', 'Dos Nte 2004-2012, Talca, VII RegiÃ³n, Chile', '2 Nte. 1300, Talca, VII RegiÃ³n, Chile', '-35.42553317942174', '-71.64677426218987', '-35.425085119824395', '-71.64600614458323');
INSERT INTO `recorrido` VALUES ('163', null, '2018-03-08', '10:52:03', 'Cost 2629-2641, Talca, VII RegiÃ³n, Chile', 'Diez Sur 1730, Talca, VII RegiÃ³n, Chile', '-35.44156742751857', '-71.64318345487118', '-35.4386001235838', '-71.6532863304019');
INSERT INTO `recorrido` VALUES ('164', null, '2018-03-08', '11:24:48', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', '-35.41381751411793', '-71.6216466575861', '-35.41299503932757', '-71.62283889949322');
INSERT INTO `recorrido` VALUES ('165', null, '2018-03-08', '11:52:50', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '22 Nte., Talca, VII RegiÃ³n, Chile', '-35.409305549127815', '-71.61858525127172', '-35.414276292920135', '-71.61555804312229');
INSERT INTO `recorrido` VALUES ('166', null, '2018-03-08', '16:56:46', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.40977255141004', '-71.61895137280226', '-35.40696421193344', '-71.61914683878422');
INSERT INTO `recorrido` VALUES ('167', null, '2018-03-08', '16:58:13', '19 Norte A 3110, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.41314477954901', '-71.62402912974358', '-35.40929762454847', '-71.61961019039153');
INSERT INTO `recorrido` VALUES ('168', null, '2018-03-08', '16:59:29', 'Unnamed Road, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.40821659531932', '-71.61794286221266', '-35.40956159459951', '-71.62066295742989');
INSERT INTO `recorrido` VALUES ('169', null, '2018-03-08', '17:31:38', '19 Norte A 3110, Talca, VII RegiÃ³n, Chile', '22 Nte., Talca, VII RegiÃ³n, Chile', '-35.412934378063795', '-71.6240331530571', '-35.41453724098413', '-71.61453746259212');
INSERT INTO `recorrido` VALUES ('170', null, '2018-03-08', '17:33:05', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', '-35.41197991351888', '-71.6212198510766', '-35.4116500973478', '-71.62408411502838');
INSERT INTO `recorrido` VALUES ('171', null, '2018-03-08', '18:04:29', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.409491639887584', '-71.61875456571579', '-35.408775693641985', '-71.61884643137455');
INSERT INTO `recorrido` VALUES ('172', null, '2018-03-08', '18:05:52', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.40930992130918', '-71.61862883716822', '-35.40695765347043', '-71.61913108080624');
INSERT INTO `recorrido` VALUES ('173', null, '2018-03-08', '18:29:24', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.40954110006129', '-71.6188095510006', '-35.4075181268631', '-71.61941941827536');
INSERT INTO `recorrido` VALUES ('174', null, '2018-03-12', '11:33:40', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.40956815285064', '-71.61883972585201', '-35.40754490706418', '-71.61941036581992');
INSERT INTO `recorrido` VALUES ('175', '151', '2018-03-12', '11:41:34', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.40933588113118', '-71.61867778748274', '-35.40875246627177', '-71.61894768476486');
INSERT INTO `recorrido` VALUES ('176', '152', '2018-03-12', '11:42:50', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.40956678654837', '-71.61881156265736', '-35.40900031562964', '-71.61935973912477');
INSERT INTO `recorrido` VALUES ('177', '153', '2018-03-12', '11:46:42', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.40930664217318', '-71.61949452012777', '-35.40863632932034', '-71.62020362913607');
INSERT INTO `recorrido` VALUES ('178', '154', '2018-03-12', '11:51:00', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'Unnamed Road, Talca, VII RegiÃ³n, Chile', '-35.40983430809206', '-71.61889303475618', '-35.40786954797755', '-71.6186224669218');
INSERT INTO `recorrido` VALUES ('179', '155', '2018-03-12', '11:53:08', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.40977610378684', '-71.61893259733915', '-35.40755529122138', '-71.61946032196283');
INSERT INTO `recorrido` VALUES ('180', '156', '2018-03-12', '11:56:52', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.40950284357599', '-71.61963768303394', '-35.40955312352435', '-71.61916561424732');
INSERT INTO `recorrido` VALUES ('181', '157', '2018-03-12', '12:00:34', '21 Nte. A, Talca, VII RegiÃ³n, Chile', '19 Norte A 3110, Talca, VII RegiÃ³n, Chile', '-35.411109053812446', '-71.62031896412373', '-35.41390331333013', '-71.622706130147');
INSERT INTO `recorrido` VALUES ('182', '158', '2018-03-12', '12:01:04', '19 Norte A 3110, Talca, VII RegiÃ³n, Chile', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', '-35.414360725422846', '-71.62388227880001', '-35.41398556025988', '-71.62032768130302');
INSERT INTO `recorrido` VALUES ('183', '159', '2018-03-12', '12:08:04', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.409517872911664', '-71.61872137337923', '-35.407514027851946', '-71.61950659006834');
INSERT INTO `recorrido` VALUES ('184', '160', '2018-03-12', '12:08:34', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.409828842900865', '-71.61893092095852', '-35.40820675777746', '-71.61876898258924');
INSERT INTO `recorrido` VALUES ('185', '161', '2018-03-12', '12:08:51', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.409297351287115', '-71.61862045526503', '-35.408721040995545', '-71.61913476884365');
INSERT INTO `recorrido` VALUES ('186', '162', '2018-03-12', '12:13:12', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.409478523372336', '-71.61873243749142', '-35.40819090840193', '-71.61875490099192');
INSERT INTO `recorrido` VALUES ('187', '163', '2018-03-12', '12:13:45', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'Unnamed Road, Talca, VII RegiÃ³n, Chile', '-35.40902244987922', '-71.6193151473999', '-35.408469365080435', '-71.618229188025');
INSERT INTO `recorrido` VALUES ('188', '164', '2018-03-12', '14:53:16', 'Unnamed Road, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.40849505190909', '-71.61815911531447', '-35.4091353071313', '-71.62059355527161');
INSERT INTO `recorrido` VALUES ('189', '165', '2018-03-12', '17:14:14', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.40906699162228', '-71.61848533898592', '-35.407651754512514', '-71.61952134221792');
INSERT INTO `recorrido` VALUES ('190', '166', '2018-03-12', '17:15:04', '21 Nte. A, Talca, VII RegiÃ³n, Chile', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', '-35.41078688525463', '-71.61974564194679', '-35.411935646638135', '-71.62305783480406');
INSERT INTO `recorrido` VALUES ('191', '167', '2018-03-12', '17:16:14', '22 Nte., Talca, VII RegiÃ³n, Chile', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', '-35.41493071081271', '-71.61595936864614', '-35.41300432978736', '-71.61964405328035');
INSERT INTO `recorrido` VALUES ('192', '168', '2018-03-12', '17:18:03', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile', 'Diego Portales 1110, CuricÃ³, VII RegiÃ³n, Chile', '-35.42324440000001', '-71.6484804', '-34.9779853', '-71.2528803');
INSERT INTO `recorrido` VALUES ('193', '169', '2018-03-12', '17:19:16', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile', 'Diego Portales 1110, CuricÃ³, VII RegiÃ³n, Chile', '-35.42324440000001', '-71.6484804', '-34.9779853', '-71.2528803');

-- ----------------------------
-- Table structure for taxi
-- ----------------------------
DROP TABLE IF EXISTS `taxi`;
CREATE TABLE `taxi` (
  `patente` varchar(256) NOT NULL,
  `marca` varchar(256) NOT NULL,
  `modelo` varchar(256) NOT NULL,
  `numTaxi` int(11) NOT NULL,
  `anio` int(15) NOT NULL,
  PRIMARY KEY (`patente`,`numTaxi`),
  KEY `numTaxiIDX` (`numTaxi`) USING BTREE,
  KEY `patenteIDX` (`patente`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of taxi
-- ----------------------------
INSERT INTO `taxi` VALUES ('23423', 'toyota', 'yaris', '1', '2008');
INSERT INTO `taxi` VALUES ('4555', 'chevrolet', 'spark', '4', '2016');
INSERT INTO `taxi` VALUES ('666', 'nissan', 'terrano', '6', '2017');

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
  `RefTaxi` varchar(256) DEFAULT NULL,
  `estado` varchar(256) NOT NULL,
  PRIMARY KEY (`rut`),
  KEY `IND_numT` (`RefTaxi`) USING BTREE,
  KEY `IND_rut` (`rut`) USING BTREE,
  CONSTRAINT `FK_tax` FOREIGN KEY (`RefTaxi`) REFERENCES `taxi` (`patente`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of taxista
-- ----------------------------
INSERT INTO `taxista` VALUES ('1234', 'rrr@gmail.com', 'pedro', 'cardenas', 'rojas', '555', '4545', '23423', 'habilitado');
INSERT INTO `taxista` VALUES ('342', 'fff@gmail.com', 'carlos', 'nuñez', 'correa', '444', '4356', '666', 'habilitado');
INSERT INTO `taxista` VALUES ('432', 'ddd@gmail.com', 'cesar', 'gutierrez', 'reyes', '333', '3232', '666', 'habilitado');
INSERT INTO `taxista` VALUES ('454', '4', '4', '', '4', '4', '4', '23423', 'habilitado');
INSERT INTO `taxista` VALUES ('666666666', '6', '6', '6', '6', '6', '6', '23423', 'habilitado');
INSERT INTO `taxista` VALUES ('676676', '67', '6', '6', '6', '7', '7', '23423', 'deshabilitado');
INSERT INTO `taxista` VALUES ('895869865985', 'h', 'hhh', 'h', 'h', '777', 'h', '666', 'habilitado');

-- ----------------------------
-- Table structure for taxistarecorrido
-- ----------------------------
DROP TABLE IF EXISTS `taxistarecorrido`;
CREATE TABLE `taxistarecorrido` (
  `refRecorrido` int(20) DEFAULT NULL,
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
