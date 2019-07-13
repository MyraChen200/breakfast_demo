# ************************************************************
# Sequel Pro SQL dump
# Version 5438
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.16)
# Database: BreakfastDemo
# Generation Time: 2019-07-13 08:39:27 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table auth_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table auth_group_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table auth_permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
	(1,'Can add log entry',1,'add_logentry'),
	(2,'Can change log entry',1,'change_logentry'),
	(3,'Can delete log entry',1,'delete_logentry'),
	(4,'Can view log entry',1,'view_logentry'),
	(5,'Can add permission',2,'add_permission'),
	(6,'Can change permission',2,'change_permission'),
	(7,'Can delete permission',2,'delete_permission'),
	(8,'Can view permission',2,'view_permission'),
	(9,'Can add group',3,'add_group'),
	(10,'Can change group',3,'change_group'),
	(11,'Can delete group',3,'delete_group'),
	(12,'Can view group',3,'view_group'),
	(13,'Can add user',4,'add_user'),
	(14,'Can change user',4,'change_user'),
	(15,'Can delete user',4,'delete_user'),
	(16,'Can view user',4,'view_user'),
	(17,'Can add content type',5,'add_contenttype'),
	(18,'Can change content type',5,'change_contenttype'),
	(19,'Can delete content type',5,'delete_contenttype'),
	(20,'Can view content type',5,'view_contenttype'),
	(21,'Can add session',6,'add_session'),
	(22,'Can change session',6,'change_session'),
	(23,'Can delete session',6,'delete_session'),
	(24,'Can view session',6,'view_session'),
	(25,'Can add order_item',7,'add_order_item'),
	(26,'Can change order_item',7,'change_order_item'),
	(27,'Can delete order_item',7,'delete_order_item'),
	(28,'Can view order_item',7,'view_order_item'),
	(29,'Can add order',8,'add_order'),
	(30,'Can change order',8,'change_order'),
	(31,'Can delete order',8,'delete_order'),
	(32,'Can view order',8,'view_order');

/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table auth_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table auth_user_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table auth_user_user_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table django_admin_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table django_content_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;

INSERT INTO `django_content_type` (`id`, `app_label`, `model`)
VALUES
	(1,'admin','logentry'),
	(3,'auth','group'),
	(2,'auth','permission'),
	(4,'auth','user'),
	(5,'contenttypes','contenttype'),
	(8,'order','order'),
	(7,'order','order_item'),
	(6,'sessions','session');

/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`)
VALUES
	(1,'contenttypes','0001_initial','2019-07-13 08:14:13.359383'),
	(2,'auth','0001_initial','2019-07-13 08:14:13.534219'),
	(3,'admin','0001_initial','2019-07-13 08:14:13.735819'),
	(4,'admin','0002_logentry_remove_auto_add','2019-07-13 08:14:13.774354'),
	(5,'admin','0003_logentry_add_action_flag_choices','2019-07-13 08:14:13.797000'),
	(6,'contenttypes','0002_remove_content_type_name','2019-07-13 08:14:13.838762'),
	(7,'auth','0002_alter_permission_name_max_length','2019-07-13 08:14:13.864068'),
	(8,'auth','0003_alter_user_email_max_length','2019-07-13 08:14:13.892798'),
	(9,'auth','0004_alter_user_username_opts','2019-07-13 08:14:13.904724'),
	(10,'auth','0005_alter_user_last_login_null','2019-07-13 08:14:13.930853'),
	(11,'auth','0006_require_contenttypes_0002','2019-07-13 08:14:13.932894'),
	(12,'auth','0007_alter_validators_add_error_messages','2019-07-13 08:14:13.944212'),
	(13,'auth','0008_alter_user_username_max_length','2019-07-13 08:14:13.970411'),
	(14,'auth','0009_alter_user_last_name_max_length','2019-07-13 08:14:13.998097'),
	(15,'auth','0010_alter_group_name_max_length','2019-07-13 08:14:14.026986'),
	(16,'auth','0011_update_proxy_permissions','2019-07-13 08:14:14.037668'),
	(17,'sessions','0001_initial','2019-07-13 08:14:14.063656'),
	(21,'order','0001_initial','2019-07-13 08:34:49.571186'),
	(22,'order','0002_auto_20190713_0835','2019-07-13 08:35:55.851469');

/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_session
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table order_order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_order`;

CREATE TABLE `order_order` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `shipping` int(11) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `order_order` WRITE;
/*!40000 ALTER TABLE `order_order` DISABLE KEYS */;

INSERT INTO `order_order` (`order_id`, `customer_id`, `shipping`, `created_at`)
VALUES
	(1,15,80,'2018/1/17 上午 4:09:53\r'),
	(2,15,0,'2018/1/18 上午 3:41:21\r'),
	(3,3,0,'2018/1/18 上午 10:09:10\r'),
	(4,3,0,'2018/1/18 上午 10:11:49\r'),
	(5,3,0,'2018/1/18 上午 10:15:39'),
	(6,15,80,'2018/1/22 上午 4:34:15\r'),
	(8,15,80,'2018/1/22 上午 6:57:28\r'),
	(10,15,80,'2018/1/23 上午 4:43:59\r'),
	(11,15,80,'2018/1/24 上午 5:49:04\r'),
	(12,15,80,'2018/1/29 上午 7:27:11\r'),
	(14,10,80,'2018/1/29 下午 12:34:19\r'),
	(15,10,80,'2018/1/30 上午 2:12:04\r'),
	(16,10,80,'2018/1/30 上午 6:05:31\r'),
	(17,10,80,'2018/1/30 上午 6:08:32\r'),
	(18,10,80,'2018/1/30 上午 8:17:08\r'),
	(27,10,80,'2018/1/30 上午 8:58:34\r'),
	(28,10,80,'2018/1/30 上午 9:15:42\r'),
	(29,16,80,'2018/1/30 下午 4:17:30\r'),
	(30,15,80,'2018/2/1 上午 12:53:34\r'),
	(34,10,80,'2018/2/1 上午 2:53:52\r'),
	(35,10,80,'2018/2/1 上午 3:57:42\r'),
	(36,10,80,'2018/2/1 上午 6:51:26\r'),
	(37,10,80,'2018/2/1 上午 7:01:48\r'),
	(46,12,80,'2018/2/1 上午 7:12:49\r'),
	(47,10,80,'2018/2/1 上午 7:13:58\r'),
	(48,10,80,'2018/2/1 上午 7:15:59\r'),
	(49,8,80,'2018/2/1 上午 7:21:02\r'),
	(52,8,80,'2018/2/1 上午 7:21:59\r'),
	(53,10,80,'2018/2/1 上午 7:26:20\r'),
	(54,8,80,'2018/2/1 上午 7:26:38\r'),
	(63,16,80,'2018/2/1 上午 8:48:20\r'),
	(64,16,80,'2018/2/1 上午 11:01:49\r'),
	(65,16,80,'2018/2/2 上午 2:44:40\r'),
	(84,10,80,'2018/2/2 上午 3:11:06\r'),
	(85,10,0,'2018/2/2 上午 6:27:07\r'),
	(86,10,80,'2018/2/2 上午 6:44:33\r'),
	(87,10,80,'2018/2/2 上午 7:00:44\r'),
	(88,10,80,'2018/2/2 上午 7:11:08\r'),
	(89,10,80,'2018/2/2 上午 7:15:33\r'),
	(90,10,80,'2018/2/2 上午 7:35:18\r'),
	(91,10,80,'2018/2/2 上午 7:49:02\r'),
	(92,10,80,'2018/2/2 上午 10:03:06\r'),
	(94,10,80,'2018/2/2 上午 10:28:43\r'),
	(95,10,80,'2018/2/3 上午 11:22:40\r'),
	(96,15,80,'2018/2/5 上午 11:54:34\r'),
	(97,10,80,'2018/2/5 下午 12:04:42\r'),
	(98,10,80,'2018/2/5 下午 1:42:51\r'),
	(99,10,80,'2018/2/5 下午 1:44:13\r'),
	(100,10,80,'2018/2/5 下午 1:45:23\r'),
	(101,15,80,'2018/2/5 下午 1:50:38\r'),
	(108,10,80,'2018/2/5 下午 1:52:25\r'),
	(109,10,80,'2018/2/5 下午 1:54:12\r'),
	(110,10,80,'2018/2/5 下午 2:00:58\r'),
	(111,10,80,'2018/2/5 下午 2:01:38\r'),
	(112,10,80,'2018/2/6 上午 3:03:26\r'),
	(113,15,80,'2018/2/6 上午 4:11:00\r'),
	(114,10,80,'2018/2/6 上午 4:20:17\r'),
	(115,10,80,'2018/2/6 上午 4:22:35\r'),
	(116,10,80,'2018/2/6 上午 4:25:47\r'),
	(117,10,0,'2018/2/6 上午 4:32:18\r'),
	(118,10,0,'2018/2/6 上午 5:05:08\r'),
	(137,10,0,'2018/2/6 上午 5:18:06\r'),
	(138,10,0,'2018/2/6 上午 5:39:50\r'),
	(139,10,0,'2018/2/6 上午 6:00:11\r'),
	(140,10,80,'2018/2/6 上午 6:09:00\r'),
	(141,10,80,'2018/2/6 上午 6:14:53\r'),
	(142,10,80,'2018/2/6 上午 6:21:06\r'),
	(143,10,80,'2018/2/6 上午 6:36:59\r'),
	(144,10,80,'2018/2/6 上午 6:49:31\r'),
	(145,10,80,'2018/2/6 上午 7:04:23\r'),
	(146,10,80,'2018/2/6 上午 7:10:50\r'),
	(147,10,80,'2018/2/6 上午 7:51:54\r'),
	(148,10,80,'2018/2/6 上午 8:02:29\r'),
	(154,15,80,'2018/2/6 上午 8:05:53\r'),
	(155,10,80,'2018/2/6 上午 8:43:12\r'),
	(156,10,80,'2018/2/6 上午 9:03:18\r'),
	(157,10,80,'2018/2/6 上午 9:05:58\r'),
	(158,10,80,'2018/2/6 上午 9:28:42\r'),
	(159,10,80,'2018/2/6 下午 12:04:12\r'),
	(160,12,80,'2018/2/6 下午 12:05:34\r'),
	(161,10,80,'2018/2/6 下午 12:08:23\r'),
	(162,10,80,'2018/2/6 下午 12:34:28\r'),
	(163,10,80,'2018/2/7 上午 3:42:42\r'),
	(164,10,80,'2018/2/7 上午 3:44:36\r'),
	(184,15,80,'2018/2/7 上午 3:50:10\r');

/*!40000 ALTER TABLE `order_order` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_order_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_order_item`;

CREATE TABLE `order_order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) NOT NULL,
  `qty` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_order_item_order_id_b20333dc` (`order_id`),
  CONSTRAINT `order_order_item_order_id_b20333dc_fk_order_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `order_order_item` WRITE;
/*!40000 ALTER TABLE `order_order_item` DISABLE KEYS */;

INSERT INTO `order_order_item` (`id`, `product_name`, `qty`, `order_id`)
VALUES
	(1,'Palladium Desrue Mid',5,1),
	(2,'測試商品2',4,1),
	(3,'測試打包組合1',1,2),
	(4,'Palladium Desrue Mid',1,2),
	(5,'測試商品2',1,2),
	(6,'Palladium Desrue Mid',1,3),
	(7,'Palladium Desrue Mid',1,4),
	(8,'Palladium Desrue Mid',1,5),
	(9,'[137 degrees] 無加糖杏仁堅果奶 (180ml/罐)',1,6),
	(10,'[137 degrees] 無加糖杏仁堅果奶 (180ml/罐)-無加糖杏仁堅果奶',1,6),
	(11,'[137 degrees] 無加糖杏仁堅果奶 (180ml/罐)',1,8),
	(12,'[137 degrees] 無加糖杏仁堅果奶 (180ml/罐)-無加糖杏仁堅果奶',1,8),
	(13,'[Prize Snack] 泰國低熱量爆米圓餅-orange',1,8),
	(14,'[Prize Snack] 泰國低熱量爆米圓餅-orange',1,10),
	(15,'[137 degrees] 咖啡拿鐵杏仁堅果奶 (180ml/罐) {賞味期限: 2018-10-05}',1,10),
	(16,'[137 degrees] 開心果堅果奶 (180ml/罐) {賞味期限: 2018-08-15}',3,10),
	(17,'FREE -  FreeGiftSample',1,10),
	(18,'測試商品2',1,11),
	(19,'FREE -  FreeGiftSample',1,11),
	(20,'[137 degrees] 開心果堅果奶 (180ml/罐) {賞味期限: 2018-08-15}',1,12),
	(21,'[137 degrees] 咖啡拿鐵杏仁堅果奶 (180ml/罐) {賞味期限: 2018-10-05}',1,12),
	(22,'FREE -  FreeGiftSample',1,12),
	(23,'[137 degrees] 咖啡拿鐵杏仁堅果奶 (180ml/罐) {賞味期限: 2018-10-05}',2,14),
	(24,'[137 degrees] 原味杏仁堅果奶 (180ml/罐) {賞味期限: 2018-09-11}',1,14),
	(25,'[137 degrees] 咖啡拿鐵杏仁堅果奶 (180ml/罐) {賞味期限: 2018-10-05}',4,14),
	(26,'[137 degrees] 原味杏仁堅果奶 (180ml/罐) {賞味期限: 2018-09-11}',2,14),
	(27,'[137 degrees] 開心果堅果奶 (180ml/罐) {賞味期限: 2018-08-15}',2,14),
	(28,'[137 degrees] 原味杏仁堅果奶 (180ml/罐) {賞味期限: 2018-09-11}',1,15),
	(29,'[137 degrees] 原味杏仁堅果奶 (180ml/罐) {賞味期限: 2018-09-11}',1,16),
	(30,'[137 degrees] 咖啡拿鐵杏仁堅果奶 (180ml/罐) {賞味期限: 2018-10-05}',2,17),
	(31,'[137 degrees] 原味杏仁堅果奶 (180ml/罐) {賞味期限: 2018-09-11}',1,18),
	(32,'[137 degrees] 咖啡拿鐵杏仁堅果奶 (180ml/罐) {賞味期限: 2018-10-05}',1,18),
	(33,'[137 degrees] 咖啡拿鐵杏仁堅果奶 (180ml/罐) {賞味期限: 2018-10-05}',1,18),
	(34,'[137 degrees] 無加糖杏仁堅果奶 (180ml/罐)',1,27),
	(35,'[137 degrees] 原味杏仁堅果奶 (180ml/罐)',1,27),
	(36,'[137 degrees] 無加糖杏仁堅果奶 (180ml/罐)',1,28),
	(37,'[137 degrees] 咖啡拿鐵杏仁堅果奶 (180ml/罐) {賞味期限: 2018-10-05}',1,29),
	(38,'[137 degrees] 無加糖杏仁堅果奶 (180ml/罐)',1,29),
	(39,'[137 degrees] 無加糖杏仁堅果奶 (180ml/罐)',2,30),
	(40,'[137 degrees] 原味杏仁堅果奶 (180ml/罐)',1,30),
	(41,'[137 degrees] 無加糖杏仁堅果奶 (180ml/罐)',1,34),
	(42,'[137 degrees] 原味杏仁堅果奶 (180ml/罐)',1,35),
	(43,'[137 degrees] 無加糖杏仁堅果奶 (180ml/罐)',1,35),
	(44,'[137 degrees] 咖啡拿鐵杏仁堅果奶 (180ml/罐) {賞味期限: 2018-10-05}',2,36),
	(45,'[137 degrees] 無加糖杏仁堅果奶 (180ml/罐)',2,36),
	(46,'FREE -  [澳思] 初榨椰子油 (650ml/罐)',1,36),
	(47,'[137 degrees] 原味杏仁堅果奶 (180ml/罐)',1,37),
	(48,'[Aronia] 有機野櫻莓果醬(無添加糖) (225g/罐)',1,37),
	(49,'[137 degrees] 無加糖杏仁堅果奶 (180ml/罐)',1,46),
	(50,'[137 degrees] 無加糖杏仁堅果奶 (180ml/罐)',1,47),
	(51,'[Aronia] 有機野櫻莓果醬(無添加糖) (225g/罐)',1,47),
	(52,'[Aronia] 有機野櫻莓果醬(無添加糖) (225g/罐)',1,48),
	(53,'[Aronia] 有機野櫻莓果醬(無添加糖) (225g/罐)',1,49),
	(54,'[Aronia] 有機野櫻莓果醬(無添加糖) (225g/罐)',1,52),
	(55,'[Aronia] 有機野櫻莓果醬(無添加糖) (225g/罐)',2,53),
	(56,'[137 degrees] 咖啡拿鐵杏仁堅果奶 (180ml/罐) {賞味期限: 2018-10-05}',1,53),
	(57,'[Aronia] 有機野櫻莓果醬(無添加糖) (225g/罐)',2,54),
	(58,'[137 degrees] 咖啡拿鐵杏仁堅果奶 (180ml/罐) {賞味期限: 2018-10-05}',1,63),
	(59,'[Aronia] 有機野櫻莓果醬(無添加糖) (225g/罐)',1,63),
	(60,'[Aronia] 有機野櫻莓果醬(無添加糖) (225g/罐)',2,64),
	(61,'[137 degrees] 無加糖杏仁堅果奶 (180ml/罐)',2,65),
	(62,'[Aronia] 有機野櫻莓果醬(無添加糖) (225g/罐)',1,84),
	(63,'[Aronia] 有機野櫻莓果醬(無添加糖) (225g/罐)',1,85),
	(64,'[Aronia] 有機野櫻莓果醬(無添加糖) (225g/罐)',1,86),
	(65,'[Aronia] 有機野櫻莓果醬(無添加糖) (225g/罐)',2,87),
	(66,'[Aronia] 有機野櫻莓果醬(無添加糖) (225g/罐)',1,88),
	(67,'[Aronia] 有機野櫻莓果醬(無添加糖) (225g/罐)',1,89),
	(68,'[Aronia] 有機野櫻莓果醬(無添加糖) (225g/罐)',1,90),
	(69,'[Aronia] 有機野櫻莓果醬(無添加糖) (225g/罐)',1,91),
	(70,'[Aronia] 有機野櫻莓果醬(無添加糖) (225g/罐)',2,92),
	(71,'[Aronia] 有機野櫻莓果醬(無添加糖) (225g/罐)',1,94),
	(72,'[Aronia] 有機野櫻莓果醬(無添加糖) (225g/罐)',1,95),
	(73,'[Aronia] 有機野櫻莓果醬(無添加糖) (225g/罐)',1,96),
	(74,'[Aronia] 有機野櫻莓果醬(無添加糖) (225g/罐)',1,97),
	(75,'[Aronia] 有機野櫻莓果醬(無添加糖) (225g/罐)',2,98),
	(76,'[Aronia] 有機野櫻莓果醬(無添加糖) (225g/罐)',3,99),
	(77,'[Aronia] 有機野櫻莓果醬(無添加糖) (225g/罐)',1,100),
	(78,'[137 degrees] 咖啡拿鐵杏仁堅果奶 (180ml/罐) {賞味期限: 2018-10-05}',1,101),
	(79,'[137 degrees] 無加糖杏仁堅果奶 (180ml/罐)',1,101),
	(80,'[Aronia] 有機野櫻莓果醬(無添加糖) (225g/罐)',2,108),
	(81,'[Aronia] 有機野櫻莓果醬(無添加糖) (225g/罐)',4,109),
	(82,'[Aronia] 有機野櫻莓果醬(無添加糖) (225g/罐)',2,110),
	(83,'[Aronia] 有機野櫻莓果醬(無添加糖) (225g/罐)',2,111),
	(84,'[Aronia] 有機野櫻莓果醬(無添加糖) (225g/罐)',2,112),
	(85,'[Aronia] 有機野櫻莓果醬(無添加糖) (225g/罐)',1,113),
	(86,'[Aronia] 有機野櫻莓果醬(無添加糖) (225g/罐)',1,114),
	(87,'[Aronia] 有機野櫻莓果醬(無添加糖) (225g/罐)',2,115),
	(88,'[Aronia] 有機野櫻莓果醬(無添加糖) (225g/罐)',1,116),
	(89,'[Aronia] 有機野櫻莓果醬(無添加糖) (225g/罐)',2,117),
	(90,'[Aronia] 有機野櫻莓果醬(無添加糖) (225g/罐)',1,118),
	(91,'[澳思] 初榨椰子油 (650ml/罐) {賞味期限: 2019-08-23}',1,137),
	(92,'[137 degrees] 咖啡拿鐵杏仁堅果奶 (180ml/罐)',2,138),
	(93,'[Prize Snack] 爆米圓餅-鹽味米脆餅 (80g/罐) {賞味期限: 2018-09-28}',1,139),
	(94,'[Prize Snack] 爆米圓餅-鹽味米脆餅 (80g/罐) {賞味期限: 2018-09-28}',1,140),
	(95,'[東和製油] 無加糖原味花生醬 (180g/罐)',1,141),
	(96,'[137 degrees] 咖啡拿鐵杏仁堅果奶 (180ml/罐)',1,142),
	(97,'[澳思] 初榨椰子油 (650ml/罐) {賞味期限: 2019-08-23}',2,143),
	(98,'[137 degrees] 咖啡拿鐵杏仁堅果奶 (180ml/罐)',2,144),
	(99,'[Prize Snack] 爆米圓餅-鹽味米脆餅 (80g/罐) {賞味期限: 2018-09-28}',1,145),
	(100,'[澳思] 初榨椰子油 (650ml/罐) {賞味期限: 2019-08-23}',2,146),
	(101,'[137 degrees] 咖啡拿鐵杏仁堅果奶 (180ml/罐)',3,147),
	(102,'[Prize Snack] 爆米圓餅-鹽味米脆餅 (80g/罐) {賞味期限: 2018-09-28}',1,147),
	(103,'[澳思] 初榨椰子油 (650ml/罐) {賞味期限: 2019-08-23}',1,147),
	(104,'[澳思] 初榨椰子油 (650ml/罐) {賞味期限: 2019-08-23}',1,148),
	(105,'[137 degrees] 咖啡拿鐵杏仁堅果奶 (180ml/罐)',1,148),
	(106,'[Prize Snack] 爆米圓餅-鹽味米脆餅 (80g/罐) {賞味期限: 2018-09-28}',1,154),
	(107,'[澳思] 初榨椰子油 (650ml/罐) {賞味期限: 2019-08-23}',1,155),
	(108,'hh',1,156),
	(109,'[澳思] 初榨椰子油 (650ml/罐) {賞味期限: 2019-08-23}',1,156),
	(110,'[東和製油] 無加糖原味花生醬 (180g/罐)',1,156),
	(111,'[澳思] 初榨椰子油 (650ml/罐) {賞味期限: 2019-08-23}',1,157),
	(112,'[東和製油] 花生醬 微甜 (180g/罐)',2,158),
	(113,'[澳思] 初榨椰子油 (650ml/罐) {賞味期限: 2019-08-23}',1,159),
	(114,'[Aronia] 有機野櫻莓果醬(無添加糖) (225g/罐) {賞味期限: 2019-09-22}',2,160),
	(115,'hh',1,161),
	(116,'[137 degrees] 測試堅果奶',1,161),
	(117,'[137 degrees] 測試堅果奶',2,162),
	(118,'[澳思] 初榨椰子油 (650ml/罐) {賞味期限: 2019-08-23}',1,162),
	(119,'[澳思] 初榨椰子油 (650ml/罐) {賞味期限: 2019-08-23}',3,163),
	(120,'[澳思] 初榨椰子油 (650ml/罐) {賞味期限: 2019-08-23}',2,164),
	(121,'[137 degrees] 測試堅果奶',1,164),
	(122,'[137 degrees] 咖啡拿鐵杏仁堅果奶 (180ml/罐) {賞味期限: 2018-10-05}',1,184),
	(123,'[137 degrees] 原味杏仁堅果奶 (180ml/罐) {賞味期限: 2018-09-11}',2,184),
	(124,'[澳思] 初榨椰子油 (650ml/罐) {賞味期限: 2019-08-23}',1,184);

/*!40000 ALTER TABLE `order_order_item` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
