/*
 Navicat Premium Data Transfer

 Source Server         : CanKer
 Source Server Type    : MySQL
 Source Server Version : 50542
 Source Host           : localhost
 Source Database       : perfecTime

 Target Server Type    : MySQL
 Target Server Version : 50542
 File Encoding         : utf-8

 Date: 11/25/2015 19:37:08 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `almacenes`
-- ----------------------------
DROP TABLE IF EXISTS `almacenes`;
CREATE TABLE `almacenes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `encargado` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `domicilio` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `almacenes_domicilio_foreign` (`domicilio`),
  CONSTRAINT `almacenes_domicilio_foreign` FOREIGN KEY (`domicilio`) REFERENCES `domicilios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `almacenes`
-- ----------------------------
BEGIN;
INSERT INTO `almacenes` VALUES ('1', 'Central de Mayoreo', 'Carlos Paz', 'charlypz94@hotmail.com', '2', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
COMMIT;

-- ----------------------------
--  Table structure for `categorias`
-- ----------------------------
DROP TABLE IF EXISTS `categorias`;
CREATE TABLE `categorias` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `categorias`
-- ----------------------------
BEGIN;
INSERT INTO `categorias` VALUES ('1', 'Brazaletes', '', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('2', 'Collares', '', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('3', 'Tiaras', '', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('4', 'Pulceras', '', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('5', 'Peinetas', '', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('6', 'Broches', '', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('7', 'Pasadores', '', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('8', 'Aretes', '', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
COMMIT;

-- ----------------------------
--  Table structure for `clientes`
-- ----------------------------
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `apellidoP` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `apellidoM` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `RFC` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `domicilio` int(10) unsigned NOT NULL,
  `id_tipo_cliente` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `clientes_email_unique` (`email`),
  KEY `clientes_id_tipo_cliente_foreign` (`id_tipo_cliente`),
  KEY `clientes_domicilio_foreign` (`domicilio`),
  CONSTRAINT `clientes_domicilio_foreign` FOREIGN KEY (`domicilio`) REFERENCES `domicilios` (`id`),
  CONSTRAINT `clientes_id_tipo_cliente_foreign` FOREIGN KEY (`id_tipo_cliente`) REFERENCES `tipo_clientes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `clientes`
-- ----------------------------
BEGIN;
INSERT INTO `clientes` VALUES ('1', 'Roman', 'Montes', 'Fernandez', 'rmont23@gmail.com', 'FMR432FDSGIF09', '4', '2', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
COMMIT;

-- ----------------------------
--  Table structure for `domicilios`
-- ----------------------------
DROP TABLE IF EXISTS `domicilios`;
CREATE TABLE `domicilios` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `calle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `numE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `numI` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `colonia` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cp` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ciudad` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `estado` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pais` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `domicilios`
-- ----------------------------
BEGIN;
INSERT INTO `domicilios` VALUES ('1', 'tamaulipas', '3', '2', 'Roma', '31231', 'Ciudad de Mexico', 'DIstrito Federal', 'México', '43242344', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('2', 'del puente', '20', '6', 'Ejidos', '32421', 'Ciudad de Mexico', 'Distrito Federal', 'Mexico', '42342342', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('3', 'doce', '9', '4', 'Sta Teresa', '10930', 'Ciudad de Mexico', 'Distrito Federal', 'Mexico', '98028323', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('4', 'Moctezuma', '1', '43', 'Del valle', '49123', 'Ciudad de Mexico', 'Distrito Federal', 'Mexico', '42398423', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('5', 'V. Carranza', '32', '3', 'Centro', '15039', 'Ciudad de Mexico', 'Distrito Federal', 'Mexico', '55434323', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
COMMIT;

-- ----------------------------
--  Table structure for `productos`
-- ----------------------------
DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `precioPublico` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `precioCompra` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `categoria` int(10) unsigned NOT NULL,
  `proveedor` int(10) unsigned NOT NULL,
  `almacen` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `productos_categoria_foreign` (`categoria`),
  KEY `productos_proveedor_foreign` (`proveedor`),
  KEY `productos_almacen_foreign` (`almacen`),
  CONSTRAINT `productos_almacen_foreign` FOREIGN KEY (`almacen`) REFERENCES `almacenes` (`id`),
  CONSTRAINT `productos_categoria_foreign` FOREIGN KEY (`categoria`) REFERENCES `categorias` (`id`),
  CONSTRAINT `productos_proveedor_foreign` FOREIGN KEY (`proveedor`) REFERENCES `proveedores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `productos`
-- ----------------------------
BEGIN;
INSERT INTO `productos` VALUES ('1', 'Aretes Tornasol', 'Aretes Color Tornalos', '100', '70', 'img/productos/aretes/art1.png', '8', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('2', 'Aretes Plata', 'Aretes Color Plata', '100', '70', 'img/aretes/art2.png', '8', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('3', 'Aretes S', 'Aretes Plateado en Forma de S', '120', '80', 'img/productos/aretes/art3.png', '8', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('4', 'Aretes Pendulo', 'Aretes Plateado en Forma de Pendulo', '110', '80', 'img/productos/aretes/art4.png', '8', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('5', 'Aretes Cascada', 'Aretes Color Oro en forma de cascada', '130', '90', 'img/productos/aretes/art5.png', '8', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('6', 'Brazalete Sencillo Oro', 'Brazalete Sencillo color oro', '130', '80', 'img/productos/brazaletes/brz13.png', '1', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('7', 'Brazalete Sencillo Plata', 'Brazalete Sencillo color plata', '130', '80', 'img/productos/brazaletes/brz14.png', '1', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('8', 'Brazalete Doble Oro', 'Brazalete Doble color Oro', '150', '100', 'img/productos/brazaletes/brz15.png', '1', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('9', 'Brazalete Doble Plata', 'Brazalete Doble color plata', '150', '100', 'img/productos/brazaletes/brz16.png', '1', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('10', 'Brazalete Triple Oro', 'Brazalete Triple color oro', '180', '110', 'img/productos/brazaletes/brz17.png', '1', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('11', 'Broche Flor Tornasol', 'Broche en forma de flor color tornasol', '90', '70', 'img/productos/broches/bro92.png', '6', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('12', 'Broche Flor Plata', 'Broche en forma de flor color plata', '90', '70', 'img/productos/broches/bro92.png', '6', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('13', 'Broche Estrella Tornasol', 'Broche en forma de estrella color tornasol', '120', '80', 'img/productos/broches/bro94.png', '6', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('14', 'Broche Estrella Plata', 'Broche en forma de estrella color plata', '120', '80', 'img/productos/broches/bro95.png', '6', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('15', 'Broche 8 picos Plata', 'Broche con 5 picos color plata', '130', '80', 'img/productos/broches/bro96.png', '6', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('16', 'Collar Flor Amarillo', 'Collar con flores color amarillo', '150', '90', 'img/productos/collares/col102.png', '2', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('17', 'Collar Flor Oro', 'Collar con flores color oro', '150', '90', 'img/productos/collares/col103.png', '2', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('18', 'Collar Flor Plata', 'Collar con flores color plata', '150', '90', 'img/productos/collares/col104.png', '2', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('19', 'Collar Flor Azul', 'Collar con flores color azul con plata', '150', '90', 'img/productos/collares/col105.png', '2', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('20', 'Collar Flor plata', 'Collar con flores color plata', '150', '90', 'img/productos/collares/col106.png', '2', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('21', 'Pasador Flor Oro rosa', 'Pasador colo oro rosa en forma de flor', '80', '50', 'img/productos/pasadores/pas81.png', '7', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('22', 'Pasador Flor Tornasol', 'Pasador tornasol en forma de flor', '80', '50', 'img/productos/pasadores/pas82.png', '7', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('23', 'Pasador Flor Azul', 'Pasador azul en forma de flor', '80', '50', 'img/productos/pasadores/pas83.png', '7', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('24', 'Pasador Flor Negro', 'Pasador negro en forma de flor', '80', '50', 'img/productos/pasadores/pas84.png', '7', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('25', 'Pasador Flor Plata', 'Pasador plata en forma de flor', '80', '50', 'img/productos/pasadores/pas85.png', '7', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('26', 'Peineta Oro', 'Peineta color oro', '100', '80', 'img/productos/peinetas/pei79.png', '5', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('27', 'Peineta Plata', 'Peineta color plata', '100', '80', 'img/productos/peinetas/pei80.png', '5', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('28', 'Pulsera Amarilla', 'Pulsera Amarilla con flores', '80', '20', 'img/productos/pulceras/pul1.png', '4', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('29', 'Pulsera Negra', 'Pulsera Negra con flores', '80', '20', 'img/productos/pulceras/pul2.png', '4', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('30', 'Pulsera Azul', 'Pulsera Azul con flores', '80', '20', 'img/productos/pulceras/pul3.png', '4', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('31', 'Pulsera Verde', 'Pulsera Verde con flores', '80', '20', 'img/productos/pulceras/pul4.png', '4', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('32', 'Pulsera Rosa', 'Pulsera Rosa con flores', '80', '20', 'img/productos/pulceras/pul5.png', '4', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('33', 'Tiara Flamas Tornasol', 'Tiara color tornasol con figuras de flamas', '150', '90', 'img/productos/tiaras/tia306.png', '3', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('34', 'Tiara Flamas Plata', 'Tiara color plata con figuras de flama', '150', '90', 'img/productos/tiaras/tia307.png', '3', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('35', 'Tiara Piedras Oro', 'Tiara color oro con piedras', '140', '80', 'img/productos/tiaras/tia308.png', '3', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('36', 'Tiara Piedras Tornasol', 'Tiara color tornasol con piedras', '140', '80', 'img/productos/tiaras/tia309.png', '3', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('37', 'Tiara Piedras Plata', 'Tiara conlor plata con piedras', '150', '80', 'img/productos/tiaras/tia310.png', '3', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
COMMIT;

-- ----------------------------
--  Table structure for `productos_almacenes`
-- ----------------------------
DROP TABLE IF EXISTS `productos_almacenes`;
CREATE TABLE `productos_almacenes` (
  `producto` int(10) unsigned NOT NULL,
  `almacen` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`producto`,`almacen`),
  KEY `productos_almacenes_almacen_foreign` (`almacen`),
  CONSTRAINT `productos_almacenes_almacen_foreign` FOREIGN KEY (`almacen`) REFERENCES `almacenes` (`id`),
  CONSTRAINT `productos_almacenes_producto_foreign` FOREIGN KEY (`producto`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `productos_proveedores`
-- ----------------------------
DROP TABLE IF EXISTS `productos_proveedores`;
CREATE TABLE `productos_proveedores` (
  `producto` int(10) unsigned NOT NULL,
  `proveedor` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`producto`,`proveedor`),
  KEY `productos_proveedores_proveedor_foreign` (`proveedor`),
  CONSTRAINT `productos_proveedores_producto_foreign` FOREIGN KEY (`producto`) REFERENCES `productos` (`id`),
  CONSTRAINT `productos_proveedores_proveedor_foreign` FOREIGN KEY (`proveedor`) REFERENCES `proveedores` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `proveedores`
-- ----------------------------
DROP TABLE IF EXISTS `proveedores`;
CREATE TABLE `proveedores` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `RFC` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `domicilio` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `proveedores_email_unique` (`email`),
  KEY `proveedores_domicilio_foreign` (`domicilio`),
  CONSTRAINT `proveedores_domicilio_foreign` FOREIGN KEY (`domicilio`) REFERENCES `domicilios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `proveedores`
-- ----------------------------
BEGIN;
INSERT INTO `proveedores` VALUES ('1', 'Leonardo Fernandez', 'FRO2384DSHF09', 'leofrnd@christinacl.com', '2', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
COMMIT;

-- ----------------------------
--  Table structure for `tipo_clientes`
-- ----------------------------
DROP TABLE IF EXISTS `tipo_clientes`;
CREATE TABLE `tipo_clientes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `tipo_clientes`
-- ----------------------------
BEGIN;
INSERT INTO `tipo_clientes` VALUES ('1', 'normal', '', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('2', 'frecuente', '', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
COMMIT;

-- ----------------------------
--  Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `apellidoP` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `apellidoM` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `tipo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `users`
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES ('1', 'DianaOsorio', 'Diana', 'Osorio', 'Rodriguez', 'dianaosorio1190@hotmail.com', 'password', 'admin', null, null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('2', 'CarlosPaz', 'Carlos', 'Paz', 'Osorio', 'charlypz94@hotmail.com', 'password', 'admin', null, null, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
