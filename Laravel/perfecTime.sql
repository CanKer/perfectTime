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

 Date: 11/17/2015 20:12:27 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `Menu`
-- ----------------------------
DROP TABLE IF EXISTS `Menu`;
CREATE TABLE `Menu` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `Menu`
-- ----------------------------
BEGIN;
INSERT INTO `Menu` VALUES ('1', 'Productos'), ('2', 'Almacenes'), ('3', 'Proveedores'), ('4', 'Clientes'), ('5', 'Categorías'), ('6', 'Usuarios');
COMMIT;

-- ----------------------------
--  Table structure for `almacenes`
-- ----------------------------
DROP TABLE IF EXISTS `almacenes`;
CREATE TABLE `almacenes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `encargado` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `calle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `numE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `numbI` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `colonia` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ciudad` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cp` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `estado` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pais` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `id` (`id`,`nombre`),
  KEY `nombre` (`nombre`),
  KEY `nombre_2` (`nombre`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `almacenes`
-- ----------------------------
BEGIN;
INSERT INTO `almacenes` VALUES ('1', 'Central de Mayoreo Apartado ', 'Carlos Paz', 'charlypz94@hotmail.com', '5555084807', 'Apartado', '14', 'Local 204', 'Centro', 'Ciudad de Mexico', '06000', 'DF', 'México', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
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
  PRIMARY KEY (`id`),
  KEY `id` (`id`,`nombre`),
  KEY `nombre` (`nombre`),
  KEY `nombre_2` (`nombre`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `categorias`
-- ----------------------------
BEGIN;
INSERT INTO `categorias` VALUES ('1', 'Collares', '', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('2', 'Broches', '', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('3', 'Brazaletes', '', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('4', 'Aretes', '', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('5', 'Tiaras', '', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('6', 'Peinetas', '', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('7', 'Pasadores', '', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('8', 'Pulseras', '', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
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
  `calle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `numE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `numI` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `colonia` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cp` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ciudad` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `estado` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pais` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_tipo_cliente` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `clientes_email_unique` (`email`),
  KEY `clientes_id_tipo_cliente_foreign` (`id_tipo_cliente`),
  CONSTRAINT `clientes_id_tipo_cliente_foreign` FOREIGN KEY (`id_tipo_cliente`) REFERENCES `tipo_clientes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `migrations`
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `migrations`
-- ----------------------------
BEGIN;
INSERT INTO `migrations` VALUES ('2014_10_12_000000_create_users_table', '1'), ('2014_10_12_100000_create_password_resets_table', '1'), ('2015_11_05_231000_create_proveedores_table', '1'), ('2015_11_05_232000_create_almacenes_table', '1'), ('2015_11_05_233000_create_categorias_table', '1'), ('2015_11_05_234000_create_tipo_clientes_table', '1'), ('2015_11_05_235000_create_productos_table', '1'), ('2015_11_05_236000_create_clientes_table', '1');
COMMIT;

-- ----------------------------
--  Table structure for `password_resets`
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `productos`
-- ----------------------------
DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `precioPublico` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `precioCompra` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_categoria` int(10) unsigned DEFAULT NULL,
  `id_proveedor` int(10) unsigned DEFAULT NULL,
  `id_almacen` int(10) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `categoria` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `productos_id_proveedor_foreign` (`id_proveedor`),
  KEY `productos_id_almacen_foreign` (`id_almacen`),
  KEY `productos_id_categoria_foreign` (`id_categoria`),
  KEY `productos_categoria` (`categoria`) USING BTREE,
  CONSTRAINT `productos_categoria` FOREIGN KEY (`categoria`) REFERENCES `categorias` (`nombre`),
  CONSTRAINT `productos_id_almacen_foreign` FOREIGN KEY (`id_almacen`) REFERENCES `almacenes` (`id`),
  CONSTRAINT `productos_id_categoria_foreign` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`),
  CONSTRAINT `productos_id_proveedor_foreign` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `productos`
-- ----------------------------
BEGIN;
INSERT INTO `productos` VALUES ('1', 'Aretes Blancos', 'Aretes de fantasia blancos', '100', '30', 'productos/aretes/art2.png', '4', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Aretes'), ('2', 'Aretes Tornasol', 'Aretes de fantasia tornasol', '100', '30', 'productos/aretes/art1.png', '4', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Aretes'), ('3', 'Aretes en forma de S', 'Aretes de fantasia en forma de S', '80', '40', 'productos/aretes/art3.png', '4', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Aretes'), ('4', 'Aretes Pendulo Plata', 'Aretes en forma de pendulo color plata', '60', '20', 'productos/aretes/art4.png', '4', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Aretes'), ('5', 'Aretes Caida Dorado', 'Aretes en forma de Cascada Dorados', '70', '30', 'productos/aretes/art5.png', '4', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Aretes'), ('6', 'Brazalete Sencillo Dorado', 'Brazalete sencillo color dorado', '120', '50', 'productos/brazaletes/brz13.png', '3', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Brazaletes'), ('7', 'Brazalete Sencillo Plata', 'Brazalete sencillo color plata', '120', '50', 'productos/brazaletes/brz14.png', '3', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Brazaletes'), ('8', 'Brazalete Doble Dorado', 'Brazalete doble color dorado', '150', '85', 'productos/brazaletes/brz15.png', '3', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Brazaletes'), ('9', 'Brazalete Doble Plata', 'Brazalete doble color plata', '150', '85', 'productos/brazaletes/brz16.png', '3', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Brazaletes'), ('10', 'Brazalete Triple Dorado', 'Brazalete triple color dorado', '180', '100', 'productos/brazaletes/brz17.png', '3', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Brazaletes'), ('11', 'Broche Flor Tornasol', 'Broche en forma de flor color tornasol', '80', '20', 'productos/broches/bro92.png', '2', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Broches'), ('12', 'Broche Flor Plata', 'Broche en forma de flor color plata', '80', '20', 'productos/broches/bro93.png', '2', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Broches'), ('13', 'Broche Estrella Tornasol', 'Broche en forma de estrella color tornasol', '100', '40', 'productos/broches/bro94.png', '2', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Broches'), ('14', 'Broche Estrella Plata', 'Broche en forma de estrella color plata', '100', '40', 'productos/broches/bro95.png', '2', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Broches'), ('15', 'Broche 10 picos', 'Broche en forma de estrella con 10 picos', '90', '30', 'productos/broches/bro96.png', '2', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Broches'), ('16', 'Collar Flor Combinado Amarillo c/ Plata', 'Collar en forma de flor color amarillo con plata', '150', '20', 'productos/collares/col102.png', '1', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Collares'), ('17', 'Collar Flor Ambar', 'Collar en forma de flor color ambar', '150', '20', 'productos/collares/col103.png', '1', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Collares'), ('18', 'Collar Flor Negro c/ Plata', 'Collar en forma de flor color plata con negro', '150', '20', 'productos/collares/col104.png', '1', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Collares'), ('19', 'Collar Flor Azul c/ Plata', 'Collar en forma de flor color azul con plata', '150', '20', 'productos/collares/col105.png', '1', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Collares'), ('20', 'Collar Flor Plata', 'Collar en forma de flor color plata', '150', '20', 'productos/collares/col106.png', '1', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Collares'), ('21', 'Pasador Flor Ambar', 'Pasador en forma de flor color ambar', '40', '5', 'productos/pasadores/pas81.png', '7', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Pasadores'), ('22', 'Pasador Flor Tornasol', 'Pasador en forma de flor color tornasol', '40', '5', 'productos/pasadores/pas82.png', '7', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Pasadores'), ('23', 'Pasador Flor Azul', 'Pasador en forma de flor color azul', '40', '5', 'productos/pasadores/pas83.png', '7', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Pasadores'), ('24', 'Pasador Flor Negro', 'Pasador en forma de flor color negro', '40', '5', 'productos/pasadores/pas84.png', '7', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Pasadores'), ('25', 'Pasador Flor Plata', 'Pasador en forma de flor color plata', '40', '5', 'productos/pasadores/pas85.png', '7', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Pasadores'), ('26', 'Peineta Fugaz Dorada', 'Peineta en forma de estrella fugaz dorada', '80', '20', 'productos/peinetas/pei79.png', '6', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Peinetas'), ('27', 'Peineta Fugaz Plata', 'Peineta en forma de color plata', '80', '20', 'productos/peinetas/pei80.png', '6', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Peinetas'), ('28', 'Pulcera Flor Ambar', 'Pulsera en forma de flor color ambar', '110', '30', 'productos/pulceras/pul1.png', '8', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Pulseras'), ('29', 'Pulcera Flor Negra', 'Pulsera en forma de flor color negra', '110', '30', 'productos/pulceras/pul2.png', '8', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Pulseras'), ('30', 'Pulcera Flor Azul', 'Pulsera en forma de flor color azul', '110', '30', 'productos/pulceras/pul3.png', '8', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Pulseras'), ('31', 'Pulcera Flor Verde', 'Pulsera en forma de flor color verde', '110', '30', 'productos/pulceras/pul4.png', '8', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Pulseras'), ('32', 'Pulcera Flor Rosa', 'Pulsera en forma de flor color rosa', '110', '30', 'productos/pulceras/pul5.png', '8', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Pulseras'), ('33', 'Tiara Gotas Tornasol', 'TIara con detalles en forma de gotas tornasol', '150', '50', 'productos/tiaras/tia306.png', '5', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Tiaras'), ('34', 'Tiara Gotas Plata', 'Tiara con detalles en forma de gota color plata', '150', '50', 'productos/tiaras/tia307.png', '5', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Tiaras'), ('35', 'Tiara Piedras Dorada', 'Tiara con detalles de piedras color dorada', '180', '70', 'productos/tiaras/tia308.png', '5', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Tiaras'), ('36', 'Tiara Piedras Tornasol', 'Tiara con detalles de piedras color tornasol', '180', '70', 'productos/tiaras/tia309.png', '5', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Tiaras'), ('37', 'Tiara Piedras Plata', 'Tiara con detalles de piedras color plata', '180', '70', 'productos/tiaras/tia310.png', '5', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Tiaras'), ('47', null, null, null, null, null, null, null, null, null, '2015-11-16 08:20:02', '2015-11-16 08:20:02', null), ('48', 'asdfdañfasf', 'añsldfjañsldjflñdasj fñklasj fñlas f', null, null, null, '3', null, null, null, '2015-11-16 08:24:00', '2015-11-16 08:24:00', null), ('49', '85430', 'añslfjñalsdjfñlasjfñ', null, null, null, '3', null, null, null, '2015-11-16 08:24:34', '2015-11-16 08:24:34', null), ('50', '000', '82jalñsdjfñlajsfñladjsfñlajsdlñfkj', null, null, null, '4', null, null, null, '2015-11-16 22:29:18', '2015-11-16 22:29:18', null), ('51', '666', 'asdfasdfsdjafñasldfasfsadfsad', null, null, null, '1', null, null, null, '2015-11-16 22:30:36', '2015-11-16 22:30:36', null), ('52', '1234567890', 'adñsfkladsjflñkajdsñflkja', null, null, null, '3', null, null, null, '2015-11-16 23:53:26', '2015-11-16 23:53:26', null), ('53', '00998765', 'alksdhflkadsjfkljadhsflk', null, null, null, '1', null, null, null, '2015-11-16 23:56:41', '2015-11-16 23:56:41', null), ('54', 'sdfasdfasdjfj', 'ajsñldfjalsñfasdfadsf', null, null, null, null, null, null, null, '2015-11-18 02:07:27', '2015-11-18 02:07:27', null), ('55', '0009hola', 'asdlfjasñldfjña sldfal sdfla', null, null, null, '1', null, null, null, '2015-11-18 02:08:09', '2015-11-18 02:08:09', null);
COMMIT;

-- ----------------------------
--  Table structure for `proveedores`
-- ----------------------------
DROP TABLE IF EXISTS `proveedores`;
CREATE TABLE `proveedores` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `RFC` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `calle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `numE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `numbI` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `colonia` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ciudad` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cp` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `estado` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pais` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `proveedores_email_unique` (`email`),
  KEY `id` (`id`,`nombre`),
  KEY `nombre` (`nombre`),
  KEY `nombre_2` (`nombre`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `proveedores`
-- ----------------------------
BEGIN;
INSERT INTO `proveedores` VALUES ('1', 'Leo Fernandez', 'JIMA9009106K5', 'leo@christinacollection.com', '2122390506', 'Broadway', '1261', 'Suite 701', 'Nueva York', 'Nueva York', '10001', 'NY', 'Estados Unidos', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
INSERT INTO `users` VALUES ('1', 'dianaosorio', 'Diana', 'Osorio', 'Rodriguez', 'dianaosorio193@hotmail.com', 'dianaosorio', 'admin', null, null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('2', 'carlospaz', 'Carlos', 'Paz', 'Osorio', 'charlypz94@hotmail.com', 'charlypz', 'admin', null, null, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
