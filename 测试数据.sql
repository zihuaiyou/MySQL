/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table article
# ------------------------------------------------------------

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `publish_time` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `click` int(11) NOT NULL DEFAULT '0',
  `flag` set('推荐','置顶','热门','图文') DEFAULT NULL,
  `stu_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章表';

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;

INSERT INTO `article` (`id`, `title`, `publish_time`, `status`, `click`, `flag`, `stu_id`)
VALUES
	(1,'PHP很好学习，功能强大','2019-06-12 18:00:00',1,18,NULL,1),
	(2,'Mysql系统课程正在更新','2019-07-12 18:00:00',1,18,NULL,3),
	(3,'后盾人在线学习编程',NULL,1,100,'推荐',5),
	(4,'文档库在doc.houdunren.com',NULL,1,100,'推荐,置顶,图文',2);

/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table attendance
# ------------------------------------------------------------

DROP TABLE IF EXISTS `attendance`;

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_id` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考勤表';

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;

INSERT INTO `attendance` (`id`, `stu_id`, `created_at`)
VALUES
	(1,1,'2019-07-15 08:22:00'),
	(2,2,'2019-07-15 09:22:00'),
	(3,3,'2019-07-15 07:22:00'),
	(4,4,'2019-07-15 10:55:00'),
	(5,5,'2019-07-15 07:15:00'),
	(6,2,'2019-07-16 11:15:00'),
	(7,1,'2019-07-10 08:22:00'),
	(8,2,'2019-07-21 08:15:00'),
	(9,2,'2018-07-15 11:22:00');

/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table class
# ------------------------------------------------------------

DROP TABLE IF EXISTS `class`;

CREATE TABLE `class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(100) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `a` float(10,2) DEFAULT NULL,
  `b` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='班级表';

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;

INSERT INTO `class` (`id`, `cname`, `description`, `a`, `b`)
VALUES
	(1,'幼儿园','学习PHP 开发网站',NULL,NULL),
	(2,'小学','前端工程师',NULL,NULL),
	(3,'初中','服务器知识PHP好帮助',NULL,NULL),
	(4,'高中','数据库学习',NULL,NULL),
	(5,'大学','越努力越幸运',NULL,NULL);

/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table lesson
# ------------------------------------------------------------

DROP TABLE IF EXISTS `lesson`;

CREATE TABLE `lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课程表';

LOCK TABLES `lesson` WRITE;
/*!40000 ALTER TABLE `lesson` DISABLE KEYS */;

INSERT INTO `lesson` (`id`, `name`)
VALUES
	(1,'PHP'),
	(2,'MYSQL'),
	(3,'LINUX'),
	(4,'JS');

/*!40000 ALTER TABLE `lesson` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table stu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `stu`;

CREATE TABLE `stu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sname` char(10) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sex` enum('男','女') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生表';

LOCK TABLES `stu` WRITE;
/*!40000 ALTER TABLE `stu` DISABLE KEYS */;

INSERT INTO `stu` (`id`, `sname`, `class_id`, `birthday`, `updated_at`, `sex`)
VALUES
	(1,'李广',1,'1998-02-12 08:22:13','2019-07-20 14:22:16','男'),
	(2,'何青',1,'1985-07-22 18:19:13','2019-07-17 21:50:38','女'),
	(3,'钱佳',3,'1989-11-17 10:29:13','2019-07-17 20:54:14','男'),
	(4,'刘玉',1,'1999-07-03 19:46:13','2019-07-17 20:54:14','女'),
	(5,'后盾人',2,'2003-09-01 20:33:13','2019-07-20 16:41:32','男'),
	(6,'张云',3,'1996-09-01 20:33:13','2019-07-19 12:59:40','女'),
	(7,'李风',1,'2003-02-15 20:33:13','2019-07-20 14:30:02','男'),
	(8,'李兰',2,NULL,'2019-07-19 12:50:07','女'),
	(9,'李月',1,NULL,'2019-07-18 17:49:03','女'),
	(10,'刘雷',NULL,'1996-11-08 20:33:13','2019-07-20 15:59:28',NULL);

/*!40000 ALTER TABLE `stu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table stu_info
# ------------------------------------------------------------

DROP TABLE IF EXISTS `stu_info`;

CREATE TABLE `stu_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `qq` char(20) DEFAULT NULL,
  `mobile` char(20) DEFAULT NULL,
  `stu_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生资料表';

LOCK TABLES `stu_info` WRITE;
/*!40000 ALTER TABLE `stu_info` DISABLE KEYS */;

INSERT INTO `stu_info` (`id`, `email`, `qq`, `mobile`, `stu_id`)
VALUES
	(1,'2300071698@qq.com','2300071698','999999999',1),
	(2,'good@houdunren.com','9999999','188888888',3),
	(3,'hello@houdunren.com','2222','1988888888',5);

/*!40000 ALTER TABLE `stu_info` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table stu_lesson
# ------------------------------------------------------------

DROP TABLE IF EXISTS `stu_lesson`;

CREATE TABLE `stu_lesson` (
  `stu_id` int(11) NOT NULL,
  `lesson_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生学习的课程表';

LOCK TABLES `stu_lesson` WRITE;
/*!40000 ALTER TABLE `stu_lesson` DISABLE KEYS */;

INSERT INTO `stu_lesson` (`stu_id`, `lesson_id`)
VALUES
	(1,2),
	(1,1),
	(2,3),
	(3,4),
	(4,2),
	(5,3),
	(6,1);

/*!40000 ALTER TABLE `stu_lesson` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;