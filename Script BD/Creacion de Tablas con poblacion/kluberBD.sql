/*
Navicat MySQL Data Transfer

Source Server         : Kluber
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : kluber

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-03-01 15:23:55
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
INSERT INTO `contadorsolicitudes` VALUES ('33');

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
INSERT INTO `disponibilidadchoferes` VALUES ('432', '25 norte', 'ocupado', '00:00:00');
INSERT INTO `disponibilidadchoferes` VALUES ('454', '20 oriente', 'ocupado', '00:00:00');
INSERT INTO `disponibilidadchoferes` VALUES ('666666666', '15 norte', 'ocupado', '00:00:00');
INSERT INTO `disponibilidadchoferes` VALUES ('895869865985', '10 norte', 'ocupado', '00:00:00');

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
  PRIMARY KEY (`id`),
  KEY `FKChofer` (`RefChoferTaxista`),
  CONSTRAINT `FKChofer` FOREIGN KEY (`RefChoferTaxista`) REFERENCES `taxista` (`rut`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pedido
-- ----------------------------
INSERT INTO `pedido` VALUES ('1', 'yo', 'yo', 'yo', 'yo', 'yo', '1234', 'esperando', '13:36:02', '2018-02-23', '00:00:00', '0', '0', '0', '0');
INSERT INTO `pedido` VALUES ('2', 'aaa', 'aaa', 'aaa', 'aaa', 'aaa', '342', 'viajando', '17:42:17', '2018-02-23', '00:00:00', '0', '0', '0', '0');
INSERT INTO `pedido` VALUES ('3', 'rrr', 'rrr', 'rrrr', 'rrr', 'rrr', '432', 'viajando', '18:07:14', '2018-02-23', '00:00:00', '0', '0', '0', '0');
INSERT INTO `pedido` VALUES ('5', 'ggg', 'ggg', 'ggg', 'ggg', 'ggggg', '1234', 'finalizado', '18:12:50', '2018-02-23', '02:00:00', '0', '0', '0', '0');
INSERT INTO `pedido` VALUES ('6', 'ttt', 't', 't', 't', 't', '1234', 'esperando', '00:00:00', '2018-02-23', '00:00:00', '0', '0', '0', '0');
INSERT INTO `pedido` VALUES ('7', 'yyy', 'y', 'y', 'y', 'y', '432', 'finalizado', '00:00:00', '2018-02-23', '00:00:00', '0', '0', '0', '0');
INSERT INTO `pedido` VALUES ('10', 'frfr', 'fr', 'fr', 'fr', 'fr', '1234', 'finalizado', '10:06:48', '2018-02-27', '10:06:55', '0', '0', '0', '0');
INSERT INTO `pedido` VALUES ('11', 'yuyuy', 'yyy', '(-35.42324440000001, -71.64848039999998)', '(-34.9779853, -71.25288030000002)', '7777', '1234', 'esperando', '00:00:00', '2018-02-27', '11:11:31', '0', '0', '0', '0');
INSERT INTO `pedido` VALUES ('20', 'ijoq3rijorjir', 'jdjd', 'Talca, Chile', 'Curicó, Chile', '9', '666666666', 'esperando', '00:00:00', '2018-02-28', '12:59:33', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002');
INSERT INTO `pedido` VALUES ('21', 'jljljl', 'jljl', 'Talca, Chile', 'Curicó, Chile', '98', '666666666', 'esperando', '00:00:00', '2018-02-28', '13:02:37', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002');
INSERT INTO `pedido` VALUES ('22', 'jdjhdjdkjdssndlfsñdf', 'fsdfds', 'Talca, Chile', 'Curicó, Chile', '6767', '666666666', 'esperando', '00:00:00', '2018-02-28', '13:04:05', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002');
INSERT INTO `pedido` VALUES ('23', 'jkjjjjj', 'jjjjj', 'Talca, Chile', 'Curicó, Chile', '87', '666666666', 'esperando', '00:00:00', '2018-02-28', '13:05:36', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002');
INSERT INTO `pedido` VALUES ('24', 'yyyyyyuuuiiiiii', 'yyuyu', 'Talca, Chile', 'Curicó, Chile', '666', '666666666', 'esperando', '00:00:00', '2018-02-28', '13:07:38', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002');
INSERT INTO `pedido` VALUES ('43', 'ttttt', 'tttt', 'Talca, Chile', 'Curicó, Chile', '78', '895869865985', 'esperando', '00:00:00', '2018-03-01', '09:26:05', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002');
INSERT INTO `pedido` VALUES ('44', 'thththth', 'tht', 'Talca, Chile', 'Curicó, Chile', '7777', '666666666', 'esperando', '00:00:00', '2018-03-01', '09:28:04', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002');
INSERT INTO `pedido` VALUES ('45', 'yyyyy', 'yyy', 'Talca, Chile', 'Curicó, Chile', '8888', '454', 'esperando', '00:00:00', '2018-03-01', '09:33:29', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002');
INSERT INTO `pedido` VALUES ('46', 'tttt', 'ttt', 'Talca, Chile', 'Curicó, Chile', '77', '432', 'esperando', '00:00:00', '2018-03-01', '09:34:34', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002');
INSERT INTO `pedido` VALUES ('47', 'uuuuu', 'uuu', 'Talca, Chile', 'Curicó, Chile', '777', '895869865985', 'esperando', '00:00:00', '2018-03-01', '09:48:36', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002');
INSERT INTO `pedido` VALUES ('48', 'eeee', 'eee', 'Talca, Chile', 'Curicó, Chile', '666', '666666666', 'esperando', '00:00:00', '2018-03-01', '09:52:58', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002');
INSERT INTO `pedido` VALUES ('49', 'llll', 'll', 'Talca, Chile', 'Curicó, Chile', '888', '454', 'esperando', '00:00:00', '2018-03-01', '09:57:28', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002');
INSERT INTO `pedido` VALUES ('50', 'jjjj', 'jjj', 'Talca, Chile', 'Curicó, Chile', '999', '666666666', 'esperando', '00:00:00', '2018-03-01', '09:59:51', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002');
INSERT INTO `pedido` VALUES ('51', 'kkkkk', 'kkk', 'Talca, Chile', 'Curicó, Chile', '777', '454', 'esperando', '00:00:00', '2018-03-01', '10:00:44', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002');
INSERT INTO `pedido` VALUES ('52', 'hhhh', 'hh', 'Talca, Chile', 'Curicó, Chile', '7777', '432', 'esperando', '00:00:00', '2018-03-01', '10:04:39', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002');
INSERT INTO `pedido` VALUES ('53', 'jjjjjjj', 'jjjj', 'Talca, Chile', 'Curicó, Chile', '999', '895869865985', 'esperando', '00:00:00', '2018-03-01', '10:06:15', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002');
INSERT INTO `pedido` VALUES ('54', 'gghhgh', 'ghgh', 'Talca, Chile', 'Curicó, Chile', '777', '895869865985', 'esperando', '00:00:00', '2018-03-01', '10:48:24', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002');
INSERT INTO `pedido` VALUES ('55', 'jhjhj', 'jhjh', 'Talca, Chile', 'Curicó, Chile', '55', '666666666', 'esperando', '00:00:00', '2018-03-01', '10:56:21', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002');
INSERT INTO `pedido` VALUES ('56', 'lklklk', 'lklkl', 'Talca, Chile', 'Curicó, Chile', '555', '895869865985', 'esperando', '00:00:00', '2018-03-01', '11:04:22', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002');
INSERT INTO `pedido` VALUES ('57', 'hhhh', 'hhh', 'Talca, Chile', 'Curicó, Chile', '555', '895869865985', 'esperando', '00:00:00', '2018-03-01', '11:13:14', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002');
INSERT INTO `pedido` VALUES ('58', 'kkk', 'kk', 'Talca, Chile', 'Curicó, Chile', '7676', '895869865985', 'esperando', '00:00:00', '2018-03-01', '11:16:10', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002');
INSERT INTO `pedido` VALUES ('59', 'xcfdgdfgd', 'dsfsd', 'Talca, Chile', 'Curicó, Chile', '88', '895869865985', 'esperando', '00:00:00', '2018-03-01', '11:18:30', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002');
INSERT INTO `pedido` VALUES ('60', 'jjjjj', 'jjj', 'Talca, Chile', 'Curicó, Chile', '555', '895869865985', 'esperando', '00:00:00', '2018-03-01', '11:20:31', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002');
INSERT INTO `pedido` VALUES ('61', 'trrr', 'tr', 'Talca, Chile', 'Curicó, Chile', '5555', '895869865985', 'esperando', '00:00:00', '2018-03-01', '11:27:19', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002');
INSERT INTO `pedido` VALUES ('62', 'ggg', 'ggg', 'Talca, Chile', 'Curicó, Chile', '55', '895869865985', 'esperando', '00:00:00', '2018-03-01', '11:33:27', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002');
INSERT INTO `pedido` VALUES ('63', 'gghg', 'ghg', 'Talca, Chile', 'Curicó, Chile', '555', '895869865985', 'esperando', '00:00:00', '2018-03-01', '11:34:39', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002');
INSERT INTO `pedido` VALUES ('64', 'hhhh', 'hhh', 'Talca, Chile', 'Curicó, Chile', '555', '895869865985', 'esperando', '00:00:00', '2018-03-01', '11:38:58', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002');
INSERT INTO `pedido` VALUES ('65', 'asdas', 'asdas', 'Talca, Chile', 'Curicó, Chile', 'asdasd', '895869865985', 'esperando', '00:00:00', '2018-03-01', '11:57:00', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002');
INSERT INTO `pedido` VALUES ('66', 'asdada', 'asdasd', 'Talca, Chile', 'Curicó, Chile', 'asdas', '895869865985', 'esperando', '00:00:00', '2018-03-01', '13:06:01', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002');
INSERT INTO `pedido` VALUES ('67', 'asda', 'asda', 'Talca, Chile', 'Curicó, Chile', 'asda', '895869865985', 'esperando', '00:00:00', '2018-03-01', '13:07:55', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002');
INSERT INTO `pedido` VALUES ('68', 'asda', 'asda', 'Talca, Chile', 'Curicó, Chile', 'asda', '895869865985', 'esperando', '00:00:00', '2018-03-01', '13:09:26', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002');
INSERT INTO `pedido` VALUES ('69', 'asdsa', 'asdas', 'Talca, Chile', 'Curicó, Chile', 'asdas', '895869865985', 'esperando', '00:00:00', '2018-03-01', '13:11:27', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002');
INSERT INTO `pedido` VALUES ('70', 'asda', 'asdas', 'Talca, Chile', 'Curicó, Chile', 'asd', '895869865985', 'esperando', '00:00:00', '2018-03-01', '13:13:50', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002');
INSERT INTO `pedido` VALUES ('71', 'sdfsd', 'sdfds', 'Talca, Chile', 'Curicó, Chile', 'sdfs', '895869865985', 'esperando', '00:00:00', '2018-03-01', '13:16:39', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002');
INSERT INTO `pedido` VALUES ('72', 'sadas', 'asdas', 'Talca, Chile', 'Curicó, Chile', 'asdas', '895869865985', 'esperando', '00:00:00', '2018-03-01', '13:27:24', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002');
INSERT INTO `pedido` VALUES ('73', 'asada', 'asdas', 'Talca, Chile', 'Curicó, Chile', 'asda', '895869865985', 'esperando', '00:00:00', '2018-03-01', '13:29:49', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002');
INSERT INTO `pedido` VALUES ('74', 'asdas', 'asda', 'Talca, Chile', 'Curicó, Chile', 'asda', '895869865985', 'esperando', '00:00:00', '2018-03-01', '13:33:21', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002');
INSERT INTO `pedido` VALUES ('75', 'asd', 'sadad', 'Talca, Chile', 'Curicó, Chile', 'asdsa', '895869865985', 'esperando', '00:00:00', '2018-03-01', '13:49:06', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002');

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

-- ----------------------------
-- Table structure for recorrido
-- ----------------------------
DROP TABLE IF EXISTS `recorrido`;
CREATE TABLE `recorrido` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `lugarInicio` varchar(100) NOT NULL,
  `lugarDestino` varchar(100) NOT NULL,
  `latitudInicio` varchar(200) NOT NULL,
  `longitudInicio` varchar(200) NOT NULL,
  `latitudDestino` varchar(200) NOT NULL,
  `longitudDestino` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of recorrido
-- ----------------------------
INSERT INTO `recorrido` VALUES ('1', '2018-01-24', '09:33:20', 'Curico', 'Talca', '', '', '', '');
INSERT INTO `recorrido` VALUES ('2', '2018-01-25', '11:33:47', 'Av. Circunvalacion 32', 'Camilo Henriquez 56', '', '', '', '');
INSERT INTO `recorrido` VALUES ('3', '2018-01-29', '12:38:12', 'San Martin 132', 'Prat 345', '', '', '', '');
INSERT INTO `recorrido` VALUES ('4', '2018-01-26', '10:17:36', 'los niches 59', 'san martin 678', '', '', '', '');
INSERT INTO `recorrido` VALUES ('5', '2018-01-29', '12:18:32', 'yungay 65', 'prat 999', '', '', '', '');
INSERT INTO `recorrido` VALUES ('6', '2018-01-30', '14:19:19', 'peña 89', 'sarmiento 387', '', '', '', '');
INSERT INTO `recorrido` VALUES ('99', '2018-02-14', '17:06:02', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '21 Nte. A, Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('100', '2018-02-14', '17:07:57', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('101', '2018-02-14', '17:13:11', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '21 Nte. A, Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('102', '2018-02-14', '17:15:22', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '24 Ote., Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('103', '2018-02-14', '17:16:21', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '24 Ote., Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('104', '2018-02-14', '17:18:47', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'CircunvalaciÃ³n 2475, Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('105', '2018-02-14', '17:20:14', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('106', '2018-02-14', '17:30:29', '19 Norte A, Talca, VII RegiÃ³n, Chile', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('107', '2018-02-14', '17:37:43', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 1/2 Ote., Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('108', '2018-02-14', '17:39:14', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('109', '2018-02-14', '17:46:51', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('110', '2018-02-14', '17:49:13', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '21 Nte. A, Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('111', '2018-02-14', '17:52:41', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('112', '2018-02-14', '17:57:54', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('113', '2018-02-14', '18:07:02', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('114', '2018-02-14', '18:08:24', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('115', '2018-02-14', '18:10:02', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '24 Ote., Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('116', '2018-02-14', '18:12:12', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('117', '2018-02-14', '18:13:55', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('118', '2018-02-14', '18:31:38', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Ote., Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('119', '2018-02-15', '10:00:14', 'Unnamed Road, ChÃ©pica, VI RegiÃ³n, Chile', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('120', '2018-02-15', '10:00:17', 'Unnamed Road, ChÃ©pica, VI RegiÃ³n, Chile', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('121', '2018-02-15', '10:00:24', 'Unnamed Road, ChÃ©pica, VI RegiÃ³n, Chile', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('122', '2018-02-15', '10:00:25', 'Unnamed Road, ChÃ©pica, VI RegiÃ³n, Chile', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('123', '2018-02-15', '10:00:25', 'Unnamed Road, ChÃ©pica, VI RegiÃ³n, Chile', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('124', '2018-02-15', '10:00:25', 'Unnamed Road, ChÃ©pica, VI RegiÃ³n, Chile', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('125', '2018-02-15', '10:01:45', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('126', '2018-02-15', '10:01:47', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('127', '2018-02-15', '10:01:47', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('128', '2018-02-15', '10:03:36', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('129', '2018-02-15', '10:06:23', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('130', '2018-02-15', '10:11:35', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('131', '2018-02-15', '10:11:39', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('132', '2018-02-15', '10:11:39', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('133', '2018-02-15', '10:11:40', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('134', '2018-02-15', '10:11:57', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('135', '2018-02-15', '10:14:44', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('136', '2018-02-15', '10:17:10', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('137', '2018-02-15', '10:57:53', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 1/2 Ote., Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('138', '2018-02-15', '11:17:48', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('139', '2018-02-15', '11:34:12', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '', '', '', '');
INSERT INTO `recorrido` VALUES ('140', '2018-02-15', '11:46:08', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.40927221123707', '-71.6194847971201', '-35.407028703458', '-71.61983717232943');
INSERT INTO `recorrido` VALUES ('141', '2018-02-15', '11:47:41', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '24 Ote., Talca, VII RegiÃ³n, Chile', '-35.40956542024607', '-71.61964070051908', '-35.410453785111656', '-71.62139989435673');
INSERT INTO `recorrido` VALUES ('142', '2018-02-15', '11:48:46', 'Calle 13 Ote. 3262, Talca, VII RegiÃ³n, Chile', 'Pasaje Doce 12 1/2 Oriente C 3224, Talca, VII RegiÃ³n, Chile', '-35.40982966267957', '-71.63536079227924', '-35.4086849702286', '-71.63662645965815');
INSERT INTO `recorrido` VALUES ('143', '2018-02-15', '12:18:42', 'Diego Portales 1110, CuricÃ³, VII RegiÃ³n, Chile', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile', '-34.9779853', '-71.2528803', '-35.42324440000001', '-71.6484804');
INSERT INTO `recorrido` VALUES ('144', '2018-02-15', '12:24:07', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile', 'Diego Portales 1110, CuricÃ³, VII RegiÃ³n, Chile', '-35.42324440000001', '-71.6484804', '-34.9779853', '-71.2528803');
INSERT INTO `recorrido` VALUES ('145', '2018-02-15', '12:28:54', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile', 'Diego Portales 1110, CuricÃ³, VII RegiÃ³n, Chile', '-35.42324440000001', '-71.6484804', '-34.9779853', '-71.2528803');
INSERT INTO `recorrido` VALUES ('146', '2018-02-15', '12:37:47', '21 Nte. A, Talca, VII RegiÃ³n, Chile', 'Pje B 1998, Talca, VII RegiÃ³n, Chile', '-35.41171376536334', '-71.6197369247675', '-35.41646932334171', '-71.6455940902233');
INSERT INTO `recorrido` VALUES ('147', '2018-02-15', '12:39:47', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile', 'Diego Portales 1110, CuricÃ³, VII RegiÃ³n, Chile', '-35.42324440000001', '-71.6484804', '-34.9779853', '-71.2528803');
INSERT INTO `recorrido` VALUES ('148', '2018-02-15', '13:36:51', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.40929680476436', '-71.62065993994474', '-35.407361271221035', '-71.61964975297451');
INSERT INTO `recorrido` VALUES ('149', '2018-02-15', '13:44:39', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.40917438357642', '-71.6187971457839', '-35.40829338275761', '-71.62280537188053');
INSERT INTO `recorrido` VALUES ('150', '2018-02-15', '13:53:22', 'Diego Portales 1110, CuricÃ³, VII RegiÃ³n, Chile', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile', '-34.9779853', '-71.2528803', '-35.42324440000001', '-71.6484804');
INSERT INTO `recorrido` VALUES ('151', '2018-02-15', '13:57:15', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile', 'Diego Portales 1110, CuricÃ³, VII RegiÃ³n, Chile', '-35.42324440000001', '-71.6484804', '-34.9779853', '-71.2528803');
INSERT INTO `recorrido` VALUES ('152', '2018-02-22', '16:59:52', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 1/2 Ote., Talca, VII RegiÃ³n, Chile', '-35.40875547216711', '-71.61843907088041', '-35.410003728835136', '-71.62238124758005');
INSERT INTO `recorrido` VALUES ('153', '2018-02-22', '17:04:36', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile', 'Diego Portales 1110, CuricÃ³, VII RegiÃ³n, Chile', '-35.42324440000001', '-71.6484804', '-34.9779853', '-71.2528803');
INSERT INTO `recorrido` VALUES ('154', '2018-02-22', '17:13:51', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.40849641822954', '-71.61912839859724', '-35.41022588807627', '-71.62029784172773');
INSERT INTO `recorrido` VALUES ('155', '2018-02-23', '14:13:09', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'VeintidÃ³s Sur 41, Talca, VII RegiÃ³n, Chile', '-35.408788263745414', '-71.6188544780016', '-35.43734630031883', '-71.69154100120068');
INSERT INTO `recorrido` VALUES ('156', '2018-02-23', '14:13:52', 'Unnamed Road, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.408309778642426', '-71.61805283278227', '-35.41004034552957', '-71.6206069663167');

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
