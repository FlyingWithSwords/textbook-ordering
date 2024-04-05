/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 8.0.24 : Database - missystemdb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`missystemdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `missystemdb`;

/*Table structure for table `bookdepot` */

DROP TABLE IF EXISTS `bookdepot`;

CREATE TABLE `bookdepot` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bookname` varchar(90) DEFAULT NULL,
  `writer` varchar(120) DEFAULT NULL,
  `public` varchar(120) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `total` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `bookdepot` */

insert  into `bookdepot`(`id`,`bookname`,`writer`,`public`,`price`,`total`) values 
(2,'线性代数','123','高等教育出版社',49,7000),
(3,'计算机基础','HelloWorld','高等教育出版社',50,6000),
(4,'高等数学','123','高等教育出版社',45,0),
(6,'古文学赏析','古文学出版社','古文学出版社',60.5,12000);

/*Table structure for table `buybook` */

DROP TABLE IF EXISTS `buybook`;

CREATE TABLE `buybook` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bookname` varchar(90) DEFAULT NULL,
  `writer` varchar(120) DEFAULT NULL,
  `public` varchar(120) DEFAULT NULL,
  `num` int DEFAULT NULL,
  `user` varchar(30) DEFAULT NULL,
  `state` varchar(30) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `buybook` */

insert  into `buybook`(`id`,`bookname`,`writer`,`public`,`num`,`user`,`state`,`time`) values 
(10,'高等数学','123','高等教育出版社',3000,'xiaoming','已通过','2021-07-25 18:16:56');

/*Table structure for table `inbook` */

DROP TABLE IF EXISTS `inbook`;

CREATE TABLE `inbook` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bookname` varchar(90) DEFAULT NULL,
  `writer` varchar(120) DEFAULT NULL,
  `public` varchar(120) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `total` int DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `inbook` */

insert  into `inbook`(`id`,`bookname`,`writer`,`public`,`price`,`total`,`time`) values 
(11,'古文学赏析','古文学出版社','古文学出版社',60.5,6000,'2021-07-25 02:52:58'),
(12,'古文学赏析','古文学出版社','古文学出版社',60.5,6000,'2021-07-25 03:02:35'),
(13,'高等数学','123','高等教育出版社',45,5000,'2021-07-25 03:10:42');

/*Table structure for table `missbook` */

DROP TABLE IF EXISTS `missbook`;

CREATE TABLE `missbook` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bookname` varchar(90) DEFAULT NULL,
  `writer` varchar(120) DEFAULT NULL,
  `public` varchar(120) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `total` int DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `missbook` */

insert  into `missbook`(`id`,`bookname`,`writer`,`public`,`price`,`total`,`state`,`time`) values 
(8,'高等数学','123','高等教育出版社',45,10000,'未补','2021-07-25 18:17:04');

/*Table structure for table `outbook` */

DROP TABLE IF EXISTS `outbook`;

CREATE TABLE `outbook` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bookname` varchar(90) DEFAULT NULL,
  `writer` varchar(120) DEFAULT NULL,
  `public` varchar(120) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `user` varchar(30) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `total` int DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `outbook` */

insert  into `outbook`(`id`,`bookname`,`writer`,`public`,`price`,`user`,`state`,`total`,`time`) values 
(13,'高等数学','123','高等教育出版社',45,'zhangsan','已出库',100,'2021-07-25 02:52:24'),
(15,'高等数学','123','高等教育出版社',45,'xiaoming','已出库',3000,'2021-07-25 18:08:25'),
(16,'高等数学','123','高等教育出版社',45,'zhangsan','已出库',2000,'2021-07-25 18:09:06'),
(19,'高等数学','123','高等教育出版社',45,'xiaoming','出库失败',0,'2021-07-25 18:17:04');

/*Table structure for table `readybook` */

DROP TABLE IF EXISTS `readybook`;

CREATE TABLE `readybook` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bookname` varchar(90) DEFAULT NULL,
  `writer` varchar(120) DEFAULT NULL,
  `public` varchar(120) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `total` int DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `readybook` */

insert  into `readybook`(`id`,`bookname`,`writer`,`public`,`price`,`total`,`state`,`time`) values 
(1,'古文学赏析','古文学出版社','古文学出版社',60.5,6000,'已购','2021-07-25 03:02:35'),
(2,'高等数学','123','高等教育出版社',45,5000,'已购','2021-07-25 03:10:42');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `chara` varchar(10) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`email`,`chara`,`time`) values 
(1,'root','root','12345@mail.com','管理员','2021-07-17 21:05:55'),
(2,'小王','1234','123456@mail.com','教材发行员工','2021-07-20 21:21:11'),
(3,'小李','1234','1234@mail.com','书库采购员工','2021-07-20 21:29:35'),
(4,'zhangsan','1234','123456@mail.com','教师','2021-07-20 22:59:23'),
(5,'xiaoming','1234','123@163.com','学生','2021-07-20 23:10:40');

/* Trigger structure for table `missbook` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_insert_missbook` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `trigger_insert_missbook` BEFORE INSERT ON `missbook` FOR EACH ROW BEGIN
	if new.bookname=(select bookname from missbook where writer=new.writer and public=new.public and price=new.price) then
		update missbook set total=total+new.total where bookname=new.bookname and writer=new.writer and public=new.public and price=new.price;
	end if;
    END */$$


DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
