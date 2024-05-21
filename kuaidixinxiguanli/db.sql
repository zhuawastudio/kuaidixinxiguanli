/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - kuaidixinxiguanli
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`kuaidixinxiguanli` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `kuaidixinxiguanli`;

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配置文件';

/*Data for the table `config` */

/*Table structure for table `dictionary` */

DROP TABLE IF EXISTS `dictionary`;

CREATE TABLE `dictionary` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` int(11) DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字  Search111 ',
  `super_id` int(11) DEFAULT NULL COMMENT '父字段id',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='字典表';

/*Data for the table `dictionary` */

insert  into `dictionary`(`id`,`dic_code`,`dic_name`,`code_index`,`index_name`,`super_id`,`beizhu`,`create_time`) values (1,'jijianxinxi_types','物品类型',1,'物品类型1',NULL,NULL,'2022-04-21 10:00:50'),(2,'jijianxinxi_types','物品类型',2,'物品类型2',NULL,NULL,'2022-04-21 10:00:50'),(3,'jijianxinxi_types','物品类型',3,'物品类型3',NULL,NULL,'2022-04-21 10:00:50'),(4,'kuaijian_types','快递状态',1,'已分配',NULL,NULL,'2022-04-21 10:00:50'),(5,'kuaijian_types','快递状态',2,'派件中',NULL,NULL,'2022-04-21 10:00:50'),(6,'kuaijian_types','快递状态',3,'已完成',NULL,NULL,'2022-04-21 10:00:50'),(7,'news_types','公告类型',1,'公告类型1',NULL,NULL,'2022-04-21 10:00:50'),(8,'news_types','公告类型',2,'公告类型2',NULL,NULL,'2022-04-21 10:00:50'),(9,'news_types','公告类型',3,'公告类型3',NULL,NULL,'2022-04-21 10:00:50'),(10,'sex_types','性别',1,'男',NULL,NULL,'2022-04-21 10:00:50'),(11,'sex_types','性别',2,'女',NULL,NULL,'2022-04-21 10:00:50');

/*Table structure for table `kuaidiyuan` */

DROP TABLE IF EXISTS `kuaidiyuan`;

CREATE TABLE `kuaidiyuan` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `kuaidiyuan_name` varchar(200) DEFAULT NULL COMMENT '快递员姓名 Search111 ',
  `kuaidiyuan_phone` varchar(200) DEFAULT NULL COMMENT '快递员手机号',
  `kuaidiyuan_id_number` varchar(200) DEFAULT NULL COMMENT '快递员身份证号',
  `kuaidiyuan_photo` varchar(200) DEFAULT NULL COMMENT '快递员头像',
  `sex_types` int(11) DEFAULT NULL COMMENT '性别',
  `kuaidiyuan_email` varchar(200) DEFAULT NULL COMMENT '电子邮箱',
  `kuaidiyuan_number` int(11) DEFAULT NULL COMMENT '派件数量 Search111',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='快递员';

/*Data for the table `kuaidiyuan` */

insert  into `kuaidiyuan`(`id`,`username`,`password`,`kuaidiyuan_name`,`kuaidiyuan_phone`,`kuaidiyuan_id_number`,`kuaidiyuan_photo`,`sex_types`,`kuaidiyuan_email`,`kuaidiyuan_number`,`create_time`) values (1,'a1','123456','快递员姓名1','17703786901','410224199610232001','http://localhost:8080/kuaidixinxiguanli/upload/kuaidiyuan1.jpg',2,'1@qq.com',267,'2022-04-21 10:01:02'),(2,'a2','123456','快递员姓名2','17703786902','410224199610232002','http://localhost:8080/kuaidixinxiguanli/upload/kuaidiyuan2.jpg',2,'2@qq.com',275,'2022-04-21 10:01:02'),(3,'a3','123456','快递员姓名3','17703786903','410224199610232003','http://localhost:8080/kuaidixinxiguanli/upload/kuaidiyuan3.jpg',1,'3@qq.com',101,'2022-04-21 10:01:02');

/*Table structure for table `kuaijian` */

DROP TABLE IF EXISTS `kuaijian`;

CREATE TABLE `kuaijian` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `kuaijian_uuid_number` varchar(200) DEFAULT NULL COMMENT '编号 Search111',
  `kuaijian_name` varchar(200) DEFAULT NULL COMMENT '发件人名称 Search111',
  `kuaijian_phone` varchar(200) DEFAULT NULL COMMENT '联系方式',
  `kuaijian_photo` varchar(200) DEFAULT NULL COMMENT '物品图片',
  `kuaijian_address` varchar(200) DEFAULT NULL COMMENT '送件住址',
  `jijianxinxi_types` int(11) DEFAULT NULL COMMENT '物品类型 Search111',
  `kuaijian_types` int(11) DEFAULT NULL COMMENT '快递状态 Search111',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `kuaidiyuan_id` int(11) DEFAULT NULL COMMENT '派件员',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '发布日期',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show2 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='快递信息';

/*Data for the table `kuaijian` */

insert  into `kuaijian`(`id`,`kuaijian_uuid_number`,`kuaijian_name`,`kuaijian_phone`,`kuaijian_photo`,`kuaijian_address`,`jijianxinxi_types`,`kuaijian_types`,`yonghu_id`,`kuaidiyuan_id`,`insert_time`,`create_time`) values (1,'16505064630037','发件人名称1','17703786901','http://localhost:8080/kuaidixinxiguanli/upload/kuaijian1.jpg','送件住址1',2,2,2,2,'2022-04-21 10:01:02','2022-04-21 10:01:02'),(2,'165050646300320','发件人名称2','17703786902','http://localhost:8080/kuaidixinxiguanli/upload/kuaijian2.jpg','送件住址2',3,3,2,3,'2022-04-21 10:01:02','2022-04-21 10:01:02'),(3,'165050646300311','发件人名称3','17703786903','http://localhost:8080/kuaidixinxiguanli/upload/kuaijian3.jpg','送件住址3',3,3,3,2,'2022-04-21 10:01:02','2022-04-21 10:01:02'),(4,'16505064630036','发件人名称4','17703786904','http://localhost:8080/kuaidixinxiguanli/upload/kuaijian4.jpg','送件住址4',2,3,1,2,'2022-04-21 10:01:02','2022-04-21 10:01:02'),(5,'16505064630031','发件人名称5','17703786905','http://localhost:8080/kuaidixinxiguanli/upload/kuaijian5.jpg','送件住址5',2,3,1,1,'2022-04-21 10:01:02','2022-04-21 10:01:02');

/*Table structure for table `liuyan` */

DROP TABLE IF EXISTS `liuyan`;

CREATE TABLE `liuyan` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `liuyan_name` varchar(200) DEFAULT NULL COMMENT '留言标题  Search111 ',
  `liuyan_text` text COMMENT '留言内容',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '留言时间',
  `reply_text` text COMMENT '回复内容',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '回复时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show2 nameShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='留言';

/*Data for the table `liuyan` */

insert  into `liuyan`(`id`,`yonghu_id`,`liuyan_name`,`liuyan_text`,`insert_time`,`reply_text`,`update_time`,`create_time`) values (1,1,'留言标题1','留言内容1','2022-04-21 10:01:02','回复信息1','2022-04-21 10:01:02','2022-04-21 10:01:02'),(2,2,'留言标题2','留言内容2','2022-04-21 10:01:02','回复信息2','2022-04-21 10:01:02','2022-04-21 10:01:02'),(3,2,'留言标题3','留言内容3','2022-04-21 10:01:02','回复信息3','2022-04-21 10:01:02','2022-04-21 10:01:02'),(4,1,'留言标题4','留言内容4','2022-04-21 10:01:02','回复信息4','2022-04-21 10:01:02','2022-04-21 10:01:02'),(5,1,'留言标题5','留言内容5','2022-04-21 10:01:02','回复信息5','2022-04-21 10:01:02','2022-04-21 10:01:02'),(6,1,'标题','留言','2022-04-21 10:34:36','回复1111','2022-04-21 10:35:34','2022-04-21 10:34:36');

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `news_name` varchar(200) DEFAULT NULL COMMENT '公告标题  Search111 ',
  `news_types` int(11) DEFAULT NULL COMMENT '公告类型  Search111 ',
  `news_photo` varchar(200) DEFAULT NULL COMMENT '公告图片',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  `news_content` text COMMENT '公告详情',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 nameShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='公告信息';

/*Data for the table `news` */

insert  into `news`(`id`,`news_name`,`news_types`,`news_photo`,`insert_time`,`news_content`,`create_time`) values (1,'公告标题1',3,'http://localhost:8080/kuaidixinxiguanli/upload/news1.jpg','2022-04-21 10:01:02','公告详情1','2022-04-21 10:01:02'),(2,'公告标题2',3,'http://localhost:8080/kuaidixinxiguanli/upload/news2.jpg','2022-04-21 10:01:02','公告详情2','2022-04-21 10:01:02'),(3,'公告标题3',2,'http://localhost:8080/kuaidixinxiguanli/upload/news3.jpg','2022-04-21 10:01:02','公告详情3','2022-04-21 10:01:02'),(4,'公告标题4',1,'http://localhost:8080/kuaidixinxiguanli/upload/news4.jpg','2022-04-21 10:01:02','公告详情4','2022-04-21 10:01:02'),(5,'公告标题5',2,'http://localhost:8080/kuaidixinxiguanli/upload/news5.jpg','2022-04-21 10:01:02','公告详情5','2022-04-21 10:01:02');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (1,1,'admin','users','管理员','9qhj0yomkg66nrlsur3gxxz2cvsl1xzb','2022-04-21 10:20:12','2022-04-21 11:37:13'),(2,1,'a1','kuaidiyuan','快递员','9vkfb9foey5yhudbe6zeaoqam8jxbqud','2022-04-21 10:32:17','2022-04-21 11:34:44'),(3,1,'a1','yonghu','用户','p24eab8u374m6op0rbeab2wpdzsokrq3','2022-04-21 10:33:20','2022-04-21 11:33:21'),(4,2,'a2','kuaidiyuan','快递员','0yc4eeomcntvh89n2cvh08l8ztv5m4fl','2022-04-21 10:34:49','2022-04-21 11:34:49');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (1,'admin','admin','管理员','2022-05-01 00:00:00');

/*Table structure for table `yonghu` */

DROP TABLE IF EXISTS `yonghu`;

CREATE TABLE `yonghu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `yonghu_name` varchar(200) DEFAULT NULL COMMENT '用户姓名 Search111 ',
  `yonghu_photo` varchar(255) DEFAULT NULL COMMENT '头像',
  `sex_types` int(11) DEFAULT NULL COMMENT '性别 Search111 ',
  `yonghu_phone` varchar(200) DEFAULT NULL COMMENT '联系方式',
  `yonghu_email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `yonghu_delete` int(11) DEFAULT '1' COMMENT '假删',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户';

/*Data for the table `yonghu` */

insert  into `yonghu`(`id`,`username`,`password`,`yonghu_name`,`yonghu_photo`,`sex_types`,`yonghu_phone`,`yonghu_email`,`yonghu_delete`,`insert_time`,`create_time`) values (1,'a1','123456','用户姓名1','http://localhost:8080/kuaidixinxiguanli/upload/yonghu1.jpg',2,'17703786901','1@qq.com',1,'2022-04-21 10:01:02','2022-04-21 10:01:02'),(2,'a2','123456','用户姓名2','http://localhost:8080/kuaidixinxiguanli/upload/yonghu2.jpg',1,'17703786902','2@qq.com',1,'2022-04-21 10:01:02','2022-04-21 10:01:02'),(3,'a3','123456','用户姓名3','http://localhost:8080/kuaidixinxiguanli/upload/yonghu3.jpg',1,'17703786903','3@qq.com',1,'2022-04-21 10:01:02','2022-04-21 10:01:02');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
