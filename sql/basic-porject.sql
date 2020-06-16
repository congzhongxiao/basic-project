/*
SQLyog Enterprise - MySQL GUI v7.02 
MySQL - 5.7.24 : Database - basic-project
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`basic-project` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `basic-project`;

/*Table structure for table `person` */

DROP TABLE IF EXISTS `person`;

CREATE TABLE `person` (
  `id` varchar(100) NOT NULL COMMENT '主键',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `age` int(10) DEFAULT '0' COMMENT '年龄',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `gender` int(10) DEFAULT '0' COMMENT '性别',
  `address` varchar(300) DEFAULT NULL COMMENT '地址',
  `summary` text COMMENT '简介',
  `create_by` varchar(100) DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(100) DEFAULT NULL COMMENT '更新用户',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `person` */

insert  into `person`(`id`,`name`,`age`,`birthday`,`gender`,`address`,`summary`,`create_by`,`create_time`,`update_by`,`update_time`) values ('1258666571995344897','张三15',24,'2020-01-16',2,'山东临沂15','我厉害了15','admin','2020-05-08 15:54:30',NULL,NULL),('1258666571982761985','张三14',23,'2020-01-14',1,'山东临沂14','我厉害了14','admin','2020-05-08 15:54:30',NULL,NULL),('1258666571970179073','张三13',22,'2020-01-13',0,'山东临沂13','我厉害了13','admin','2020-05-08 15:54:30',NULL,NULL),('1258666571961790466','张三12',21,'2020-01-12',2,'山东临沂12','我厉害了12','admin','2020-05-08 15:54:30',NULL,NULL),('1258666571949207553','张三11',20,'2020-01-11',0,'山东临沂11','我厉害了11','admin','2020-05-08 15:54:30',NULL,NULL),('1258666571940818945','张三10',19,'2020-01-10',1,'山东临沂10','我厉害了10','admin','2020-05-08 15:54:30',NULL,NULL),('1258666571924041730','张三9',18,'2020-01-09',2,'山东临沂9','我厉害了9','admin','2020-05-08 15:54:30',NULL,NULL),('1258666571915653122','张三8',17,'2020-01-08',0,'山东临沂8','我厉害了8','admin','2020-05-08 15:54:30',NULL,NULL),('1258666571907264514','张三7',16,'2020-01-07',1,'山东临沂7','我厉害了7','admin','2020-05-08 15:54:30',NULL,NULL),('1258666571894681602','张三6',15,'2020-01-06',0,'山东临沂6','我厉害了6','admin','2020-05-08 15:54:30',NULL,NULL),('1258666571886292994','张三5',14,'2020-01-05',1,'山东临沂5','我厉害了5','admin','2020-05-08 15:54:30',NULL,NULL),('1258666571873710081','张三4',13,'2020-01-04',0,'山东临沂4','我厉害了4','admin','2020-05-08 15:54:30',NULL,NULL),('1258666571852738561','张三3',12,'2020-01-03',2,'山东临沂3','我厉害了3','admin','2020-05-08 15:54:30',NULL,NULL),('1258666571844349953','张三2',11,'2020-01-02',1,'山东临沂2','我厉害了2','admin','2020-05-08 15:54:30',NULL,NULL),('1258666571831767042','张三1',10,'2020-01-01',1,'山东临沂1','我厉害了1','admin','2020-05-08 15:54:30',NULL,NULL),('1258670326111272962','张三1',10,'2020-01-01',1,'山东临沂1','我厉害了1','admin','2020-05-08 16:09:25',NULL,NULL),('1258670326161604610','张三2',11,'2020-01-02',1,'山东临沂2','我厉害了2','admin','2020-05-08 16:09:25',NULL,NULL),('1258670326182576129','张三3',12,'2020-01-03',2,'山东临沂3','我厉害了3','admin','2020-05-08 16:09:25',NULL,NULL),('1258670326207741953','张三4',13,'2020-01-04',0,'山东临沂4','我厉害了4','admin','2020-05-08 16:09:25',NULL,NULL),('1258670326224519170','张三5',14,'2020-01-05',1,'山东临沂5','我厉害了5','admin','2020-05-08 16:09:25',NULL,NULL),('1258670326245490690','张三6',15,'2020-01-06',0,'山东临沂6','我厉害了6','admin','2020-05-08 16:09:25',NULL,NULL),('1258670326279045121','张三7',16,'2020-01-07',1,'山东临沂7','我厉害了7','admin','2020-05-08 16:09:25',NULL,NULL),('1258670326304210945','张三8',17,'2020-01-08',0,'山东临沂8','我厉害了8','admin','2020-05-08 16:09:25',NULL,NULL),('1258670326329376770','张三9',18,'2020-01-09',2,'山东临沂9','我厉害了9','admin','2020-05-08 16:09:25',NULL,NULL),('1258670326354542593','张三10',19,'2020-01-10',1,'山东临沂10','我厉害了10','admin','2020-05-08 16:09:25',NULL,NULL),('1258670326362931202','张三11',20,'2020-01-11',0,'山东临沂11','我厉害了11','admin','2020-05-08 16:09:25',NULL,NULL),('1258670326388097026','张三12',21,'2020-01-12',2,'山东临沂12','我厉害了12','admin','2020-05-08 16:09:25',NULL,NULL),('1258670326421651458','张三13',22,'2020-01-13',0,'山东临沂13','我厉害了13','admin','2020-05-08 16:09:25',NULL,NULL),('1258670326434234369','张三14',23,'2020-01-14',1,'山东临沂14','我厉害了14','admin','2020-05-08 16:09:25',NULL,NULL),('1258670326455205889','张三15',24,'2020-01-15',2,'山东临沂15','我厉害了15','admin','2020-05-08 16:09:25',NULL,NULL);

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` varchar(100) NOT NULL COMMENT '主键',
  `name` varchar(300) DEFAULT NULL COMMENT '名称',
  `author` varchar(100) DEFAULT NULL COMMENT '作者',
  `detail` text COMMENT '描述',
  `short_id` varchar(100) DEFAULT NULL COMMENT '缩略图id',
  `short_image` varchar(300) DEFAULT NULL COMMENT '缩略图',
  `create_by` varchar(100) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(100) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `product` */

insert  into `product`(`id`,`name`,`author`,`detail`,`short_id`,`short_image`,`create_by`,`create_time`,`update_by`,`update_time`) values ('1254756965808144386','测试','测试','擦擦擦','1258670051334029314','http://localhost:8888/profile/upload/2020/05/08/22732bfcc7d3d4334b17b5fa45b378c6.jpg','admin','2020-04-27 20:59:08',NULL,NULL),('1254774090044067841','测试','测试','菜市场','1254774028429742081','http://localhost:8888/profile/upload/2020/04/27/676aa2af2065b893434e141bf73b3927.jpg','admin','2020-04-27 22:07:10',NULL,NULL),('1254774333993177089','测试','测试','','1254774699476439042','http://localhost:8888/profile/upload/2020/04/27/1c572babe2a402c8b0359f68a024db72.jpg','admin','2020-04-27 22:08:08',NULL,NULL),('1258207526180184065','测试','11','测试','1258207456462462977','http://localhost:8888/profile/upload/2020/05/07/9aaf02d5381595d1461b0bf31bf03615.jpg','admin','2020-05-07 09:30:25',NULL,NULL);

/*Table structure for table `product_file` */

DROP TABLE IF EXISTS `product_file`;

CREATE TABLE `product_file` (
  `id` varchar(100) NOT NULL COMMENT '主键',
  `product_id` varchar(100) DEFAULT NULL COMMENT '作品id',
  `file_id` varchar(100) DEFAULT NULL COMMENT '文件id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `product_file` */

/*Table structure for table `product_image` */

DROP TABLE IF EXISTS `product_image`;

CREATE TABLE `product_image` (
  `id` varchar(100) NOT NULL COMMENT '主键',
  `product_id` varchar(100) DEFAULT NULL COMMENT '作品主键',
  `image_id` varchar(100) DEFAULT NULL COMMENT '图片主键',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `product_image` */

insert  into `product_image`(`id`,`product_id`,`image_id`) values ('1254774147661221889','1254774090044067841','1254774064995684353'),('1269884128588763138','1254756965808144386','1254764997304700929'),('1269884128563597313','1254756965808144386','1254773726414688257'),('1254774147640250370','1254774090044067841','1254774053239050241'),('1258208396368240641','1258207526180184065','1258207514717151233'),('1258208396330491905','1258207526180184065','1258207493712076801'),('1254774714693373953','1254774333993177089','1254774328146317313'),('1258208396301131777','1258207526180184065','1258207493913403394'),('1258208396250800129','1258207526180184065','1258208389288255489'),('1258208396393406466','1258207526180184065','1258207494223781890');

/*Table structure for table `sys_permission` */

DROP TABLE IF EXISTS `sys_permission`;

CREATE TABLE `sys_permission` (
  `id` varchar(40) NOT NULL COMMENT '主键',
  `name` varchar(40) DEFAULT NULL COMMENT '权限名',
  `type` int(11) DEFAULT NULL COMMENT '权限类型',
  `code` varchar(40) DEFAULT NULL COMMENT '权限编码',
  `pid` varchar(40) DEFAULT NULL COMMENT '父权限id',
  `value` varchar(40) DEFAULT NULL COMMENT '权限值',
  `comment` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `sys_permission` */

insert  into `sys_permission`(`id`,`name`,`type`,`code`,`pid`,`value`,`comment`) values ('1242332436917977089','系统管理',NULL,'sys:admin','0',NULL,'系统管理权限'),('1242332722738823170','管理员管理',NULL,'sys:admin:list','1242332436917977089',NULL,''),('1258294103497568257','查看',NULL,'admin:view','1242332722738823170',NULL,''),('1258294195721924610','编辑',NULL,'admin:edit','1242332722738823170',NULL,''),('1258294246141652994','添加',NULL,'admin:add','1242332722738823170',NULL,''),('1272466615030636546','图片上传',NULL,'image','0',NULL,''),('1272466739937009666','编辑',NULL,'image:edit','1272466615030636546',NULL,''),('1272466806135709698','删除',NULL,'image:delete','1272466615030636546',NULL,'');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` varchar(40) NOT NULL COMMENT '主键',
  `name` varchar(40) DEFAULT NULL COMMENT '角色名称',
  `comment` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`name`,`comment`) values ('1242336572984090626','超级管理员','超级管理员'),('1242338849828462593','普通管理员','管理员管理'),('1272466912813637634','图片上传管理员',''),('1272466994350907394','图片上传编辑管理员','');

/*Table structure for table `sys_role_permission` */

DROP TABLE IF EXISTS `sys_role_permission`;

CREATE TABLE `sys_role_permission` (
  `role_id` varchar(40) DEFAULT NULL COMMENT '角色id',
  `perm_id` varchar(40) DEFAULT NULL COMMENT '权限管理id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `sys_role_permission` */

insert  into `sys_role_permission`(`role_id`,`perm_id`) values ('1242336572984090626','1242332722738823170'),('1242336572984090626','1242332436917977089'),('1242336572984090626','1258294103497568257'),('1242338849828462593','1258294103497568257'),('1242338849828462593','1242332722738823170'),('1242338849828462593','1242332436917977089'),('1242336572984090626','1258294195721924610'),('1242336572984090626','1258294246141652994'),('1272466912813637634','1272466615030636546'),('1272466912813637634','1272466739937009666'),('1272466912813637634','1272466806135709698'),('1272466994350907394','1272466615030636546'),('1272466994350907394','1272466739937009666');

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` varchar(40) NOT NULL COMMENT '主键',
  `username` varchar(40) DEFAULT NULL COMMENT '用户名',
  `password` varchar(40) DEFAULT NULL COMMENT '密码',
  `salt` varchar(100) DEFAULT NULL COMMENT '密码种子',
  `nickname` varchar(40) DEFAULT NULL COMMENT '昵称',
  `icon` varchar(100) DEFAULT NULL COMMENT '头像地址',
  `state` int(11) DEFAULT '1' COMMENT '用户状态，0禁用，1启用',
  `isdel` int(11) DEFAULT '0' COMMENT '删除状态 0未删除，1删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `email` varchar(40) DEFAULT NULL COMMENT '电子邮箱',
  `mobile` varchar(40) DEFAULT NULL COMMENT '手机号码',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`username`,`password`,`salt`,`nickname`,`icon`,`state`,`isdel`,`create_time`,`update_time`,`email`,`mobile`,`delete_time`) values ('1242327057416970241','admin','339766036f819059b8419af892fdb629','k8h23cokz6','超级管理员',NULL,1,0,'2020-03-24 13:47:06','2020-03-24 14:01:52','admin2@qq.com','18858868888',NULL),('1242343616969560066','ceshi','ec36e7d4db25dfb60c0224e3be037aef','1ytgfhm3o1','admin',NULL,1,1,'2020-03-24 14:52:54',NULL,'','18858868888',NULL),('1242370555167989761','putong','ea59fd709fab88138aaefdd438d296af','jvo6a1u3yt','普通管理员',NULL,1,0,'2020-03-24 16:39:57',NULL,'','18988888888',NULL),('1272467134352580610','admin1','52b2519f718def86b6a599f227171f43','yl89e2qvli','图片上传管理员',NULL,1,0,'2020-06-15 17:53:01',NULL,'','18858868888',NULL),('1272467298744131585','admin2','39571cba259c2e7bfc6f32a55df34087','56zk0wtpws','图片上传编辑管理员',NULL,1,0,'2020-06-15 17:53:40',NULL,'','18858868888',NULL);

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `user_id` varchar(40) DEFAULT NULL COMMENT '用户id',
  `role_id` varchar(40) DEFAULT NULL COMMENT '角色ID'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`user_id`,`role_id`) values ('1242327057416970241','1242336572984090626'),('1272467134352580610','1272466912813637634'),('1272467298744131585','1272466994350907394'),('1242327057416970241','1272466912813637634');

/*Table structure for table `test` */

DROP TABLE IF EXISTS `test`;

CREATE TABLE `test` (
  `id` varchar(100) NOT NULL COMMENT '主键',
  `name` varchar(300) DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `test` */

insert  into `test`(`id`,`name`) values ('1','测试'),('2','测试2'),('0','测试会议2');

/*Table structure for table `upload_files` */

DROP TABLE IF EXISTS `upload_files`;

CREATE TABLE `upload_files` (
  `id` varchar(100) NOT NULL COMMENT '主键',
  `storage` varchar(100) DEFAULT NULL COMMENT '上传类型',
  `url` varchar(300) DEFAULT NULL COMMENT '地址',
  `name` varchar(300) DEFAULT NULL COMMENT '文件名称',
  `size` int(11) DEFAULT '0' COMMENT '文件大小',
  `type` varchar(100) DEFAULT NULL COMMENT '文件类型',
  `extension` varchar(100) DEFAULT NULL COMMENT '文件后缀名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(100) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `upload_files` */

insert  into `upload_files`(`id`,`storage`,`url`,`name`,`size`,`type`,`extension`,`create_time`,`create_by`) values ('1254756937429483521',NULL,'http://localhost:8888/profile/upload/2020/04/27/9b6e5dd2d56f0553054e04c9354da096.jpg','3b441a674d25deecacea70a715add339.jpg',301561,'image','jpg','2020-04-27 20:59:01','admin'),('1254756957314678786',NULL,'http://localhost:8888/profile/upload/2020/04/27/bb73b035e5d191ed1b7881d48ef4df59.jpg','3b441a674d25deecacea70a715add339.jpg',301561,'image','jpg','2020-04-27 20:59:06','admin'),('1254756957373399041',NULL,'http://localhost:8888/profile/upload/2020/04/27/9dc38082fa5b5394db87bce087d959e8.jpg','2016070407232701586cd8a36248e79e09fb893852b1c1ss.jpg',47418,'image','jpg','2020-04-27 20:59:06','admin'),('1254756957838966786',NULL,'http://localhost:8888/profile/upload/2020/04/27/937a2e9eec27fcbb0a6b4ee290a6aa5f.jpg','d83a5f9058f29b2c0960447bd3ba42e3.jpg',174104,'image','jpg','2020-04-27 20:59:06','admin'),('1254760664441880578',NULL,'http://localhost:8888/profile/upload/2020/04/27/e10a6b984002d3bb0b7e1bdb7ea8579f.jpg','3b441a674d25deecacea70a715add339.jpg',301561,'image','jpg','2020-04-27 21:13:49','admin'),('1254760674411741186',NULL,'http://localhost:8888/profile/upload/2020/04/27/5264ee7816c4386b282b070b4240cd6a.jpg','2016070407232701586cd8a36248e79e09fb893852b1c1ss.jpg',47418,'image','jpg','2020-04-27 21:13:52','admin'),('1254760686386479106',NULL,'http://localhost:8888/profile/upload/2020/04/27/36d43ba6d796ada8951aac0e2e7d3c7d.jpg','d83a5f9058f29b2c0960447bd3ba42e3.jpg',174104,'image','jpg','2020-04-27 21:13:55','admin'),('1254763806243999745',NULL,'http://localhost:8888/profile/upload/2020/04/27/c009b04402f5b79bd0ecc60aa7df829b.jpg','3b441a674d25deecacea70a715add339.jpg',301561,'image','jpg','2020-04-27 21:26:18','admin'),('1254763824531165185',NULL,'http://localhost:8888/profile/upload/2020/04/27/35652c454be79172ff3a08c7d3f50e60.jpg','3b441a674d25deecacea70a715add339.jpg',301561,'image','jpg','2020-04-27 21:26:23','admin'),('1254763882924265474',NULL,'http://localhost:8888/profile/upload/2020/04/27/da4be1722c3c19876becdfdac8c6d51c.jpg','3b441a674d25deecacea70a715add339.jpg',301561,'image','jpg','2020-04-27 21:26:37','admin'),('1254763930911297538',NULL,'http://localhost:8888/profile/upload/2020/04/27/a0bc5175d84552b907459b5b8c315975.jpg','3b441a674d25deecacea70a715add339.jpg',301561,'image','jpg','2020-04-27 21:26:48','admin'),('1254764278744928258',NULL,'http://localhost:8888/profile/upload/2020/04/27/bce877fbed2696ab73cb6ccc4692a503.jpg','3b441a674d25deecacea70a715add339.jpg',301561,'image','jpg','2020-04-27 21:28:11','admin'),('1254764279265021953',NULL,'http://localhost:8888/profile/upload/2020/04/27/4713d5479deeee10d20a972b67ca8565.jpg','2016070407232701586cd8a36248e79e09fb893852b1c1ss.jpg',47418,'image','jpg','2020-04-27 21:28:11','admin'),('1254764279348908034',NULL,'http://localhost:8888/profile/upload/2020/04/27/6658afb3f6987aaf79ac510921b4473c.jpg','d83a5f9058f29b2c0960447bd3ba42e3.jpg',174104,'image','jpg','2020-04-27 21:28:11','admin'),('1254764997304700929',NULL,'http://localhost:8888/profile/upload/2020/04/27/3b8d3dbe79601b16d57e28925c44f8b8.jpg','3b441a674d25deecacea70a715add339.jpg',301561,'image','jpg','2020-04-27 21:31:02','admin'),('1254765358547521537',NULL,'http://localhost:8888/profile/upload/2020/04/27/e4d7e59734204d14bbc2ce69ed4293d6.jpg','d83a5f9058f29b2c0960447bd3ba42e3.jpg',174104,'image','jpg','2020-04-27 21:32:29','admin'),('1254766368741445633',NULL,'http://localhost:8888/profile/upload/2020/04/27/3d0ac625cc7207f50539986157c4d6f1.jpg','temp.jpg',300670,'image','jpg','2020-04-27 21:36:29','admin'),('1254766533686644738',NULL,'http://localhost:8888/profile/upload/2020/04/27/a01b4f4f8b218ce6432e6f7fc64cfb55.jpg','temp.jpg',300670,'image','jpg','2020-04-27 21:37:09','admin'),('1254766879595089921',NULL,'http://localhost:8888/profile/upload/2020/04/27/23678e2caaf30b851a4bec0f7767296f.jpg','temp.jpg',300670,'image','jpg','2020-04-27 21:38:31','admin'),('1254768549930520577',NULL,'http://localhost:8888/profile/upload/2020/04/27/38f28b8ae1fbc84040eea13dcfc3de79.jpg','temp.jpg',300670,'image','jpg','2020-04-27 21:45:09','admin'),('1254768555022405634',NULL,'http://localhost:8888/profile/upload/2020/04/27/fa4b1a0a04daa016b0d7880d8b695f6e.jpg','temp.jpg',300670,'image','jpg','2020-04-27 21:45:11','admin'),('1254768654171557889',NULL,'http://localhost:8888/profile/upload/2020/04/27/8fab93d4ae5b1c3d6457cc8359029d65.jpg','temp.jpg',300670,'image','jpg','2020-04-27 21:45:34','admin'),('1254773140139069442',NULL,'http://localhost:8888/profile/upload/2020/04/27/07bb747464814ed948d74348799f877c.jpg','3b441a674d25deecacea70a715add339.jpg',301561,'image','jpg','2020-04-27 22:03:24','admin'),('1254773189501833217',NULL,'http://localhost:8888/profile/upload/2020/04/27/b243651b72bb17b9b7f4606c950d0c4a.jpg','3b441a674d25deecacea70a715add339.jpg',301561,'image','jpg','2020-04-27 22:03:36','admin'),('1254773623683600386',NULL,'http://localhost:8888/profile/upload/2020/04/27/a475780cb61c785c828c34b78075e500.jpg','3b441a674d25deecacea70a715add339.jpg',301561,'image','jpg','2020-04-27 22:05:19','admin'),('1254773702813339650',NULL,'http://localhost:8888/profile/upload/2020/04/27/8688d1e2bea419c1169a0ee36c6eedd7.jpg','3b441a674d25deecacea70a715add339.jpg',301561,'image','jpg','2020-04-27 22:05:38','admin'),('1254773726414688257',NULL,'http://localhost:8888/profile/upload/2020/04/27/4ca22025e2066ee25cff69674b1d3f18.jpg','3b441a674d25deecacea70a715add339.jpg',301561,'image','jpg','2020-04-27 22:05:44','admin'),('1254774028429742081',NULL,'http://localhost:8888/profile/upload/2020/04/27/676aa2af2065b893434e141bf73b3927.jpg','3b441a674d25deecacea70a715add339.jpg',301561,'image','jpg','2020-04-27 22:06:56','admin'),('1254774040194764802',NULL,'http://localhost:8888/profile/upload/2020/04/27/407e3a8c2dd44eba9500da3294ce6737.jpg','d83a5f9058f29b2c0960447bd3ba42e3.jpg',174104,'image','jpg','2020-04-27 22:06:58','admin'),('1254774053239050241',NULL,'http://localhost:8888/profile/upload/2020/04/27/0011c82ce9d5cbaec01ef63709d3cd21.jpg','d83a5f9058f29b2c0960447bd3ba42e3.jpg',174104,'image','jpg','2020-04-27 22:07:02','admin'),('1254774064995684353',NULL,'http://localhost:8888/profile/upload/2020/04/27/698a959f04b90f3caf6ec841102506b4.jpg','2016070407232701586cd8a36248e79e09fb893852b1c1ss.jpg',47418,'image','jpg','2020-04-27 22:07:04','admin'),('1254774303626416129',NULL,'http://localhost:8888/profile/upload/2020/04/27/ce87f90b737be93ada0e4f68caefa7e4.jpg','2016070407232701586cd8a36248e79e09fb893852b1c1ss.jpg',56710,'image','jpg','2020-04-27 22:08:01','admin'),('1254774312363151362',NULL,'http://localhost:8888/profile/upload/2020/04/27/51bbfda3932209e280fd02fcab9928e3.jpg','d83a5f9058f29b2c0960447bd3ba42e3.jpg',173668,'image','jpg','2020-04-27 22:08:03','admin'),('1254774327756247041',NULL,'http://localhost:8888/profile/upload/2020/04/27/3ba3626ed2304c4e373e4750c72f4a5d.jpg','3b441a674d25deecacea70a715add339.jpg',302173,'image','jpg','2020-04-27 22:08:07','admin'),('1254774328146317313',NULL,'http://localhost:8888/profile/upload/2020/04/27/bd05c5e031391d13d35bed133d393b48.jpg','2016070407232701586cd8a36248e79e09fb893852b1c1ss.jpg',56710,'image','jpg','2020-04-27 22:08:07','admin'),('1254774699476439042',NULL,'http://localhost:8888/profile/upload/2020/04/27/1c572babe2a402c8b0359f68a024db72.jpg','d83a5f9058f29b2c0960447bd3ba42e3.jpg',174104,'image','jpg','2020-04-27 22:09:36','admin'),('1258207456462462977',NULL,'http://localhost:8888/profile/upload/2020/05/07/9aaf02d5381595d1461b0bf31bf03615.jpg','3b441a674d25deecacea70a715add339.jpg',301561,'image','jpg','2020-05-07 09:30:08','admin'),('1258207493712076801',NULL,'http://localhost:8888/profile/upload/2020/05/07/9acccefa8f6fb3009e5846fb431ccb27.jpg','2016070407232701586cd8a36248e79e09fb893852b1c1ss.jpg',47418,'image','jpg','2020-05-07 09:30:18','admin'),('1258207493913403394',NULL,'http://localhost:8888/profile/upload/2020/05/07/d0e58ec9e5c9551da05061e129432832.jpg','3b441a674d25deecacea70a715add339.jpg',301561,'image','jpg','2020-05-07 09:30:18','admin'),('1258207494223781890',NULL,'http://localhost:8888/profile/upload/2020/05/07/47ebfa69f424f6dac5fe9cd013666b1e.jpg','d83a5f9058f29b2c0960447bd3ba42e3.jpg',174104,'image','jpg','2020-05-07 09:30:18','admin'),('1258207514717151233',NULL,'http://localhost:8888/profile/upload/2020/05/07/0077046ee5530eded1c9a90df03926c9.jpg','3b441a674d25deecacea70a715add339.jpg',301561,'image','jpg','2020-05-07 09:30:23','admin'),('1258208389288255489',NULL,'http://localhost:8888/profile/upload/2020/05/07/dcbd4191ad3ba0d2979ce49f7ac8d5c5.jpg','d83a5f9058f29b2c0960447bd3ba42e3.jpg',174104,'image','jpg','2020-05-07 09:33:51','admin'),('1258670051334029314',NULL,'http://localhost:8888/profile/upload/2020/05/08/22732bfcc7d3d4334b17b5fa45b378c6.jpg','d83a5f9058f29b2c0960447bd3ba42e3.jpg',174104,'image','jpg','2020-05-08 16:08:19','admin'),('1269884526280085505',NULL,'http://localhost:8888/profile/upload/2020/06/08/94694c7f447d4a21205b2045e7e809f0.jpg','d83a5f9058f29b2c0960447bd3ba42e3.jpg',174104,'image','jpg','2020-06-08 14:50:39','admin'),('1269884545800376322',NULL,'http://localhost:8888/profile/upload/2020/06/08/4b283e32870a5cc56580a870c489060f.jpg','3b441a674d25deecacea70a715add339.jpg',301561,'image','jpg','2020-06-08 14:50:44','admin'),('1269884558307790850',NULL,'http://localhost:8888/profile/upload/2020/06/08/57294d4ff658a828973fc23e470c1f6a.jpg','2016070407232701586cd8a36248e79e09fb893852b1c1ss.jpg',47418,'image','jpg','2020-06-08 14:50:47','admin'),('1269884570609684481',NULL,'http://localhost:8888/profile/upload/2020/06/08/8a48985ba169d35c2bd12100948bdd3f.jpg','d83a5f9058f29b2c0960447bd3ba42e3.jpg',174104,'image','jpg','2020-06-08 14:50:50','admin');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
