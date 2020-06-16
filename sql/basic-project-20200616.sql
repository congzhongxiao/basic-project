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

insert  into `product`(`id`,`name`,`author`,`detail`,`short_id`,`short_image`,`create_by`,`create_time`,`update_by`,`update_time`) values ('1272789700896145410','作品上传1','小飞侠1','擦擦擦','1272789639290208258','http://localhost:8888/profile/upload/2020/06/16/c111d9d935a3b73586cfc4f0de373fd9.png','admin','2020-06-16 15:14:47','admin','2020-06-16 16:16:25'),('1272792876982517762','测试2','ccc','','1272792846808694786','http://localhost:8888/profile/upload/2020/06/16/8c6f54ec3a1ab95efbf5beb3703b0c55.png','admin','2020-06-16 15:27:24',NULL,NULL),('1272794581895790594','测试会议2','ccc ','ccc','1272794467160604673','http://localhost:8888/profile/upload/2020/06/16/29d1e0688174d09412be291c7645a5a7.jpg','admin','2020-06-16 15:34:10',NULL,NULL);

/*Table structure for table `product_file` */

DROP TABLE IF EXISTS `product_file`;

CREATE TABLE `product_file` (
  `product_id` varchar(100) DEFAULT NULL COMMENT '作品id',
  `file_id` varchar(100) DEFAULT NULL COMMENT '文件id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `product_file` */

insert  into `product_file`(`product_id`,`file_id`) values ('1272789700896145410','1272789679136096257'),('1272789700896145410','1272805193614954497'),('1272789700896145410','1272805193552039937'),('1272789700896145410','1272805193682063362'),('1272789700896145410','1272805193900167170'),('1272792876982517762','1272792870988857346'),('1272794581895790594','1272794557858234369'),('1272794581895790594','1272794557950509058'),('1272794581895790594','1272794557635936258'),('1272794581895790594','1272794557598187522');

/*Table structure for table `product_image` */

DROP TABLE IF EXISTS `product_image`;

CREATE TABLE `product_image` (
  `product_id` varchar(100) DEFAULT NULL COMMENT '作品主键',
  `image_id` varchar(100) DEFAULT NULL COMMENT '图片主键'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `product_image` */

insert  into `product_image`(`product_id`,`image_id`) values ('1272789700896145410','1272789655337615361'),('1272789700896145410','1272805132478779393'),('1272792876982517762','1272792860880584705'),('1272794581895790594','1272794515005030402'),('1272794581895790594','1272794503621689345'),('1272794581895790594','1272794503500054529'),('1272794581895790594','1272794485779120129'),('1272794581895790594','1272794485527461890'),('1272789700896145410','1272789655333421058'),('1272789700896145410','1272805207099641857'),('1272789700896145410','1272805081949999105');

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

insert  into `upload_files`(`id`,`storage`,`url`,`name`,`size`,`type`,`extension`,`create_time`,`create_by`) values ('1272789639290208258',NULL,'http://localhost:8888/profile/upload/2020/06/16/c111d9d935a3b73586cfc4f0de373fd9.png','wormhole-739872.png',1991762,'image','png','2020-06-16 15:14:32','admin'),('1272789655333421058',NULL,'http://localhost:8888/profile/upload/2020/06/16/f568c23aebace4ee9ac29a888c7908e7.jpg','globalisation-3390877_1920.jpg',391977,'image','jpg','2020-06-16 15:14:36','admin'),('1272789655337615361',NULL,'http://localhost:8888/profile/upload/2020/06/16/fa9a918d1ad8a6f966ee78f393cf3bb2.png','wormhole-739872.png',1991762,'image','png','2020-06-16 15:14:36','admin'),('1272789679136096257',NULL,'http://localhost:8888/profile/upload/2020/06/16/811d25b2e9717a240dd0150beb3e5de1.xlsx','计划实际销售额 (7).xlsx',3776,'file','xlsx','2020-06-16 15:14:41','admin'),('1272789679333228545',NULL,'http://localhost:8888/profile/upload/2020/06/16/1410c9c21452c49fccb731ebbc15562a.xlsx','计划实际销售额 (9).xlsx',3758,'file','xlsx','2020-06-16 15:14:41','admin'),('1272789679366782978',NULL,'http://localhost:8888/profile/upload/2020/06/16/132cf7af6ed4c7226d965a91faf73da5.xlsx','计划实际销售额 (8).xlsx',3777,'file','xlsx','2020-06-16 15:14:42','admin'),('1272789679601664002',NULL,'http://localhost:8888/profile/upload/2020/06/16/c5739c79cc9bb03033f23c08e5a04329.xlsx','计划实际销售额 (10).xlsx',3777,'file','xlsx','2020-06-16 15:14:42','admin'),('1272789679685550082',NULL,'http://localhost:8888/profile/upload/2020/06/16/05bd641af297e6f53a3b07918f386b29.xlsx','计划实际销售额 (11).xlsx',3660,'file','xlsx','2020-06-16 15:14:42','admin'),('1272792846808694786',NULL,'http://localhost:8888/profile/upload/2020/06/16/8c6f54ec3a1ab95efbf5beb3703b0c55.png','wormhole-739872.png',1991762,'image','png','2020-06-16 15:27:17','admin'),('1272792860880584705',NULL,'http://localhost:8888/profile/upload/2020/06/16/5cc527c0a77808c10b852d8bfacedd7b.jpg','globalisation-3390877_1920.jpg',391977,'image','jpg','2020-06-16 15:27:20','admin'),('1272792870988857346',NULL,'http://localhost:8888/profile/upload/2020/06/16/8567c2b07c5d390f5167fbb7d152a971.xlsx','5aa9f95224465c92f348fad27eb2bda8.xlsx',3683,'file','xlsx','2020-06-16 15:27:22','admin'),('1272792908641124354',NULL,'http://localhost:8888/profile/upload/2020/06/16/204c677ecd4290bec2156b192f5f4826.xlsx','1591598639802客户信息.xlsx',3842,'file','xlsx','2020-06-16 15:27:31','admin'),('1272792944154296321',NULL,'http://localhost:8888/profile/upload/2020/06/16/955752024266edcb2d5421ab6e237a2f.xlsx','7b942ddc02a8527dd494fd4dbc607249.xlsx',3683,'file','xlsx','2020-06-16 15:27:40','admin'),('1272793016342462465',NULL,'http://localhost:8888/profile/upload/2020/06/16/64fd518f19d3d2a6a87520b9bde2498b.xlsx','1592288882945个人信息数据.xlsx',4840,'file','xlsx','2020-06-16 15:27:57','admin'),('1272793755697594370',NULL,'http://localhost:8888/profile/upload/2020/06/16/429e765c596c1d264e9814d9d9f0220b.xlsx','1591598639802客户信息.xlsx',3842,'file','xlsx','2020-06-16 15:30:53','admin'),('1272793794696232962',NULL,'http://localhost:8888/profile/upload/2020/06/16/04b29597d6a7cd309fa29c6e3edac20d.xlsx','1591598639802客户信息.xlsx',3842,'file','xlsx','2020-06-16 15:31:03','admin'),('1272793827751542785',NULL,'http://localhost:8888/profile/upload/2020/06/16/a50ec39c5c6588220919d1c69acef31d.xlsx','计划实际销售额 (3).xlsx',3683,'file','xlsx','2020-06-16 15:31:11','admin'),('1272793827780902914',NULL,'http://localhost:8888/profile/upload/2020/06/16/ebdaa3772e851161d0429543d2a0b8e1.xlsx','计划实际销售额 (5).xlsx',3682,'file','xlsx','2020-06-16 15:31:11','admin'),('1272793827789291522',NULL,'http://localhost:8888/profile/upload/2020/06/16/b542a5a0795fb7ac90a3fed9ffef378a.xlsx','计划实际销售额 (4).xlsx',3682,'file','xlsx','2020-06-16 15:31:11','admin'),('1272794467160604673',NULL,'http://localhost:8888/profile/upload/2020/06/16/29d1e0688174d09412be291c7645a5a7.jpg','globalisation-3390877_1920.jpg',391977,'image','jpg','2020-06-16 15:33:43','admin'),('1272794485527461890',NULL,'http://localhost:8888/profile/upload/2020/06/16/e57136c49f22b7018660aa227acd0356.jpg','globalisation-3390877_1920.jpg',391977,'image','jpg','2020-06-16 15:33:47','admin'),('1272794485779120129',NULL,'http://localhost:8888/profile/upload/2020/06/16/396f82c6514e4063ce11de0e9763d108.png','wormhole-739872.png',1991762,'image','png','2020-06-16 15:33:47','admin'),('1272794503500054529',NULL,'http://localhost:8888/profile/upload/2020/06/16/76721603f7f8bd9f02fc2a1cc300d13f.jpg','globalisation-3390877_1920.jpg',391977,'image','jpg','2020-06-16 15:33:52','admin'),('1272794503621689345',NULL,'http://localhost:8888/profile/upload/2020/06/16/37c39c5e8389405b2b173e0f8167ada8.png','wormhole-739872.png',1991762,'image','png','2020-06-16 15:33:52','admin'),('1272794515005030402',NULL,'http://localhost:8888/profile/upload/2020/06/16/366a98d0fb486873527f7e98a4f4b7e9.png','wormhole-739872.png',1991762,'image','png','2020-06-16 15:33:54','admin'),('1272794557535272962',NULL,'http://localhost:8888/profile/upload/2020/06/16/128d3b30e99f143846483dd711e5770e.xlsx','4f8b59581bb70448fb0389acfbe7a5dd (2).xlsx',3811,'file','xlsx','2020-06-16 15:34:05','admin'),('1272794557598187522',NULL,'http://localhost:8888/profile/upload/2020/06/16/8a67a7ec31eca362e13d708018fce128.xlsx','4f8b59581bb70448fb0389acfbe7a5dd (3).xlsx',3811,'file','xlsx','2020-06-16 15:34:05','admin'),('1272794557635936258',NULL,'http://localhost:8888/profile/upload/2020/06/16/738bfcd580de4b4775d9da9b599a7a88.xlsx','4f8b59581bb70448fb0389acfbe7a5dd.xlsx',3811,'file','xlsx','2020-06-16 15:34:05','admin'),('1272794557858234369',NULL,'http://localhost:8888/profile/upload/2020/06/16/09935af443cbace77dcbe239c120cd76.xlsx','7b942ddc02a8527dd494fd4dbc607249.xlsx',3683,'file','xlsx','2020-06-16 15:34:05','admin'),('1272794557950509058',NULL,'http://localhost:8888/profile/upload/2020/06/16/cabdb11098acdb3c66bad60b07208af4.xlsx','5aa9f95224465c92f348fad27eb2bda8.xlsx',3683,'file','xlsx','2020-06-16 15:34:05','admin'),('1272794699848007681',NULL,'http://localhost:8888/profile/upload/2020/06/16/375164110971963e03861cd659abb7d5.xlsx','4f8b59581bb70448fb0389acfbe7a5dd (2).xlsx',3811,'file','xlsx','2020-06-16 15:34:38','admin'),('1272795261360455681',NULL,'http://localhost:8888/profile/upload/2020/06/16/13c1c44914ce323dfaa2190f9c1e5730.png','wormhole-739872.png',1991762,'image','png','2020-06-16 15:36:52','admin'),('1272796128838991874',NULL,'http://localhost:8888/profile/upload/2020/06/16/0455f87cc531aad2dd65ab4496e5c579.png','wormhole-739872.png',1991762,'image','png','2020-06-16 15:40:19','admin'),('1272797439286362114',NULL,'http://localhost:8888/profile/upload/2020/06/16/9688930c7802016cb69ed706a9f99362.jpg','globalisation-3390877_1920.jpg',391977,'image','jpg','2020-06-16 15:45:32','admin'),('1272797466939408385',NULL,'http://localhost:8888/profile/upload/2020/06/16/29763867b3582286d72e84b9175de1f2.png','wormhole-739872.png',1991762,'image','png','2020-06-16 15:45:38','admin'),('1272798693408423937',NULL,'http://localhost:8888/profile/upload/2020/06/16/26c9b7ecee435591b3ec0cdd84d6618c.xlsx','4f8b59581bb70448fb0389acfbe7a5dd (3).xlsx',3811,'file','xlsx','2020-06-16 15:50:31','admin'),('1272798725616484354',NULL,'http://localhost:8888/profile/upload/2020/06/16/98597a2fed260d474100e4e80d973ca4.xlsx','1591598639802客户信息.xlsx',3842,'file','xlsx','2020-06-16 15:50:38','admin'),('1272798725842976770',NULL,'http://localhost:8888/profile/upload/2020/06/16/8c72291f25e32eb6c1ec5d26ec8364bc.xlsx','1591956011384个人信息数据.xlsx',4840,'file','xlsx','2020-06-16 15:50:38','admin'),('1272798725847171074',NULL,'http://localhost:8888/profile/upload/2020/06/16/ebfd4b6af51792f4f7b5c922523d3886.xlsx','1592288882945个人信息数据.xlsx',4840,'file','xlsx','2020-06-16 15:50:38','admin'),('1272798725842976771',NULL,'http://localhost:8888/profile/upload/2020/06/16/9a145fb0c5d6b6f5f6700b0683b8d1ed.xlsx','bac2ac7c0025bbb682eaf7fd7e96a9f0.xlsx',3731,'file','xlsx','2020-06-16 15:50:38','admin'),('1272798808831475714',NULL,'http://localhost:8888/profile/upload/2020/06/16/0f0cefe556df3540704c09834f01573b.xlsx','1591598639802客户信息.xlsx',3842,'file','xlsx','2020-06-16 15:50:58','admin'),('1272798841945505793',NULL,'http://localhost:8888/profile/upload/2020/06/16/41c4049bac7714391996635e3f7a5b11.xlsx','bac2ac7c0025bbb682eaf7fd7e96a9f0.xlsx',3731,'file','xlsx','2020-06-16 15:51:06','admin'),('1272798988452544513',NULL,'http://localhost:8888/profile/upload/2020/06/16/07b6aa21b4f36eb1187b2c864cb82af4.png','wormhole-739872.png',1991762,'image','png','2020-06-16 15:51:41','admin'),('1272799006643240962',NULL,'http://localhost:8888/profile/upload/2020/06/16/7c0f6b63eea400d3df9113cadd62103d.jpg','globalisation-3390877_1920.jpg',391977,'image','jpg','2020-06-16 15:51:45','admin'),('1272805081949999105',NULL,'http://localhost:8888/profile/upload/2020/06/16/405e2a4e8123fb49d8cd1dcf5e111123.png','wormhole-739872.png',1991762,'image','png','2020-06-16 16:15:53','admin'),('1272805132478779393',NULL,'http://localhost:8888/profile/upload/2020/06/16/d55780d3ee946577da37925089d066ce.jpg','globalisation-3390877_1920.jpg',391977,'image','jpg','2020-06-16 16:16:06','admin'),('1272805193552039937',NULL,'http://localhost:8888/profile/upload/2020/06/16/e41ae5395e24e23be843fd07eac52bfb.xlsx','计划实际销售额 (2).xlsx',3683,'file','xlsx','2020-06-16 16:16:20','admin'),('1272805193614954497',NULL,'http://localhost:8888/profile/upload/2020/06/16/116514c0a1898b05d01f9a49c4ff7be2.xlsx','计划实际销售额 (1).xlsx',3731,'file','xlsx','2020-06-16 16:16:20','admin'),('1272805193682063362',NULL,'http://localhost:8888/profile/upload/2020/06/16/6f832e96ff886b32e35c27ff82e30517.xlsx','计划实际销售额 (3).xlsx',3683,'file','xlsx','2020-06-16 16:16:20','admin'),('1272805193900167170',NULL,'http://localhost:8888/profile/upload/2020/06/16/0190162390bd77c4c88843355a74acb9.xlsx','计划实际销售额 (4).xlsx',3682,'file','xlsx','2020-06-16 16:16:20','admin'),('1272805207099641857',NULL,'http://localhost:8888/profile/upload/2020/06/16/88451909c1633ca879fed1388c8a44b9.jpg','globalisation-3390877_1920.jpg',391977,'image','jpg','2020-06-16 16:16:24','admin');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
