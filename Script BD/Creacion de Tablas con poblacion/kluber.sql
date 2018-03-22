/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : kluber

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-03-17 13:51:12
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
INSERT INTO `contadorsolicitudes` VALUES ('2');

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
  `RefChoferTaxista` varchar(256) DEFAULT NULL,
  `estado` varchar(256) NOT NULL,
  `duracion` time DEFAULT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `latitudInicial` varchar(256) NOT NULL,
  `longitudInicial` varchar(256) NOT NULL,
  `latitudFinal` varchar(256) NOT NULL,
  `longitudFinal` varchar(256) NOT NULL,
  `distanciaEstimada` int(20) NOT NULL,
  `tiempoEstimado` time DEFAULT NULL,
  `segundosEstimados` int(11) NOT NULL,
  `costoEstimado` int(20) NOT NULL,
  `tiempoEsperaComienzo` time DEFAULT NULL,
  `segundosEsperaComienzo` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKChofer` (`RefChoferTaxista`),
  CONSTRAINT `FKChofer` FOREIGN KEY (`RefChoferTaxista`) REFERENCES `taxista` (`rut`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=302 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pedido
-- ----------------------------
INSERT INTO `pedido` VALUES ('134', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', null, '2018-03-13', '12:01:42', '-35.409295165196106', '-71.6186409071088', '-35.40720113605203', '-71.61926921457052', '406', '00:11:32', '692', '740', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('135', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', null, '2018-03-13', '12:58:36', '-35.4092856010473', '-71.61859396845102', '-35.406972683280706', '-71.61910727620125', '373', '00:11:15', '675', '620', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('136', 'yorch', 'sepulveda', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'Unnamed Road, Talca, VII RegiÃ³n, Chile', '133', '1', 'esperando', null, '2018-03-13', '13:00:12', '-35.409295165196106', '-71.6194013133645', '-35.40684178720249', '-71.61716569215059', '406', '00:11:25', '685', '740', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('137', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', null, '2018-03-13', '13:56:43', '-35.40929106627533', '-71.61857720464468', '-35.407230922310625', '-71.61928229033947', '412', '00:11:27', '687', '740', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('138', 'xxx', 'xxx', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile', 'Diego Portales 1110, CuricÃ³, VII RegiÃ³n, Chile', '555', '1', 'esperando', null, '2018-03-13', '13:57:31', '-35.42324440000001', '-71.6484804', '-34.9779853', '-71.2528803', '67032', '01:05:59', '3959', '40700', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('139', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', null, '2018-03-13', '14:26:11', '-35.409261007516584', '-71.61851149052382', '-35.40857074602676', '-71.61957196891308', '298', '00:11:09', '669', '620', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('140', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'Unnamed Road, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', null, '2018-03-13', '14:42:44', '-35.40926537970037', '-71.61856513470411', '-35.40794824860811', '-71.61857284605503', '199', '00:10:47', '647', '500', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('141', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'Unnamed Road, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', null, '2018-03-13', '16:23:19', '-35.40928806039996', '-71.6185849159956', '-35.40787938556057', '-71.6186449304223', '356', '00:11:02', '662', '620', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('142', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'Unnamed Road, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', null, '2018-03-13', '16:27:06', '-35.409302269991635', '-71.61865565925837', '-35.40786544898426', '-71.61870796233416', '220', '00:10:52', '652', '620', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('143', 'pato', 'castro', 'Pje Ocho 1310-1336, Talca, VII RegiÃ³n, Chile', 'Pje Dos Ote 2700-2742, Talca, VII RegiÃ³n, Chile', '555', '1', 'esperando', null, '2018-03-13', '20:55:09', '-35.410809292269796', '-71.65473338216543', '-35.404287768158916', '-71.65878552943467', '1109', '00:13:39', '819', '1100', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('144', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'finalizado', '00:20:56', '2018-03-14', '10:03:59', '-35.40929871759395', '-71.61868080496788', '-35.40815237801048', '-71.61888767033815', '180', '00:10:46', '646', '500', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('145', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'finalizado', '00:16:47', '2018-03-14', '10:29:38', '-35.40952497768755', '-71.61871902644634', '-35.40653271858347', '-71.61998704075813', '494', '00:11:41', '701', '740', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('146', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'finalizado', '00:20:41', '2018-03-14', '11:18:57', '-35.409277676466004', '-71.61856915801762', '-35.40752823775639', '-71.61943417042494', '443', '00:11:30', '690', '740', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('147', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'finalizado', '00:08:37', '2018-03-14', '13:47:23', '-35.409321671545435', '-71.61861643195152', '-35.408447777207485', '-71.62001989781857', '320', '00:11:43', '703', '620', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('148', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'finalizado', '00:16:07', '2018-03-14', '13:52:56', '-35.40905414830012', '-71.62042323499918', '-35.40820894389797', '-71.618837043643', '264', '00:15:57', '957', '620', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('149', 'f', 'f', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile', 'Diego Portales 1110, CuricÃ³, VII RegiÃ³n, Chile', '5', '1', 'finalizado', '01:10:31', '2018-03-14', '15:18:40', '-35.42324440000001', '-71.6484804', '-34.9779853', '-71.2528803', '67032', '01:05:59', '3959', '40700', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('150', 'f', 'f', 'Unnamed Road, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'finalizado', '00:20:26', '2018-03-14', '15:21:05', '-35.40849259253224', '-71.61810111254454', '-35.40887051589561', '-71.62033136934042', '371', '00:16:28', '988', '620', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('151', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'Unnamed Road, Talca, VII RegiÃ³n, Chile', '5', '1', 'finalizado', '00:13:20', '2018-03-14', '15:23:31', '-35.41043575011795', '-71.62009097635746', '-35.40757278032522', '-71.6180893778801', '488', '00:11:30', '690', '740', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('152', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'Unnamed Road, Talca, VII RegiÃ³n, Chile', '5', '1', 'finalizado', '00:13:20', '2018-03-14', '15:27:09', '-35.410583582295814', '-71.62016708403826', '-35.40781216205264', '-71.61776315420866', '435', '00:11:27', '687', '740', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('153', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'Unnamed Road, Talca, VII RegiÃ³n, Chile', '5', '1', 'finalizado', '00:13:22', '2018-03-14', '15:42:50', '-35.410583582295814', '-71.62016708403826', '-35.40781216205264', '-71.61776315420866', '435', '00:11:27', '687', '740', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('154', 'f', 'f', '21 Nte. A, Talca, Chile', '23 Nte. 1523, Talca, Chile', '5', '1', 'finalizado', '00:18:36', '2018-03-14', '15:58:11', '-35.4110564', '-71.62192010000001', '-35.4089027', '-71.62161449999996', '360', '00:11:35', '695', '716', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('156', 'f', 'f', 'Av. Diego Portales 2052, Iquique, Chile', 'Puerto Montt, Chile', '5', '1', 'viajando', '02:44:00', '2018-03-14', '16:23:29', '-20.2307117', '-70.13561720000001', '-41.468917', '-72.9411364', '2787014', '05:31:31', '106291', '1672708', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('157', 'f', 'f', 'Av. Diego Portales 2052, Iquique, RegiÃ³n de TarapacÃ¡, Chile', 'PaicavÃ­ 773-835, ConcepciÃ³n, RegiÃ³n del BÃ­o BÃ­o, Chile', '5', '1', 'finalizado', '00:12:04', '2018-03-14', '16:24:54', '-20.2307033', '-70.1356692', '-36.82013519999999', '-73.0443904', '2253663', '00:08:00', '86880', '1352660', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('158', 'f', 'f', 'Plaza de Armas 976-1000, Santiago, RegiÃ³n Metropolitana, Chile', 'PaicavÃ­ 773-835, ConcepciÃ³n, RegiÃ³n del BÃ­o BÃ­o, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-14', '17:11:50', '-33.4378305', '-70.6504492', '-36.82013519999999', '-73.0443904', '501549', '05:28:58', '19738', '301340', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('159', 'ghgfhgf', 'hgfhfg', 'Talca, Chile', 'Curicó, Curico, Chile', '5', '432', 'finalizado', '01:07:29', '2018-03-14', '17:12:21', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '67032', '01:05:59', '3959', '40719', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('160', 'hghgh', 'hghg', 'Talca, Chile', 'Curicó, Curico, Chile', '5', '454', 'finalizado', '01:16:30', '2018-03-14', '17:16:47', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '67032', '01:05:59', '3959', '40719', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('161', 'iiiiii', 'iiii', 'Talca, Chile', 'Curicó, Curico, Chile', '5', '666666666', 'finalizado', '01:15:56', '2018-03-14', '17:17:26', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '67032', '01:05:59', '3959', '40719', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('162', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-14', '17:24:20', '-35.409510768135156', '-71.61880753934383', '-35.4072229975273', '-71.61924406886101', '438', '00:11:35', '695', '740', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('163', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-14', '17:25:08', '-35.409510768135156', '-71.61880753934383', '-35.4072229975273', '-71.61924406886101', '438', '00:11:35', '695', '740', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('164', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-14', '18:07:53', '-35.409510768135156', '-71.61880753934383', '-35.4072229975273', '-71.61924406886101', '438', '00:11:35', '695', '740', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('165', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-14', '18:34:46', '-35.40934107309458', '-71.61868616938591', '-35.407540808054385', '-71.61940667778255', '429', '00:11:23', '683', '740', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('166', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-14', '18:36:19', '-35.40875465237749', '-71.61838542670012', '-35.409238873332534', '-71.62039004266262', '267', '00:11:13', '673', '620', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('167', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-14', '18:38:16', '-35.40875465237749', '-71.61838542670012', '-35.409238873332534', '-71.62039004266262', '267', '00:11:13', '673', '620', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('168', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'Unnamed Road, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-14', '18:38:43', '-35.40926537970037', '-71.61861576139928', '-35.40760201991223', '-71.61829188466072', '235', '00:10:51', '651', '620', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('169', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-14', '18:39:19', '-35.40969002692038', '-71.61889404058456', '-35.408172053106284', '-71.61964841187', '299', '00:11:09', '669', '620', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('170', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-14', '18:41:06', '-35.409083387349725', '-71.61842364817858', '-35.40896151236264', '-71.62021100521088', '282', '00:11:05', '665', '620', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('171', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'Unnamed Road, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-14', '18:42:37', '-35.410613094047456', '-71.61961689591408', '-35.407652027779456', '-71.61879513412714', '417', '00:11:19', '679', '740', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('172', 'f', 'f', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', '21 Nte. A, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:22:17', '2018-03-14', '18:43:50', '-35.41273381301973', '-71.62137676030396', '-35.410961495854224', '-71.62082388997078', '249', '00:10:51', '651', '620', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('173', 'f', 'f', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', '21 Nte. A, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-14', '18:44:18', '-35.41272342952974', '-71.62070587277412', '-35.41127409980118', '-71.62133987993002', '681', '00:12:23', '743', '860', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('174', 'f', 'f', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-14', '18:45:52', '-35.41257286877458', '-71.62103075534105', '-35.411681794735216', '-71.62195209413767', '511', '00:11:44', '704', '740', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('175', 'f', 'f', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', '21 Nte. A, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-14', '18:47:20', '-35.412891204704096', '-71.62128690630198', '-35.4113421401849', '-71.62145957350731', '227', '00:10:49', '649', '620', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('176', 'f', 'f', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', '22 Nte. A, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-14', '18:50:40', '-35.413389063181604', '-71.62084970623255', '-35.40962007231992', '-71.62301525473595', '607', '00:12:15', '735', '860', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('177', 'f', 'f', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', '21 Nte. A, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-14', '18:51:34', '-35.41371750600369', '-71.62198562175035', '-35.410413342998936', '-71.62352956831455', '570', '00:12:14', '734', '740', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('178', 'f', 'f', '19 Norte A 3110, Talca, VII RegiÃ³n, Chile', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-14', '18:52:32', '-35.41402518084393', '-71.62181597203016', '-35.41096450166717', '-71.62482239305974', '777', '00:13:07', '787', '860', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('179', 'f ', 'f ', '19 Norte A 3110, Talca, Chile', '21 Nte. B, Talca, Chile', '5', '454', 'esperando', '00:00:01', '2018-03-14', '18:54:32', '-35.4140861', '-71.62437210000002', '-35.4103061', '-71.62273419999997', '659', '00:13:12', '792', '895', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('180', 'f', 'f', '', '', '5', '1', 'esperando', '00:00:01', '2018-03-15', '13:00:30', '-35.413636898280295', '-71.61500819027424', '-35.4148326167783', '-71.64677862077951', '6505', '00:24:36', '1476', '4340', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('181', 'f', 'f', '', '', '5', '1', 'esperando', '00:00:01', '2018-03-15', '13:01:31', '-35.433363164894324', '-71.65992815047503', '-35.432855322136405', '-71.65339093655348', '813', '00:12:07', '727', '980', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('182', 'f', 'f', '', '', '5', '1', 'esperando', '00:00:01', '2018-03-15', '13:12:41', '-35.406014595587415', '-71.65537744760513', '-35.40480480914832', '-71.65621932595968', '284', '00:11:16', '676', '620', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('183', 'f', 'f', '', '', '5', '1', 'esperando', '00:00:01', '2018-03-15', '13:14:00', '-35.42324440000001', '-71.6484804', '-34.9779853', '-71.2528803', '67032', '01:05:59', '3959', '500', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('184', 'f', 'f', '', '', '5', '1', 'esperando', '00:00:01', '2018-03-15', '13:14:44', '-35.42324440000001', '-71.6484804', '-34.9779853', '-71.2528803', '67032', '01:05:59', '3959', '500', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('185', 'f', 'f', '', '', '5', '1', 'esperando', '00:00:01', '2018-03-15', '13:20:46', '-35.42324440000001', '-71.6484804', '-34.9779853', '-71.2528803', '67032', '01:05:59', '3959', '40700', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('186', 'f', 'f', '', '', '5', '1', 'esperando', '00:00:01', '2018-03-15', '13:23:55', '-35.42324440000001', '-71.6484804', '-34.9779853', '-71.2528803', '67032', '01:05:59', '3959', '40700', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('187', 'f', 'f', '', '', '5', '1', 'esperando', '00:00:01', '2018-03-15', '13:31:54', '-35.42324440000001', '-71.6484804', '-34.9779853', '-71.2528803', '67032', '01:05:59', '3959', '40700', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('188', 'f', 'f', '', '', '5', '1', 'esperando', '00:00:01', '2018-03-15', '13:35:20', '-35.42324440000001', '-71.6484804', '-34.9779853', '-71.2528803', '67032', '01:05:59', '3959', '40700', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('189', 'f', 'f', '', '', '5', '1', 'esperando', '00:00:01', '2018-03-15', '13:36:48', '-35.42324440000001', '-71.6484804', '-34.9779853', '-71.2528803', '67032', '01:05:59', '3959', '40700', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('190', 'f', 'f', '', '', '5', '1', 'esperando', '00:00:01', '2018-03-15', '13:37:32', '-35.42324440000001', '-71.6484804', '-34.9779853', '-71.2528803', '67032', '01:05:59', '3959', '40700', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('191', 'f', 'f', '', '', '5', '1', 'esperando', '00:00:01', '2018-03-15', '13:38:16', '-35.42324440000001', '-71.6484804', '-34.9779853', '-71.2528803', '67032', '01:05:59', '3959', '40700', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('192', 'f', 'f', '', '', '5', '1', 'esperando', '00:00:01', '2018-03-15', '13:38:53', '-35.42324440000001', '-71.6484804', '-34.9779853', '-71.2528803', '67032', '01:05:59', '3959', '40700', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('193', 'f', 'f', '', '', '5', '1', 'esperando', '00:00:01', '2018-03-15', '13:39:20', '-35.42324440000001', '-71.6484804', '-34.9779853', '-71.2528803', '67032', '01:05:59', '3959', '40700', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('194', 'f', 'f', '', '', '5', '1', 'esperando', '00:00:01', '2018-03-15', '13:43:23', '-35.42324440000001', '-71.6484804', '-34.9779853', '-71.2528803', '67032', '01:05:59', '3959', '40700', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('195', 'f', 'f', '', '', '5', '1', 'esperando', '00:00:01', '2018-03-15', '13:45:08', '-35.42324440000001', '-71.6484804', '-34.9779853', '-71.2528803', '67032', '01:05:59', '3959', '40700', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('196', 'f', 'f', '', '', '5', '1', 'esperando', '00:00:01', '2018-03-15', '13:45:39', '-35.736599371411636', '-71.4379173517227', '-35.266170701567795', '-71.609787940979', '85421', '01:31:02', '5462', '51740', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('197', 'f', 'f', '', '', '5', '1', 'esperando', '00:00:01', '2018-03-15', '13:47:00', '-35.736599371411636', '-71.4379173517227', '-35.266170701567795', '-71.609787940979', '85421', '01:31:02', '5462', '51740', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('198', 'f', 'f', '', '', '5', '1', 'esperando', '00:00:01', '2018-03-15', '13:49:05', '-35.736599371411636', '-71.4379173517227', '-35.266170701567795', '-71.609787940979', '85421', '01:31:02', '5462', '51740', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('199', 'f', 'f', '', '', '5', '1', 'esperando', '00:00:01', '2018-03-15', '13:50:07', '-35.736599371411636', '-71.4379173517227', '-35.266170701567795', '-71.609787940979', '85421', '01:31:02', '5462', '51740', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('200', 'f', 'f', '', '', '5', '1', 'esperando', '00:00:01', '2018-03-15', '13:51:43', '-35.42324440000001', '-71.6484804', '-34.9779853', '-71.2528803', '67032', '01:05:59', '3959', '40700', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('201', 'f', 'f', 'Uno Sur 3188, Talca, VII RegiÃ³n, Chile', 'Lago Llanquihue 3144-3176, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '13:54:35', '-35.43165386105282', '-71.63135658949614', '-35.43029884932783', '-71.63198322057725', '241', '00:11:45', '705', '620', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('202', 'f', 'f', 'Uno Sur 3188, Talca, VII RegiÃ³n, Chile', 'Lago Llanquihue 3144-3176, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '13:55:33', '-35.43165386105282', '-71.63135658949614', '-35.43029884932783', '-71.63198322057725', '241', '00:11:45', '705', '620', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('203', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '14:19:36', '-35.40960203713964', '-71.618747189641', '-35.408737436793366', '-71.61916662007572', '214', '00:10:37', '637', '620', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('204', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '14:21:24', '-35.40960203713964', '-71.618747189641', '-35.408737436793366', '-71.61916662007572', '214', '00:10:37', '637', '620', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('205', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '14:23:42', '-35.409827749862586', '-71.61980263888834', '-35.41065162326252', '-71.61966416984795', '117', '00:10:46', '646', '500', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('206', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '14:25:22', '-35.40949765162302', '-71.61873310804367', '-35.408807665422955', '-71.61881625652313', '105', '00:10:24', '624', '500', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('207', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '14:27:01', '-35.40949765162302', '-71.61873310804367', '-35.408807665422955', '-71.61881625652313', '105', '00:10:24', '624', '500', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('208', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '14:28:47', '-35.40949765162302', '-71.61873310804367', '-35.408807665422955', '-71.61881625652313', '105', '00:10:24', '624', '500', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('209', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '14:29:54', '-35.40949765162302', '-71.61873310804367', '-35.408807665422955', '-71.61881625652313', '105', '00:10:24', '624', '500', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('210', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '14:30:38', '-35.409240786163494', '-71.61861911416054', '-35.40859752587808', '-71.61895036697388', '276', '00:10:54', '654', '620', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('211', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '14:31:21', '-35.409240786163494', '-71.61861911416054', '-35.40859752587808', '-71.61895036697388', '276', '00:10:54', '654', '620', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('212', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '14:32:32', '-35.409240786163494', '-71.61861911416054', '-35.40859752587808', '-71.61895036697388', '276', '00:10:54', '654', '620', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('213', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '14:33:25', '-35.409240786163494', '-71.61861911416054', '-35.40859752587808', '-71.61895036697388', '276', '00:10:54', '654', '620', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('214', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '14:34:14', '-35.409240786163494', '-71.61861911416054', '-35.40859752587808', '-71.61895036697388', '276', '00:10:54', '654', '620', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('215', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '14:35:02', '-35.409240786163494', '-71.61861911416054', '-35.40859752587808', '-71.61895036697388', '276', '00:10:54', '654', '620', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('216', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '14:36:11', '-35.409240786163494', '-71.61861911416054', '-35.40859752587808', '-71.61895036697388', '276', '00:10:54', '654', '620', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('217', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '14:36:25', '-35.409240786163494', '-71.61861911416054', '-35.40859752587808', '-71.61895036697388', '276', '00:10:54', '654', '620', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('218', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '14:37:00', '-35.409240786163494', '-71.61861911416054', '-35.40859752587808', '-71.61895036697388', '276', '00:10:54', '654', '620', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('219', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '14:37:25', '-35.409240786163494', '-71.61861911416054', '-35.40859752587808', '-71.61895036697388', '276', '00:10:54', '654', '620', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('220', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '14:39:21', '-35.409240786163494', '-71.61861911416054', '-35.40859752587808', '-71.61895036697388', '276', '00:10:54', '654', '620', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('221', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '14:40:51', '-35.409240786163494', '-71.61861911416054', '-35.40859752587808', '-71.61895036697388', '276', '00:10:54', '654', '620', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('222', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '14:41:45', '-35.409240786163494', '-71.61861911416054', '-35.40859752587808', '-71.61895036697388', '276', '00:10:54', '654', '620', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('223', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '14:42:58', '-35.409240786163494', '-71.61861911416054', '-35.40859752587808', '-71.61895036697388', '276', '00:10:54', '654', '620', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('224', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '14:45:55', '-35.409240786163494', '-71.61861911416054', '-35.40859752587808', '-71.61895036697388', '276', '00:10:54', '654', '620', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('225', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '14:48:48', '-35.409240786163494', '-71.61861911416054', '-35.40859752587808', '-71.61895036697388', '276', '00:10:54', '654', '620', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('226', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '14:52:03', '-35.409240786163494', '-71.61861911416054', '-35.40859752587808', '-71.61895036697388', '276', '00:10:54', '654', '620', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('227', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '14:52:51', '-35.409240786163494', '-71.61861911416054', '-35.40859752587808', '-71.61895036697388', '276', '00:10:54', '654', '620', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('228', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '14:58:54', '-35.40900550761466', '-71.6193024069071', '-35.408806299107795', '-71.61839783191681', '136', '00:10:30', '630', '500', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('229', 'f', 'f', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '15:01:00', '-35.40900550761466', '-71.6193024069071', '-35.408806299107795', '-71.61839783191681', '136', '00:10:30', '630', '500', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('230', 'f', 'f', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '15:01:58', '-35.42324440000001', '-71.6484804', '-35.408806299107795', '-71.61839783191681', '7622', '00:22:44', '1364', '5060', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('231', 'f', 'f', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '15:07:01', '-35.42324440000001', '-71.6484804', '-35.408806299107795', '-71.61839783191681', '7622', '00:22:44', '1364', '5060', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('232', 'f', 'f', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '16:29:24', '-35.42324440000001', '-71.6484804', '-35.408806299107795', '-71.61839783191681', '7622', '00:22:44', '1364', '5060', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('233', 'f ', 'f ', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile ', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile ', '5 ', '432', 'esperando', '00:00:01', '2018-03-15', '16:30:30', '-35.42324440000001 ', '-71.6484804 ', '-35.408806299107795 ', '-71.61839783191681 ', '7622', '00:22:44', '1364', '5060', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('235', 'f ', 'f ', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile ', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile ', '5 ', '1', 'esperando', '00:00:01', '2018-03-15', '16:39:01', '-35.42324440000001 ', '-71.6484804 ', '-35.408806299107795 ', '-71.61839783191681 ', '7622', '00:22:44', '1364', '5060', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('237', 'f', 'f', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '16:40:03', '-35.42324440000001', '-71.6484804', '-35.408806299107795', '-71.61839783191681', '7622', '00:22:44', '1364', '5060', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('239', 'f', 'f', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '16:44:04', '-35.42324440000001', '-71.6484804', '-35.408806299107795', '-71.61839783191681', '7622', '00:22:44', '1364', '5060', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('240', 'f', 'f', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '16:45:40', '-35.42324440000001', '-71.6484804', '-35.408806299107795', '-71.61839783191681', '7622', '00:22:44', '1364', '5060', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('241', 'f', 'f', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '16:46:17', '-35.42324440000001', '-71.6484804', '-35.408806299107795', '-71.61839783191681', '7622', '00:22:44', '1364', '5060', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('242', 'f', 'f', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '16:47:20', '-35.42324440000001', '-71.6484804', '-35.408806299107795', '-71.61839783191681', '7622', '00:22:44', '1364', '5060', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('243', 'f', 'f', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '16:47:43', '-35.42324440000001', '-71.6484804', '-35.408806299107795', '-71.61839783191681', '7622', '00:22:44', '1364', '5060', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('245', 'f', 'f', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '16:50:19', '-35.42324440000001', '-71.6484804', '-35.408806299107795', '-71.61839783191681', '7622', '00:22:44', '1364', '5060', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('247', 'f', 'f', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '16:51:28', '-35.42324440000001', '-71.6484804', '-35.408806299107795', '-71.61839783191681', '7622', '00:22:44', '1364', '5060', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('248', 'f', 'f', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '16:51:50', '-35.42324440000001', '-71.6484804', '-35.408806299107795', '-71.61839783191681', '7622', '00:22:44', '1364', '5060', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('249', 'f ', 'f ', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile ', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile ', '5 ', '895869865985', 'esperando', '00:00:01', '2018-03-15', '16:52:47', '-35.42324440000001 ', '-71.6484804 ', '-35.408806299107795 ', '-71.61839783191681 ', '7622', '00:22:44', '1364', '5060', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('250', 'f', 'f', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '5', '1', 'finalizado', '00:23:33', '2018-03-15', '16:59:46', '-35.42324440000001', '-71.6484804', '-35.408806299107795', '-71.61839783191681', '7622', '00:22:44', '1364', '5060', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('251', 'f', 'f', 'K-611 9, Talca, VII RegiÃ³n, Chile', 'Catorce Ote 1280, Talca, VII RegiÃ³n, Chile', '5', '1', 'finalizado', '00:48:17', '2018-03-15', '17:00:11', '-35.45682807071284', '-71.62526797503233', '-35.42618450063538', '-71.64562325924635', '6642', '00:24:50', '1490', '4460', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('252', 'f', 'f', 'K-611 9, Talca, VII RegiÃ³n, Chile', 'Catorce Ote 1280, Talca, VII RegiÃ³n, Chile', '5', '1', 'finalizado', '00:45:56', '2018-03-15', '17:02:36', '-35.45682807071284', '-71.62526797503233', '-35.42618450063538', '-71.64562325924635', '6642', '00:24:50', '1490', '4460', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('253', 'f ', 'f ', 'K-611 9, Talca, VII RegiÃ³n, Chile ', 'Catorce Ote 1280, Talca, VII RegiÃ³n, Chile ', '5 ', '666666666', 'esperando', '00:00:01', '2018-03-15', '17:03:05', '-35.45682807071284 ', '-71.62526797503233 ', '-35.42618450063538 ', '-71.64562325924635 ', '6642', '00:24:50', '1490', '4460', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('254', 'f', 'f', 'K-611 9, Talca, VII RegiÃ³n, Chile', 'Catorce Ote 1280, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '17:05:59', '-35.45682807071284', '-71.62526797503233', '-35.42618450063538', '-71.64562325924635', '6642', '00:24:50', '1490', '4460', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('255', 'f', 'f', 'K-611 9, Talca, VII RegiÃ³n, Chile', 'Catorce Ote 1280, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '17:09:32', '-35.45682807071284', '-71.62526797503233', '-35.42618450063538', '-71.64562325924635', '6642', '00:24:50', '1490', '4460', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('256', 'f', 'f', 'K-611 9, Talca, VII RegiÃ³n, Chile', 'Veintisiete 1/2 Ote 328-392, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '17:11:24', '-35.46013442594832', '-71.62398487329483', '-35.43974712257938', '-71.63428455591202', '3214', '00:16:46', '1006', '2420', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('257', 'f ', 'f ', 'K-611 9, Talca, VII RegiÃ³n, Chile ', 'Veintisiete 1/2 Ote 328-392, Talca, VII RegiÃ³n, Chile ', '5 ', '895869865985', 'esperando', '00:00:01', '2018-03-15', '17:15:43', '-35.46013442594832 ', '-71.62398487329483 ', '-35.43974712257938 ', '-71.63428455591202 ', '3214', '00:16:46', '1006', '2420', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('258', 'f ', 'f ', 'K-611 9, Talca, VII RegiÃ³n, Chile ', 'Veintisiete 1/2 Ote 328-392, Talca, VII RegiÃ³n, Chile ', '5 ', '666666666', 'esperando', '00:00:01', '2018-03-15', '17:18:04', '-35.46013442594832 ', '-71.62398487329483 ', '-35.43974712257938 ', '-71.63428455591202 ', '3214', '00:16:46', '1006', '2420', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('259', 'f', 'f', 'K-611 9, Talca, VII RegiÃ³n, Chile', 'Veintisiete 1/2 Ote 328-392, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '17:19:29', '-35.46013442594832', '-71.62398487329483', '-35.43974712257938', '-71.63428455591202', '3214', '00:16:46', '1006', '2420', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('260', 'f', 'f', 'K-611 9, Talca, VII RegiÃ³n, Chile', 'Veintisiete 1/2 Ote 328-392, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '17:20:08', '-35.46013442594832', '-71.62398487329483', '-35.43974712257938', '-71.63428455591202', '3214', '00:16:46', '1006', '2420', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('261', 'f ', 'f ', 'K-611 9, Talca, VII RegiÃ³n, Chile ', 'Veintisiete 1/2 Ote 328-392, Talca, VII RegiÃ³n, Chile ', '5 ', '895869865985', 'esperando', '00:00:01', '2018-03-15', '17:20:23', '-35.46013442594832 ', '-71.62398487329483 ', '-35.43974712257938 ', '-71.63428455591202 ', '3214', '00:16:46', '1006', '2420', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('262', 'f ', 'f ', 'K-611 9, Talca, VII RegiÃ³n, Chile ', 'Veintisiete 1/2 Ote 328-392, Talca, VII RegiÃ³n, Chile ', '5 ', '666666666', 'esperando', '00:00:01', '2018-03-15', '17:21:10', '-35.46013442594832 ', '-71.62398487329483 ', '-35.43974712257938 ', '-71.63428455591202 ', '3214', '00:16:46', '1006', '2420', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('263', 'f', 'f', 'K-611 9, Talca, VII RegiÃ³n, Chile', 'Veintisiete 1/2 Ote 328-392, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '17:24:07', '-35.46013442594832', '-71.62398487329483', '-35.43974712257938', '-71.63428455591202', '3214', '00:16:46', '1006', '2420', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('264', 'f ', 'f ', 'K-611 9, Talca, VII RegiÃ³n, Chile ', 'Veintisiete 1/2 Ote 328-392, Talca, VII RegiÃ³n, Chile ', '5 ', '432', 'esperando', '00:00:01', '2018-03-15', '17:25:53', '-35.46013442594832 ', '-71.62398487329483 ', '-35.43974712257938 ', '-71.63428455591202 ', '3214', '00:16:46', '1006', '2420', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('265', 'f ', 'f ', 'K-611 9, Talca, VII RegiÃ³n, Chile ', 'Veintisiete 1/2 Ote 328-392, Talca, VII RegiÃ³n, Chile ', '5 ', '454', 'esperando', '00:00:01', '2018-03-15', '17:27:02', '-35.46013442594832 ', '-71.62398487329483 ', '-35.43974712257938 ', '-71.63428455591202 ', '3214', '00:16:46', '1006', '2420', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('266', 'f ', 'f ', 'K-611 9, Talca, VII RegiÃ³n, Chile ', 'Veintisiete 1/2 Ote 328-392, Talca, VII RegiÃ³n, Chile ', '5 ', '666666666', 'esperando', '00:00:01', '2018-03-15', '17:33:41', '-35.46013442594832 ', '-71.62398487329483 ', '-35.43974712257938 ', '-71.63428455591202 ', '3214', '00:16:46', '1006', '2420', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('282', 'yyy', 'yyy', 'Talca, Chile', 'Curicó, Curico, Chile', '5', '432', 'viajando', '01:00:26', '2018-03-15', '18:08:09', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '67032', '01:05:59', '3959', '40719', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('283', 'Yorch', 'sdfsd', 'Talca, Chile', 'Curicó, Curico, Chile', 'sdfsdf', '454', 'esperando', '00:27:56', '2018-03-15', '18:40:48', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '67032', '01:05:59', '3959', '40719', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('284', 'f', 'f', 'K-611 9, Talca, VII RegiÃ³n, Chile', 'Veintisiete 1/2 Ote 328-392, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '18:41:56', '-35.46013442594832', '-71.62398487329483', '-35.43974712257938', '-71.63428455591202', '3214', '00:16:46', '1006', '2420', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('285', 'f', 'f', 'K-611 9, Talca, VII RegiÃ³n, Chile', 'Veintisiete 1/2 Ote 328-392, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '18:44:10', '-35.46013442594832', '-71.62398487329483', '-35.43974712257938', '-71.63428455591202', '3214', '00:16:46', '1006', '2420', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('286', 'f', 'f', 'K-611 9, Talca, VII RegiÃ³n, Chile', 'Veintisiete 1/2 Ote 328-392, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '18:47:25', '-35.46013442594832', '-71.62398487329483', '-35.43974712257938', '-71.63428455591202', '3214', '00:16:46', '1006', '2420', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('287', 'f', 'f', 'K-611 9, Talca, VII RegiÃ³n, Chile', 'Veintisiete 1/2 Ote 328-392, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '18:50:57', '-35.46013442594832', '-71.62398487329483', '-35.43974712257938', '-71.63428455591202', '3214', '00:16:46', '1006', '2420', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('288', 'f', 'f', 'K-611 9, Talca, VII RegiÃ³n, Chile', 'Veintisiete 1/2 Ote 328-392, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '18:55:00', '-35.46013442594832', '-71.62398487329483', '-35.43974712257938', '-71.63428455591202', '3214', '00:16:46', '1006', '2420', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('289', 'f', 'f', 'K-611 9, Talca, VII RegiÃ³n, Chile', 'Veintisiete 1/2 Ote 328-392, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '18:55:49', '-35.46013442594832', '-71.62398487329483', '-35.43974712257938', '-71.63428455591202', '3214', '00:16:46', '1006', '2420', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('290', 'f', 'f', 'K-611 9, Talca, VII RegiÃ³n, Chile', 'Veintisiete 1/2 Ote 328-392, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '18:56:32', '-35.46013442594832', '-71.62398487329483', '-35.43974712257938', '-71.63428455591202', '3214', '00:16:46', '1006', '2420', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('291', 'f', 'f', 'K-611 9, Talca, VII RegiÃ³n, Chile', 'Veintisiete 1/2 Ote 328-392, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '18:58:08', '-35.46013442594832', '-71.62398487329483', '-35.43974712257938', '-71.63428455591202', '3214', '00:16:46', '1006', '2420', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('292', 'f', 'f', 'K-611 9, Talca, VII RegiÃ³n, Chile', 'Veintisiete 1/2 Ote 328-392, Talca, VII RegiÃ³n, Chile', '5', '1', 'esperando', '00:00:01', '2018-03-15', '19:03:42', '-35.46013442594832', '-71.62398487329483', '-35.43974712257938', '-71.63428455591202', '3214', '00:16:46', '1006', '2420', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('293', 'f ', 'f ', 'K-611 9, Talca, VII RegiÃ³n, Chile ', 'Veintisiete 1/2 Ote 328-392, Talca, VII RegiÃ³n, Chile ', '5 ', '666666666', 'esperando', '00:07:26', '2018-03-15', '19:05:23', '-35.46013442594832 ', '-71.62398487329483 ', '-35.43974712257938 ', '-71.63428455591202 ', '3214', '00:16:46', '1006', '2420', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('294', 'f ', 'f ', 'K-611 9, Talca, VII RegiÃ³n, Chile ', 'Veintisiete 1/2 Ote 328-392, Talca, VII RegiÃ³n, Chile ', '5 ', '895869865985', 'esperando', '00:06:25', '2018-03-15', '19:06:39', '-35.46013442594832 ', '-71.62398487329483 ', '-35.43974712257938 ', '-71.63428455591202 ', '3214', '00:16:46', '1006', '2420', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('295', 'f ', 'f ', 'K-611 9, Talca, VII RegiÃ³n, Chile ', 'Veintisiete 1/2 Ote 328-392, Talca, VII RegiÃ³n, Chile ', '5 ', '432', 'esperando', '00:01:39', '2018-03-15', '19:11:37', '-35.46013442594832 ', '-71.62398487329483 ', '-35.43974712257938 ', '-71.63428455591202 ', '3214', '00:16:46', '1006', '2420', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('296', 'yorch', 'Sepulveda', 'Talca, Chile', 'Curicó, Curico, Chile', '555', '454', 'finalizado', '01:16:39', '2018-03-16', '14:04:04', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '67026', '01:05:59', '3959', '40715', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('297', 'Nombre Cliente', 'Apellido Cliente', 'Talca, Chile', 'Curicó, Curico, Chile', 'Teléfono', '666666666', 'finalizado', '01:48:12', '2018-03-16', '14:32:35', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '67026', '01:05:59', '3959', '40715', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('298', 'Nombre Cliente', 'Apellido Cliente', 'Talca, Chile', 'Curicó, Curico, Chile', 'Teléfono', '454', 'finalizado', '01:18:51', '2018-03-16', '15:52:56', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '67026', '01:05:59', '3959', '40715', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('299', 'Nombre Cliente', 'Apellido Cliente', 'Talca, Chile', 'Curicó, Curico, Chile', 'Teléfono', '666666666', 'finalizado', '01:11:28', '2018-03-16', '16:53:04', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '67026', '01:05:59', '3959', '40715', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('300', 'Nombre Cliente', 'Apellido Cliente', 'Talca, Chile', 'Curicó, Curico, Chile', 'Teléfono', '454', 'viajando', '01:37:52', '2018-03-16', '17:12:57', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '67026', '01:05:59', '3959', '40715', '00:10:00', '600');
INSERT INTO `pedido` VALUES ('301', 'Nombre Cliente', 'Apellido Cliente', 'Talca, Chile', 'Curicó, Curico, Chile', 'Teléfono', '666666666', 'esperando', '00:45:42', '2018-03-16', '18:05:21', '-35.42324440000001', '-71.64848039999998', '-34.9779853', '-71.25288030000002', '67026', '01:05:59', '3959', '40715', '00:10:00', '600');

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
  `contador` int(20) NOT NULL,
  `tiempoAgotado` int(20) NOT NULL,
  PRIMARY KEY (`RefPedido`),
  CONSTRAINT `FKpedido` FOREIGN KEY (`RefPedido`) REFERENCES `pedido` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pedidotiempotranscurrido
-- ----------------------------
INSERT INTO `pedidotiempotranscurrido` VALUES ('134', '00:00:01', '1', '1', '1');
INSERT INTO `pedidotiempotranscurrido` VALUES ('135', '00:00:01', '1', '1', '1');
INSERT INTO `pedidotiempotranscurrido` VALUES ('136', '00:00:01', '1', '1', '1');
INSERT INTO `pedidotiempotranscurrido` VALUES ('137', '00:00:01', '1', '1', '1');
INSERT INTO `pedidotiempotranscurrido` VALUES ('138', '00:00:01', '1', '1', '1');
INSERT INTO `pedidotiempotranscurrido` VALUES ('139', '00:00:01', '1', '1', '1');
INSERT INTO `pedidotiempotranscurrido` VALUES ('140', '00:00:01', '1', '1', '1');
INSERT INTO `pedidotiempotranscurrido` VALUES ('141', '00:00:01', '1', '1', '1');
INSERT INTO `pedidotiempotranscurrido` VALUES ('142', '00:00:01', '1', '1', '1');
INSERT INTO `pedidotiempotranscurrido` VALUES ('143', '00:00:01', '1', '1', '1');
INSERT INTO `pedidotiempotranscurrido` VALUES ('144', '00:20:56', 'finalizado', '1256', '1');
INSERT INTO `pedidotiempotranscurrido` VALUES ('145', '00:16:47', 'finalizado', '1007', '1');
INSERT INTO `pedidotiempotranscurrido` VALUES ('146', '00:20:41', 'finalizado', '1241', '1');
INSERT INTO `pedidotiempotranscurrido` VALUES ('147', '00:08:37', 'finalizado', '517', '1');
INSERT INTO `pedidotiempotranscurrido` VALUES ('148', '00:16:07', 'finalizado', '967', '1');
INSERT INTO `pedidotiempotranscurrido` VALUES ('149', '01:10:31', 'finalizado', '4231', '1');
INSERT INTO `pedidotiempotranscurrido` VALUES ('150', '00:20:26', 'finalizado', '1226', '1');
INSERT INTO `pedidotiempotranscurrido` VALUES ('151', '00:13:20', 'finalizado', '800', '1');
INSERT INTO `pedidotiempotranscurrido` VALUES ('152', '00:13:20', 'finalizado', '800', '1');
INSERT INTO `pedidotiempotranscurrido` VALUES ('153', '00:13:22', 'finalizado', '802', '1');
INSERT INTO `pedidotiempotranscurrido` VALUES ('154', '00:18:36', 'finalizado', '1116', '1');
INSERT INTO `pedidotiempotranscurrido` VALUES ('156', '02:44:00', 'esperando', '9840', '2');
INSERT INTO `pedidotiempotranscurrido` VALUES ('157', '00:12:04', 'finalizado', '724', '1');
INSERT INTO `pedidotiempotranscurrido` VALUES ('159', '01:07:29', 'finalizado', '4049', '1');
INSERT INTO `pedidotiempotranscurrido` VALUES ('160', '01:16:30', 'finalizado', '4590', '1');
INSERT INTO `pedidotiempotranscurrido` VALUES ('161', '01:15:56', 'finalizado', '4556', '1');
INSERT INTO `pedidotiempotranscurrido` VALUES ('172', '00:22:17', 'esperando', '1337', '0');
INSERT INTO `pedidotiempotranscurrido` VALUES ('250', '00:23:33', 'finalizado', '1413', '1');
INSERT INTO `pedidotiempotranscurrido` VALUES ('251', '00:48:17', 'finalizado', '2897', '1');
INSERT INTO `pedidotiempotranscurrido` VALUES ('252', '00:45:56', 'finalizado', '2756', '1');
INSERT INTO `pedidotiempotranscurrido` VALUES ('282', '01:00:26', 'esperando', '3626', '2');
INSERT INTO `pedidotiempotranscurrido` VALUES ('283', '00:27:56', 'esperando', '1676', '0');
INSERT INTO `pedidotiempotranscurrido` VALUES ('293', '00:07:26', 'esperando', '446', '0');
INSERT INTO `pedidotiempotranscurrido` VALUES ('294', '00:06:25', 'esperando', '385', '0');
INSERT INTO `pedidotiempotranscurrido` VALUES ('295', '00:01:39', 'esperando', '99', '0');
INSERT INTO `pedidotiempotranscurrido` VALUES ('296', '01:16:39', 'finalizado', '4599', '1');
INSERT INTO `pedidotiempotranscurrido` VALUES ('297', '01:48:12', 'finalizado', '6492', '1');
INSERT INTO `pedidotiempotranscurrido` VALUES ('298', '01:18:51', 'finalizado', '4731', '1');
INSERT INTO `pedidotiempotranscurrido` VALUES ('299', '01:11:28', 'finalizado', '4288', '1');
INSERT INTO `pedidotiempotranscurrido` VALUES ('300', '01:37:52', 'esperando', '5872', '2');
INSERT INTO `pedidotiempotranscurrido` VALUES ('301', '00:45:42', 'esperando', '2742', '0');

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
  CONSTRAINT `idRecorrido` FOREIGN KEY (`refRecorrido`) REFERENCES `recorrido` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `personarecorrido_ibfk_2` FOREIGN KEY (`refPersona`) REFERENCES `persona` (`correo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of personarecorrido
-- ----------------------------
INSERT INTO `personarecorrido` VALUES ('196', 'f');
INSERT INTO `personarecorrido` VALUES ('197', 'f');
INSERT INTO `personarecorrido` VALUES ('198', 'f');
INSERT INTO `personarecorrido` VALUES ('199', 'f');
INSERT INTO `personarecorrido` VALUES ('200', 'f');
INSERT INTO `personarecorrido` VALUES ('201', 'f');
INSERT INTO `personarecorrido` VALUES ('202', 'f');
INSERT INTO `personarecorrido` VALUES ('203', 'f');
INSERT INTO `personarecorrido` VALUES ('204', 'f');
INSERT INTO `personarecorrido` VALUES ('205', 'f');
INSERT INTO `personarecorrido` VALUES ('206', 'f');
INSERT INTO `personarecorrido` VALUES ('207', 'f');
INSERT INTO `personarecorrido` VALUES ('208', 'f');
INSERT INTO `personarecorrido` VALUES ('209', 'f');
INSERT INTO `personarecorrido` VALUES ('210', 'f');
INSERT INTO `personarecorrido` VALUES ('211', 'f');
INSERT INTO `personarecorrido` VALUES ('212', 'f');
INSERT INTO `personarecorrido` VALUES ('213', 'f');
INSERT INTO `personarecorrido` VALUES ('214', 'f');
INSERT INTO `personarecorrido` VALUES ('215', 'f');
INSERT INTO `personarecorrido` VALUES ('216', 'f');
INSERT INTO `personarecorrido` VALUES ('218', 'f');
INSERT INTO `personarecorrido` VALUES ('219', 'f');
INSERT INTO `personarecorrido` VALUES ('220', 'f');
INSERT INTO `personarecorrido` VALUES ('221', 'f');
INSERT INTO `personarecorrido` VALUES ('222', 'f');
INSERT INTO `personarecorrido` VALUES ('223', 'f');
INSERT INTO `personarecorrido` VALUES ('224', 'f');
INSERT INTO `personarecorrido` VALUES ('225', 'f');
INSERT INTO `personarecorrido` VALUES ('226', 'f');
INSERT INTO `personarecorrido` VALUES ('227', 'f');
INSERT INTO `personarecorrido` VALUES ('228', 'f');
INSERT INTO `personarecorrido` VALUES ('229', 'f');
INSERT INTO `personarecorrido` VALUES ('230', 'f');
INSERT INTO `personarecorrido` VALUES ('231', 'f');
INSERT INTO `personarecorrido` VALUES ('232', 'f');
INSERT INTO `personarecorrido` VALUES ('233', 'f');
INSERT INTO `personarecorrido` VALUES ('234', 'f');
INSERT INTO `personarecorrido` VALUES ('235', 'f');
INSERT INTO `personarecorrido` VALUES ('236', 'f');
INSERT INTO `personarecorrido` VALUES ('237', 'f');
INSERT INTO `personarecorrido` VALUES ('238', 'f');
INSERT INTO `personarecorrido` VALUES ('239', 'f');
INSERT INTO `personarecorrido` VALUES ('240', 'f');
INSERT INTO `personarecorrido` VALUES ('241', 'f');
INSERT INTO `personarecorrido` VALUES ('242', 'f');
INSERT INTO `personarecorrido` VALUES ('243', 'f');
INSERT INTO `personarecorrido` VALUES ('244', 'f');
INSERT INTO `personarecorrido` VALUES ('245', 'f');
INSERT INTO `personarecorrido` VALUES ('246', 'f');
INSERT INTO `personarecorrido` VALUES ('247', 'f');
INSERT INTO `personarecorrido` VALUES ('248', 'f');
INSERT INTO `personarecorrido` VALUES ('249', 'f');
INSERT INTO `personarecorrido` VALUES ('250', 'f');
INSERT INTO `personarecorrido` VALUES ('251', 'f');
INSERT INTO `personarecorrido` VALUES ('252', 'f');
INSERT INTO `personarecorrido` VALUES ('253', 'f');
INSERT INTO `personarecorrido` VALUES ('254', 'f');
INSERT INTO `personarecorrido` VALUES ('255', 'f');
INSERT INTO `personarecorrido` VALUES ('256', 'f');
INSERT INTO `personarecorrido` VALUES ('257', 'f');
INSERT INTO `personarecorrido` VALUES ('258', 'f');
INSERT INTO `personarecorrido` VALUES ('259', 'f');
INSERT INTO `personarecorrido` VALUES ('260', 'f');
INSERT INTO `personarecorrido` VALUES ('261', 'f');
INSERT INTO `personarecorrido` VALUES ('262', 'f');
INSERT INTO `personarecorrido` VALUES ('263', 'f');
INSERT INTO `personarecorrido` VALUES ('264', 'f');
INSERT INTO `personarecorrido` VALUES ('265', 'f');
INSERT INTO `personarecorrido` VALUES ('266', 'f');
INSERT INTO `personarecorrido` VALUES ('267', 'f');
INSERT INTO `personarecorrido` VALUES ('268', 'f');
INSERT INTO `personarecorrido` VALUES ('269', 'f');
INSERT INTO `personarecorrido` VALUES ('270', 'f');
INSERT INTO `personarecorrido` VALUES ('271', 'f');
INSERT INTO `personarecorrido` VALUES ('272', 'f');
INSERT INTO `personarecorrido` VALUES ('273', 'f');
INSERT INTO `personarecorrido` VALUES ('274', 'f');
INSERT INTO `personarecorrido` VALUES ('275', 'f');
INSERT INTO `personarecorrido` VALUES ('276', 'f');
INSERT INTO `personarecorrido` VALUES ('277', 'f');
INSERT INTO `personarecorrido` VALUES ('278', 'f');
INSERT INTO `personarecorrido` VALUES ('279', 'f');
INSERT INTO `personarecorrido` VALUES ('280', 'f');
INSERT INTO `personarecorrido` VALUES ('281', 'f');
INSERT INTO `personarecorrido` VALUES ('282', 'f');
INSERT INTO `personarecorrido` VALUES ('283', 'f');
INSERT INTO `personarecorrido` VALUES ('284', 'f');
INSERT INTO `personarecorrido` VALUES ('285', 'f');
INSERT INTO `personarecorrido` VALUES ('286', 'f');
INSERT INTO `personarecorrido` VALUES ('287', 'f');
INSERT INTO `personarecorrido` VALUES ('288', 'f');
INSERT INTO `personarecorrido` VALUES ('289', 'f');
INSERT INTO `personarecorrido` VALUES ('290', 'f');
INSERT INTO `personarecorrido` VALUES ('291', 'f');
INSERT INTO `personarecorrido` VALUES ('292', 'f');
INSERT INTO `personarecorrido` VALUES ('294', 'f');
INSERT INTO `personarecorrido` VALUES ('296', 'f');
INSERT INTO `personarecorrido` VALUES ('298', 'f');
INSERT INTO `personarecorrido` VALUES ('299', 'f');
INSERT INTO `personarecorrido` VALUES ('300', 'f');
INSERT INTO `personarecorrido` VALUES ('301', 'f');
INSERT INTO `personarecorrido` VALUES ('302', 'f');
INSERT INTO `personarecorrido` VALUES ('304', 'f');
INSERT INTO `personarecorrido` VALUES ('306', 'f');
INSERT INTO `personarecorrido` VALUES ('307', 'f');
INSERT INTO `personarecorrido` VALUES ('308', 'f');
INSERT INTO `personarecorrido` VALUES ('309', 'f');
INSERT INTO `personarecorrido` VALUES ('310', 'f');
INSERT INTO `personarecorrido` VALUES ('311', 'f');
INSERT INTO `personarecorrido` VALUES ('312', 'f');
INSERT INTO `personarecorrido` VALUES ('313', 'f');
INSERT INTO `personarecorrido` VALUES ('314', 'f');
INSERT INTO `personarecorrido` VALUES ('315', 'f');
INSERT INTO `personarecorrido` VALUES ('316', 'f');
INSERT INTO `personarecorrido` VALUES ('317', 'f');
INSERT INTO `personarecorrido` VALUES ('318', 'f');
INSERT INTO `personarecorrido` VALUES ('319', 'f');
INSERT INTO `personarecorrido` VALUES ('320', 'f');
INSERT INTO `personarecorrido` VALUES ('321', 'f');
INSERT INTO `personarecorrido` VALUES ('322', 'f');
INSERT INTO `personarecorrido` VALUES ('323', 'f');
INSERT INTO `personarecorrido` VALUES ('324', 'f');
INSERT INTO `personarecorrido` VALUES ('325', 'f');
INSERT INTO `personarecorrido` VALUES ('330', 'f');
INSERT INTO `personarecorrido` VALUES ('331', 'f');
INSERT INTO `personarecorrido` VALUES ('332', 'f');
INSERT INTO `personarecorrido` VALUES ('333', 'f');
INSERT INTO `personarecorrido` VALUES ('334', 'f');
INSERT INTO `personarecorrido` VALUES ('335', 'f');
INSERT INTO `personarecorrido` VALUES ('336', 'f');
INSERT INTO `personarecorrido` VALUES ('337', 'f');
INSERT INTO `personarecorrido` VALUES ('338', 'f');
INSERT INTO `personarecorrido` VALUES ('339', 'f');
INSERT INTO `personarecorrido` VALUES ('340', 'f');
INSERT INTO `personarecorrido` VALUES ('341', 'f');

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
-- Table structure for recorrido
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
) ENGINE=InnoDB AUTO_INCREMENT=342 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of recorrido
-- ----------------------------
INSERT INTO `recorrido` VALUES ('196', '134', '2018-03-13', '12:01:42', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.409295165196106', '-71.6186409071088', '-35.40720113605203', '-71.61926921457052');
INSERT INTO `recorrido` VALUES ('197', '135', '2018-03-13', '12:58:36', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.4092856010473', '-71.61859396845102', '-35.406972683280706', '-71.61910727620125');
INSERT INTO `recorrido` VALUES ('198', '136', '2018-03-13', '13:00:12', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'Unnamed Road, Talca, VII RegiÃ³n, Chile', '-35.409295165196106', '-71.6194013133645', '-35.40684178720249', '-71.61716569215059');
INSERT INTO `recorrido` VALUES ('199', '137', '2018-03-13', '13:56:43', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.40929106627533', '-71.61857720464468', '-35.407230922310625', '-71.61928229033947');
INSERT INTO `recorrido` VALUES ('200', '138', '2018-03-13', '13:57:31', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile', 'Diego Portales 1110, CuricÃ³, VII RegiÃ³n, Chile', '-35.42324440000001', '-71.6484804', '-34.9779853', '-71.2528803');
INSERT INTO `recorrido` VALUES ('201', '139', '2018-03-13', '14:26:11', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.409261007516584', '-71.61851149052382', '-35.40857074602676', '-71.61957196891308');
INSERT INTO `recorrido` VALUES ('202', '140', '2018-03-13', '14:42:44', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'Unnamed Road, Talca, VII RegiÃ³n, Chile', '-35.40926537970037', '-71.61856513470411', '-35.40794824860811', '-71.61857284605503');
INSERT INTO `recorrido` VALUES ('203', '141', '2018-03-13', '16:23:19', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'Unnamed Road, Talca, VII RegiÃ³n, Chile', '-35.40928806039996', '-71.6185849159956', '-35.40787938556057', '-71.6186449304223');
INSERT INTO `recorrido` VALUES ('204', '142', '2018-03-13', '16:27:06', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'Unnamed Road, Talca, VII RegiÃ³n, Chile', '-35.409302269991635', '-71.61865565925837', '-35.40786544898426', '-71.61870796233416');
INSERT INTO `recorrido` VALUES ('205', '143', '2018-03-13', '20:55:09', 'Pje Ocho 1310-1336, Talca, VII RegiÃ³n, Chile', 'Pje Dos Ote 2700-2742, Talca, VII RegiÃ³n, Chile', '-35.410809292269796', '-71.65473338216543', '-35.404287768158916', '-71.65878552943467');
INSERT INTO `recorrido` VALUES ('206', '144', '2018-03-14', '10:03:59', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.40929871759395', '-71.61868080496788', '-35.40815237801048', '-71.61888767033815');
INSERT INTO `recorrido` VALUES ('207', '145', '2018-03-14', '10:29:38', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.40952497768755', '-71.61871902644634', '-35.40653271858347', '-71.61998704075813');
INSERT INTO `recorrido` VALUES ('208', '146', '2018-03-14', '11:18:57', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.409277676466004', '-71.61856915801762', '-35.40752823775639', '-71.61943417042494');
INSERT INTO `recorrido` VALUES ('209', '147', '2018-03-14', '13:47:23', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.409321671545435', '-71.61861643195152', '-35.408447777207485', '-71.62001989781857');
INSERT INTO `recorrido` VALUES ('210', '148', '2018-03-14', '13:52:56', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.40905414830012', '-71.62042323499918', '-35.40820894389797', '-71.618837043643');
INSERT INTO `recorrido` VALUES ('211', '149', '2018-03-14', '15:18:40', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile', 'Diego Portales 1110, CuricÃ³, VII RegiÃ³n, Chile', '-35.42324440000001', '-71.6484804', '-34.9779853', '-71.2528803');
INSERT INTO `recorrido` VALUES ('212', '150', '2018-03-14', '15:21:05', 'Unnamed Road, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.40849259253224', '-71.61810111254454', '-35.40887051589561', '-71.62033136934042');
INSERT INTO `recorrido` VALUES ('213', '151', '2018-03-14', '15:23:31', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'Unnamed Road, Talca, VII RegiÃ³n, Chile', '-35.41043575011795', '-71.62009097635746', '-35.40757278032522', '-71.6180893778801');
INSERT INTO `recorrido` VALUES ('214', '152', '2018-03-14', '15:27:09', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'Unnamed Road, Talca, VII RegiÃ³n, Chile', '-35.410583582295814', '-71.62016708403826', '-35.40781216205264', '-71.61776315420866');
INSERT INTO `recorrido` VALUES ('215', '153', '2018-03-14', '15:42:50', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'Unnamed Road, Talca, VII RegiÃ³n, Chile', '-35.410583582295814', '-71.62016708403826', '-35.40781216205264', '-71.61776315420866');
INSERT INTO `recorrido` VALUES ('216', '154', '2018-03-14', '15:58:11', '21 Nte. A, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.411676056416006', '-71.61827679723501', '-35.40668656986556', '-71.62054661661386');
INSERT INTO `recorrido` VALUES ('218', '156', '2018-03-14', '16:23:29', 'Av. Diego Portales 2052, Iquique, RegiÃ³n de TarapacÃ¡, Chile', 'PaicavÃ­ 773-835, ConcepciÃ³n, RegiÃ³n del BÃ­o BÃ­o, Chile', '-20.2307033', '-70.1356692', '-36.82013519999999', '-73.0443904');
INSERT INTO `recorrido` VALUES ('219', '157', '2018-03-14', '16:24:54', 'Av. Diego Portales 2052, Iquique, RegiÃ³n de TarapacÃ¡, Chile', 'PaicavÃ­ 773-835, ConcepciÃ³n, RegiÃ³n del BÃ­o BÃ­o, Chile', '-20.2307033', '-70.1356692', '-36.82013519999999', '-73.0443904');
INSERT INTO `recorrido` VALUES ('220', '158', '2018-03-14', '17:11:50', 'Plaza de Armas 976-1000, Santiago, RegiÃ³n Metropolitana, Chile', 'PaicavÃ­ 773-835, ConcepciÃ³n, RegiÃ³n del BÃ­o BÃ­o, Chile', '-33.4378305', '-70.6504492', '-36.82013519999999', '-73.0443904');
INSERT INTO `recorrido` VALUES ('221', '162', '2018-03-14', '17:24:20', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.409510768135156', '-71.61880753934383', '-35.4072229975273', '-71.61924406886101');
INSERT INTO `recorrido` VALUES ('222', '163', '2018-03-14', '17:25:08', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.409510768135156', '-71.61880753934383', '-35.4072229975273', '-71.61924406886101');
INSERT INTO `recorrido` VALUES ('223', '164', '2018-03-14', '18:07:53', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.409510768135156', '-71.61880753934383', '-35.4072229975273', '-71.61924406886101');
INSERT INTO `recorrido` VALUES ('224', '165', '2018-03-14', '18:34:46', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.40934107309458', '-71.61868616938591', '-35.407540808054385', '-71.61940667778255');
INSERT INTO `recorrido` VALUES ('225', '166', '2018-03-14', '18:36:19', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.40875465237749', '-71.61838542670012', '-35.409238873332534', '-71.62039004266262');
INSERT INTO `recorrido` VALUES ('226', '167', '2018-03-14', '18:38:16', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.40875465237749', '-71.61838542670012', '-35.409238873332534', '-71.62039004266262');
INSERT INTO `recorrido` VALUES ('227', '168', '2018-03-14', '18:38:43', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'Unnamed Road, Talca, VII RegiÃ³n, Chile', '-35.40926537970037', '-71.61861576139928', '-35.40760201991223', '-71.61829188466072');
INSERT INTO `recorrido` VALUES ('228', '169', '2018-03-14', '18:39:19', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.40969002692038', '-71.61889404058456', '-35.408172053106284', '-71.61964841187');
INSERT INTO `recorrido` VALUES ('229', '170', '2018-03-14', '18:41:06', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.409083387349725', '-71.61842364817858', '-35.40896151236264', '-71.62021100521088');
INSERT INTO `recorrido` VALUES ('230', '171', '2018-03-14', '18:42:37', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', 'Unnamed Road, Talca, VII RegiÃ³n, Chile', '-35.410613094047456', '-71.61961689591408', '-35.407652027779456', '-71.61879513412714');
INSERT INTO `recorrido` VALUES ('231', '172', '2018-03-14', '18:43:50', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', '21 Nte. A, Talca, VII RegiÃ³n, Chile', '-35.41273381301973', '-71.62137676030396', '-35.410961495854224', '-71.62082388997078');
INSERT INTO `recorrido` VALUES ('232', '173', '2018-03-14', '18:44:18', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', '21 Nte. A, Talca, VII RegiÃ³n, Chile', '-35.41272342952974', '-71.62070587277412', '-35.41127409980118', '-71.62133987993002');
INSERT INTO `recorrido` VALUES ('233', '174', '2018-03-14', '18:45:52', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', '-35.41257286877458', '-71.62103075534105', '-35.411681794735216', '-71.62195209413767');
INSERT INTO `recorrido` VALUES ('234', '175', '2018-03-14', '18:47:20', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', '21 Nte. A, Talca, VII RegiÃ³n, Chile', '-35.412891204704096', '-71.62128690630198', '-35.4113421401849', '-71.62145957350731');
INSERT INTO `recorrido` VALUES ('235', '176', '2018-03-14', '18:50:40', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', '22 Nte. A, Talca, VII RegiÃ³n, Chile', '-35.413389063181604', '-71.62084970623255', '-35.40962007231992', '-71.62301525473595');
INSERT INTO `recorrido` VALUES ('236', '177', '2018-03-14', '18:51:34', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', '21 Nte. A, Talca, VII RegiÃ³n, Chile', '-35.41371750600369', '-71.62198562175035', '-35.410413342998936', '-71.62352956831455');
INSERT INTO `recorrido` VALUES ('237', '178', '2018-03-14', '18:52:32', '19 Norte A 3110, Talca, VII RegiÃ³n, Chile', 'Av. 21 Nte., Talca, VII RegiÃ³n, Chile', '-35.41402518084393', '-71.62181597203016', '-35.41096450166717', '-71.62482239305974');
INSERT INTO `recorrido` VALUES ('238', '179', '2018-03-14', '18:54:32', '19 Norte A 3110, Talca, VII RegiÃ³n, Chile', '21 Nte. B, Talca, VII RegiÃ³n, Chile', '-35.41462987051252', '-71.62273395806552', '-35.41008925884917', '-71.6231956332922');
INSERT INTO `recorrido` VALUES ('239', '180', '2018-03-15', '13:00:30', '', '', '-35.413636898280295', '-71.61500819027424', '-35.4148326167783', '-71.64677862077951');
INSERT INTO `recorrido` VALUES ('240', '181', '2018-03-15', '13:01:31', '', '', '-35.433363164894324', '-71.65992815047503', '-35.432855322136405', '-71.65339093655348');
INSERT INTO `recorrido` VALUES ('241', '182', '2018-03-15', '13:12:41', '', '', '-35.406014595587415', '-71.65537744760513', '-35.40480480914832', '-71.65621932595968');
INSERT INTO `recorrido` VALUES ('242', '183', '2018-03-15', '13:14:00', '', '', '-35.42324440000001', '-71.6484804', '-34.9779853', '-71.2528803');
INSERT INTO `recorrido` VALUES ('243', '184', '2018-03-15', '13:14:44', '', '', '-35.42324440000001', '-71.6484804', '-34.9779853', '-71.2528803');
INSERT INTO `recorrido` VALUES ('244', '185', '2018-03-15', '13:20:46', '', '', '-35.42324440000001', '-71.6484804', '-34.9779853', '-71.2528803');
INSERT INTO `recorrido` VALUES ('245', '186', '2018-03-15', '13:23:55', '', '', '-35.42324440000001', '-71.6484804', '-34.9779853', '-71.2528803');
INSERT INTO `recorrido` VALUES ('246', '187', '2018-03-15', '13:31:54', '', '', '-35.42324440000001', '-71.6484804', '-34.9779853', '-71.2528803');
INSERT INTO `recorrido` VALUES ('247', '188', '2018-03-15', '13:35:20', '', '', '-35.42324440000001', '-71.6484804', '-34.9779853', '-71.2528803');
INSERT INTO `recorrido` VALUES ('248', '189', '2018-03-15', '13:36:48', '', '', '-35.42324440000001', '-71.6484804', '-34.9779853', '-71.2528803');
INSERT INTO `recorrido` VALUES ('249', '190', '2018-03-15', '13:37:32', '', '', '-35.42324440000001', '-71.6484804', '-34.9779853', '-71.2528803');
INSERT INTO `recorrido` VALUES ('250', '191', '2018-03-15', '13:38:16', '', '', '-35.42324440000001', '-71.6484804', '-34.9779853', '-71.2528803');
INSERT INTO `recorrido` VALUES ('251', '192', '2018-03-15', '13:38:53', '', '', '-35.42324440000001', '-71.6484804', '-34.9779853', '-71.2528803');
INSERT INTO `recorrido` VALUES ('252', '193', '2018-03-15', '13:39:20', '', '', '-35.42324440000001', '-71.6484804', '-34.9779853', '-71.2528803');
INSERT INTO `recorrido` VALUES ('253', '194', '2018-03-15', '13:43:23', '', '', '-35.42324440000001', '-71.6484804', '-34.9779853', '-71.2528803');
INSERT INTO `recorrido` VALUES ('254', '195', '2018-03-15', '13:45:08', '', '', '-35.42324440000001', '-71.6484804', '-34.9779853', '-71.2528803');
INSERT INTO `recorrido` VALUES ('255', '196', '2018-03-15', '13:45:39', '', '', '-35.736599371411636', '-71.4379173517227', '-35.266170701567795', '-71.609787940979');
INSERT INTO `recorrido` VALUES ('256', '197', '2018-03-15', '13:47:00', '', '', '-35.736599371411636', '-71.4379173517227', '-35.266170701567795', '-71.609787940979');
INSERT INTO `recorrido` VALUES ('257', '198', '2018-03-15', '13:49:05', '', '', '-35.736599371411636', '-71.4379173517227', '-35.266170701567795', '-71.609787940979');
INSERT INTO `recorrido` VALUES ('258', '199', '2018-03-15', '13:50:07', '', '', '-35.736599371411636', '-71.4379173517227', '-35.266170701567795', '-71.609787940979');
INSERT INTO `recorrido` VALUES ('259', '200', '2018-03-15', '13:51:43', '', '', '-35.42324440000001', '-71.6484804', '-34.9779853', '-71.2528803');
INSERT INTO `recorrido` VALUES ('260', '201', '2018-03-15', '13:54:35', 'Uno Sur 3188, Talca, VII RegiÃ³n, Chile', 'Lago Llanquihue 3144-3176, Talca, VII RegiÃ³n, Chile', '-35.43165386105282', '-71.63135658949614', '-35.43029884932783', '-71.63198322057725');
INSERT INTO `recorrido` VALUES ('261', '202', '2018-03-15', '13:55:33', 'Uno Sur 3188, Talca, VII RegiÃ³n, Chile', 'Lago Llanquihue 3144-3176, Talca, VII RegiÃ³n, Chile', '-35.43165386105282', '-71.63135658949614', '-35.43029884932783', '-71.63198322057725');
INSERT INTO `recorrido` VALUES ('262', '203', '2018-03-15', '14:19:36', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.40960203713964', '-71.618747189641', '-35.408737436793366', '-71.61916662007572');
INSERT INTO `recorrido` VALUES ('263', '204', '2018-03-15', '14:21:24', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.40960203713964', '-71.618747189641', '-35.408737436793366', '-71.61916662007572');
INSERT INTO `recorrido` VALUES ('264', '205', '2018-03-15', '14:23:42', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.409827749862586', '-71.61980263888834', '-35.41065162326252', '-71.61966416984795');
INSERT INTO `recorrido` VALUES ('265', '206', '2018-03-15', '14:25:22', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.40949765162302', '-71.61873310804367', '-35.408807665422955', '-71.61881625652313');
INSERT INTO `recorrido` VALUES ('266', '207', '2018-03-15', '14:27:01', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.40949765162302', '-71.61873310804367', '-35.408807665422955', '-71.61881625652313');
INSERT INTO `recorrido` VALUES ('267', '208', '2018-03-15', '14:28:47', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.40949765162302', '-71.61873310804367', '-35.408807665422955', '-71.61881625652313');
INSERT INTO `recorrido` VALUES ('268', '209', '2018-03-15', '14:29:54', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.40949765162302', '-71.61873310804367', '-35.408807665422955', '-71.61881625652313');
INSERT INTO `recorrido` VALUES ('269', '210', '2018-03-15', '14:30:38', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.409240786163494', '-71.61861911416054', '-35.40859752587808', '-71.61895036697388');
INSERT INTO `recorrido` VALUES ('270', '211', '2018-03-15', '14:31:21', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.409240786163494', '-71.61861911416054', '-35.40859752587808', '-71.61895036697388');
INSERT INTO `recorrido` VALUES ('271', '212', '2018-03-15', '14:32:32', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.409240786163494', '-71.61861911416054', '-35.40859752587808', '-71.61895036697388');
INSERT INTO `recorrido` VALUES ('272', '213', '2018-03-15', '14:33:25', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.409240786163494', '-71.61861911416054', '-35.40859752587808', '-71.61895036697388');
INSERT INTO `recorrido` VALUES ('273', '214', '2018-03-15', '14:34:14', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.409240786163494', '-71.61861911416054', '-35.40859752587808', '-71.61895036697388');
INSERT INTO `recorrido` VALUES ('274', '215', '2018-03-15', '14:35:02', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.409240786163494', '-71.61861911416054', '-35.40859752587808', '-71.61895036697388');
INSERT INTO `recorrido` VALUES ('275', '216', '2018-03-15', '14:36:11', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.409240786163494', '-71.61861911416054', '-35.40859752587808', '-71.61895036697388');
INSERT INTO `recorrido` VALUES ('276', '217', '2018-03-15', '14:36:25', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.409240786163494', '-71.61861911416054', '-35.40859752587808', '-71.61895036697388');
INSERT INTO `recorrido` VALUES ('277', '218', '2018-03-15', '14:37:00', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.409240786163494', '-71.61861911416054', '-35.40859752587808', '-71.61895036697388');
INSERT INTO `recorrido` VALUES ('278', '219', '2018-03-15', '14:37:25', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.409240786163494', '-71.61861911416054', '-35.40859752587808', '-71.61895036697388');
INSERT INTO `recorrido` VALUES ('279', '220', '2018-03-15', '14:39:21', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.409240786163494', '-71.61861911416054', '-35.40859752587808', '-71.61895036697388');
INSERT INTO `recorrido` VALUES ('280', '221', '2018-03-15', '14:40:51', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.409240786163494', '-71.61861911416054', '-35.40859752587808', '-71.61895036697388');
INSERT INTO `recorrido` VALUES ('281', '222', '2018-03-15', '14:41:45', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.409240786163494', '-71.61861911416054', '-35.40859752587808', '-71.61895036697388');
INSERT INTO `recorrido` VALUES ('282', '223', '2018-03-15', '14:42:58', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.409240786163494', '-71.61861911416054', '-35.40859752587808', '-71.61895036697388');
INSERT INTO `recorrido` VALUES ('283', '224', '2018-03-15', '14:45:55', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.409240786163494', '-71.61861911416054', '-35.40859752587808', '-71.61895036697388');
INSERT INTO `recorrido` VALUES ('284', '225', '2018-03-15', '14:48:48', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.409240786163494', '-71.61861911416054', '-35.40859752587808', '-71.61895036697388');
INSERT INTO `recorrido` VALUES ('285', '226', '2018-03-15', '14:52:03', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.409240786163494', '-71.61861911416054', '-35.40859752587808', '-71.61895036697388');
INSERT INTO `recorrido` VALUES ('286', '227', '2018-03-15', '14:52:51', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.409240786163494', '-71.61861911416054', '-35.40859752587808', '-71.61895036697388');
INSERT INTO `recorrido` VALUES ('287', '228', '2018-03-15', '14:58:54', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.40900550761466', '-71.6193024069071', '-35.408806299107795', '-71.61839783191681');
INSERT INTO `recorrido` VALUES ('288', '229', '2018-03-15', '15:01:00', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.40900550761466', '-71.6193024069071', '-35.408806299107795', '-71.61839783191681');
INSERT INTO `recorrido` VALUES ('289', '230', '2018-03-15', '15:01:58', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.42324440000001', '-71.6484804', '-35.408806299107795', '-71.61839783191681');
INSERT INTO `recorrido` VALUES ('290', '231', '2018-03-15', '15:07:01', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.42324440000001', '-71.6484804', '-35.408806299107795', '-71.61839783191681');
INSERT INTO `recorrido` VALUES ('291', '232', '2018-03-15', '16:29:24', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.42324440000001', '-71.6484804', '-35.408806299107795', '-71.61839783191681');
INSERT INTO `recorrido` VALUES ('292', '233', '2018-03-15', '16:30:30', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.42324440000001', '-71.6484804', '-35.408806299107795', '-71.61839783191681');
INSERT INTO `recorrido` VALUES ('294', '235', '2018-03-15', '16:39:01', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.42324440000001', '-71.6484804', '-35.408806299107795', '-71.61839783191681');
INSERT INTO `recorrido` VALUES ('296', '237', '2018-03-15', '16:40:03', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.42324440000001', '-71.6484804', '-35.408806299107795', '-71.61839783191681');
INSERT INTO `recorrido` VALUES ('298', '239', '2018-03-15', '16:44:04', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.42324440000001', '-71.6484804', '-35.408806299107795', '-71.61839783191681');
INSERT INTO `recorrido` VALUES ('299', '240', '2018-03-15', '16:45:40', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.42324440000001', '-71.6484804', '-35.408806299107795', '-71.61839783191681');
INSERT INTO `recorrido` VALUES ('300', '241', '2018-03-15', '16:46:17', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.42324440000001', '-71.6484804', '-35.408806299107795', '-71.61839783191681');
INSERT INTO `recorrido` VALUES ('301', '242', '2018-03-15', '16:47:20', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.42324440000001', '-71.6484804', '-35.408806299107795', '-71.61839783191681');
INSERT INTO `recorrido` VALUES ('302', '243', '2018-03-15', '16:47:43', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.42324440000001', '-71.6484804', '-35.408806299107795', '-71.61839783191681');
INSERT INTO `recorrido` VALUES ('304', '245', '2018-03-15', '16:50:19', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.42324440000001', '-71.6484804', '-35.408806299107795', '-71.61839783191681');
INSERT INTO `recorrido` VALUES ('306', '247', '2018-03-15', '16:51:28', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.42324440000001', '-71.6484804', '-35.408806299107795', '-71.61839783191681');
INSERT INTO `recorrido` VALUES ('307', '248', '2018-03-15', '16:51:50', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.42324440000001', '-71.6484804', '-35.408806299107795', '-71.61839783191681');
INSERT INTO `recorrido` VALUES ('308', '249', '2018-03-15', '16:52:47', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.42324440000001', '-71.6484804', '-35.408806299107795', '-71.61839783191681');
INSERT INTO `recorrido` VALUES ('309', '250', '2018-03-15', '16:59:46', 'Alameda - 2 Nte., Talca, VII RegiÃ³n, Chile', '23 Nte. 1523, Talca, VII RegiÃ³n, Chile', '-35.42324440000001', '-71.6484804', '-35.408806299107795', '-71.61839783191681');
INSERT INTO `recorrido` VALUES ('310', '251', '2018-03-15', '17:00:11', 'K-611 9, Talca, VII RegiÃ³n, Chile', 'Catorce Ote 1280, Talca, VII RegiÃ³n, Chile', '-35.45682807071284', '-71.62526797503233', '-35.42618450063538', '-71.64562325924635');
INSERT INTO `recorrido` VALUES ('311', '252', '2018-03-15', '17:02:36', 'K-611 9, Talca, VII RegiÃ³n, Chile', 'Catorce Ote 1280, Talca, VII RegiÃ³n, Chile', '-35.45682807071284', '-71.62526797503233', '-35.42618450063538', '-71.64562325924635');
INSERT INTO `recorrido` VALUES ('312', '253', '2018-03-15', '17:03:05', 'K-611 9, Talca, VII RegiÃ³n, Chile', 'Catorce Ote 1280, Talca, VII RegiÃ³n, Chile', '-35.45682807071284', '-71.62526797503233', '-35.42618450063538', '-71.64562325924635');
INSERT INTO `recorrido` VALUES ('313', '254', '2018-03-15', '17:05:59', 'K-611 9, Talca, VII RegiÃ³n, Chile', 'Catorce Ote 1280, Talca, VII RegiÃ³n, Chile', '-35.45682807071284', '-71.62526797503233', '-35.42618450063538', '-71.64562325924635');
INSERT INTO `recorrido` VALUES ('314', '255', '2018-03-15', '17:09:32', 'K-611 9, Talca, VII RegiÃ³n, Chile', 'Catorce Ote 1280, Talca, VII RegiÃ³n, Chile', '-35.45682807071284', '-71.62526797503233', '-35.42618450063538', '-71.64562325924635');
INSERT INTO `recorrido` VALUES ('315', '256', '2018-03-15', '17:11:24', 'K-611 9, Talca, VII RegiÃ³n, Chile', 'Veintisiete 1/2 Ote 328-392, Talca, VII RegiÃ³n, Chile', '-35.46013442594832', '-71.62398487329483', '-35.43974712257938', '-71.63428455591202');
INSERT INTO `recorrido` VALUES ('316', '257', '2018-03-15', '17:15:43', 'K-611 9, Talca, VII RegiÃ³n, Chile', 'Veintisiete 1/2 Ote 328-392, Talca, VII RegiÃ³n, Chile', '-35.46013442594832', '-71.62398487329483', '-35.43974712257938', '-71.63428455591202');
INSERT INTO `recorrido` VALUES ('317', '258', '2018-03-15', '17:18:04', 'K-611 9, Talca, VII RegiÃ³n, Chile', 'Veintisiete 1/2 Ote 328-392, Talca, VII RegiÃ³n, Chile', '-35.46013442594832', '-71.62398487329483', '-35.43974712257938', '-71.63428455591202');
INSERT INTO `recorrido` VALUES ('318', '259', '2018-03-15', '17:19:29', 'K-611 9, Talca, VII RegiÃ³n, Chile', 'Veintisiete 1/2 Ote 328-392, Talca, VII RegiÃ³n, Chile', '-35.46013442594832', '-71.62398487329483', '-35.43974712257938', '-71.63428455591202');
INSERT INTO `recorrido` VALUES ('319', '260', '2018-03-15', '17:20:08', 'K-611 9, Talca, VII RegiÃ³n, Chile', 'Veintisiete 1/2 Ote 328-392, Talca, VII RegiÃ³n, Chile', '-35.46013442594832', '-71.62398487329483', '-35.43974712257938', '-71.63428455591202');
INSERT INTO `recorrido` VALUES ('320', '261', '2018-03-15', '17:20:23', 'K-611 9, Talca, VII RegiÃ³n, Chile', 'Veintisiete 1/2 Ote 328-392, Talca, VII RegiÃ³n, Chile', '-35.46013442594832', '-71.62398487329483', '-35.43974712257938', '-71.63428455591202');
INSERT INTO `recorrido` VALUES ('321', '262', '2018-03-15', '17:21:10', 'K-611 9, Talca, VII RegiÃ³n, Chile', 'Veintisiete 1/2 Ote 328-392, Talca, VII RegiÃ³n, Chile', '-35.46013442594832', '-71.62398487329483', '-35.43974712257938', '-71.63428455591202');
INSERT INTO `recorrido` VALUES ('322', '263', '2018-03-15', '17:24:07', 'K-611 9, Talca, VII RegiÃ³n, Chile', 'Veintisiete 1/2 Ote 328-392, Talca, VII RegiÃ³n, Chile', '-35.46013442594832', '-71.62398487329483', '-35.43974712257938', '-71.63428455591202');
INSERT INTO `recorrido` VALUES ('323', '264', '2018-03-15', '17:25:53', 'K-611 9, Talca, VII RegiÃ³n, Chile', 'Veintisiete 1/2 Ote 328-392, Talca, VII RegiÃ³n, Chile', '-35.46013442594832', '-71.62398487329483', '-35.43974712257938', '-71.63428455591202');
INSERT INTO `recorrido` VALUES ('324', '265', '2018-03-15', '17:27:02', 'K-611 9, Talca, VII RegiÃ³n, Chile', 'Veintisiete 1/2 Ote 328-392, Talca, VII RegiÃ³n, Chile', '-35.46013442594832', '-71.62398487329483', '-35.43974712257938', '-71.63428455591202');
INSERT INTO `recorrido` VALUES ('325', '266', '2018-03-15', '17:33:41', 'K-611 9, Talca, VII RegiÃ³n, Chile', 'Veintisiete 1/2 Ote 328-392, Talca, VII RegiÃ³n, Chile', '-35.46013442594832', '-71.62398487329483', '-35.43974712257938', '-71.63428455591202');
INSERT INTO `recorrido` VALUES ('330', '284', '2018-03-15', '18:41:56', 'K-611 9, Talca, VII RegiÃ³n, Chile', 'Veintisiete 1/2 Ote 328-392, Talca, VII RegiÃ³n, Chile', '-35.46013442594832', '-71.62398487329483', '-35.43974712257938', '-71.63428455591202');
INSERT INTO `recorrido` VALUES ('331', '285', '2018-03-15', '18:44:10', 'K-611 9, Talca, VII RegiÃ³n, Chile', 'Veintisiete 1/2 Ote 328-392, Talca, VII RegiÃ³n, Chile', '-35.46013442594832', '-71.62398487329483', '-35.43974712257938', '-71.63428455591202');
INSERT INTO `recorrido` VALUES ('332', '286', '2018-03-15', '18:47:25', 'K-611 9, Talca, VII RegiÃ³n, Chile', 'Veintisiete 1/2 Ote 328-392, Talca, VII RegiÃ³n, Chile', '-35.46013442594832', '-71.62398487329483', '-35.43974712257938', '-71.63428455591202');
INSERT INTO `recorrido` VALUES ('333', '287', '2018-03-15', '18:50:57', 'K-611 9, Talca, VII RegiÃ³n, Chile', 'Veintisiete 1/2 Ote 328-392, Talca, VII RegiÃ³n, Chile', '-35.46013442594832', '-71.62398487329483', '-35.43974712257938', '-71.63428455591202');
INSERT INTO `recorrido` VALUES ('334', '288', '2018-03-15', '18:55:00', 'K-611 9, Talca, VII RegiÃ³n, Chile', 'Veintisiete 1/2 Ote 328-392, Talca, VII RegiÃ³n, Chile', '-35.46013442594832', '-71.62398487329483', '-35.43974712257938', '-71.63428455591202');
INSERT INTO `recorrido` VALUES ('335', '289', '2018-03-15', '18:55:49', 'K-611 9, Talca, VII RegiÃ³n, Chile', 'Veintisiete 1/2 Ote 328-392, Talca, VII RegiÃ³n, Chile', '-35.46013442594832', '-71.62398487329483', '-35.43974712257938', '-71.63428455591202');
INSERT INTO `recorrido` VALUES ('336', '290', '2018-03-15', '18:56:32', 'K-611 9, Talca, VII RegiÃ³n, Chile', 'Veintisiete 1/2 Ote 328-392, Talca, VII RegiÃ³n, Chile', '-35.46013442594832', '-71.62398487329483', '-35.43974712257938', '-71.63428455591202');
INSERT INTO `recorrido` VALUES ('337', '291', '2018-03-15', '18:58:08', 'K-611 9, Talca, VII RegiÃ³n, Chile', 'Veintisiete 1/2 Ote 328-392, Talca, VII RegiÃ³n, Chile', '-35.46013442594832', '-71.62398487329483', '-35.43974712257938', '-71.63428455591202');
INSERT INTO `recorrido` VALUES ('338', '292', '2018-03-15', '19:03:42', 'K-611 9, Talca, VII RegiÃ³n, Chile', 'Veintisiete 1/2 Ote 328-392, Talca, VII RegiÃ³n, Chile', '-35.46013442594832', '-71.62398487329483', '-35.43974712257938', '-71.63428455591202');
INSERT INTO `recorrido` VALUES ('339', '293', '2018-03-15', '19:05:23', 'K-611 9, Talca, VII RegiÃ³n, Chile', 'Veintisiete 1/2 Ote 328-392, Talca, VII RegiÃ³n, Chile', '-35.46013442594832', '-71.62398487329483', '-35.43974712257938', '-71.63428455591202');
INSERT INTO `recorrido` VALUES ('340', '294', '2018-03-15', '19:06:39', 'K-611 9, Talca, VII RegiÃ³n, Chile', 'Veintisiete 1/2 Ote 328-392, Talca, VII RegiÃ³n, Chile', '-35.46013442594832', '-71.62398487329483', '-35.43974712257938', '-71.63428455591202');
INSERT INTO `recorrido` VALUES ('341', '295', '2018-03-15', '19:11:37', 'K-611 9, Talca, VII RegiÃ³n, Chile', 'Veintisiete 1/2 Ote 328-392, Talca, VII RegiÃ³n, Chile', '-35.46013442594832', '-71.62398487329483', '-35.43974712257938', '-71.63428455591202');

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
INSERT INTO `taxi` VALUES ('1', '1', '1', '1', '1');
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
INSERT INTO `taxista` VALUES ('1', '1', '1', '1', '1', '1', '1', '1', 'deshabilitado');
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
